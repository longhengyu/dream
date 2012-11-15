<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title'/></title>
<meta name='layout' content='pkgwlayout'/>
</head>

<body>

<div class="noSideBar">
<div class="centerBlockFun">
	<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

	<g:if test='${emailSent}'>
	<br/>
        <table class="left">
        <tr>
            <td>
	            <g:message code='spring.security.ui.forgotPassword.sent'/>
            </td>
        </tr>
        </table>
	</g:if>

	<g:else>

	<br/>
	<p><g:message code='spring.security.ui.forgotPassword.description'/></p>

	<table class="hoverAble">
		<tr>
			<td><label for="username"><g:message code='spring.security.ui.forgotPassword.username'/></label></td>
			<td><g:textField name="username" size="30" /></td>
		</tr>
	</table>

	<table class="center">
        <tr>
            <td>
                <g:submitButton class="center buttonsub ui-corner-all" id="getPassButton" name="getPass" value="${message(code: 'spring.security.ui.forgotPassword.submit', default: 'Reset Password')}" />
            </td>
        </tr>
    </table>
	</g:else>

	</g:form>
    </div>
</div>

</body>
</html>
