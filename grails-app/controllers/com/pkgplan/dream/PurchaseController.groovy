package com.pkgplan.dream

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.runtime.TimeCategory
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import com.pkgplan.auth.User
import org.apache.commons.lang.RandomStringUtils

class PurchaseController {

    def springSecurityService

    String charset = (('A'..'Z') + ('0'..'9')).join()
    Integer length = 9

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        // if it's user, we show only user's purchase list
        // if it's admin, we show all if no user id is specified, or show the specified user purchases.
        User owner = springSecurityService.currentUser
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            owner = User.get(params?.ownerId)
        }
        flash.ownerId = owner?.id
        params.max = Math.min(params.max ?: 10, 100)
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

        if(request.xhr) {
            render(view: "_listBody", model: [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()])
        }

        [purchaseInstanceList: results, purchaseInstanceTotal: results.getTotalCount()]
    }

    def create() {
        [purchaseInstance: new Purchase(params)]
    }

    def save() {
        def purchaseInstance = new Purchase(params)
        if (!purchaseInstance.save(flush: true)) {
            render(view: "create", model: [purchaseInstance: purchaseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'purchase.label', default: 'Purchase'), purchaseInstance.id])
        redirect(action: "show", id: purchaseInstance.id)
    }

    def show(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
            return
        }

        [purchaseInstance: purchaseInstance]
    }

    def edit(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
            return
        }

        [purchaseInstance: purchaseInstance]
    }

    def update(Long id, Long version) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (purchaseInstance.version > version) {
                purchaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'purchase.label', default: 'Purchase')] as Object[],
                          "Another user has updated this Purchase while you were editing")
                render(view: "edit", model: [purchaseInstance: purchaseInstance])
                return
            }
        }

        purchaseInstance.properties = params

        if (!purchaseInstance.save(flush: true)) {
            render(view: "edit", model: [purchaseInstance: purchaseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'purchase.label', default: 'Purchase'), purchaseInstance.id])
        redirect(action: "show", id: purchaseInstance.id)
    }

    def delete(Long id) {
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
            return
        }

        try {
            purchaseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "show", id: id)
        }
    }

    def buy(Long id) {
        log.info("Purchase, id=${id}")
        def purchaseInstance = Purchase.get(id)
        if (!purchaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchase.label', default: 'Purchase'), id])
            redirect(action: "list")
            return
        }
        def owner = purchaseInstance.owner
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


        String randomString = RandomStringUtils.random(length, charset.toCharArray())
        purchaseInstance.purchaseNumber = "${g.formatDate(date:now, format: 'yyyyMMdd')}${randomString}"
        purchaseInstance.save()

        flash.message = message(code: 'purchase.buy.success', default: "purchase success.")
        render(view: "show", model: [purchaseInstance: purchaseInstance])

    }
}
