<%@ page import="com.pkgplan.dream.Profile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="nav" role="navigation">
                    <ul>
                        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
        </sec:ifAllGranted>
		<div id="edit-profile" class="content scaffold-edit" role="main">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>


			<g:render template="form"/>

            <span class="forgot-link">
                <g:link controller='register' action='resetPasswordWithoutToken'><g:message code='spring.security.ui.forgotPassword.submit'/></g:link>
            </span>
		</div>
	</body>
</html>
