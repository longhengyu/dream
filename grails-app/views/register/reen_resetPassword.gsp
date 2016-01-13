<html>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="reen_layout" />
</head>

<section id="contact-form">
    <div class="container inner-xs">

        <div class="row">
            <div class="col-sm-12">
                <div class="row">

                    <div class="col-sm-6 center-block text-center inner-right-sm">

                        <h2><g:message code='password.forgot.title'/></h2>

                        <div class="row text-left">
                            <div class="col-sm-12 small margin-bottom-20">
                                <p><g:message code="password.reset.password.description"/></p>
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <g:hasErrors bean="${command}">
                            <ul class="circled text-left error-msg">
                                <g:eachError bean="${command}" var="error">
                                    <li><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>

                        </g:hasErrors>



                            <g:form class="forms" url="[controller: 'register', action:'resetPassword']" autocomplete='off'>

                                <g:hiddenField name='t' value='${token}'/>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="password" autofocus="" placeholder="<g:message code='login.label.password'/>" name="password" value="${command?.password}">
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="password" placeholder="<g:message code='user.register.label.password.again'/>" name="password2" value="${command?.password2}" >
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

                                <button type="submit" class="btn btn-large btn-submit btn-wide">${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}</button>


                            </g:form>


                        <div id="response"></div>

                    </div><!-- ./col -->



                </div><!-- /.row -->
            </div><!-- /.col -->
        </div><!-- /.row -->

    </div><!-- /.container -->
</section>




</html>