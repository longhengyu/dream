package com.pkgplan
import org.apache.commons.validator.EmailValidator
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class HomeController {

    def userService
    def mailService
    EmailValidator emailValidator = EmailValidator.getInstance()

    def index() {
        if(request.xhr) {
            render(view: "_body")
            return
        }
    }

    def manual() {
		
    }

	// receive a message and send mail
    def contact() {
		if (!request.post) {
			return
		}
		if (!params.email) {
			flash.error = message(code: 'contact.error.message.null.email')
			return
		}
        if (!emailValidator.isValid(params.email)) {
            flash.error = message(code: 'contact.error.message.wrong.email')
            return
        }
		if (!params.subject) {
			flash.error = message(code: 'contact.error.message.null.subject')
			return
		}
		if (!params.content) {
			flash.error = message(code: 'contact.error.message.null.content')
			return
		}

        mailService.sendMail {
            // TODO: change this receiver address to a good one, info@pkgplan.com or something
            to grailsApplication.config.grails.mail.username
            from SpringSecurityUtils.securityConfig.ui.register.emailFrom
            subject params.subject
            html params.content + "\n\n" + params.email
        }

		render view: "/home/contact", model: [emailSent: true]
    }

    def home() {
        if (!userService.isUserLonggedIn()) {
            redirect(action: "index")
        }
    }
}
