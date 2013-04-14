<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="product.list.title" /></title>
	</head>
	<body>
        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="listBody"/>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="listBodyAdmin"/>
        </sec:ifAllGranted>
	</body>
</html>
