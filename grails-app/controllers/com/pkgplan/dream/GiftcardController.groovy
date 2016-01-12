package com.pkgplan.dream

import com.pkgplan.auth.User
import grails.plugins.springsecurity.Secured
import org.apache.commons.lang.RandomStringUtils
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN','ROLE_USER'])
class GiftcardController {

    private final String PAYMENT_METHOD_ID_GIFTCARD = 2

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def purchaseService
    def giftcardService
    def productService
    def userService
    def mailService



    def index() {
        redirect(action: "list", params: params)
    }


    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        // TODO: use interceptor here. (or before_filter)
        User owner = springSecurityService.currentUser
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            owner = User.get(params?.ownerId)
        }
        flash.ownerId = owner?.id
        params.max = Math.min(params.max?.toInteger() ?: 10, 100)
        Product testPlan = productService.getTestProduct()
        def query = {order("status")}
        def criteria = Giftcard.createCriteria()
        def results
        if (owner) {
            query = {
                and {
                    eq("owner", owner)
                    ne("product", testPlan)  // user will not see the test plan giftcard
                }
                order("status")
            }
        }

        results = criteria.list(params, query)

        if (request.xhr) {
            render(view: "_listBody", model: [giftcardInstanceList: results, giftcardInstanceTotal: results.getTotalCount()])
        }

        [giftcardInstanceList: results, giftcardInstanceTotal: results.getTotalCount()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        // random generate a code
        def giftcardInstance = new Giftcard(params)
        giftcardInstance.code = giftcardService.generateGiftcardCode()
        [giftcardInstance: giftcardInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def giftcardInstance = new Giftcard(params)
        if (!giftcardInstance.save(flush: true)) {


            render(view: "create", model: [giftcardInstance: giftcardInstance])
            return
        }

        if (params.sendMail && giftcardInstance.product.code.equals(productService.getTestProduct().code)) {
            // create the test plan purchase and send mail to user
            createTestProductPurchase(giftcardInstance.owner)
            sendAppliedMail(giftcardInstance)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), giftcardInstance.id])
        redirect(action: "show", id: giftcardInstance.id)
    }

    def show(Long id) {
        def giftcardInstance = Giftcard.get(id)
        if (!giftcardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
            return
        }

        [giftcardInstance: giftcardInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def giftcardInstance = Giftcard.get(id)
        if (!giftcardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
            return
        }

        [giftcardInstance: giftcardInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def giftcardInstance = Giftcard.get(id)
        if (!giftcardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (giftcardInstance.version > version) {
                giftcardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'giftcard.label', default: 'Giftcard')] as Object[],
                          "Another user has updated this Giftcard while you were editing")
                render(view: "edit", model: [giftcardInstance: giftcardInstance])
                return
            }
        }

        giftcardInstance.properties = params

        if (!giftcardInstance.save(flush: true)) {
            render(view: "edit", model: [giftcardInstance: giftcardInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), giftcardInstance.id])
        redirect(action: "show", id: giftcardInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def giftcardInstance = Giftcard.get(id)
        if (!giftcardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
            return
        }

        try {
            giftcardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "show", id: id)
        }
    }

    def apply() {

        def verified = false
        def applied = false
        def purchaseId = null
        def query = {}
        def criteria = Purchase.createCriteria()
        User currentUser = springSecurityService.currentUser

        query = {
            and {
                eq("owner", currentUser)
                eq("product", productService.getTestProduct())
            }
        }

        def results = criteria.list(params, query)
        if (results) {
            applied = true
            purchaseId = results[0].id
            flash.message = message(code: 'introducer.apply.success')
            if (results[0].datePay != null) {
                verified = true
            }
        }

        render(view: "reen_apply", model: [verified: verified, applied: applied, purchaseId: purchaseId, hasServer: currentUser.server != null, referrals: currentUser.referrals])
    }

    def issue() {
        def applied = false
        def username = params.username
        def purchaseId = null
        User introducer = User.findByUsername(username)
        User currentUser = springSecurityService.currentUser
        if (introducer != null && introducer != currentUser && !introducer.username.equals("admin")) {

            Purchase.withTransaction{ status ->
                try {
                    // 1. create a test purchase
                    Product testPlan = productService.getTestProduct()

                    def purchaseInstance = createTestProductPurchase(currentUser)
                    if (purchaseInstance == null) {
                        log.error("update introducer " + introducer.id + " for user " + currentUser.id + " failed. new test purchase error")

                    }

                    flash.message = message(code: 'introducer.apply.success')
                    flash.error_ajax = null
                    applied = true
                    purchaseId = purchaseInstance.id

                    // 2. create a giftcard code
                    def giftcardInstance = new Giftcard(product: testPlan, owner: currentUser)
                    giftcardInstance.code = giftcardService.generateGiftcardCode()
                    if (!giftcardInstance.save(flush: true, failOnError:true)) {
                        log.error("update introducer " + introducer.id + " for user " + currentUser.id + " failed. new test giftcard error.")
                        flash.error_ajax = message(code: 'introducer.not.correct')
                        render(view: "/giftcard/_verifyFriend", model: [applied: applied, purchaseId: purchaseId, username: params.username])
                        return
                    }

                    // 3. save introducer
                    currentUser.introducer = introducer
                    if (!currentUser.save(flush: true, failOnError:true)) {
                        // TODO: give some message, when fails
                        log.error("update introducer " + introducer.id + " for user " + currentUser.id + " failed.")
                        flash.error_ajax = message(code: 'introducer.not.correct')
                        render(view: "/giftcard/_verifyFriend", model: [applied: applied, purchaseId: purchaseId, username: params.username])
                        return
                    }

                    // 4. send mail
                    sendAppliedMail(giftcardInstance)
                    log.info("update introducer " + introducer.id + " for user " + currentUser.id + " success. new test user.")

                }catch(Exception exp){
                    flash.error_ajax = message(code: 'introducer.not.correct')
                    log.error("apply test transaction error " + exp.getMessage())
                    exp.printStackTrace()
                    status.setRollbackOnly()
                }

            }

        } else {
            flash.error_ajax = message(code: 'introducer.not.correct')
        }
        render(view: "/giftcard/_verifyFriend", model: [applied: applied, purchaseId: purchaseId, username: params.username])
        return
    }

    def verify() {

        def purchaseInstance = Purchase.findById(params.purchaseId)

        if (giftcardService.processGiftcardIfValid(purchaseInstance, purchaseInstance.product, params.code)) {
            log.info("free trail giftcard proceeded, code: " + params.code + ", purchase number: " + purchaseInstance.id)

            purchaseInstance = purchaseService.proceedPurchase(purchaseInstance.id.toLong(), PAYMENT_METHOD_ID_GIFTCARD)

            // TODO sendmail
            sendVerifiedMail(purchaseInstance)


            render(view: "/giftcard/_verifyFriend", model: [verified: true, applied: true])
        } else {
            flash.error_ajax = message(code: 'introducer.verify.fail')
            flash.message = message(code: 'introducer.apply.success')

            render(view: "/giftcard/_verifyFriend", model: [verified: false, applied: true, purchaseId: params.purchaseId, code: params.code])
        }
    }

    private Purchase createTestProductPurchase(User user) {
        Product testPlan = productService.getTestProduct()

        def purchaseInstance = new Purchase(product: testPlan, owner: user)
        purchaseInstance.purchaseNumber = purchaseService.generatePurchaseNumber()
        if (!purchaseInstance.save(flush: true, failOnError:true)) {
            // TODO: give some message, when fails
            log.error("creating test product purchase error.")
            return null
        }

        return purchaseInstance
    }

    private def sendAppliedMail (Giftcard giftcardInstance) {
        try {
            String urlContact = createLink(controller: 'home', action: 'contact', absolute: 'true')
            String urlApply = createLink(controller: 'giftcard', action: 'apply', absolute: 'true')
            def conf = SpringSecurityUtils.securityConfig
            def body = message(code: 'introducer.applied.mail.body', args: [giftcardInstance.owner.username,
                    urlApply,
                    giftcardInstance.code,
                    urlContact])
            mailService.sendMail {
                to giftcardInstance.owner.email
                from conf.ui.forgotPassword.emailFrom
                subject message(code: 'introducer.applied.mail.subject')
                html body.toString()
            }
        }catch (Exception e) {
            log.error("Send mail error.")
            e.printStackTrace()
        }
    }

    private def sendVerifiedMail (Purchase updatedPurchaseInstance) {
        try {
            String url = createLink(controller: 'home', action: 'contact', absolute: 'true')
            def conf = SpringSecurityUtils.securityConfig
            def body = message(code: 'introducer.verified.mail.body', args: [updatedPurchaseInstance.owner.username,
                    updatedPurchaseInstance.owner.server.ipAddr,
                    updatedPurchaseInstance.owner.username,
                    userService.getUserVpnPassword(updatedPurchaseInstance.owner),
                    formatDate(date: updatedPurchaseInstance.owner.dateExpired),
                    url])
            mailService.sendMail {
                to updatedPurchaseInstance.owner.email
                from conf.ui.forgotPassword.emailFrom
                subject message(code: 'introducer.verified.mail.subject')
                html body.toString()
            }
        }catch (Exception e) {
            log.error("Send mail error.")
            e.printStackTrace()
        }
    }
}
