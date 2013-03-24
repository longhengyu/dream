<html>
<head>
    <title><g:message code="site.page.title"/></title>
    <g:if test='${emailSent == true}'><meta name="layout" content='pkgsimplelayout' /></g:if>
    <g:else><meta name="layout" content='pkgsimplelayout2' /></g:else>
</head>
<body>
<g:if test='${emailSent}'>
    <div class="well-white bottom20px">
        <div class="page-header">
            <h1><g:message code="user.register.success"/></h1>
        </div>

        <div class="padding20px form">
            <div class="alert alert-success">
                <p><g:message code='user.register.message.mail.sent'/>
                </p>
            </div>
        </div>
    </div>
</g:if>
<g:else>
<div class="signup-wrapper cf">
    <div class="form-wrapper left">
        <div class="well-white bottom20px">
            <div class="padding20px form">
                <g:hasErrors bean="${command}">
                    <div class="alert alert-error">
                        <ul class="">
                            <g:eachError bean="${command}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:form class="kissmetrics-login" url="[controller: 'register', action:'register']" autocomplete='off'>


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

                    <div class="cf">
                        <div class="left">
                            <span class="free-trial">30 day free trial, no credit card required.</span>
                        </div>
                        <div class="right">
                            <g:submitButton class="btn btn-success btn-large" id="loginButton"
                                            name="register" value="${message(code: 'user.register.button.create')}"/>
                        </div>
                    </div>

                </g:form>

                <span class="by-clicking">By clicking "Get Started" you agree to <a
                    href="https://gathercontent.com/terms-of-use">Terms of Use</a> and <a
                    href="https://gathercontent.com/privacy-policy">Privacy Policy</a>.</span>
            </div>
        </div>
    </div>

    <div class="perks right">
        <p class="up-and-running">You’ll be up and running<br>in less than a minute</p>

        <p class="included">Included in your account:</p>
        <ul class="perks-list">
            <li>SSL Connection (bank level)</li>
            <li>Hourly offsite back-ups</li>
            <li>100GB Storage</li>
            <li>30-day free trial</li>
            <li>Friendly customer support</li>
        </ul>

        <p class="joining">
            You are joining 12.000+ other web<br>professionals who have a distaste<br>for unorganised content.
        </p>
    </div>

</div>
</g:else>
</html>
