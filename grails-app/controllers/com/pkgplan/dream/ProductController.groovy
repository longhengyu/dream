package com.pkgplan.dream

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		if(request.xhr) {
			render(view: "_listBody", model: [productInstanceList: Product.list(params), productInstanceTotal: Product.count()])
			return
		}
        render(view: "reen_list", model: [productInstanceList: Product.list(params), productInstanceTotal: Product.count()])
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [productInstance: new Product(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def productInstance = new Product(params)
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }


    def show(Long id) {
        if (!SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
            redirect(action: "list")
        }
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        try {
            productInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "show", id: id)
        }
    }
}
