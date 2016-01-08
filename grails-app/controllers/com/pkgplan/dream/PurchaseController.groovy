package com.pkgplan.dream

import com.pkgplan.alipay.AlipayTransaction
import com.pkgplan.auth.User
import com.pkgplan.dream.exception.InstanceNotFoundException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.grails.paypal.Payment
import org.springframework.dao.DataIntegrityViolationException

import java.text.SimpleDateFormat
import javax.annotation.Resource



class PurchaseController {

    private final String PAYMENT_METHOD_ID_PAYPAL = 1
    private final String PAYMENT_METHOD_ID_GIFTCARD = 2
    private final String PAYMENT_METHOD_ID_CREDITCARD = 0
    private final String PAYMENT_METHOD_ID_ALIPAY = 3

    def springSecurityService
    def purchaseService
    def giftcardService
    def mailService

    static allowedMethods = [save: "POST", delete: "POST"]

    @Resource
    UserService userService;

    @Resource(name = "productService")
    ProductService productService;

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def list() {
        // if it's user, we show only user's purchase list
        // if it's admin, we show all if no user id is specified, or show the specified user purchases.
        // TODO: use interceptor here. (or before_filter)
        User owner = springSecurityService.currentUser
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            owner = User.get(params?.ownerId)
        }
        flash.ownerId = owner?.id
        params.max = Math.min(params.max?.toInteger() ?: 10, 100)
        def query = {order("dateCreated", "desc")}
        def criteria = Purchase.createCriteria()
        def results
        if (owner) {
            query = {
                and {
                    eq("owner", owner)
                    ne("product", productService.getTestProduct())
                }
                order("dateCreated", "desc")
            }
        }

        results = criteria.list(params, query)

        if (request.xhr) {
            render(view: "_listBody", model: [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()])
        }

        render(view: "reen_list", model: [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()])
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def newPurchase = new Purchase(params)
        newPurchase.purchaseNumber = "${new SimpleDateFormat('yyyyMMdd').format(now)}${randomString}"
        [purchaseInstance: new Purchase(params)]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def save() {
        def purchaseInstance = new Purchase(params)

        purchaseInstance.purchaseNumber = purchaseService.generatePurchaseNumber()
        if (!purchaseInstance.save(flush: true)) {
            // TODO: give some message, when fails
        }

        flash.message = message(code: 'purchase.message.purchase.created')
        redirect(action: "show", id: purchaseInstance.id)
    }

    /**
     * generate: when user click "Buy" button on the product page,
     * a purchase record is generated and saved to DB.
     */
    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def generate() {
        redirect(action: "save", params: params)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
            return
        }

        //it must be usd
        render(view: "reen_show", model: [purchaseInstance: purchaseInstance, userInstance: userService.currentUser(), usdPrice: productService.convertPriceCNYtoUSD(purchaseInstance.getProduct().price)])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def edit(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
            return
        }

        [purchaseInstance: purchaseInstance]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def delete(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message')
            redirect(action: "list")
            return
        }

        try {
            def alipayTransaction = AlipayTransaction.findByPurchase(purchaseInstance)
            if (null != alipayTransaction) {
                alipayTransaction.delete(flush: true)
            }
            purchaseInstance.delete(flush: true)
            flash.message = message(code: 'purchase.message.purchase.canceled')
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "show", id: id)
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def buy() {
        def paymentId = params.paymentMethod?:PAYMENT_METHOD_ID_PAYPAL
        def pageRedirect = false
        def purchaseId = params.id?:Long.valueOf(params.item_number)
        def purchaseInstance = Purchase.findById(purchaseId)
        def alreadyFinished = false
        if (purchaseInstance) {
            log.info("Process purchase, payment method: ${paymentId}, purchase ID: ${purchaseInstance.id}, user: ${purchaseInstance.owner}")
            if (paymentId == PAYMENT_METHOD_ID_ALIPAY) {
                def alipayTransaction = AlipayTransaction.findByPurchase(purchaseInstance)
                if (alipayTransaction?.status.equals("Finished")) {
                    alreadyFinished = true
                    log.info("alipay processed by return, but already finished, trade number: " + params.alipay_trade_no)
                } else if (purchaseService.proceedAlipayTransaction(purchaseInstance)) {
                    log.info("alipay processed by return, trade number: " + params.alipay_trade_no)
                } else {
                    flash.message = message(code: 'purchase.message.payment.not.success')
                    redirect(action: "show")
                    return
                }

            } else if (paymentId == PAYMENT_METHOD_ID_GIFTCARD) {
                if (giftcardService.processGiftcardIfValid(purchaseInstance, purchaseInstance.product, params.code)) {
                    log.info("giftcard proceeded, code: " + params.code + ", purchase number: " + purchaseInstance.id)
                    pageRedirect = true
                } else {
                    flash.error_ajax = message(code: 'giftcard.not.correct')
                    render(view: "/giftcard/_reen_use", model: [purchaseInstance: purchaseInstance])
                    return
                }
            } else if (paymentId == PAYMENT_METHOD_ID_CREDITCARD) {
                if (purchaseService.proceedCreditCard(params.stripeToken, Double.valueOf(params.amount))) {
                    log.info("creditcard processed, purchase number: " + purchaseInstance.id)
                    pageRedirect = true
                } else {
                    flash.error_ajax = message(code: 'creditcard.not.correct')
                    render(view: "_creditcardForm", model: [purchaseInstance: purchaseInstance, usdPrice: productService.convertPriceCNYtoUSD(purchaseInstance.getProduct().price)])
                    return
                }
            } else {
                // pay with paypal
                Payment payment = Payment.findByTransactionId(params.transactionId ?: '')
                if (payment == null || !Payment.COMPLETE.equals(payment.status)) {
                    log.error("error payment!")
                    //if it's wrong payment,redirect list view
                    flash.message = message(code: 'purchase.message.payment.not.supported')
                    redirect(action: "show")
                    return
                } else {
                    log.info("paypal proceeded, purchase number: " + purchaseInstance.id);
                }
            }
            try {

                if (alreadyFinished == false) {
                    purchaseInstance = purchaseService.proceedPurchase(purchaseId.toLong(), paymentId)
                    sendConfirmationMail(purchaseInstance)
                } 


                flash.message = message(code: 'purchase.message.purchase.succeed')
                render(view: "reen_show", model: [purchaseInstance: purchaseInstance, userInstance: purchaseInstance.owner, pageRedirect: pageRedirect])
            } catch (InstanceNotFoundException e) {
                flash.message = message(code: 'purchase.message.purchase.not.found')
                redirect(action: "list")
            }
        } else {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
        }

    }

    private def sendConfirmationMail (Purchase updatedPurchaseInstance) {
        try {
            String url = createLink(controller: 'home', action: 'contact', absolute: 'true')
			def conf = SpringSecurityUtils.securityConfig
            def body = message(code: 'ui.purchase.mail.body', args: [updatedPurchaseInstance.owner.username,
                    updatedPurchaseInstance.purchaseNumber,
                    message(code: "product.info.name.${updatedPurchaseInstance.product.code}"),
                    message(code: "payment.method.name.${updatedPurchaseInstance.paymentMethod}"),
                    formatDate(date: updatedPurchaseInstance.datePay),
                    updatedPurchaseInstance.owner.server.ipAddr,
                    updatedPurchaseInstance.owner.username,
                    userService.getUserVpnPassword(updatedPurchaseInstance.owner),
                    formatDate(date: updatedPurchaseInstance.owner.dateExpired),
                    url])
            mailService.sendMail {
                to updatedPurchaseInstance.owner.email
                from conf.ui.forgotPassword.emailFrom
                subject message(code: 'ui.purchase.mail.subject')
                html body.toString()
            }
        }catch (Exception e) {
            log.error("Send mail error.")
			e.printStackTrace()
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def buildAlipayRequest () {

        // put the alipay transaction in DB
        def purchaseInstance = Purchase.findById(params.purchaseId)

        if (null == AlipayTransaction.findByPurchase(purchaseInstance)) {
            def alipayTransaction = new AlipayTransaction([alipay_trade_no: "NEW", status: "Pending", purchase: purchaseInstance])

            if (!alipayTransaction.save(flush: true)) {
                // 500 error

                return
            }
        }


        Map<String, String> alipayParams = purchaseService.buildAlipayRequestParams(params.purchaseId)

        List<String> keys = new ArrayList<String>(alipayParams.keySet());

        StringBuffer sbHtml = new StringBuffer();

        sbHtml.append("<form id=\"alipaysubmit\" name=\"alipaysubmit\" action=\"" + grailsApplication.config.alipay.alipay_gateway
                + "_input_charset=" + grailsApplication.config.alipay.input_charset + "\" method=\"" + "get"
                + "\">");

        for (int i = 0; i < keys.size(); i++) {
            String name = (String) keys.get(i);
            String value = (String) alipayParams.get(name);

            sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
        }

        //submit按钮控件请不要含有name属性
        sbHtml.append("<input type=\"submit\" value=\"" + "支付" + "\" style=\"display:none;\"></form>");
        sbHtml.append("<script>document.forms['alipaysubmit'].submit();</script>");

        render(view: "alipayRequest", model: [alipayParams: sbHtml.toString()])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def alipayReturn () {
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        //商户订单号

        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

        //支付宝交易号

        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

        //交易状态
        String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

        //计算得出通知验证结果
        boolean verify_result = purchaseService.alipayVerify(params);

        if(verify_result){//验证成功
            //////////////////////////////////////////////////////////////////////////////////////////
            //请在这里加上商户的业务逻辑程序代码

            def purchaseInstance = Purchase.findByPurchaseNumber(out_trade_no)

            redirect(action: "buy", params: [id: purchaseInstance.id, paymentMethod: PAYMENT_METHOD_ID_ALIPAY,
                                                alipay_trade_no: trade_no] )


            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

            if(trade_status.equals("WAIT_SELLER_SEND_GOODS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序
            }

            //该页面可做页面美工编辑

            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

            //////////////////////////////////////////////////////////////////////////////////////////
        }else{
            //该页面可做页面美工编辑
            log.info("alipay verify fails");
        }
    }

    def alipayNotify () {
		log.info("alipay notify is coming!")
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        //商户订单号

        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

        //交易状态
        String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//


        def purchaseInstance = Purchase.findByPurchaseNumber(out_trade_no)

        if(purchaseService.alipayVerify(params)){//验证成功
            //////////////////////////////////////////////////////////////////////////////////////////
            //请在这里加上商户的业务逻辑程序代码

            //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——

            if(trade_status.equals("WAIT_BUYER_PAY")){
                //该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款

                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                log.info("alipay: WAIT_BUYER_PAY");	//请不要修改或删除
                render(view: "alipaySuccess")
            } else if(trade_status.equals("WAIT_SELLER_SEND_GOODS")){
                //该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货

                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                log.info("alipay: WAIT_SELLER_SEND_GOODS");	//请不要修改或删除

                // 发货的逻辑
                if (purchaseService.proceedAlipayTransaction(purchaseInstance)) {
                    log.info("alipay processed by notify, trade number: " + trade_no)
                    purchaseInstance = purchaseService.proceedPurchase(Purchase.findByPurchaseNumber(out_trade_no).id.toLong(), PAYMENT_METHOD_ID_ALIPAY)
                    sendConfirmationMail(purchaseInstance)

                }

                purchaseService.alipaySendGoods(trade_no, grailsApplication.config.alipay.logistics_company, trade_no, grailsApplication.config.alipay.logistics_type)

                log.info("alipay: sent goods");
                render(view: "alipaySuccess")
            } else if(trade_status.equals("WAIT_BUYER_CONFIRM_GOODS")){
                //该判断表示卖家已经发了货，但买家还没有做确认收货的操作

                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                log.info("WAIT_BUYER_CONFIRM_GOODS");	//请不要修改或删除
                render(view: "alipaySuccess")
            } else if(trade_status.equals("TRADE_FINISHED")){
                //该判断表示买家已经确认收货，这笔交易完成

                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                log.info("TRADE_FINISHED");	//请不要修改或删除
                render(view: "alipaySuccess")
            }
            else {
                log.info("success");	//请不要修改或删除
                render(view: "alipaySuccess")
            }

            //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

            //////////////////////////////////////////////////////////////////////////////////////////
        }else{//验证失败
            log.info("alipay verify fail")
            render(view: "alipaySuccess")
        }
    }
}
