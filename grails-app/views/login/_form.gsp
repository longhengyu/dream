
    <form action='${webRequest.contextPath}${com.pkgplan.SecureService.getLoginUrl()}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
        <div class="sign-in">

            <table class="hoverAble">
                <tr class="namepasswd">
                    <td><label for="username"><g:message code='login.label.username'/></label></td>
                    <td><input name="j_username" id="username" size="20" /></td>
                </tr>
                <tr class="namepasswd">
                    <td><label for="password"><g:message code='login.label.password'/></label></td>
                    <td><input type="password" name="j_password" id="password" size="20" /></td>
                </tr>
            </table>
            <table>
                <tr>

                    <td colspan="2" class="center">

                        <input type="checkbox" class="checkbox" name="${com.pkgplan.SecureService.getRememberMeParam()}" id="remember_me" checked="checked" />
                        <label for='remember_me'><g:message code='login.label.remember.me'/></label>
                        <g:submitButton class="buttonsub ui-corner-all" id="loginButton" name="login" value="${message([code: 'login.button.login'])}" />

                    </td>
                </tr>
            </table>

                <ul class="noListType floatList loginFloat">
                    <li colspan='2' class="left">
                        <span><g:link controller="register" action="index"><g:message code="login.link.register.new.user"/> </g:link></span>

                    </li>

                    <li colspan="2" class="left">
                        <span><g:link controller='register' action='forgotPassword'><g:message code='login.link.forgot.password'/></g:link></span>

                    </li>
                </ul>


        </div>
    </form>
