package com.pkgplan.dream

import com.pkgplan.auth.User
import com.pkgplan.dream.exception.InstanceNotFoundException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.grails.paypal.Payment
import org.springframework.dao.DataIntegrityViolationException

import javax.annotation.Resource
import com.stripe.model.Charge
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.servlet.support.RequestContextUtils

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PurchaseController {

    private final String PAYMENT_METHOD_ID_PAYPAL = 1
    private final String PAYMENT_METHOD_ID_GIFTCARD = 2
    private final String PAYMENT_METHOD_ID_CREDITCARD = 0

    def springSecurityService
    def purchaseService
    def giftcardService
    def mailService

    static allowedMethods = [save: "POST", delete: "POST"]

    @Resource
    UserService userService;

    @Resource(name = "productService")
    ProductService productService;

    def index() {
        redirect(action: "list", params: params)
    }

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
                }
                order("dateCreated", "desc")
            }
        }

        results = criteria.list(params, query)

        if (request.xhr) {
            render(view: "_listBody", model: [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()])
        }

        [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [purchaseInstance: new Purchase(params)]
    }

    def save() {
        def purchaseInstance = new Purchase(params)
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
    def generate() {
        redirect(action: "save", params: params)
    }

    def show(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
            return
        }

        //it must be usd
        [purchaseInstance: purchaseInstance, userInstance: userService.currentUser(), usdPrice: productService.convertPriceCNYtoUSD(purchaseInstance.getProduct().price)]
    }

    def edit(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
            return
        }

        [purchaseInstance: purchaseInstance]
    }

    def delete(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message')
            redirect(action: "list")
            return
        }

        try {
            purchaseInstance.delete(flush: true)
            flash.message = message(code: 'purchase.message.purchase.canceled')
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "show", id: id)
        }
    }


    def buy() {
        def paymentId = params.paymentMethod?:PAYMENT_METHOD_ID_PAYPAL
        def pageRedirect = false
        def purchaseId = params.id?:Long.valueOf(params.item_number)
        def purchaseInstance = Purchase.findById(purchaseId)
        if (purchaseInstance) {
            log.info("Process purchase, payment method: ${paymentId}, purchase ID: ${purchaseInstance.id}, user: ${purchaseInstance.owner}")
            if (paymentId == PAYMENT_METHOD_ID_GIFTCARD) {
                if (giftcardService.processGiftcardIfValid(purchaseInstance, purchaseInstance.product, params.code)) {
                    log.info("giftcard proceeded, code: " + params.code + ", purchase number: " + purchaseInstance.id)
                    pageRedirect = true
                } else {
                    flash.error_ajax = message(code: 'giftcard.not.correct')
                    render(view: "/giftcard/_use", model: [purchaseInstance: purchaseInstance])
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
                Purchase updatedPurchaseInstance = purchaseService.proceedPurchase(purchaseId.toLong(), paymentId)
                // send mail
                try {
                    String url = createLink(controller: 'home', action: 'contact', absolute: 'true')

                    def conf = SpringSecurityUtils.securityConfig
                    def body = message(code: 'ui.purchase.mail.body', args: [updatedPurchaseInstance.owner.username,
                            updatedPurchaseInstance.purchaseNumber,
                            message(code: "product.info.name.${updatedPurchaseInstance.product.code}"),
                            message(code: "payment.method.name.${updatedPurchaseInstance.paymentMethod}"),
                            formatDate(date: updatedPurchaseInstance.datePay),
                            updatedPurchaseInstance.owner.server.ipAddr,
                            userService.getCurrentUserVpnPassword(),
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
                }

                flash.message = message(code: 'purchase.message.purchase.succeed')
                render(view: "show", model: [purchaseInstance: updatedPurchaseInstance, userInstance: updatedPurchaseInstance.owner, pageRedirect: pageRedirect])
            } catch (InstanceNotFoundException e) {
                flash.message = message(code: 'purchase.message.purchase.not.found')
                redirect(action: "list")
            }
        } else {
            flash.message = message(code: 'purchase.message.purchase.not.found')
            redirect(action: "list")
        }

    }
}
