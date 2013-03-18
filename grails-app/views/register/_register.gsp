<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">
        <g:if test='${emailSent}'>
            <g:message code="user.register.success"/>
            </g:if><g:else>
            <g:message code="user.register.title"/>
        </g:else>
    </h3>
</div>
<div class="modal-body" id="register-body">
    <div class="row-fluid">
        <g:hasErrors bean="${command}">
            <div class="alert alert-error">
                <ul class="">
                    <g:eachError bean="${command}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>


        <g:if test='${emailSent}'>
            <div class="alert alert-success">
                <p><g:message code='user.register.message.mail.sent'/>
                </p>
            </div>
        </g:if>
        <g:else>
            <div class="span10">

                <g:formRemote class="form-horizontal" url="[controller: 'register', action:'register']" name='registerForm' update="register-Modal" >

                    <fieldset>
                        <div class="control-group ${hasErrors(bean:command,field:'username', 'error')}">
                            <label class="control-label" for="username"><g:message code="login.label.username"/></label>
                            <div class="controls">
                                <input type="text" class="input-append" id="username" name="username" value="${command?.username}">
                            </div>
                        </div>

                        <div class="control-group ${hasErrors(bean:command,field:'email', 'error')}">
                            <label class="control-label" for="email"><g:message code="user.register.label.email"/></label>
                            <div class="controls">
                                <input type="text" class="input-append" id="email" name="email" value="${command?.email}">
                            </div>
                        </div>

                        <div class="control-group ${hasErrors(bean:command,field:'password', 'error')}">
                            <label class="control-label" for="password"><g:message code="login.label.password"/></label>
                            <div class="controls">
                                <input type="password" class="input-append" id="password" name="password" value="${command?.password}">
                            </div>
                        </div>
                        <div class="control-group ${hasErrors(bean:command,field:'password2', 'error')}">
                            <label class="control-label" for="password2"><g:message code="user.register.label.password.again"/></label>
                            <div class="controls">
                                <input type="password" class="input-append" id="password2" name="password2" value="${command?.password2}">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="registerButton"></label>
                            <div class="controls">
                                <g:submitButton class="btn btn-primary btn-large" id="registerButton"
                                                name="register" value="${message(code: 'user.register.button.create')}"
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
            <g:message code="general.close"/>
            </g:if><g:else>
            <g:message code="user.register.not.now"/>
            </g:else>
    </button>
</div>
