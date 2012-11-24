package com.pkgplan

import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.NullSaltSource
import grails.plugins.springsecurity.ui.ResetPasswordCommand
import com.pkgplan.dream.UserService

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    UserService userService;
    def resetPasswordWithoutToken = { ResetPasswordCommand command ->

        if (!request.post) {
            log.info("just load for the page.")
            render(view: 'resetPassword', model: [command: new ResetPasswordCommand(), hasToken: false])
            return
        }

        command.username = userService.currentUser().username;
        command.validate();
        if (command.hasErrors()) {
            render(view: 'resetPassword', model: [command: command, hasToken: false])
            return
        }

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        RegistrationCode.withTransaction { status ->
            def user = lookupUserClass().findByUsername(command.username)
            user.password = springSecurityUiService.encodePassword(command.password, salt)
            user.save()
        }

        springSecurityService.reauthenticate command.username

        flash.message = message(code: 'spring.security.ui.resetPassword.success')

        def conf = SpringSecurityUtils.securityConfig
        String postResetUrl = conf.ui.register.postResetUrl ?: conf.successHandler.defaultTargetUrl
        redirect uri: postResetUrl
    }

    def forgotPassword = {

        if (!request.post) {
            // show the form
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

        [emailSent: true]
    }
}