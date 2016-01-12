package com.pkgplan
import org.apache.commons.validator.EmailValidator
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {

    def userService
    def mailService
    EmailValidator emailValidator = EmailValidator.getInstance()

    def index() {
        if (userService.isAdminLoggedIn()) {
            redirect(action: 'list', controller: 'user')
        }

        if (userService.isUserLonggedIn()) {
            redirect(action: 'show', controller: 'user')
        }

        render view: "/home/reen_home"
    }

    def manual() {
        redirect(action: 'manual_mac', controller: 'home')
    }

    def manual_mac() {
        render view: "/home/reen_manual_mac"
    }

    def manual_ios() {
        render view: "/home/reen_manual_ios"
    }

    def manual_win7() {
        render view: "/home/reen_manual_win7"
    }

    def manual_android() {
        render view: "/home/reen_manual_android"
    }

	// receive a message and send mail
    def contact() {
		if (!request.post) {
            render view: "/home/reen_contact"
            return
		}
		if (!params.email) {
			flash.error = message(code: 'contact.error.message.null.email')
            render view: "/home/reen_contact"
            return
		}
        if (!emailValidator.isValid(params.email)) {
            flash.error = message(code: 'contact.error.message.wrong.email')
            render view: "/home/reen_contact"
            return
        }
		if (!params.subject) {
			flash.error = message(code: 'contact.error.message.null.subject')
            render view: "/home/reen_contact"
            return
		}
		if (!params.content) {
			flash.error = message(code: 'contact.error.message.null.content')
            render view: "/home/reen_contact"
            return
		}

        mailService.sendMail {
            // TODO: change this receiver address to a good one, info@pkgplan.com or something
            to grailsApplication.config.grails.mail.username
            from SpringSecurityUtils.securityConfig.ui.register.emailFrom
            subject params.subject
            html params.content + "\n\n" + params.email
        }

		render view: "/home/reen_contact", model: [emailSent: true]
    }

    def home() {
        if (!userService.isUserLonggedIn()) {
            redirect(action: "index")
        }
    }
}
