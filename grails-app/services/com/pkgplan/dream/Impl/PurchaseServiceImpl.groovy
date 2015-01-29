package com.pkgplan.dream.Impl

import com.pkgplan.alipay.AlipayTransaction
import com.pkgplan.dream.Purchase
import com.pkgplan.dream.PurchaseService
import com.pkgplan.dream.Server
import com.pkgplan.dream.ServerService
import com.pkgplan.dream.exception.InstanceNotFoundException
import com.pkgplan.dream.util.alipay.http.HttpProtocolHandler
import com.pkgplan.dream.util.alipay.http.HttpRequest
import com.pkgplan.dream.util.alipay.http.HttpResponse
import com.pkgplan.dream.util.alipay.http.HttpResultType
import com.stripe.model.Charge
import groovy.time.TimeCategory
import org.apache.commons.codec.digest.DigestUtils
import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.springframework.stereotype.Service

import java.text.SimpleDateFormat
import javax.annotation.Resource

import org.apache.commons.httpclient.NameValuePair;

/**
 * User: longhengyu
 * Date: 12-12-18
 */
@Service("purchaseService")
class PurchaseServiceImpl implements PurchaseService {

    String charset = (('A'..'Z') + ('0'..'9')).join()
    Integer length = 9

    @Resource
    ServerService serverService

    def log

    String generatePurchaseNumber() {
        Date now = new Date()
        String randomString = RandomStringUtils.random(length, charset.toCharArray())
        return "${new SimpleDateFormat('yyyyMMdd').format(now)}${randomString}"
    }

    Purchase proceedPurchase(Long purchaseId, String paymentMethodId) throws InstanceNotFoundException {

        // find purchase
        def purchaseInstance = Purchase.get(purchaseId)
        if (!purchaseInstance) {
            throw new InstanceNotFoundException()
        }

        // if this user has no server, assign owner to server
        def owner = purchaseInstance.owner
        def servers = serverService.findServerByUser(owner)
        if (owner.server == null) {
            Server server = serverService.getLeastLoadedServer()
            owner.server = server
            owner.save()
        }

        def product = purchaseInstance.product
        Date now = new Date()
        Date fromDate = now > owner.dateExpired ? now : owner.dateExpired
        Date endDate
        use(TimeCategory) {
            endDate = fromDate + product.pYear.year + product.pMonth.month + product.pDay.day + product.pHour.hour + product.pMinute.minute
        }

        owner.dateExpired = endDate
        owner.save()
        purchaseInstance.datePay = now
        purchaseInstance.paymentMethod = paymentMethodId

        String randomString = RandomStringUtils.random(length, charset.toCharArray())
        purchaseInstance.save()
        return purchaseInstance
    }

    boolean proceedCreditCard(String stripeToken, Double amount) {
            def amountInCents = (amount * 100) as Integer

            def chargeParams = [
                    'amount': amountInCents,
                    'currency': 'usd',
                    'card': stripeToken,
                    'description': 'customer@sample.org'
            ]

            def status
            try {
                Charge.create(chargeParams)
                return true;
            } catch(CardException) {
                // TODO log the exception
            }
            return false
    }

    Map<String, String> buildAlipayRequestParams(String purchaseId) {

        def purchaseInstance = Purchase.get(purchaseId)

        Map<String, String> sParaTemp = new HashMap<String, String>();

        sParaTemp.put("service", "create_partner_trade_by_buyer");
        sParaTemp.put("partner", ApplicationHolder.application.config.alipay.partner);
        sParaTemp.put("_input_charset", ApplicationHolder.application.config.alipay.input_charset);
        sParaTemp.put("payment_type", ApplicationHolder.application.config.alipay.payment_type);
        sParaTemp.put("notify_url", ApplicationHolder.application.config.alipay.notify_url);
        sParaTemp.put("return_url", ApplicationHolder.application.config.alipay.return_url);
        sParaTemp.put("seller_email", ApplicationHolder.application.config.alipay.seller_email);
        sParaTemp.put("out_trade_no", purchaseInstance.purchaseNumber);
        sParaTemp.put("subject", purchaseInstance.product.name);
        sParaTemp.put("logistics_type", ApplicationHolder.application.config.alipay.logistics_type);
        sParaTemp.put("logistics_fee", ApplicationHolder.application.config.alipay.logistics_fee);
        sParaTemp.put("logistics_payment", ApplicationHolder.application.config.alipay.logistics_payment);
        sParaTemp.put("price", /*purchaseInstance.product.price*/ "0.01");
        sParaTemp.put("quantity", 1);
        sParaTemp.put("show_url", ApplicationHolder.application.config.alipay.show_url);

        // remove the blank params
        Map<String, String> sPara = paraFilter(sParaTemp);

        // build sign
        String mysign = buildRequestMysign(sPara);

        //签名结果与签名方式加入请求提交参数组中
        sPara.put("sign", mysign);
        sPara.put("sign_type", ApplicationHolder.application.config.alipay.sign_type);

        return sPara
    }

    def paraFilter(Map<String, String> sArray) {

        Map<String, String> result = new HashMap<String, String>();

        if (sArray == null || sArray.size() <= 0) {
            return result;
        }

        for (String key : sArray.keySet()) {
            String value = sArray.get(key);
            if (value == null || value.equals("") || key.equalsIgnoreCase("sign")
                    || key.equalsIgnoreCase("sign_type")) {
                continue;
            }
            result.put(key, value);
        }

        return result;
    }

    def createLinkString(Map<String, String> params) {

        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);

        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {// concanate without the last '&'
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }

        return prestr;
    }

    def sign(String text, String key, String input_charset) {
        text = text + key;
        return DigestUtils.md5Hex(getContentBytes(text, input_charset));
    }

    def verifyMD5(String text, String sign, String key, String input_charset) {
        text = text + key;
        String mysign = DigestUtils.md5Hex(getContentBytes(text, input_charset));
        if(mysign.equals(sign)) {
            return true;
        }
        else {
            return false;
        }
    }

    def getContentBytes(String content, String charset) {
        if (charset == null || "".equals(charset)) {
            return content.getBytes();
        }
        try {
            return content.getBytes(charset);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
        }
    }

    def buildRequestMysign(Map<String, String> sPara) {
        String prestr = createLinkString(sPara);
        String mysign = "";
        if(ApplicationHolder.application.config.alipay.sign_type.equals("MD5") ) {
            mysign = sign(prestr, ApplicationHolder.application.config.alipay.key, ApplicationHolder.application.config.alipay.input_charset);
        }
        return mysign;
    }

    private String verifyResponse(String notify_id) {
        //获取远程服务器ATN结果，验证是否是支付宝服务器发来的请求

        String partner = ApplicationHolder.application.config.alipay.partner;
        String veryfy_url = ApplicationHolder.application.config.alipay.HTTPS_VERIFY_URL + "partner=" + partner + "&notify_id=" + notify_id;

        return checkUrl(veryfy_url);
    }

    private String checkUrl(String urlvalue) {
        String inputLine = "";

        try {
            URL url = new URL(urlvalue);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            BufferedReader inReader = new BufferedReader(new InputStreamReader(urlConnection
                    .getInputStream()));
            inputLine = inReader.readLine().toString();
        } catch (Exception e) {
            e.printStackTrace();
            inputLine = "";
        }

        return inputLine;
    }

    boolean getSignVeryfy(Map<String, String> Params, String sign) {
        //过滤空值、sign与sign_type参数
        Map<String, String> sParaNew = paraFilter(Params);
        //获取待签名字符串
        String preSignStr = createLinkString(sParaNew);
        //获得签名验证结果
        boolean isSign = false;
        if(ApplicationHolder.application.config.alipay.sign_type.equals("MD5") ) {
            isSign = verifyMD5(preSignStr, sign, ApplicationHolder.application.config.alipay.key, ApplicationHolder.application.config.alipay.input_charset);
        }
        return isSign;
    }

    boolean alipayVerify(Map<String, String> params) {

        //判断responsetTxt是否为true，isSign是否为true
        //responsetTxt的结果不是true，与服务器设置问题、合作身份者ID、notify_id一分钟失效有关
        //isSign不是true，与安全校验码、请求时的参数格式（如：带自定义参数等）、编码格式有关
        String responseTxt = "true";
        if(params.get("notify_id") != null) {
            String notify_id = params.get("notify_id");
            responseTxt = verifyResponse(notify_id);
        }
        String sign = "";
        if(params.get("sign") != null) {sign = params.get("sign");}
        boolean isSign = getSignVeryfy(params, sign);

        //写日志记录（若要调试，请取消下面两行注释）
        //String sWord = "responseTxt=" + responseTxt + "\n isSign=" + isSign + "\n 返回回来的参数：" + AlipayCore.createLinkString(params);
        //AlipayCore.logResult(sWord);

        if (isSign && responseTxt.equals("true")) {
            return true;
        } else {
            return false;
        }
    }

    boolean proceedAlipayTransaction(String trade_no) {

        def alipayTransaction = AlipayTransaction.findByAlipay_trade_no(trade_no)
        if (alipayTransaction?.status.equals("Pending")) {
            alipayTransaction.status = "Finished"
            alipayTransaction.save()
            return true
        }
        return false
    }

    boolean alipaySendGoods(String trade_no, String logistics_name, String invoice_no, String transport_type) {


        //把请求参数打包成数组
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", "send_goods_confirm_by_platform");
        sParaTemp.put("partner", ApplicationHolder.application.config.alipay.partner);
        sParaTemp.put("_input_charset", ApplicationHolder.application.config.alipay.input_charset);
        sParaTemp.put("trade_no", trade_no);
        sParaTemp.put("logistics_name", logistics_name);
        sParaTemp.put("invoice_no", invoice_no);
        sParaTemp.put("transport_type", transport_type);

        //建立请求
        String sHtmlText = buildRequest("", "", sParaTemp);
        println(sHtmlText);

        return true
    }

    private String buildRequest(String strParaFileName, String strFilePath,Map<String, String> sParaTemp) throws Exception {
        //待请求参数数组
        Map<String, String> sPara = buildRequestPara(sParaTemp);

        HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler.getInstance();

        HttpRequest request = new HttpRequest(HttpResultType.BYTES);
        //设置编码集
        request.setCharset(ApplicationHolder.application.config.alipay.input_charset);

        request.setParameters(generatNameValuePair(sPara));
        request.setUrl(ApplicationHolder.application.config.alipay.alipay_gateway+"_input_charset="+ApplicationHolder.application.config.alipay.input_charset);

        HttpResponse response = httpProtocolHandler.execute(request,strParaFileName,strFilePath);
        if (response == null) {
            return null;
        }

        String strResult = response.getStringResult();

        return strResult;
    }

    private Map<String, String> buildRequestPara(Map<String, String> sParaTemp) {
        //除去数组中的空值和签名参数
        Map<String, String> sPara = paraFilter(sParaTemp);
        //生成签名结果
        String mysign = buildRequestMysign(sPara);

        //签名结果与签名方式加入请求提交参数组中
        sPara.put("sign", mysign);
        sPara.put("sign_type", ApplicationHolder.application.config.alipay.sign_type);

        return sPara;
    }

    private NameValuePair[] generatNameValuePair(Map<String, String> properties) {
        NameValuePair[] nameValuePair = new NameValuePair[properties.size()];
        int i = 0;
        for (Map.Entry<String, String> entry : properties.entrySet()) {
            nameValuePair[i++] = new NameValuePair(entry.getKey(), entry.getValue());
        }

        return nameValuePair;
    }


}
