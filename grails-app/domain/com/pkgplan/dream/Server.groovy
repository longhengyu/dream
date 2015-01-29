package com.pkgplan.dream

import com.pkgplan.auth.User
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class Server {

    String ipAddr
    String hostname
    Integer capacity
    Date dateCreated
    static hasMany = [users: User]

    static constraints = {
        hostname(blank:false)
        ipAddr(blank:false, matches:/^(?:(?:25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d?\d)$/)
        capacity(min: 1)
        dateCreated()
    }

    String toString() {
        return this.hostname
    }
}
