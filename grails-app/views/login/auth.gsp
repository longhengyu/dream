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
        <h1><g:message code="login.title"/></h1>
    </div>

    <div class="padding20px form">
        <g:if test="${flash.message}">
            <div class="alert alert-error" role="status">
                <a class="close" data-dismiss="alert" href="#">×</a>
                ${flash.message}
            </div>
        </g:if>
        <form class="kissmetrics-login" action='${webRequest.contextPath}${SecureServiceImpl.getLoginUrl()}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
            <input type="text" autofocus="" placeholder="<g:message code='login.label.username'/>" name="j_username" id="username" >
            <input type="password" placeholder="<g:message code='login.label.password'/>" name="j_password" id="password" >
            <input type="hidden" name="returnUrl" value="${(request.forwardURI - request.contextPath)}"/>
            <label class="checkbox">
                <input type="checkbox" class="checkbox" name="${SecureServiceImpl.getRememberMeParam()}" id="remember_me" checked="checked" />
                <g:message code='login.label.remember.me'/>
            </label>


            <div class="cf">
                <div class="left">
                    <g:submitButton class="btn btn-success btn-large" id="loginButton" name="login" value="${message([code: 'login.button.login'])}" />
                </div>

                <div class="right">
                    <a class="link-option" href="/register/forgotPassword"><g:message code='login.link.forgot.password'/></a>
                </div>
            </div>

        </form>



    </div>
</div>
</body>
</html>