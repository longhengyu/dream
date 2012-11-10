<%@ page import="com.pkgplan.dream.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'fullName', 'error')} ">
	<label for="fullName">
		<g:message code="profile.fullName.label" default="Full Name" />
		
	</label>
	<g:textField name="fullName" value="${profileInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="profile.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${profileInstance.constraints.gender.inList}" value="${profileInstance?.gender}" valueMessagePrefix="profile.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="profile.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${profileInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'timezone', 'error')} ">
	<label for="timezone">
		<g:message code="profile.timezone.label" default="Timezone" />
		
	</label>
	<g:textField name="timezone" value="${profileInstance?.timezone}"/>
</div>

