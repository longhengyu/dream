package com.pkgplan.dream

import org.springframework.dao.DataIntegrityViolationException
import com.pkgplan.auth.User
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class GiftcardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        // TODO: use interceptor here. (or before_filter)
        User owner = springSecurityService.currentUser
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            owner = User.get(params?.ownerId)
        }
        flash.ownerId = owner?.id
        params.max = Math.min(params.max?.toInteger() ?: 10, 100)
        def query = {order("dateCreated", "desc")}
        def criteria = Giftcard.createCriteria()
        def results
        if (owner) {
            query = {
                and {
                    eq("owner", owner)
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

    def create() {
        [giftcardInstance: new Giftcard(params)]
    }

    def save() {
        def giftcardInstance = new Giftcard(params)
        if (!giftcardInstance.save(flush: true)) {
            render(view: "create", model: [giftcardInstance: giftcardInstance])
            return
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

    def edit(Long id) {
        def giftcardInstance = Giftcard.get(id)
        if (!giftcardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'giftcard.label', default: 'Giftcard'), id])
            redirect(action: "list")
            return
        }

        [giftcardInstance: giftcardInstance]
    }

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
}
