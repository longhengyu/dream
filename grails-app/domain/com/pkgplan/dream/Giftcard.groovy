package com.pkgplan.dream

import com.pkgplan.auth.User

class Giftcard {

    static belongsTo = [owner: User]
	String code
	Product product
    Purchase purchase
	Date dateUsed
	String status = 'Available'
	
    static constraints = {
        code(blank: false)
        product(nullable: false)
        purchase(nullable: true)
        status(inList: ['Available','Used'], blank: false)
        dateUsed(nullable:  true)
    } 
}
