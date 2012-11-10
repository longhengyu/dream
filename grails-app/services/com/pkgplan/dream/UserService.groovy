package com.pkgplan.dream

import com.pkgplan.auth.User

class UserService {

    def springSecurityService

    def isCurrentUserValid() {
       return currentUser().dateExpired < new Date()
    }

    def currentUser() {
        return User.get(springSecurityService.principal.id)
    }
}
