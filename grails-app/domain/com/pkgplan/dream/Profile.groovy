package com.pkgplan.dream

import com.pkgplan.auth.User

class Profile {

    static belongsTo = User
    String fullName
    String gender
    String country
    String timezone

    static constraints = {
        fullName(nullable: true)
        gender(inList: ['M','F','X'])
        country(nullable: true)
        timezone(nullable: true)
    }

    String toString() {
        return this.fullName
    }
}
