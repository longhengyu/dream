package com.pkgplan.dream

import com.pkgplan.auth.User
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class UserService {

    def springSecurityService

    def isCurrentUserValid() {
       return currentUser().dateExpired < new Date()
    }

    def currentUser() {
        return User.get(springSecurityService.principal.id)
    }

    def isAdminLoggedIn() {
        SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")
    }

    def isUserLonggedIn() {
        SpringSecurityUtils.ifAnyGranted("ROLE_USER")
    }
}
