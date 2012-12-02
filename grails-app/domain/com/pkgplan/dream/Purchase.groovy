package com.pkgplan.dream

import com.pkgplan.auth.User

class Purchase {

    Date dateCreated
    static belongsTo = [owner: User]
    Product product
    String paymentMethod
    Date datePay
    String purchaseNumber

    static constraints = {
        owner(nullable: false)
        product(nullable: false)
        datePay(nullable: true)
        purchaseNumber(nullable: true)
    }
}
