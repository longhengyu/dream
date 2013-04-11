package com.pkgplan

import grails.converters.JSON
import org.codehaus.groovy.grails.commons.ApplicationHolder

class DynamicVariableController {

    def log

    // call google api to get the currency rate and refresh it in the settingØ
    def refreshCurrencyRate() {
        try {
            String url = "http://www.google.com/ig/calculator?hl=en&q=1" + params.fromCur +  "=?" + params.toCur
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
