<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-user"></i> <g:message code="default.edit.label" args="[entityName]" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${userInstance}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${userInstance}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form method="post" >
                        <g:hiddenField name="id" value="${userInstance?.id}" />
                        <g:hiddenField name="version" value="${userInstance?.version}" />
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>
                        <fieldset class="buttons">
                            <g:actionSubmit class="btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                            <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>