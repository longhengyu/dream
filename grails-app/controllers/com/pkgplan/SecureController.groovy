package com.pkgplan

import javax.servlet.http.HttpServletResponse

// this class is public, the caller should provide the service Key
class SecureController {

    def secureService

    def index = {
        render 'Secure access only'
    }

    def chapSec = {
        def serviceKey = params.get("serviceKey")

        if (grailsApplication.config.dream.api["serviceKey"] != serviceKey) {
            response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
            return
        }
        def fileContent = secureService.generateSecFile(params.get("hostname"))
        if (fileContent == null) {
            response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
            return
        }
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "attachment;filename=chap-secrets")
        response.outputStream << fileContent
    }




}
