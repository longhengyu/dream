<html>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="pkgsimplelayout" />
</head>
<body>
<%
    def springSecurityService
%>
<%@ page import="com.pkgplan.security.Impl.SecureServiceImpl; com.pkgplan.security.Impl.SecureServiceImpl" %>
<div class="well-white bottom20px">
    <div class="page-header">
        <h1><g:message code='password.forgot.title'/></h1>
    </div>

    <div class="padding20px form">
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
            <form class="kissmetrics-login" method='POST' autocomplete='off' url="[controller: 'register', action:'forgotPassword']" >
                <p><g:message code='password.forgot.password.description'/></p>
                <input type="text" placeholder="<g:message code='password.forgot.password.label.name.mail'/>" id="username" name="username" value="${params.username}">
                <div class="cf">
                    <div class="left">
                        <g:submitButton class="btn btn-success btn-large" name="register" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}" />
                    </div>
                </div>

            </form>


        </g:else>



    </div>
</div>
</body>
</html>