<%@ page import="com.pkgplan.dream.Server" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-sitemap"></i> <g:message code="default.show.label" args="[entityName]" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <ol class="property-list server">

                        <g:if test="${serverInstance?.hostname}">
                            <li class="fieldcontain">
                                <span id="hostname-label" class="property-label"><g:message code="server.hostname.label" default="Hostname" /></span>

                                <span class="property-value" aria-labelledby="hostname-label"><g:fieldValue bean="${serverInstance}" field="hostname"/></span>

                            </li>
                        </g:if>

                        <g:if test="${serverInstance?.ipAddr}">
                            <li class="fieldcontain">
                                <span id="ipAddr-label" class="property-label"><g:message code="server.ipAddr.label" default="Ip Addr" /></span>

                                <span class="property-value" aria-labelledby="ipAddr-label"><g:fieldValue bean="${serverInstance}" field="ipAddr"/></span>

                            </li>
                        </g:if>

                        <g:if test="${serverInstance?.capacity}">
                            <li class="fieldcontain">
                                <span id="capacity-label" class="property-label"><g:message code="server.capacity.label" default="Capacity" /></span>

                                <span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${serverInstance}" field="capacity"/></span>

                            </li>
                        </g:if>

                        <g:if test="${serverInstance?.dateCreated}">
                            <li class="fieldcontain">
                                <span id="dateCreated-label" class="property-label"><g:message code="server.dateCreated.label" default="Date Created" /></span>

                                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${serverInstance?.dateCreated}" /></span>

                            </li>
                        </g:if>

                        <g:if test="${serverInstance?.users}">
                            <li class="fieldcontain">
                                <span id="users-label" class="property-label"><g:message code="server.users.label" default="Users" /></span>

                                <g:each in="${serverInstance.users}" var="u">
                                    <span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
                                </g:each>

                            </li>
                        </g:if>

                    </ol>
                    <div class="form-horizontal">
                        <div class="form-actions text-right">
                            <g:form>
                                <fieldset class="buttons">
                                    <g:hiddenField name="id" value="${serverInstance?.id}" />
                                    <g:link class="btn btn-inverse" action="edit" id="${serverInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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





