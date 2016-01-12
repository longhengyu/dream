<section class="light-bg" id="use-qr-body">

    <g:if test="${flash.error_ajax}">
        <div class="alert alert-danger small" role="status">
            <a class="close" data-dismiss="alert" href="#">×</a>
            ${flash.error_ajax}
            <script type="text/javascript">setTimeout(function(){$("#use-qr-body .alert").fadeOut(1000 );},2000)</script>
        </div>
    </g:if>
    <g:formRemote update="use-qr-Modal" class="form-inline" name="purchase" url="[controller: 'purchase', action: 'buy']">
        <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
        <g:hiddenField name="paymentMethod" value="4"/>
        <input class="submit-by-enter" name="code" type="text" placeholder="${message(code:'payment.method.4.order.num')}">
        <g:submitToRemote url="[controller: 'purchase', action: 'buy']" class="btn btn-success btn-loading" data-loading-text="Loading..." value="${message(code: 'introducer.button.verify.id')}" update="modal-pay-qr-body"/>
        <g:loading/>
    </g:formRemote>

</section>

