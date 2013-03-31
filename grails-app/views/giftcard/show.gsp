<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'giftcard.label', default: 'Giftcard')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-gift"></i> <g:message code="default.show.label" args="[entityName]" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <ol class="property-list giftcard">

                        <g:if test="${giftcardInstance?.code}">
                            <li class="fieldcontain">
                                <span id="code-label" class="property-label"><g:message code="giftcard.code.label" default="Code" /></span>

                                <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${giftcardInstance}" field="code"/></span>

                            </li>
                        </g:if>

                        <g:if test="${giftcardInstance?.product}">
                            <li class="fieldcontain">
                                <span id="product-label" class="property-label"><g:message code="giftcard.product.label" default="Product" /></span>

                                <span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${giftcardInstance?.product?.id}">${giftcardInstance?.product?.encodeAsHTML()}</g:link></span>

                            </li>
                        </g:if>

                        <g:if test="${giftcardInstance?.status}">
                            <li class="fieldcontain">
                                <span id="status-label" class="property-label"><g:message code="giftcard.status.label" default="Status" /></span>

                                <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${giftcardInstance}" field="status"/></span>

                            </li>
                        </g:if>

                        <g:if test="${giftcardInstance?.dateUsed}">
                            <li class="fieldcontain">
                                <span id="dateUsed-label" class="property-label"><g:message code="giftcard.dateUsed.label" default="Date Used" /></span>

                                <span class="property-value" aria-labelledby="dateUsed-label"><g:formatDate date="${giftcardInstance?.dateUsed}" /></span>

                            </li>
                        </g:if>

                        <g:if test="${giftcardInstance?.owner}">
                            <li class="fieldcontain">
                                <span id="owner-label" class="property-label"><g:message code="giftcard.owner.label" default="Owner" /></span>

                                <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${giftcardInstance?.owner?.id}">${giftcardInstance?.owner?.encodeAsHTML()}</g:link></span>

                            </li>
                        </g:if>

                    </ol>
                    <div class="form-horizontal">
                        <div class="form-actions text-right">
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${giftcardInstance?.id}" />
                                    <g:link class="btn btn-inverse" action="edit" id="${giftcardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                    <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </fieldset>
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

