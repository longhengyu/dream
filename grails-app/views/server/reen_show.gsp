<%@ page import="com.pkgplan.dream.Server" %>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                    <h2><g:message code="default.show.label" args="[entityName]" /></h2>
                </header>
            </section>

        <!-- ============================================================= SECTION – HERO : END ============================================================= -->

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
        <!-- ============================================================= SECTION – CONTENT ============================================================= -->

            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs">



                <h3 class="team-headline sidelines text-center"><span>SERVER</h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <form class="form-horizontal">
                    <g:if test="${serverInstance?.hostname}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="server.hostname.label" default="Hostname" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${serverInstance}" field="hostname"/></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${serverInstance?.ipAddr}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="server.ipAddr.label" default="Ip Addr" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${serverInstance}" field="ipAddr"/></p>
                            </div>
                        </div>
                    </g:if>


                    <g:if test="${serverInstance?.capacity}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="server.capacity.label" default="Capacity" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${serverInstance}" field="capacity"/></p>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${serverInstance?.dateCreated}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="server.dateCreated.label" default="Date Created" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatDate date="${serverInstance?.dateCreated}" /></p>
                            </div>
                        </div>
                    </g:if>


                    <g:if test="${serverInstance?.users}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="server.users.label" default="Users" /></label>

                            <div class="col-sm-8">
                                <p class="form-control-static">
                                <g:each in="${serverInstance.users}" var="u">
                                    <span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
                                </g:each>
                                </p>
                            </div>
                        </div>
                    </g:if>


                </form>

            </section>



            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs outer-sm">



                <h3 class="team-headline sidelines text-center"><span>USE LOG</span></h3>

                    <g:if test="${exeResult}">
                        <g:if test="${exeResult.rc == 0}">
                        <table class="text-center table table-bordered table-striped tabel-custom" id="purchase-history">
                            <tbody>
                            <g:each in="${exeResult.sysout.split('\n')}" status="i"  var="u">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td class="${u.contains('still') ? 'red' : ''}">${u}</td>


                                </tr>
                            </g:each>

                            </tbody>
                        </table>
                        </g:if>

                    </g:if>

            </section>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

            <form method="POST" action="/server/delete">
                <input type="hidden" name="id" value="${serverInstance?.id}"/>
                <button type="submit" class="btn btn-default btn-warning btn-one-line"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    ${message(code: 'default.button.delete.label', default: 'Delete')}
                </button>


                <g:link class="btn btn-primary btn-info btn-one-line" action="edit" id="${serverInstance?.id}">
                    <g:message code="default.button.edit.label" default="Edit" />
                </g:link>
            </form>
        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

</html>