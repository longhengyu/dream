<%@ page import="com.pkgplan.auth.User" %>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta name="layout" content="reen_layout" />
</head>

<div class="container inner">
    <div class="row">

        <g:if test="${com.pkgplan.dream.Impl.HelperService.isMobile() == false}">
            <g:render template="/layouts/reen_sidemenu"/>
        </g:if>

        <div class="col-md-9 inner-left-md border-left">

            <!-- ============================================================= SECTION – HERO ============================================================= -->

            <section id="hero" class="inner-bottom-xs">
                <header>
                    <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                </header>
            </section>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <section id="contact-names" class="small">
                <g:if test="${userInstanceList.size() > 0}">
                    <table class="table table-bordered table-striped tabel-custom" id="purchase-history">
                        <thead>
                        <tr>
                            <th >${message(code: 'user.username.label', default: 'Username')}</th>

                            <th >${message(code: 'user.email.label', default: 'Email')}</th>
                            <th >${message(code: 'user.dateCreated.label', default: 'Created')}</th>
                            <th >${message(code: 'user.dateExpired.label', default: 'Expired')}</th>
                            <th ><g:message code="purchase.label.action" default="Action" /></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${userInstanceList}" status="i" var="userInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td class="link_line" ><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                                <td>${fieldValue(bean: userInstance, field: "email")}</td>

                                <td><g:formatDate date="${userInstance.dateCreated}" /></td>

                                <td>
                                    <g:formatDate date="${userInstance.dateExpired}"/>
                                </td>
                                <td>
                                    <div class="center">
                                        <div class="purchase-button">
                                            <form method="POST" action="/user/delete">
                                                <input type="hidden" name="id" value="${userInstance?.id}"/>
                                                <button type="submit" class="btn btn-danger btn-small"
                                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                    ${message(code: 'default.button.delete.label', default: 'Delete')}
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

                    <pkg:paginate total="${userInstanceTotal}" params="${flash}" />

                </g:if>

            </section>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

</html>
