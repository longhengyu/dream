<html xmlns:wb=“http://open.weibo.com/wb”>
<head>
    <title><g:message code="site.page.title"/></title>
    <meta name="layout" content="pkgwlayout" />
</head>
<div class="container">
    <div class="row">
        <h3><g:message code="password.reset.password.description"/>
        </h3>

        <g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
            <g:hiddenField name='t' value='${token}'/>
            <table class="hoverAble">
                <s2ui:passwordFieldRow name='password' labelCode='login.label.password' bean="${command}"
                                       labelCodeDefault='Password' value="${command?.password}"/>

                <s2ui:passwordFieldRow name='password2' labelCode='user.register.label.password.again' bean="${command}"
                                       labelCodeDefault='Password (again)' value="${command?.password2}"/>
            </table>


            <table class="center">
                <tr>
                    <td>
                        <g:submitButton class="btn btn-info" id="getPassButton" name="getPass" value="${message(code: 'password.forgot.password.button.reset', default: 'Reset Password')}" />
                    </td>
                </tr>
            </table>
        </g:form>
    </div>
</div>
</html>