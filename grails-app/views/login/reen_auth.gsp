<html>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="reen_layout" />
</head>

<%
    def springSecurityService
%>
<%@ page import="com.pkgplan.security.Impl.SecureServiceImpl; com.pkgplan.security.Impl.SecureServiceImpl" %>

<section id="contact-form">
    <div class="container inner-xs">

        <div class="row">
            <div class="col-sm-12">
                <div class="row">

                    <div class="col-sm-6 center-block text-center inner-right-sm">

                        <h2><g:message code="login.title"/></h2>

                        <g:if test="${flash.message}">
                            <ul class="circled text-left error-msg">
                                <li>${flash.message}</li>
                            </ul>
                        </g:if>

                        <form class="forms" action='${webRequest.contextPath}${SecureServiceImpl.getLoginUrl()}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>

                            <input type="hidden" name="returnUrl" value="${(request.forwardURI - request.contextPath)}"/>

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" autofocus="" placeholder="<g:message code='login.label.username'/>" name="j_username" id="username" >
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="password" class="form-control" placeholder="<g:message code='login.label.password'/>" name="j_password" id="password" >
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-sm-12 checkbox">
                                    <p class="text-left"><input type="checkbox" class="checkbox" name="${SecureServiceImpl.getRememberMeParam()}" id="remember_me" checked="checked" />
                                        <g:message code='login.label.remember.me'/></p>
                                </div><!-- /.col -->
                            </div><!-- /.row -->


                            <button type="submit" class="btn btn-large btn-submit btn-wide">${message([code: 'login.button.login'])}</button>

                            <div class="row inner-xs">

                                <div class="col-sm-12 checkbox text-right">
                                    <p class="text-right"><a href="/register/index" >注册新用户</a> &nbsp;&nbsp;&nbsp;<a href="/register/forgotPassword"><g:message code='login.link.forgot.password'/></a></p>
                                </div><!-- /.col -->
                            </div><!-- /.row -->



                        </form>

                        <div id="response"></div>

                    </div><!-- ./col -->



                </div><!-- /.row -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </div><!-- /.container -->
</section>


</html>