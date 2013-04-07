package com.pkgplan.dream

import grails.plugins.stripe.StripeTagLib
import com.stripe.Stripe

class DreamStripeTagLib extends StripeTagLib {
    def script = { attrs, body ->
        Stripe.apiKey = grailsApplication.config.grails.plugins.stripe.secretKey
        def publishableKey = grailsApplication.config.grails.plugins.stripe.publishableKey
        if(!publishableKey){
            throw new IllegalArgumentException("publishableKey must be provided! Please set it in your grails config")
        }
        out << render(template: "/stripe/script", model: [ publishableKey: publishableKey ])
        setupPage(attrs.formName)
    }

    private void setupPage(String formName){
        if(!formName){
            throw new IllegalArgumentException("formName must be provided! Please pass it as an attribute")
        }
        else{
            emitResponseHandler(formName)
            emitPageSetup(formName)
        }
    }

    private void emitResponseHandler(String formName){
        out << render(template: "/stripe/responseHandler", model: [formName: formName])
    }

    private void emitPageSetup(String formName){
        out << render(template: "/stripe/pageSetup", model: [formName: formName])
    }

    /**
     * Creates the form to input credit card details.
     *
     * @attr cssClass REQUIRED the field cssClass
     */
    def creditCardInputs = { attrs, body ->
        def cssClass = attrs.cssClass
        if(!cssClass){
            throw new IllegalArgumentException("cssClass must be provided! Please pass it as an attribute")
        }
        out << render(template: "/stripe/creditCardInputs", model: [cssClass: cssClass])
    }

}
