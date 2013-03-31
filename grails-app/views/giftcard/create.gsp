<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'giftcard.label', default: 'Giftcard')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-gift"></i> <g:message code="default.create.label" args="[entityName]" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${giftcardInstance}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${giftcardInstance}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <g:form action="save" >
                        <fieldset class="form">
                            <g:render template="form"/>
                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>