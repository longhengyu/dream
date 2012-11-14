
    <form action='${webRequest.contextPath}${com.pkgplan.SecureService.getLoginUrl()}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
        <div class="sign-in">

            <table>
                <tr class="namepasswd">
                    <td><label for="username"><g:message code='spring.security.ui.login.username'/></label></td>
                    <td><input name="j_username" id="username" size="20" /></td>
                </tr>
                <tr class="namepasswd">
                    <td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
                    <td><input type="password" name="j_password" id="password" size="20" /></td>
                </tr>
                <tr>

                    <td colspan="2" class="left">

                        <input type="checkbox" class="checkbox" name="${com.pkgplan.SecureService.getRememberMeParam()}" id="remember_me" checked="checked" />
                        <label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label>
                        <g:submitButton id="loginButton" name="login" value="Login" />

                    </td>
                </tr>
                <tr>
                    <td colspan='2' class="left">
                        <span><g:link controller="register" action="register">Register as New User</g:link></span>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="left">
                        <span><g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link></span>

                    </td>
                </tr>
            </table>

        </div>
    </form>
