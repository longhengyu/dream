
<div class="span3">
    <div class="feat-inner ">
        <!-- Font awesome icon -->
        <i class="${icon} text-${paymentId}"></i>
        <!-- Title -->
        <h4>${message(code: "payment.method.name.${paymentId}")}</h4>
        <!-- Para -->
        <p class="brown">${message(code: "payment.method.description.${paymentId}")}
        </p>
        <!-- Button -->
        <g:if test="${paymentId == 1}">
            <form method="post" action="/paypal/buy">
                <input type="hidden" id="returnAction" value="buy" name="returnAction">
                <input type="hidden" id="returnController" value="purchase" name="returnController">
                <input type="hidden" id="cancelAction" value="list" name="cancelAction">
                <input type="hidden" id="cancelController" value="purchase" name="cancelController">
                <input type="hidden" id="itemName" value="${purchaseInstance?.product?.name}" name="itemName">
                <input type="hidden" id="itemNumber" value="${purchaseInstance?.id}" name="itemNumber">
                <input type="hidden" id="amount" value="${usdPrice}" name="amount">
                <input type="hidden" id="discountAmount" value="0" name="discountAmount">
                <input type="hidden" id="tax" value="0.0" name="tax">
                <input type="hidden" id="buyerId" value="${userInstance?.id}" name="buyerId">
                <input type="hidden" id="currency" value="USD" name="currency">
                <button type="submit" class="btn btn-${paymentId}">
                    ${message(code: "purchase.button.pay")}
                </button>
            </form>

        </g:if>
        <g:elseif test="${paymentId == 2}">
            <a href="#use-giftcard-Modal" data-toggle="modal" data-target="#use-giftcard-Modal" type="submit" class="form-like btn btn-${paymentId}">${message(code: "purchase.button.pay")}</a>
        </g:elseif>
        <g:elseif test="${paymentId == 0}">
            <a href="#use-stripe-Modal" data-toggle="modal" data-target="#use-stripe-Modal" type="submit" class="form-like btn btn-${paymentId}">${message(code: "purchase.button.pay")}</a>
        </g:elseif>
        <g:elseif test="${paymentId == 3}">
            <form method="post" action="/purchase/buildAlipayRequest">
                <input type="hidden" id="purchaseId" value="${purchaseInstance?.id}" name="purchaseId">
                <button type="submit" class="btn btn-${paymentId}">
                    ${message(code: "purchase.button.pay")}
                </button>
            </form>
        </g:elseif>
    </div>
</div>

<g:if test="${paymentId == 2}">
<div id="use-giftcard-Modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <g:render template="/giftcard/use"/>
</div>
</g:if>


<g:if test="${paymentId == 0}">
<div id="use-stripe-Modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <g:render template="creditcardForm"/>
</div>
<script type="text/javascript">
    function getCardErrorMessageFromCode(errorCode) {
        if (errorCode == 'invalid_number') {
            return "${message(code: 'creditcard.error.invalid_number')}"
        } else if (errorCode == 'invalid_cvc') {
            return "${message(code: 'creditcard.error.invalid_cvc')}"
        } else if (errorCode == 'invalid_expiry_month') {
            return "${message(code: 'creditcard.error.invalid_expiry_month')}"
        } else if (errorCode == 'invalid_expiry_year') {
            return "${message(code: 'creditcard.error.invalid_expiry_year')}"
        } else {
            return "${message(code: 'creditcard.not.correct')}"
        }
    }
</script>
</g:if>