<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">
        <g:if test='${emailSent}'>
            Success
        </g:if><g:else>
            <g:message code='spring.security.ui.forgotPassword.title'/>
        </g:else>
    </h3>
</div>
<div class="modal-body" id="forgot-body">
    <div class="row-fluid">
        <g:if test="${flash.error}">
            <div class="alert alert-error" role="status">
                ${flash.error}
            </div>
        </g:if>


        <g:if test='${emailSent}'>
            <div class="alert alert-success">
                <p><g:message code='password.forgot.password.message.mail.sent'/>
                </p>
            </div>
        </g:if>
        <g:else>
            <div class="span10">
                <p><g:message code='password.forgot.password.description'/></p>

                <g:formRemote autocomplete='off' class="form-horizontal" url="[controller: 'register', action:'forgotPassword']" name='forgotForm' update="forgot-password-Modal" >

                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" for="username"><g:message code='password.forgot.password.label.name.mail'/></label>
                            <div class="controls">
                                <input type="text" class="input-append" id="username" name="username" value="${params.username}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="getPassButton"></label>
                            <div class="controls">
                                <g:submitButton class="btn btn-primary btn-large" id="getPassButton"
                                                name="register" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}"
                                />
                            </div>
                        </div>
                    </fieldset>
                </g:formRemote>
            </div>
            <div class="span2">

            </div>
        </g:else>
    </div>
</div>

<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">
        <g:if test='${emailSent}'>
            Close
        </g:if><g:else>
            Not Now
        </g:else>
    </button>
</div>