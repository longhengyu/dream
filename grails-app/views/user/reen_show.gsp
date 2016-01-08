<%@ page import="com.pkgplan.auth.User" %>
<html>
<head>
    <title><g:message code="user.account.title" /></title>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <meta name="layout" content="reen_layout" />
</head>

<div class="container inner">
    <div class="row">

        <g:render template="/layouts/reen_sidemenu"/>

        <div class="col-md-9 inner-left-md border-left">

            <!-- ============================================================= SECTION – HERO ============================================================= -->

            <section id="hero" class="inner-bottom-xs">
                <header>
                    <h2><g:message code="user.account.title"/></h2>
                </header>
            </section>

            <!-- ============================================================= SECTION – HERO : END ============================================================= -->

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!-- ============================================================= SECTION – CONTENT ============================================================= -->

            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs">



                <h3 class="team-headline sidelines text-center"><span><g:message code="user.account.tab.user"/></span></h3>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <form class="form-horizontal">
                    <g:if test="${userInstance?.username}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="login.label.username" default="Username" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${userInstance}" field="username"/></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.email}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="login.label.email" default="Email" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${userInstance}" field="email"/></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.enabled}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.enable" default="Enabled" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatBoolean boolean="${userInstance?.enabled}" /></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.accountExpired}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.account.expired" default="Account Expired" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.accountLocked}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.locked" default="Account Locked" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.dateCreated}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.register.time" default="Date Created" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatDate date="${userInstance?.dateCreated}" locale="${locale}"/></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.dateExpired.compareTo(userInstance?.dateCreated) != 0}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.expire.time" default="Date Expired" /></label>
                            <div class="col-sm-8">
                                <g:if test="${userInstance?.dateExpired > new java.util.Date()}">
                                    <p class="form-control-static label label-success label-custom">
                                        <g:formatDate date="${userInstance?.dateExpired}" locale="${locale}"/>
                                    </p>
                                </g:if><g:else>
                                    <p class="form-control-static label label-danger label-custom">
                                        <g:formatDate date="${userInstance?.dateExpired}" locale="${locale}"/>
                                        &nbsp;<g:message code="user.account.label.expire.time.already"/>
                                    </p>
                                </g:else>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${userInstance?.passwordExpired}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.label.password.expired" default="Password Expired" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></p>
                            </div>
                        </div>
                    </g:if>

                </form>

            </section>

            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs outer-sm">



                <h3 class="team-headline sidelines text-center"><span><g:message code="user.account.vpn.info.title" default="VPN connection information" /></span></h3>

                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><g:message code="user.account.server.ip.address" default="Server IP address" /></label>
                        <div class="col-sm-5">
                            <g:if test="${serverInstance}">
                                <p class="form-control-static"><g:fieldValue bean="${serverInstance}" field="ipAddr"/></p>
                            </g:if><g:else>
                                <p class="form-control-static"><g:message code="user.account.server.not.defined.yet"/>
                                    <g:message code="user.account.server.not.defined.please" args="['/product/list']"/>
                                </p>
                            </g:else>
                        </div>
                    </div>
                    <g:if test="${userInstance?.username}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.vpn.username" default="VPN Username" /></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:fieldValue bean="${userInstance}" field="username"/></p>
                            </div>
                        </div>
                    </g:if>
                    <g:if test="${serverInstance}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><g:message code="user.account.vpn.password" default="VPN Password"/></label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><g:vpnPassword/></p>
                            </div>
                        </div>
                    </g:if>

                </form>

            </section>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

</html>