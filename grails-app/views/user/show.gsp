
<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="user.account.title" /></title>
	</head>
    <body>
        <g:render template="showBody"/>
    </body>
</html>
