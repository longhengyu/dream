<%@ page import="com.pkgplan.auth.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<g:if test="${params.action == 'create'}">
    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
        <label for="password">
            <g:message code="user.password.label" default="Password" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="password" required="" value="${userInstance?.password}"/>
    </div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain">
    <label for="profile">
        <g:message code="user.server.label" default="Server" />

    </label>
    <g:select id="server" name="server.id" from="${com.pkgplan.dream.Server.list()}" optionKey="id" value="${serverInstance?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="user.profile.label" default="Profile" />

	</label>
	<g:select id="profile" name="profile.id" from="${com.pkgplan.dream.Profile.list()}" optionKey="id" value="${userInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>

</div>

<g:if test="${params.action != 'create'}">
    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dateExpired', 'error')} required">
        <label for="dateExpired">
            <g:message code="user.dateExpired.label" default="Date Expired" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="dateExpired" precision="day"  value="${userInstance?.dateExpired}"  />
    </div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>

</div>

