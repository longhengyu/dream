package com.pkgplan.dream

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

import net.neoremind.sshxcute.core.Result;



@Secured(['ROLE_ADMIN'])
class ServerController {

    def HelperService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render (view: "reen_list", model: [serverInstanceList: Server.list(params), serverInstanceTotal: Server.count()])
    }

    def create() {
        [serverInstance: new Server(params)]
    }

    def save() {
        def serverInstance = new Server(params)
        if (!serverInstance.save(flush: true)) {
            render(view: "create", model: [serverInstance: serverInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'server.label', default: 'Server'), serverInstance.id])
        redirect(action: "show", id: serverInstance.id)
    }

    def show(Long id) {



        def serverInstance = Server.get(id)
        if (!serverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "list")
            return
        }

        Result res = HelperService.executeRemoteScript(serverInstance.hostname + ".dream-vpn.com", "root", "yuaixing", "/root/uselog.sh")

        render (view: "reen_show", model: [serverInstance: serverInstance, exeResult: res])
    }

    def edit(Long id) {
        def serverInstance = Server.get(id)
        if (!serverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "list")
            return
        }

        [serverInstance: serverInstance]
    }

    def update(Long id, Long version) {
        def serverInstance = Server.get(id)
        if (!serverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (serverInstance.version > version) {
                serverInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'server.label', default: 'Server')] as Object[],
                          "Another user has updated this Server while you were editing")
                render(view: "edit", model: [serverInstance: serverInstance])
                return
            }
        }

        serverInstance.properties = params

        if (!serverInstance.save(flush: true)) {
            render(view: "edit", model: [serverInstance: serverInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'server.label', default: 'Server'), serverInstance.id])
        redirect(action: "show", id: serverInstance.id)
    }

    def delete(Long id) {
        def serverInstance = Server.get(id)
        if (!serverInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "list")
            return
        }

        try {
            serverInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'server.label', default: 'Server'), id])
            redirect(action: "show", id: id)
        }
    }
}
