<div class="noSideBar">

    <g:form action='register' name='registerForm'>

        <g:if test='${emailSent}'>
            <table class="left">
                <tr>
                    <td>
                        <g:message code='spring.security.ui.register.sent'/>
                    </td>
                </tr>
            </table>
        </g:if>
        <g:else>

            <table class="hoverAble">
                <tbody>

                <s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                                   size='40' labelCodeDefault='Username' value="${command.username}"/>

                <s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
                                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>

                <s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                                       size='40' labelCodeDefault='Password' value="${command.password}"/>

                <s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                                       size='40' labelCodeDefault='Password (again)' value="${command.password2}"/>

                </tbody>
            </table>
            <table>
                <tbody>
                <tr class="hoverNone">
                    <td colspan="2" class="center">
                        <g:submitButton class="buttonsub ui-corner-all" id="registerButton" name="register" value="Create Your New Account" />
                    </td>
                </tr>
                </tbody>
            </table>
        </g:else>

    </g:form>

</div>