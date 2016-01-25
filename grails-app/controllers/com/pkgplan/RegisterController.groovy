package com.pkgplan

import com.pkgplan.dream.UserService
import grails.plugins.springsecurity.ui.RegisterCommand
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.web.servlet.support.RequestContextUtils as RCU

import javax.annotation.Resource
import java.nio.charset.Charset

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    @Resource
    UserService userService;

    def register = { RegisterCommand command ->

        if (command.hasErrors()) {
            render view: 'reen_index', model: [command: command]
            return
        }

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        def user = lookupUserClass().newInstance(email: command.email, username: command.username,
                accountLocked: true, enabled: true, lang: RCU.getLocale(request).toString())

        RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            flash.chainedParams = params
            redirect action: 'reen_index'
            return
        }

        String url = g.createLink(action: 'verifyRegistration', params: [t: registrationCode.token], absolute: 'true')

        def conf = SpringSecurityUtils.securityConfig
        def body = message(code: conf.ui.register.emailBody, args: [user.username, url])
        mailService.sendMail {
            to command.email
            from conf.ui.register.emailFrom
            bcc conf.ui.register.emailFrom
            subject message(code: conf.ui.register.emailSubject)
            html body.toString()
        }

        // get the email link
        def checkMailLink
        String mailDomain = command.email.split("@")[1]
        for ( e in grailsApplication.config.dream.mail.checkYourMailLink) {
            if (e.key.equals(mailDomain)) {
                checkMailLink = e.value
            }
        }

        render view: 'reen_index', model: [emailSent: true, checkMailLink: checkMailLink]
    }

    def forgotPassword = {

        if (!request.post) {
            // show the form
            if(request.xhr) {
                render template: "/register/forgot", model: [params: params]
            } else {
                // TODO: render the whole page
            }
            render view: "/register/reen_forgot_password", model: [params: params]
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

        String url = g.createLink(action: 'resetPassword', params: [t: registrationCode.token], absolute: 'true')

        def conf = SpringSecurityUtils.securityConfig
        def body = message(code: conf.ui.forgotPassword.emailBody, args: [user.username, url])
        mailService.sendMail {
            to user.email
            from conf.ui.forgotPassword.emailFrom
            subject message(code: conf.ui.forgotPassword.emailSubject)
            html body.toString()
        }

        render view: "/register/reen_forgot_password", model: [params: params, emailSent: true]
    }

    def index = {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'reen_index', params: params
        }
    }

    def reen_index = {

    }
}

class RegisterCommand {

    String username
    String email
    String password
    String password2

    def grailsApplication

    static constraints = {
        username blank: false, nullable: false, validator: { value, command ->
            if (value) {
                def User = command.grailsApplication.getDomainClass(
                        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz

                String usernameValidationRegex = command.grailsApplication.config.username.validationRegex
                if (!value.matches(usernameValidationRegex)) {
                    return 'registerCommand.username.ascii'
                }
                if (User.findByUsername(value)) {
                    return 'registerCommand.username.unique'
                }
            }
        }
        email blank: false, nullable: false, email: true, validator: { value, command ->
            if (value) {
                def User = command.grailsApplication.getDomainClass(
                        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
                if (User.findByEmail(value)) {
                    return 'registerCommand.email.unique'
                }
            }
        }
        password blank: false, nullable: false, validator: RegisterController.passwordValidator
        password2 validator: RegisterController.password2Validator
    }
}