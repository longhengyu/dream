package com.pkgplan.dream.Impl

import com.pkgplan.auth.User
import com.pkgplan.dream.UserService
import com.pkgplan.security.SecureService
import grails.plugins.springsecurity.SpringSecurityService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.stereotype.Service

import javax.annotation.Resource

@Service("userService")
class UserServiceImpl implements UserService{

    @Resource
    SpringSecurityService springSecurityService

    @Resource
    SecureService secureService

    boolean isCurrentUserValid() {
       return currentUser().dateExpired < new Date()
    }

    User currentUser() {
        return User.get(springSecurityService.principal.id)
    }

    boolean isAdminLoggedIn() {
        SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")
    }

    boolean isUserLonggedIn() {
        SpringSecurityUtils.ifAnyGranted("ROLE_USER")
    }

    String getCurrentUserVpnPassword() {
        return secureService.encodePasswordForVpn(currentUser().password)
    }
}
