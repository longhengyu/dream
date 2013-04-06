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
                      value="${profileInstance?.gender}" valueMessagePrefix="profile.gender" noSelection="['': message(code: 'general.please.choose')]"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'age', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.age"/></label>
        <div class="controls">
            <g:field name="age" type="number" min="1" class="input-xlarge" value="${profileInstance?.age}"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'country', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.country"/></label>
        <div class="controls">
            <g:countrySelect name="country" value="${profileInstance?.country}"
                             noSelection="['':message(code: 'general.please.choose')]"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'education', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.education"/></label>
        <div class="controls">
            <g:select name="education" from="${profileInstance.constraints.education.inList}"
                      value="${profileInstance?.education}" valueMessagePrefix="profile.education" noSelection="['': message(code: 'general.please.choose')]"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'occupation', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.occupation"/></label>
        <div class="controls">
            <g:select name="occupation" from="${profileInstance.constraints.occupation.inList}"
                      value="${profileInstance?.occupation}" valueMessagePrefix="profile.occupation" noSelection="['': message(code: 'general.please.choose')]"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'os', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.os"/></label>
        <div class="controls">
            <g:select name="os" from="${profileInstance.constraints.os.inList}"
                      value="${profileInstance?.os}" valueMessagePrefix="profile.os" noSelection="['': message(code: 'general.please.choose')]"/>
        </div>
    </div>
    <div class="control-group ${hasErrors(bean:profileInstance,field:'purpose', 'error')}">
        <label class="control-label"><g:message code="user.profile.label.purpose"/></label>
        <div class="controls">
            <g:select name="purpose" from="${profileInstance.constraints.purpose.inList}"
                      value="${profileInstance?.purpose}" valueMessagePrefix="profile.purpose" noSelection="['': message(code: 'general.please.choose')]"/>
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