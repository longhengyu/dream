<g:if test="${paymentId == 1}">
    <!-- paypal -->
    <paypal:submitButton
            itemName="${purchaseInstance?.product?.name}"
            itemNumber="${purchaseInstance?.id}"
            discountAmount = "0"
            amount="${usdPrice}"
            buyerId="${userInstance?.id}"
            returnAction = "buy"
            returnController = "purchase"
            cancelAction = "list"
            cancelController = "purchase"
            classStyle="buyOnline buyOnline-color-${paymentId}"
            value="${message(code: "payment.method.name.${paymentId}")}"
    />

</g:if>
<g:else>
    <g:form>
        <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
        <g:hiddenField name="paymentMethod" value="${paymentId}"/>
        <g:actionSubmit class="buyOnline buyOnline-color-${paymentId}" action="buy" value="${message(code: "payment.method.name.${paymentId}")}"/>
    </g:form>
</g:else>
