package com.pkgplan

import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import grails.plugins.springsecurity.ui.ResetPasswordCommand

import com.pkgplan.dream.UserService
import javax.annotation.Resource

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    @Resource
    UserService userService;


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
            redirect action: 'forgotPassword', params: params
            return
        }

        def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
        registrationCode.save(flush: true)

        String url = generateLink('resetPassword', [t: registrationCode.token])

        def conf = SpringSecurityUtils.securityConfig
        def body = conf.ui.forgotPassword.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to user.email
            from conf.ui.forgotPassword.emailFrom
            subject conf.ui.forgotPassword.emailSubject
            html body.toString()
        }

        render template: "/register/forgot", model: [params: params, emailSent: true]
    }
}