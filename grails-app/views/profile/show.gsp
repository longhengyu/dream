
<%@ page import="com.pkgplan.dream.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profile" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${profileInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.timezone}">
				<li class="fieldcontain">
					<span id="timezone-label" class="property-label"><g:message code="profile.timezone.label" default="Timezone" /></span>
					
						<span class="property-value" aria-labelledby="timezone-label"><g:fieldValue bean="${profileInstance}" field="timezone"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profileInstance?.id}" />
					<g:link class="edit" action="edit" id="${profileInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
