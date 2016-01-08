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

                        <h2>新用户注册</h2>

                        <g:hasErrors bean="${command}">
                            <ul class="circled text-left error-msg">
                                <g:eachError bean="${command}" var="error">
                                    <li><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form class="forms" url="[controller: 'register', action:'register']" autocomplete='off'>

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" autofocus="" placeholder="<g:message code='login.label.username'/>" id="username" name="username" value="${command?.username}">
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="<g:message code='user.register.label.email'/>" id="email" name="email" value="${command?.email}" >
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="password" class="form-control" placeholder="<g:message code='login.label.password'/>" id="password" name="password" value="${command?.password}">
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="password" class="form-control" placeholder="<g:message code='user.register.label.password.again'/>" id="password2" name="password2" value="${command?.password2}" >
                                </div><!-- /.col -->
                            </div><!-- /.row -->




                            <button type="submit" class="btn btn-large btn-submit btn-wide">${message(code: 'user.register.button.create')}</button>

                            <div class="row inner-xs">

                                <div class="col-sm-12 checkbox text-right">
                                    <p class="text-right"><a href="/login/auth" >已注册用户登录</a></p>
                                </div><!-- /.col -->
                            </div><!-- /.row -->



                        </g:form>

                        <div id="response"></div>

                    </div><!-- ./col -->



                </div><!-- /.row -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </div><!-- /.container -->
</section>


</html>