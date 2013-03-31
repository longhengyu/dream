<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                    <ol class="property-list product">

                        <g:if test="${productInstance?.name}">
                            <li class="fieldcontain">
                                <span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>

                                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.code}">
                            <li class="fieldcontain">
                                <span id="code-label" class="property-label"><g:message code="product.code.label" default="Code" /></span>

                                <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${productInstance}" field="code"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.description}">
                            <li class="fieldcontain">
                                <span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>

                                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.imageUrl}">
                            <li class="fieldcontain">
                                <span id="imageUrl-label" class="property-label"><g:message code="product.imageUrl.label" default="Image Url" /></span>

                                <span class="property-value" aria-labelledby="imageUrl-label"><g:fieldValue bean="${productInstance}" field="imageUrl"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.price}">
                            <li class="fieldcontain">
                                <span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>

                                <span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.status}">
                            <li class="fieldcontain">
                                <span id="status-label" class="property-label"><g:message code="product.status.label" default="Status" /></span>

                                <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${productInstance}" field="status"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.pYear}">
                            <li class="fieldcontain">
                                <span id="pYear-label" class="property-label"><g:message code="product.pYear.label" default="PY ear" /></span>

                                <span class="property-value" aria-labelledby="pYear-label"><g:fieldValue bean="${productInstance}" field="pYear"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.pMonth}">
                            <li class="fieldcontain">
                                <span id="pMonth-label" class="property-label"><g:message code="product.pMonth.label" default="PM onth" /></span>

                                <span class="property-value" aria-labelledby="pMonth-label"><g:fieldValue bean="${productInstance}" field="pMonth"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.pDay}">
                            <li class="fieldcontain">
                                <span id="pDay-label" class="property-label"><g:message code="product.pDay.label" default="PD ay" /></span>

                                <span class="property-value" aria-labelledby="pDay-label"><g:fieldValue bean="${productInstance}" field="pDay"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.pHour}">
                            <li class="fieldcontain">
                                <span id="pHour-label" class="property-label"><g:message code="product.pHour.label" default="PH our" /></span>

                                <span class="property-value" aria-labelledby="pHour-label"><g:fieldValue bean="${productInstance}" field="pHour"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.pMinute}">
                            <li class="fieldcontain">
                                <span id="pMinute-label" class="property-label"><g:message code="product.pMinute.label" default="PM inute" /></span>

                                <span class="property-value" aria-labelledby="pMinute-label"><g:fieldValue bean="${productInstance}" field="pMinute"/></span>

                            </li>
                        </g:if>

                        <g:if test="${productInstance?.dateCreated}">
                            <li class="fieldcontain">
                                <span id="dateCreated-label" class="property-label"><g:message code="product.dateCreated.label" default="Date Created" /></span>

                                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${productInstance?.dateCreated}" /></span>

                            </li>
                        </g:if>

                    </ol>
                    <div class="form-horizontal">
                        <div class="form-actions text-right">
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${productInstance?.id}" />
                                    <g:link class="btn btn-inverse" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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