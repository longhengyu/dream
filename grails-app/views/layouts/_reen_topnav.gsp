<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>

<header>
<div class="navbar">

<div class="navbar-header">
    <div class="container">
    <!-- ============================================================= LOGO MOBILE ============================================================= -->

        <a class="navbar-brand" href="/home/index"><img src="${resource(dir:'images',file:'logo.png')}" class="logo" alt=""></a>

        <!-- ============================================================= LOGO MOBILE : END ============================================================= -->

        <a class="btn responsive-menu pull-right" data-toggle="collapse" data-target=".navbar-collapse"><i class='icon-menu-1'></i></a>

    </div><!-- /.container -->
</div><!-- /.navbar-header -->

<div class="yamm">
<div class="navbar-collapse collapse">
<div class="container">

<!-- ============================================================= LOGO ============================================================= -->

<a class="navbar-brand" href="/home/index"><img src="${resource(dir:'images',file:'logo.png')}" class="logo" alt=""></a>

<!-- ============================================================= LOGO : END ============================================================= -->


<!-- ============================================================= MAIN NAVIGATION ============================================================= -->

<ul class="nav navbar-nav">

<g:if test="${com.pkgplan.dream.Impl.HelperService.isMobile() == false}">
    <li class="dropdown">
        <g:link controller="home" action="index">
            <g:message code="nav.item.index"/>
        </g:link>
    </li>
</g:if><g:else>
    <li class="dropdown open">

        <a href="#" class="dropdown-toggle js-activated"><g:message code="nav.item.index"/></a>

        <ul class="dropdown-menu">

            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:render template="/common/reen_usermenu-element" model="[controller: 'user', action: 'list', messageCode: 'side.menu.list.account']"/>
                <g:render template="/common/reen_usermenu-element" model="[controller: 'server', action: 'list', messageCode: 'side.menu.list.server']"/>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_USER">
                <g:render template="/common/reen_usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
            </sec:ifAllGranted>
            <g:render template="/common/reen_usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>

            <sec:ifLoggedIn>
                <g:render template="/common/reen_usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>
            </sec:ifLoggedIn>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:render template="/common/reen_usermenu-element" model="[controller: 'giftcard', action: 'list', messageCode: 'side.menu.my.giftcard']"/>
            </sec:ifAllGranted>

            <sec:ifAllGranted roles="ROLE_USER">
                <g:render template="/common/reen_usermenu-element" model="[controller: 'giftcard', action: 'apply', messageCode: 'side.menu.my.free']"/>
            </sec:ifAllGranted>
        </ul><!-- /.dropdown-menu -->
    </li><!-- /.dropdown -->
</g:else>

<li class="dropdown">
    <g:link controller="home" action="manual">
        <g:message code="nav.item.manual"/>
    </g:link>
</li><!-- /.dropdown -->

<li class="dropdown">
    <g:link controller="home" action="contact">
        <g:message code="nav.item.contact"/>
    </g:link>
</li><!-- /.dropdown -->

<li class="dropdown">

    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="bfh-languages" data-language="${locale}" data-flags="true"></span><b class="caret"></b></a>

    <ul class="dropdown-menu">
        <g:each in="${grailsApplication.config.supported.languages.list}">
            <g:if test="${!locale.toString().equals(it)}">
                <li>
                    <g:link controller="${controllerName}" action="${actionName}" params="[lang:it]">
                        <span class="bfh-languages" data-language="${it}" data-flags="true"></span>
                    </g:link>
                </li>
            </g:if>
        </g:each>

    </ul><!-- /.dropdown-menu -->
</li><!-- /.dropdown -->

<sec:ifLoggedIn>
<li class="dropdown pull-right searchbox link_line">
    <span><sec:username/>&nbsp;&nbsp; (<g:link controller='logout' action="index"><g:message code="login.msg.logout"/></g:link>)</span>
</li><!-- /.dropdown -->
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<li class="dropdown pull-right searchbox link_line">
    <span><g:link action="index" controller="register"><g:message code="login.link.register.new.user"/></g:link> | <g:link action="auth" controller="login" class=""><g:message code="login.button.login"/></g:link></span>
</li><!-- /.searchbox -->
</sec:ifNotLoggedIn>

</ul><!-- /.nav -->

<!-- ============================================================= MAIN NAVIGATION : END ============================================================= -->

</div><!-- /.container -->
</div><!-- /.navbar-collapse -->
</div><!-- /.yamm -->
</div><!-- /.navbar -->
</header>