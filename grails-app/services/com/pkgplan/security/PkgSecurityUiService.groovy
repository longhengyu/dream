package com.pkgplan.security

import grails.plugins.springsecurity.ui.SpringSecurityUiService
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.transaction.interceptor.TransactionAspectSupport

/**
 * Created with IntelliJ IDEA.
 * User: longhengyu
 * Date: 12-11-16
 * Time: 下午11:06
 * To change this template use File | Settings | File Templates.
 */
class PkgSecurityUiService extends SpringSecurityUiService{
    RegistrationCode register(user, String cleartextPassword, salt) {

        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName
        String passwordFieldName = SpringSecurityUtils.securityConfig.userLookup.passwordPropertyName

        //String password = encodePassword(cleartextPassword, salt)
        //user."$passwordFieldName" = password
        /**
         * There is a bug in Grails Sprint Security UI (actually not a bug, but 2 plugins are conflict),
         * because both are encrypting password, which makes it twice.
         * Since we have beforeInsert() in User.groovy, we don't need to encrypt password here.
         */
        user."$passwordFieldName" = cleartextPassword

        if (!user.save()) {
            warnErrors user, messageSource
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
            return null
        }

        def registrationCode = new RegistrationCode(username: user."$usernameFieldName")
        if (!registrationCode.save()) {
            warnErrors registrationCode, messageSource
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly()
        }

        registrationCode
    }
}
