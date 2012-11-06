
<%@ page import="com.pkgplan.dream.Server" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-server" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="activeUserNum" title="${message(code: 'server.activeUserNum.label', default: 'Active User Num')}" />
					
						<g:sortableColumn property="capacity" title="${message(code: 'server.capacity.label', default: 'Capacity')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'server.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="hostname" title="${message(code: 'server.hostname.label', default: 'Hostname')}" />
					
						<g:sortableColumn property="ipAddr" title="${message(code: 'server.ipAddr.label', default: 'Ip Addr')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serverInstanceList}" status="i" var="serverInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serverInstance.id}">${fieldValue(bean: serverInstance, field: "activeUserNum")}</g:link></td>
					
						<td>${fieldValue(bean: serverInstance, field: "capacity")}</td>
					
						<td><g:formatDate date="${serverInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: serverInstance, field: "hostname")}</td>
					
						<td>${fieldValue(bean: serverInstance, field: "ipAddr")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serverInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
