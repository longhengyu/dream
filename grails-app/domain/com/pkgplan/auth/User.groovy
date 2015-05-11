package com.pkgplan.auth

import com.pkgplan.dream.Profile
import com.pkgplan.dream.Purchase
import com.pkgplan.dream.Server

class User {

	transient springSecurityService

	String username
	String password
    String email
    Date dateCreated
    Date dateExpired
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    Profile profile
    static hasOne = [server: Server, introducer: User]

    static hasMany = [purchases: Purchase, referrals: User]

	static constraints = {
		username blank: false, unique: true
		password blank: false
        email unique: false
        profile(nullable: true)
        purchases(nullable: true)
        server(nullable: true)
        introducer(nullable: true)
        dateExpired(nullable: true)
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
        password = springSecurityService.encodePassword(password)
    }

    /**
     * we believe the expired date equate the created date when a new user come in,
     * this date will be updated if user buy a product.
     **/
    Date getDateExpired() {
        return dateExpired?:dateCreated
    }

    boolean hasPurchased(){
        for(Purchase purchase in purchases) {
            if (purchase.datePay != null) {
                return true
            }
        }
        return false
    }

}
