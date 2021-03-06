<%
    def springSecurityService
%>
<%@ page import="com.pkgplan.security.Impl.SecureServiceImpl; com.pkgplan.security.Impl.SecureServiceImpl" %>

<sec:ifNotLoggedIn>
    <div class="well">
        <g:if test="${flash.message}">
            <div class="alert alert-error" role="status">
                <a class="close" data-dismiss="alert" href="#">×</a>
                ${flash.message}
            </div>
        </g:if>
        <form action='${webRequest.contextPath}${SecureServiceImpl.getLoginUrl()}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
            <input class="full-extended" type="text" placeholder="<g:message code='login.label.username'/>" name="j_username" id="username" >
            <input class="full-extended" type="password" placeholder="<g:message code='login.label.password'/>" name="j_password" id="password" >
            <input type="hidden" name="returnUrl" value="${(request.forwardURI - request.contextPath)}"/>
            <div class="row-fluid">
                <div class="span6">
                    <g:submitButton class="btn btn-primary" id="loginButton" name="login" value="${message([code: 'login.button.login'])}" />
                </div>

                <div class="span6 remember-me">
                    <input type="checkbox" class="checkbox" name="${SecureServiceImpl.getRememberMeParam()}" id="remember_me" checked="checked" />
                    <g:message code='login.label.remember.me'/>
                </div>

            </div>

        </form>



        <ul class="nav nav-list">
            <li>
                <a href="#register-Modal" data-toggle="modal" data-target="#register-Modal"><i class="icon-user"></i>&nbsp;<g:message code="login.link.register.new.user"/> </a>
            </li>
            <li>
                <a href="#forgot-password-Modal" data-toggle="modal" data-target="#forgot-password-Modal" ><i class="icon-question-sign"></i>&nbsp;<g:message code='login.link.forgot.password'/></a>
            </li>
        </ul>

        <!-- Modal -->
        <div id="register-Modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <g:render template="/register/register"/>
        </div>
        <div id="forgot-password-Modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <g:render template="/register/forgot"/>
        </div>
    </div>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
    <g:render template="/user/welcomeMessage"/>
</sec:ifLoggedIn>