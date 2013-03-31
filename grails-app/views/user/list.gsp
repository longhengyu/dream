<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="row-fluid">
        <div class="span12 box">
            <div class="box-head">
                <h3><i class="icon-white icon-user"></i> <g:message code="default.list.label" args="[entityName]" /></h3>
            </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="box-content">
                <div class="content-inner">
                    <div class="content-settings">
                        <g:if test="${userInstanceList.size() > 0}">

                            <table class="table table-bordered table-striped" id="purchase-history">
                                <thead>
                                <tr>
                                    <th>${message(code: 'user.username.label', default: 'Username')}</th>

                                    <th>${message(code: 'user.email.label', default: 'Email')}</th>
                                    <th>${message(code: 'user.dateCreated.label', default: 'Created')}</th>
                                    <th>${message(code: 'user.dateExpired.label', default: 'Expired')}</th>
                                    <th><g:message code="user.profile.label" default="Profile" /></th>
                                    <th><g:message code="purchase.label.action" default="Action" /></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                                            <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                            <td><g:formatDate date="${userInstance.dateCreated}" /></td>

                                            <td>
                                                <g:formatDate date="${userInstance.dateExpired}"/>
                                            </td>
                                            <td>
                                                <g:if test="${userInstance.profile}">
                                                    <g:link controller="profile" action="show" id="${userInstance.profile.id}">${fieldValue(bean: userInstance, field: "profile")}</g:link>
                                                </g:if>
                                                <g:else>
                                                    <g:link controller="profile" action="create" params="[userId: userInstance.id]">Create</g:link>
                                                </g:else>
                                            </td>
                                            <td>
                                                <div class="center">
                                                    <div class="purchase-button">
                                                        <form method="POST" action="/user/delete">
                                                            <input type="hidden" name="id" value="${userInstance?.id}"/>
                                                            <button type="submit" class="btn btn-danger btn-small"
                                                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                                <i class="icon-white icon-trash"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                                                            </button>
                                                            <g:link class="btn btn-primary btn-small" action="edit" id="${userInstance?.id}">
                                                                ${message(code: 'default.button.edit.label', default: 'Edit')} <i class="icon-white icon-double-angle-right"></i>
                                                            </g:link>
                                                        </form>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                            <div class="pagination text-center">
                                <pkg:paginate total="${userInstanceTotal}" params="${flash}" />
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
