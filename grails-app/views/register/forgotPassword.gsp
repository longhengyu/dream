<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
<meta name='layout' content='pkgwlayout'/>
</head>

<body>
<g:render template="/common/slide"/>
<div class="noSideBar">
	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

	<g:if test='${emailSent}'>
	<br/>
        <table class="left">
        <tr>
            <td>
	            <g:message code='password.forgot.password.message.mail.sent'/>
            </td>
        </tr>
        </table>
	</g:if>

	<g:else>

	<br/>
	<p><g:message code='password.forgot.password.description'/></p>

	<table class="hoverAble">
		<tr>
			<td style="padding-left: 4em;"><label for="username"><g:message code='password.forgot.password.label.name.mail'/></label></td>
			<td style="text-align: left"><g:textField name="username" size="45" /></td>
		</tr>
	</table>

	<table class="center">
        <tr>
            <td>
                <g:submitButton class="center buttonsub ui-corner-all" id="getPassButton" name="getPass" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}" />
            </td>
        </tr>
    </table>
	</g:else>

	</g:form>
    </div>
</div>

</body>
</html>
