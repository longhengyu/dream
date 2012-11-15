<html>

<head>
<title><g:message code='spring.security.ui.resetPassword.title'/></title>
<meta name='layout' content='pkgwlayout'/>
</head>

<body>
<h1><g:message code='spring.security.ui.resetPassword.description'/></h1>

<div class="noSideBar">
    <div class="centerBlockFun">

	<g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
	<g:hiddenField name='t' value='${token}'/>
	<div class="sign-in">

	<table>
		<s2ui:passwordFieldRow name='password' labelCode='resetPasswordCommand.password.label' bean="${command}"
                             labelCodeDefault='Password' value="${command?.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='resetPasswordCommand.password2.label' bean="${command}"
                             labelCodeDefault='Password (again)' value="${command?.password2}"/>
	</table>

	    <table class="center">
            <tr>
                <td>
                    <g:submitButton class="center buttonsub ui-corner-all" id="getPassButton" name="getPass" value="${message(code: 'spring.security.ui.resetPassword.submit', default: 'Reset Password')}" />
                </td>
            </tr>
        </table>
	</div>
	</g:form>

    </div>
</div>

<script>
$(document).ready(function() {
	$('#password').focus();
});
</script>

</body>
</html>
