<div id="show-profile" class="content scaffold-show" role="main">
    <h2><sec:ifAllGranted roles="ROLE_ADMIN"><g:message code="profile.show.title.admin" default="User Profile"/></sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_USER"><g:message code="profile.show.title" default="My Profile" /></sec:ifAllGranted>
    </h2>
    <g:if test="${profileInstance}">

        <ol class="property-list profile">

            <g:if test="${profileInstance?.fullName}">
                <li class="fieldcontain">
                    <span id="fullName-label" class="property-label"><g:message code="profile.fullName.label" default="Full Name" /></span>

                    <span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${profileInstance}" field="fullName"/></span>

                </li>
            </g:if>

            <g:if test="${profileInstance?.gender}">
                <li class="fieldcontain">
                    <span id="gender-label" class="property-label"><g:message code="profile.gender.label" default="Gender" /></span>

                    <span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${profileInstance}" field="gender"/></span>

                </li>
            </g:if>

            <g:if test="${profileInstance?.country}">
                <li class="fieldcontain">
                    <span id="country-label" class="property-label"><g:message code="profile.country.label" default="Country" /></span>

                    <span class="property-value" aria-labelledby="country-label">${country(code: fieldValue(bean: profileInstance, field: "country"))}</span>


                </li>
            </g:if>

            <g:if test="${profileInstance?.timezone}">
                <li class="fieldcontain">
                    <span id="timezone-label" class="property-label"><g:message code="profile.timezone.label" default="Timezone" /></span>

                    <span class="property-value" aria-labelledby="timezone-label">${profileInstance.timezone.displayName}</span>

                </li>
            </g:if>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${profileInstance?.id}" />
                <g:link controller="profile" class="edit" action="edit" id="${profileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </sec:ifAllGranted>
            </fieldset>
        </g:form>
    </g:if><g:else>
        <p>Don't have a profile yet, <g:link controller="profile" action="create"> add one</g:link> ?
    </g:else>
</div>