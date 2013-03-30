package com.pkgplan.dream

import org.springframework.dao.DataIntegrityViolationException

class GiftcardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [giftcardInstanceList: Giftcard.list(params), giftcardInstanceTotal: Giftcard.count()]
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
