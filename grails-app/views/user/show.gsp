
<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
    <body>
        <g:render template="showBody"/>
    </body>
</html>
