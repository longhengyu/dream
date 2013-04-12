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
        gender(inList: ['male','female','nosay'], blank: false)
        country(blank: false)
        occupation(inList:['student','internet','communication','design','music','government','others'], blank: false)
        age(min: 1)
        education(blank: false, inList: ['high', 'bachelor', 'master', 'doctor', 'others'])
        os(blank: false, inList: ['winxp', 'win7', 'MAC OSX', 'linux', 'iOS'])
        purpose(blank: false, inList: ['web', 'music', 'youtube', 'sns', 'download', 'others'])
    }

    String toString() {
        return this.fullName
    }
}
