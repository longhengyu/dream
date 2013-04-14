<html xmlns:wb=“http://open.weibo.com/wb”>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="pkgsimplelayout" />
</head>
<body>
<div class="well-white bottom20px">
    <div class="page-header">
        <h1><g:message code="password.reset.password.description"/></h1>
    </div>

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
        <form class="kissmetrics-login" action='/register/resetPassword' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
            <g:hiddenField name='t' value='${token}'/>
            <input type="password" autofocus="" placeholder="<g:message code='login.label.password'/>" name="password" value="${command?.password}">
            <input type="password" placeholder="<g:message code='user.register.label.password.again'/>" name="password2" value="${command?.password2}" >
            <div class="cf">
                <div class="left">
                    <g:submitButton class="btn btn-success btn-large" id="loginButton" name="login" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}" />
                </div>

            </div>

        </form>



    </div>
</div>
</body>

</html>