<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<g:if test="${profileInstance}">
    <ol class="property-list profile">

        <g:if test="${profileInstance?.fullName}">
            <li class="fieldcontain">
                <span id="fullName-label" class="property-label"><g:message code="user.profile.label.fullname" default="Full Name" /></span>

                <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${profileInstance}" field="fullName"/></span>

            </li>
        </g:if>

        <g:if test="${profileInstance?.gender}">
            <li class="fieldcontain">
                <span id="gender-label" class="property-label"><g:message code="user.profile.label.gender" default="Gender" /></span>

                <span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${profileInstance}" field="gender"/></span>

            </li>
        </g:if>

        <g:if test="${profileInstance?.country}">
            <li class="fieldcontain">
                <span id="country-label" class="property-label"><g:message code="user.profile.label.country" default="Country" /></span>

                <span class="property-value" aria-labelledby="country-label">${country(code: fieldValue(bean: profileInstance, field: "country"))}</span>


            </li>
        </g:if>

        <g:if test="${profileInstance?.timezone}">
            <li class="fieldcontain">
                <span id="timezone-label" class="property-label"><g:message code="user.profile.label.timezone" default="Timezone" /></span>

                <span class="property-value" aria-labelledby="timezone-label">${profileInstance.timezone.displayName}</span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${profileInstance?.id}" />
            <g:remoteLink controller="profile" class="edit" action="edit" id="${profileInstance?.id}" update="[success:'profile-panel']"><g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </sec:ifAllGranted>
        </fieldset>
    </g:form>
</g:if><g:else>
    <p><g:message code="user.profile.no.profile"/> <g:remoteLink controller="profile" action="create" update="profile-panel"><g:message code="user.profile.create.one"/></g:remoteLink>
</g:else>