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
}