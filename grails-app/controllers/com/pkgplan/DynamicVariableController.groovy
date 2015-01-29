package com.pkgplan

import grails.converters.JSON
import org.codehaus.groovy.grails.commons.ApplicationHolder

import java.text.MessageFormat
import javax.servlet.http.HttpServletResponse

class DynamicVariableController {

    def log

    def beforeInterceptor = {
        def serviceKey = params.get("serviceKey")
        if (grailsApplication.config.dream.api["serviceKey"] != serviceKey) {
            response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
            return false
        }
    }

    // call google api to get the currency rate and refresh it in the settingØ
    def refreshCurrencyRate() {
        try {
            String url = MessageFormat.format(grailsApplication.config.dream.currency.api[params.api].toString(), params.fromCur.toString(), params.toCur.toString())
            def callUrl = new URL(url)
            def jsonResponse = callUrl.getText()
            def jsonParsedObject = JSON.parse(jsonResponse)
            if(jsonParsedObject){
                String rhs = jsonParsedObject.rhs.toString()
                ApplicationHolder.application.config.exchangeRate = new BigDecimal(rhs.split(" ")[0].toString())
                render("updated: " + ApplicationHolder.application.config.exchangeRate.toString())
            } else {
                throw new RuntimeException()
            }
        } catch (Exception e) {
            log.error("error when fetching currency rate.")
            render("error: " + ApplicationHolder.application.config.exchangeRate.toString())
        }

    }
}
