<html>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="reen_layout" />
</head>

<g:if test='${emailSent}'>

        <section id="contact-names" class="tint-bg inner-xxs inner-left-xs inner-right-xs outer-bottom-xs">
            <p><g:message code='contact.message.success'/></p>
        </section>
</g:if>
<g:else>
    <section id="contact-form">
        <div class="container inner-xs">

            <div class="row">
                <div class="col-sm-12">
                    <div class="row">

                        <div class="col-sm-6 center-block text-center inner-right-sm">

                            <h2><g:message code='contact.title'/></h2>

                            <g:if test="${flash.error}">
                                <ul class="circled text-left error-msg">
                                    <li>${flash.error}</li>
                                </ul>
                            </g:if>

                            <g:form class="forms" url="[controller: 'home', action:'contact']" autocomplete='off'>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" placeholder="<g:message code='contact.email'/>" id="email" name="email" value="${params?.email}" >
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" placeholder="<g:message code='contact.subject'/>" id="subject" name="subject" value="${params?.subject}">
                                    </div><!-- /.col -->
                                </div><!-- /.row -->

                                <div class="row">
                                    <div class="col-sm-12">
                                        <textarea name="content" class="form-control" placeholder="${message(code: 'contact.message.placeholder')}"></textarea>
                                    </div><!-- /.col -->
                                </div><!-- /.row -->


                                <button type="submit" class="btn btn-large btn-submit btn-wide">${message(code: 'contact.button.leave.message')}</button>


                            </g:form>

                            <div id="response"></div>

                        </div><!-- ./col -->

                    </div><!-- /.row -->
                </div><!-- /.col -->
            </div><!-- /.row -->

        </div><!-- /.container -->
    </section>

</g:else>


</html>