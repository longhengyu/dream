<div class="modal-body popup-title" id="use-giftcard-body">
    <div class="row-fluid">
        <div class="well-white bottom20px">
            <div class="page-header">
                <h3><g:message code="giftcard.use.title"/></h3>
            </div>
            <div class="padding20px form">
                <g:if test="${flash.error_ajax}">
                    <div class="alert alert-error" role="status">
                        <a class="close" data-dismiss="alert" href="#">×</a>
                        ${flash.error_ajax}
                        <script type="text/javascript">setTimeout(function(){$("#use-giftcard-body .alert").fadeOut(1000 );},2000)</script>
                    </div>
                </g:if>
                <g:formRemote update="use-giftcard-Modal" class="form-inline" name="purchase" url="[controller: 'purchase', action: 'buy']">
                    <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
                    <g:hiddenField name="paymentMethod" value="2"/>
                    <input name="code" type="text" placeholder="${message(code:'giftcard.use.code')}">
                    <g:submitToRemote url="[controller: 'purchase', action: 'buy']" class="btn btn-success btn-loading" data-loading-text="Loading..." value="${message(code: 'purchase.button.pay')}" update="use-giftcard-Modal"/>
                    <g:loading/>
                </g:formRemote>
            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">
        <g:message code="general.close"/>
    </button>
</div>
