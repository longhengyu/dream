
<%@ page import="com.pkgplan.dream.Server" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-server" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list server">
			
				<g:if test="${serverInstance?.hostname}">
				<li class="fieldcontain">
					<span id="hostname-label" class="property-label"><g:message code="server.hostname.label" default="Hostname" /></span>
					
						<span class="property-value" aria-labelledby="hostname-label"><g:fieldValue bean="${serverInstance}" field="hostname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.ipAddr}">
				<li class="fieldcontain">
					<span id="ipAddr-label" class="property-label"><g:message code="server.ipAddr.label" default="Ip Addr" /></span>
					
						<span class="property-value" aria-labelledby="ipAddr-label"><g:fieldValue bean="${serverInstance}" field="ipAddr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.capacity}">
				<li class="fieldcontain">
					<span id="capacity-label" class="property-label"><g:message code="server.capacity.label" default="Capacity" /></span>
					
						<span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${serverInstance}" field="capacity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="server.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${serverInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="server.users.label" default="Users" /></span>
					
						<g:each in="${serverInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serverInstance?.id}" />
					<g:link class="edit" action="edit" id="${serverInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
