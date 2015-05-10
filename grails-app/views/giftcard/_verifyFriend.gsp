<g:if test="${applied != true}">
    <div class="test-margin-left">
        <p><g:message code="introducer.free.trail.description"/></p>
    </div>
</g:if>

<g:if test="${applied == true}">

    <g:if test="${verified == true}">
        <div class="padding20px form features-two">
            <p class="alert alert-success test-margin-left"><g:message code="introducer.verify.success"/></p>
        </div>
    </g:if>
    <g:else>
        <div class="padding20px form features-two" id="verify-friend-body">
            <g:if test="${flash.message}">
                <div class="alert alert-success test-margin-left" >
                    ${flash.message}
                </div>
            </g:if>
            <g:if test="${flash.error_ajax}">
                <div class="alert alert-error test-margin-left" role="status">
                    ${flash.error_ajax}
                </div>
                <script type="text/javascript">setTimeout(function(){$("#verify-friend-body .alert-error").fadeOut(1000 );},2000)</script>
            </g:if>

            <g:formRemote update="verify-friend-Modal" class="form-inline" name="purchase" url="[controller: 'giftcard', action: 'verify']">
                <input class="submit-by-enter" name="code" type="text" placeholder="<g:message code="introducer.placeholder.code"/>" value="${code}">
                <input name="purchaseId" type="hidden" value="${purchaseId}">
                <g:submitToRemote url="[controller: 'giftcard', action: 'verify']" class="btn btn-success btn-loading" data-loading-text="Loading..." value="${message(code: 'introducer.button.verify.code')}" update="verify-friend-Modal"/>
                <g:loading/>
            </g:formRemote>

        </div>
    </g:else>

</g:if>
<g:else>

    <div class="padding20px form features-two" id="verify-friend-body">
        <g:if test="${flash.error_ajax}">
            <div class="alert alert-error test-margin-left" role="status">
                ${flash.error_ajax}
            </div>
            <script type="text/javascript">setTimeout(function(){$("#verify-friend-body .alert-error").fadeOut(1000 );},2000)</script>
        </g:if>
        <g:formRemote update="verify-friend-Modal" class="form-inline" name="purchase" url="[controller: 'giftcard', action: 'issue']">
            <input class="submit-by-enter" name="username" type="text" placeholder="<g:message code="introducer.placeholder.id"/>" value="${username}">
            <g:submitToRemote url="[controller: 'giftcard', action: 'issue']" class="btn btn-success btn-loading " data-loading-text="Loading..." value="${message(code: 'introducer.button.verify.id')}" update="verify-friend-Modal"/>
            <g:loading/>
        </g:formRemote>
    </div>

    <div class="test-margin-left">
        <p><g:message code="introducer.free.trail.apply"/></p>
    </div>

</g:else>
<script type="text/javascript">
    $('.btn-loading').click(function() {
        $(this).addClass('disabled');
        $('.submit-by-enter').prop('readonly', true);
        if ($(this).next().is("img")) {
            $(this).next().show();
        }
    });
    $('.submit-by-enter').keydown(function(event) {
        if (event.keyCode == 13) {
            $('.btn-loading').addClass('disabled');
            $('.submit-by-enter').prop('readonly', true);
            if ($('.btn-loading').next().is("img")) {
                $('.btn-loading').next().show();
            }
        }
    });
</script>