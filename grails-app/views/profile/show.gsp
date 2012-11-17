
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
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <div class="nav" role="navigation">
                <ul>
                    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
        </sec:ifAllGranted>
        <g:render template="/profile/panel"/>
	</body>
</html>
