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
            <h1><g:message code="contact.title.success"/></h1>
        </div>

        <div class="padding20px form">
            <div class="alert alert-success">
                <p><g:message code='contact.message.success'/>
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
                <g:if test="${flash.error}">
		            <div class="alert alert-error" role="status">
		                <a class="close" data-dismiss="alert" href="#">×</a>
		                ${flash.error}
		            </div>
		        </g:if>
                <g:form class="kissmetrics-login" url="[controller: 'home', action:'contact']" autocomplete='off'>


                    <div class="control-group">
                        <label class="control-label" for="email"><g:message code="contact.email"/></label>
                        <div class="controls">
                            <input type="text" class="input-append" id="email" name="email" value="${params?.email}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="subject"><g:message code="contact.subject"/></label>
                        <div class="controls">
                            <input type="text" class="input-append" id="subject" name="subject" value="${params?.subject}">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="content"><g:message code="contact.content"/></label>
                        <div class="controls">
                            <textarea name="content" cols="40" rows="10" placeholder="${message(code: 'contact.message.placeholder')}" class="ajax-comment-textarea" dir="ltr"></textarea>
                        </div>
                    </div>
                    
					<div class="cf">
                        <div class="right">
                            <g:submitButton class="btn btn-success btn-large" 
                                            name="message" value="${message(code: 'contact.button.leave.message')}"/>
                        </div>
                    </div>

                </g:form>

            </div>
        </div>
    </div>

    <div class="perks right">
        <p class="up-and-running"><g:message code="contact.descript.welcome"/></p>

        <ul class="perks-list">
            <li><g:message code="contact.description.li.1"/></li>
            <li><g:message code="contact.description.li.2"/></li>
            <li><g:message code="contact.description.li.3"/></li>
            <li><g:message code="contact.description.li.4"/></li>
        </ul>

        <p class="joining">
            <g:message code="contact.volunteer"/>
        </p>
    </div>

</div>
</g:else>
</html>
