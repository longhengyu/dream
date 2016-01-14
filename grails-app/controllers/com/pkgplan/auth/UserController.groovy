package com.pkgplan.auth

import com.pkgplan.dream.Server
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def userService
    def serverService


    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def query = {}
        def criteria = User.createCriteria()
        def results
        if (params.sid) {
            def serverInstance = Server.findById(params.sid)
            query = {
                and {
                    eq("server", serverInstance)
                }
            }
        }
        results = criteria.list(params, query)

        //TODO user count might be problem. check the detail of pagination.
        render view: 'reen_list', model:  [userInstanceList: results, userInstanceTotal: User.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [userInstance: new User(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    /**
     * if the user hack the url trying to edit or show another id,
     * we should change the id value to current user id.
     * for admin, we use whatever id specified
     * @param id
     * @return
     */
    private Long correctId(Long id) {
        if (userService.isUserLonggedIn()) {
            return userService.currentUser().id
        }
        return id
    }

    def show(Long id) {
        flash.message = null
        id = correctId(id)
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        def server = serverService.findServerByUser(userInstance)
        if(request.xhr) {
            render(view: "_showBody", model: [userInstance: userInstance, profileInstance: userInstance.profile, serverInstance: server])
            return
        }

        render view: 'reen_show', model: [userInstance: userInstance, profileInstance: userInstance.profile, serverInstance: userInstance.server]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        render view: 'reen_edit', model:  [userInstance: userInstance, serverInstance: serverService.findServerByUser(userInstance)]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "reen_edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "reen_edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
