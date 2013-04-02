package com.pkgplan.dream

import com.pkgplan.auth.User

class Profile {

    static belongsTo = User
    String fullName
    String gender
    String country
    String occupation
    int age
    String education
    String os
    String purpose

    // TODO these in list should be move to properties files, and leave here only the key.
    static constraints = {
        fullName(blank: false)
        gender(inList: ['Male','Female','Don\'t want to say'], blank: false)
        country(blank: false)
        occupation(inList:['Student','Internet Related','Communication','Designer/Art','Music','Govement','Others'], blank: false)
        age(min: 1, blank: false)
        education(blank: false, inList: ['High School or equivalent', 'Bachelor or equivalent', 'Master or equivalent', 'Doctoral or equivalent'])
        os(blank: false, inList: ['winxp', 'win7', 'MAC OSX', 'linux', 'iOS'])
        purpose(blank: false, inList: ['web browsing', 'listening music', 'downloading', 'others'])
    }

    String toString() {
        return this.fullName
    }
}
