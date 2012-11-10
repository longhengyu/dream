package com.pkgplan.dream

import com.pkgplan.auth.User

class Profile {

    static belongsTo = User
    String fullName
    String gender
    String country
    TimeZone timezone

    static constraints = {
        fullName(blank: false)
        gender(inList: ['Male','Female','Don\'t want to say'], blank: false)
        country(blank: false)
        timezone(blank: false)
    }

    String toString() {
        return this.fullName
    }
}
