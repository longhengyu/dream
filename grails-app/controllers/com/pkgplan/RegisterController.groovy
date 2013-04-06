package com.pkgplan

import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import grails.plugins.springsecurity.ui.ResetPasswordCommand

import com.pkgplan.dream.UserService
import javax.annotation.Resource
import grails.plugins.springsecurity.ui.RegisterCommand

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    @Resource
    UserService userService;

    def register = { RegisterCommand command ->

        if (command.hasErrors()) {
            render view: 'index', model: [command: command]
            return
        }

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        def user = lookupUserClass().newInstance(email: command.email, username: command.username,
                accountLocked: true, enabled: true)

        RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            flash.chainedParams = params
            redirect action: 'index'
            return
        }

        String url = generateLink('verifyRegistration', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = message(code: conf.ui.register.emailBody, args: [user.username, url])
        mailService.sendMail {
            to command.email
            from conf.ui.register.emailFrom
            subject message(code: conf.ui.register.emailSubject)
            html body.toString()
        }

        render view: 'index', model: [emailSent: true]
    }

    def forgotPassword = {

        if (!request.post) {
            // show the form
            if(request.xhr) {
                render template: "/register/forgot", model: [params: params]
            } else {
                // TODO: render the whole page
            }
            return
        }

        String username = params.username
        if (!username) {
            flash.error = message(code: 'spring.security.ui.forgotPassword.username.missing')
            redirect action: 'forgotPassword'
            return
        }

        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName

        def user = lookupUserClass().findByUsernameOrEmail(username, username)
        if (!user) {
            flash.error = message(code: 'spring.security.ui.forgotPassword.user.notFound')
            redirect action: 'forgotPassword'
            return
        }

        def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
        registrationCode.save(flush: true)

        String url = generateLink('resetPassword', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = message(code: conf.ui.forgotPassword.emailBody, args: [user.username, url])
        mailService.sendMail {
            to user.email
            from conf.ui.forgotPassword.emailFrom
            subject message(code: conf.ui.forgotPassword.emailSubject)
            html body.toString()
        }

        render view: "/register/forgotPassword", model: [params: params, emailSent: true]
    }
}