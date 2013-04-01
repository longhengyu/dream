<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-sitemap"></i> <g:message code="default.list.label" args="[entityName]" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${serverInstanceList.size() > 0}">

                        <table class="table table-bordered table-striped" id="server-list">
                            <thead>
                            <tr>
                                <th>${message(code: 'server.hostname.label', default: 'Hostname')}</th>
                                <th>${message(code: 'server.ipAddr.label', default: 'Ip Addr')}</th>
                                <th>${message(code: 'server.capacity.label', default: 'Capacity')}</th>
                                <th>${message(code: 'server.dateCreated.label', default: 'Date Created')}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${serverInstanceList}" status="i" var="serverInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><g:link action="show" id="${serverInstance.id}">${fieldValue(bean: serverInstance, field: "hostname")}</g:link></td>
                                    <td>${fieldValue(bean: serverInstance, field: "ipAddr")}</td>

                                    <td><g:link controller="user" action="list" params="[sid: serverInstance.id]">${serverInstance.users.size()}</g:link> / ${fieldValue(bean: serverInstance, field: "capacity")}</td>

                                    <td><g:formatDate date="${serverInstance.dateCreated}" /></td>
                                </tr>
                            </g:each>

                            </tbody>
                        </table>

                        <div class="pagination text-center">
                            <pkg:paginate total="${serverInstanceTotal}" params="${flash}" />
                        </div>
                    </g:if>

                    <div class="form-horizontal">
                        <div class="form-actions text-right">
                            <form method="POST" action="/server/create">
                                <g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>