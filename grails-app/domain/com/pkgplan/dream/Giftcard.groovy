package com.pkgplan.dream

import java.util.Date;

import com.pkgplan.auth.User

class Giftcard {

	static belongsTo = User
	String code
	Product product
	Date dateUsed
	String status
	
    static constraints = {
        code(blank: false)
        product(blank: false)
        status(inList: ['Available','Used'], blank: false)
    } 
}
