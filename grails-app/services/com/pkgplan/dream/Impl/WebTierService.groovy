package com.pkgplan.dream.Impl

import org.springframework.web.context.request.RequestContextHolder as RCH

class WebTierService {

    boolean transactional = false

    static scope = "prototype"

    def static getRequest(){
        return RCH.currentRequestAttributes().currentRequest
    }

    def static getSession(){
        return RCH.currentRequestAttributes().session
    }

}