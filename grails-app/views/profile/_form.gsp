<%@ page import="com.pkgplan.dream.Profile" %>
<g:hasErrors bean="${profileInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${profileInstance}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>
<g:set var="targetAction" value="${isCreate ? "save" : "update"}"/>
<g:formRemote method="post" url="[controller: 'profile', action:targetAction]" update="profile-panel" name="profileForm">
    <g:hiddenField name="id" value="${profileInstance?.id}" />
    <g:hiddenField name="version" value="${profileInstance?.version}" />

    <ol class="property-list profile">
        <li class="fieldcontain ${hasErrors(bean: profileInstance, field: 'fullName', 'error')}">
            <span id="fullName-label" class="property-label"><label for="fullName"><g:message code="user.profile.label.fullname"/></label></span>
            <span class="property-value-edit" aria-labelledby="fullName-label"><g:textField name="fullName" value="${profileInstance?.fullName}"/></span>
        </li>
        <li class="fieldcontain ${hasErrors(bean: profileInstance, field: 'gender', 'error')}">
            <span id="gender-label" class="property-label"><label for="fullName"><g:message code="user.profile.label.gender"/></label></span>
            <span class="property-value-edit" aria-labelledby="gender-label"><g:select name="gender" from="${profileInstance.constraints.gender.inList}"
                                                                                  value="${profileInstance?.gender}" valueMessagePrefix="profile.gender" noSelection="['': '-Please Choose-']"/></span>
        </li>
        <li class="fieldcontain ${hasErrors(bean: profileInstance, field: 'country', 'error')}">
            <span id="country-label" class="property-label"><label for="country"><g:message code="user.profile.label.country"/></label></span>
            <span class="property-value-edit" aria-labelledby="country-label"><g:countrySelect name="country" value="${profileInstance?.country}"
                                                                                          noSelection="['':'-Choose your country-']"/></span>
        </li>
        <li class="fieldcontain ${hasErrors(bean: profileInstance, field: 'timezone', 'error')}">
            <span id="timezone-label" class="property-label"><label for="timezone"><g:message code="user.profile.label.timezone"/></label></span>
            <span class="property-value-edit" aria-labelledby="timezone-label"><g:timeZoneSelect name="timezone" value="${profileInstance?.timezone}" /></span>
        </li>

    </ol>
    <div class="pkgsubmit">
        <table>
            <tr>
                <td class="right">
                    <g:submitToRemote action="cancel" update="profile-panel" class="buttonsub ui-corner-all" value="${message(code: 'default.button.cancel.label', default: 'Cancel')}"/>
                </td>
                <td class="left">
                    <g:set var="buttonMessageCode" value="${isCreate ? "default.button.create.label" : "default.button.update.label"}"/>
                    <g:actionSubmit action="update" class="buttonsub ui-corner-all" value="${message(code: buttonMessageCode)}" />
                </td>
            </tr>
        </table>
    </div>

    <sec:ifAllGranted roles="ROLE_ADMIN">
        <fieldset class="buttons">
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </sec:ifAllGranted>
</g:formRemote>