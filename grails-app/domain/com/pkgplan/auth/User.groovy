package com.pkgplan.auth

import com.pkgplan.dream.Profile

class User {

	transient springSecurityService

	String username
	String password
    String email
    Date dateCreated
    /**
     * we believe the expired date equate the created date when a new user come in,
     * this date will be updated if user buy a product.
    **/
    Date dateExpired = new Date()
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    Profile profile

	static constraints = {
		username blank: false, unique: true
		password blank: false
        email unique: false
        profile(nullable: true)
	}

	static mapping = {
        table('pkguser')
        password column: 'passwd'
        profile(lazy: false)
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

    String toString() {
        return this.username
    }

    protected void encodePassword() {
        if (springSecurityService.passwordEncoder != null){
            password = springSecurityService.encodePassword(password)
        }

    }
}
