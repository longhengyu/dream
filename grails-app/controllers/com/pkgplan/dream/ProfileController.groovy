package com.pkgplan.dream

import org.springframework.dao.DataIntegrityViolationException
import com.pkgplan.auth.User
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def userService

    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def create() {
        render(view: "_form", model: [profileInstance: new Profile(params), userId: params.get("userId"), isCreate: true])
    }

    def save() {
        def profileInstance = new Profile(params)
        if (!profileInstance.save(flush: true)) {
            render(view: "_form", model: [profileInstance: profileInstance, isCreate: true])
            return
        }
        // bind user with profile
        def userInstance = params.get("userId")? User.get(params.get("userId")):userService.currentUser()
        userInstance.profile = profileInstance
        if (!userInstance.save(flush: true)) {
            render(view: "_form", model: [profileInstance: profileInstance])
            return
        }

        flash.message = message(code: 'user.profile.message.created')
        render(view: "_panelBody", model: [profileInstance: profileInstance])
    }

    def show(Long id) {
        flash.message = null
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            if (userService.isAdminLoggedIn()) {
                flash.message = message(code: 'user.profile.message.not.found')
                redirect(action: "list")
                return
            } else {
                // create a new profile if nothing found
                redirect(action: "create")
                return
            }
        }
        [profileInstance: profileInstance]
    }

    def edit(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'user.profile.message.not.found')
            redirect(action: "list")
            return
        }


        render(view: "_form", model: [profileInstance: profileInstance])
        return
    }

    def update(Long id, Long version) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'user.profile.message.not.found')
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (profileInstance.version > version) {
                profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'profile.label', default: 'Profile')] as Object[],
                          "Another user has updated this Profile while you were editing")
                render(view: "edit", model: [profileInstance: profileInstance])
                return
            }
        }

        profileInstance.properties = params

        if (!profileInstance.save(flush: true)) {
            render(view: "_form", model: [profileInstance: profileInstance])
            return
        }

        flash.message = message(code: 'user.profile.message.updated')

        render(view: "_panelBody", model: [profileInstance: profileInstance])
    }

    def delete(Long id) {
        def profileInstance = Profile.get(id)
        if (!profileInstance) {
            flash.message = message(code: 'user.profile.message.not.found')
            redirect(action: "list")
            return
        }

        try {
            profileInstance.delete(flush: true)
            flash.message = message(code: 'user.profile.message.deleted')
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'user.profile.message.not.found')
            redirect(action: "show", id: id)
        }
    }

    def cancel() {
        render(view: "_panelBody", model: [profileInstance: Profile.get(params.id)])
    }
}
