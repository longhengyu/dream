<div class="row-fluid">
    <g:if test="${flash.message}">
        <div class="alert alert-success">
            ${flash.message}
        </div>
    </g:if>
    <g:if test="${profileInstance}">
        <div class="inner-margin-left">
            <g:if test="${profileInstance?.fullName}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.fullname" default="Full Name" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="fullName"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.gender}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.gender" default="Gender" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="gender"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.age}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.age" default="Age" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="age"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.country}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.country" default="Country" /></p>
                    <span class="pull-right">${country(code: fieldValue(bean: profileInstance, field: "country"))}</span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.education}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.education" default="Education" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="education"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.occupation}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.occupation" default="Occupation" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="occupation"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.os}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.os" default="Operation System" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="os"/></span>
                </div>
            </g:if>
            <g:if test="${profileInstance?.os}">
                <div class="title display-table">
                    <p><g:message code="user.profile.label.purpose" default="Purpose of Using VPN" /></p>
                    <span class="pull-right"><g:fieldValue bean="${profileInstance}" field="purpose"/></span>
                </div>
            </g:if>

        </div>
        <g:form class="form-horizontal">
            <div class="form-actions">
                <g:hiddenField name="id" value="${profileInstance?.id}" />
                <g:remoteLink class="btn" controller="profile" action="edit" id="${profileInstance?.id}" update="[success:'profile-panel']"><i class="icon-edit"></i> <g:message code="default.button.edit.label" default="Edit" /></g:remoteLink>
            </div>
        </g:form>
    </g:if><g:else>
        <div class="inner-margin-left"><g:message code="user.profile.no.profile"/> <g:message code="user.profile.create.one"/> <g:remoteLink class="btn btn-small" controller="profile" action="create" update="profile-panel"><g:message code="general.yes"/> »</g:remoteLink>
        </div>
    </g:else>
</div>