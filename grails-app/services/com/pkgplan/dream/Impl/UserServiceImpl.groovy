package com.pkgplan.dream.Impl

import com.pkgplan.auth.User
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.stereotype.Service
import grails.plugins.springsecurity.SpringSecurityService
import javax.annotation.Resource
import com.pkgplan.dream.UserService

@Service("userService")
class UserServiceImpl implements UserService{

    @Resource
    SpringSecurityService springSecurityService

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
}
