<html xmlns="http://www.w3.org/1999/html">

<head>
<title><g:message code='spring.security.ui.resetPassword.title'/></title>
<meta name='layout' content='pkgwlayout'/>
</head>

<body>
<g:render template="/common/slide"/>
<div class="noSideBar">
    <g:form action='${hasToken? "resetPassword":"resetPasswordWithoutToken"}' name='resetPasswordForm' autocomplete='off'>
        <g:hiddenField name='t' value='${token}'/>
        <p><g:message code="password.reset.password.description"/></p>
        <table class="hoverAble">
        <s2ui:passwordFieldRow name='password' labelCode='login.label.password' bean="${command}"
                               labelCodeDefault='Password' value="${command?.password}"/>

        <s2ui:passwordFieldRow name='password2' labelCode='user.register.label.password.again' bean="${command}"
                               labelCodeDefault='Password (again)' value="${command?.password2}"/>
        </table>


        <table class="center">
            <tr>
                <td>
                    <g:submitButton class="center buttonsub ui-corner-all" id="getPassButton" name="getPass" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}" />
                </td>
            </tr>
        </table>
    </g:form>

</div>

</body>
</html>
