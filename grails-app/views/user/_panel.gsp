<div id="show-user" class="content scaffold-show" role="main">
    <h3><sec:ifAllGranted roles="ROLE_ADMIN"><g:message code="default.show.label" args="[entityName]" /></sec:ifAllGranted>
    <sec:ifAllGranted roles="ROLE_USER"><g:message code="user.account.title" default="My Account" /></sec:ifAllGranted>
    </h3>
    <div id="account-panel" class="form-no-decorate">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list user">
            <g:if test="${userInstance?.username}">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label"><g:message code="login.label.username" default="Username" /></span>
                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
                </li>
            </g:if>
            <g:if test="${userInstance?.email}">
                <li class="fieldcontain">
                    <span id="email-label" class="property-label"><g:message code="login.label.email" default="Email" /></span>

                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>

                </li>
            </g:if>

            <g:if test="${userInstance?.enabled}">
                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label"><g:message code="user.account.label.enable" default="Enabled" /></span>

                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>

                </li>
            </g:if>

            <g:if test="${userInstance?.accountExpired}">
                <li class="fieldcontain">
                    <span id="accountExpired-label" class="property-label"><g:message code="user.account.label.account.expired" default="Account Expired" /></span>

                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>

                </li>
            </g:if>

            <g:if test="${userInstance?.accountLocked}">
                <li class="fieldcontain">
                    <span id="accountLocked-label" class="property-label"><g:message code="user.account.label.locked" default="Account Locked" /></span>

                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>

                </li>
            </g:if>

            <g:if test="${userInstance?.dateCreated}">
                <li class="fieldcontain">
                    <span id="dateCreated-label" class="property-label"><g:message code="user.account.label.register.time" default="Date Created" /></span>

                    <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userInstance?.dateCreated}" /></span>

                </li>
            </g:if>

            <g:if test="${userInstance?.dateExpired}">
                <li class="fieldcontain">
                    <span id="dateExpired-label" class="property-label"><g:message code="user.account.label.expire.time" default="Date Expired" /></span>

                    <span class="property-value" aria-labelledby="dateExpired-label"><g:formatDate date="${userInstance?.dateExpired}" /></span>

                </li>
            </g:if>



            <g:if test="${userInstance?.passwordExpired}">
                <li class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label"><g:message code="user.account.label.password.expired" default="Password Expired" /></span>

                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>

                </li>
            </g:if>

        </ol>


        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <sec:ifAllGranted roles="ROLE_USER">
                    <g:link controller='register' action='resetPasswordWithoutToken' class="reset"><g:message code='user.account.link.change.password'/></g:link>
                </sec:ifAllGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </sec:ifAllGranted>
            </fieldset>
        </g:form>
    </div>
</div>