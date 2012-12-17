package com.pkgplan.dream

import org.grails.paypal.PaypalTagLib

class DreamPayPalTagLib extends PaypalTagLib {

    def submitButton = { attrs ->
        def config = grailsApplication.config.grails.paypal
        def itemName = attrs.itemName
        def itemNumber = attrs.itemNumber
        def amount = attrs.amount
        def discountAmount = attrs.discountAmount
        def tax = attrs.tax ?: "0.0"
        def buyerId = attrs.buyerId
        def value = attrs.value ?: "Paypal"
        def classStyle = attrs.classStyle ?: "buyOnline"
        def currency = attrs.currency ?: Currency.getInstance("USD")
        def returnAction = attrs.returnAction ? "${hiddenField(name:'returnAction', value:attrs.returnAction)}" : ""
        def returnController = attrs.returnController ? "${hiddenField(name:'returnController', value:attrs.returnController)}" : ""
        def cancelAction = attrs.cancelAction ? "${hiddenField(name:'cancelAction', value:attrs.cancelAction)}" : ""
        def cancelController = attrs.cancelController ? "${hiddenField(name:'cancelController', value:attrs.cancelController)}" : ""
        def originalURL = attrs.originalURL ? "${hiddenField(name:'originalURL', value:attrs.originalURL)}" : ""
        def additionalParams = new StringBuffer()
        attrs.params?.each { k,v -> additionalParams << "${hiddenField(name:k, value:v)}"  }
        attrs.remove('params')

        if(!config.server || !config.email) {
            out << '<div style="border:1px solid red; padding:5px;">Paypal is miconfigured. You need to specify the "grails.paypal.server" and "grails.paypal.email" variables</div>'
        }
        else if(!itemNumber || !itemName || !amount || !buyerId) {
            out << "<div style=\"border:1px solid red; padding:5px;\">Paypal button error: One of required attributes missing (itemName=${itemName}, itemNumber=${itemNumber}, amount=${amount} or buyerId=${buyerId})</div>"
        }
        else {
            def formParams = [:]
            if(attrs.transactionId) formParams.transactionId = attrs.transactionId
            out << g.form(controller:"paypal",action:"buy", params:formParams) {
                """ ${returnAction}
				    ${returnController}
				    ${cancelAction}
				    ${cancelController}
					${additionalParams}
					${originalURL}
					${hiddenField(name:'itemName', value:itemName)}
					${hiddenField(name:'itemNumber', value:itemNumber)}
					${hiddenField(name:'amount', value:amount)}
					${hiddenField(name:'discountAmount', value:discountAmount)}
					${hiddenField(name:'tax', value:tax)}
					${hiddenField(name:'buyerId', value:buyerId)}
					${hiddenField(name:'currency', value:currency)}
					<input type=\"submit\" value=\"${value}\" name=\"_action_buy\" class="${classStyle}">
					<img alt="" border=\"0\" src=\"https://www.paypal.com/en_US/i/scr/pixel.gif\" width=\"1\" height=\"1\">
					"""
            }
        }
    }

}
