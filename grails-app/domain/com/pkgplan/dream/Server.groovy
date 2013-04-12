package com.pkgplan.dream
import grails.plugins.springsecurity.Secured
import com.pkgplan.auth.User

@Secured(['ROLE_ADMIN'])
class Server {

    String ipAddr
    String hostname
    int capacity
    Date dateCreated
    static hasMany = [users: User]

    static constraints = {
        hostname(blank:false)
        ipAddr(blank:false, matches:/^(?:(?:25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d?\d)$/)
        capacity( min: 1)
        dateCreated()
    }

    String toString() {
        return this.hostname
    }
}
