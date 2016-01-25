<%@ page import="com.pkgplan.auth.User" %>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
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
                <g:if test="${serverInstanceList.size() > 0}">
                    <table class="table table-bordered table-striped tabel-custom" id="purchase-history">
                        <thead>
                        <tr>
                            <th style="width: 18%">${message(code: 'server.hostname.label', default: 'Hostname')}</th>
                            <th style="width: 30%">${message(code: 'server.ipAddr.label', default: 'Ip Addr')}</th>
                            <th style="width: 18%">${message(code: 'server.capacity.label', default: 'Capacity')}</th>
                            <th style="width: 34%">${message(code: 'server.dateCreated.label', default: 'Date Created')}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${serverInstanceList}" status="i" var="serverInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td class="link_line" ><g:link action="show" id="${serverInstance.id}">${fieldValue(bean: serverInstance, field: "hostname")}</g:link></td>
                                <td>${fieldValue(bean: serverInstance, field: "ipAddr")}</td>

                                <td><g:link controller="user" action="list" params="[sid: serverInstance.id]">${serverInstance.users.size()}</g:link> / ${fieldValue(bean: serverInstance, field: "capacity")}</td>

                                <td><g:formatDate date="${serverInstance.dateCreated}" /></td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>

                    <pkg:paginate total="${serverInstanceTotal}" params="${flash}" />

                </g:if>

            </section>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->
            <form method="POST" action="/server/create">
                <g:link class="btn btn-default btn-primary btn-one-line" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </form>

        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

</html>
