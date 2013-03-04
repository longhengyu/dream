<%@ page import="com.pkgplan.dream.Profile" %>
<g:hasErrors bean="${profileInstance}">
    <div class="alert alert-error">
            <ul class="">
                <g:eachError bean="${profileInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
    </div>
</g:hasErrors>
<g:set var="targetAction" value="${isCreate ? "save" : "update"}"/>
<g:formRemote method="post" class="form-horizontal" url="[controller: 'profile', action:targetAction]" update="profile-panel" name="profileForm">
    <g:hiddenField name="id" value="${profileInstance?.id}" />
    <g:hiddenField name="version" value="${profileInstance?.version}" />
    <div class="control-group ${hasErrors(bean:profileInstance,field:'fullName', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.fullname"/></label>
        <div class="controls">
            <g:textField name="fullName" class="input-xlarge" value="${profileInstance?.fullName}"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'gender', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.gender"/></label>
        <div class="controls">
            <g:select name="gender" from="${profileInstance.constraints.gender.inList}"
                      value="${profileInstance?.gender}" valueMessagePrefix="profile.gender" noSelection="['': '-Please Choose-']"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'country', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.country"/></label>
        <div class="controls">
            <g:countrySelect name="country" value="${profileInstance?.country}"
                             noSelection="['':'-Choose your country-']"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'timezone', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.timezone"/></label>
        <div class="controls">
            <pkg:timeZoneSelect class="limit-width-select" name="timezone" value="${profileInstance?.timezone}" />
        </div>
    </div>
    <div class="form-actions">
        <g:remoteLink class="btn" id="${profileInstance?.id}" controller="profile" action="cancel" update="[success:'profile-panel']"><i class="icon-trash"></i> ${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:remoteLink>
        <g:set var="buttonMessageCode" value="${isCreate ? "default.button.create.label" : "default.button.update.label"}"/>
        <button name="_action_update" class="btn btn-primary" type="submit">
            <i class="icon-check icon-white"></i>
            ${message(code: buttonMessageCode)}
        </button>
    </div>
</g:formRemote>