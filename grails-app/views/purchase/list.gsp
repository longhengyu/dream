
<%@ page import="com.pkgplan.dream.Purchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="purchase.title.purchase.history" args="[entityName]" /></title>
	</head>
    <body>
	    <g:render template="listBody"/>
    </body>
</html>
