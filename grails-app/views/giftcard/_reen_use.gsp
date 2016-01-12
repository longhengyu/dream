<section id="use-giftcard-body" class="light-bg inner-xs inner-left-xs inner-right-xs">

    <g:if test="${flash.error_ajax}">
        <div class="alert alert-danger small" role="status">
            <a class="close" data-dismiss="alert" href="#">×</a>
            ${flash.error_ajax}
            <script type="text/javascript">setTimeout(function(){$("#use-giftcard-body .alert").fadeOut(1000 );},2000)</script>
        </div>
    </g:if>
    <g:formRemote update="use-giftcard-Modal" class="form-inline" name="purchase" url="[controller: 'purchase', action: 'buy']">
        <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
        <g:hiddenField name="paymentMethod" value="2"/>
        <input class="submit-by-enter" name="code" type="text" placeholder="${message(code:'giftcard.use.code')}">
        <g:submitToRemote url="[controller: 'purchase', action: 'buy']" class="btn btn-success btn-loading" data-loading-text="Loading..." value="${message(code: 'purchase.button.pay')}" update="modal-pay-giftcard-body"/>
        <g:loading/>
    </g:formRemote>

</section>

