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

                        <h2><g:message code='password.forgot.title'/></h2>

                        <div class="row text-left">
                            <div class="col-sm-12 small margin-bottom-20">
                                <p><g:message code='password.forgot.password.description'/></p>
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <g:if test="${flash.error}">
                            <ul class="circled text-left error-msg">
                                <li>${flash.error}</li>
                            </ul>
                        </g:if>


                        <g:if test='${emailSent}'>
                            <section class="tint-bg inner-xxs inner-left-xs inner-right-xs outer-bottom-xs">
                                <p><g:message code='password.forgot.password.message.mail.sent'/></p>
                            </section>

                        </g:if>
                        <g:else>
                        <g:form class="forms" url="[controller: 'register', action:'forgotPassword']" autocomplete='off'>



                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="text" placeholder="<g:message code='password.forgot.password.label.name.mail'/>" id="username" name="username" value="${params.username}">
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                            <button type="submit" class="btn btn-large btn-submit btn-wide">${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}</button>


                        </g:form>

                        </g:else>
                        <div id="response"></div>

                    </div><!-- ./col -->



                </div><!-- /.row -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </div><!-- /.container -->
</section>




</html>