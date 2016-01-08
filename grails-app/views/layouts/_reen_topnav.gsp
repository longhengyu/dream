<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>

<header>
<div class="navbar">

<div class="navbar-header">
    <div class="container">
    <!-- ============================================================= LOGO MOBILE ============================================================= -->

        <a class="navbar-brand" href="index.html"><img src="${resource(dir:'images',file:'logo.png')}" class="logo" alt=""></a>

        <!-- ============================================================= LOGO MOBILE : END ============================================================= -->

        <a class="btn responsive-menu pull-right" data-toggle="collapse" data-target=".navbar-collapse"><i class='icon-menu-1'></i></a>

    </div><!-- /.container -->
</div><!-- /.navbar-header -->

<div class="yamm">
<div class="navbar-collapse collapse">
<div class="container">

<!-- ============================================================= LOGO ============================================================= -->

<a class="navbar-brand" href="index.html"><img src="${resource(dir:'images',file:'logo.png')}" class="logo" alt=""></a>

<!-- ============================================================= LOGO : END ============================================================= -->


<!-- ============================================================= MAIN NAVIGATION ============================================================= -->

<ul class="nav navbar-nav">

<li class="dropdown">
    <g:link controller="home" action="index">
        <g:message code="nav.item.index"/>
    </g:link>
</li><!-- /.dropdown -->

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

<sec:ifLoggedIn>
<li class="dropdown pull-right searchbox">
    <span><sec:username/>&nbsp;&nbsp; (<g:link controller='logout' action="index"><g:message code="login.msg.logout"/></g:link>)</span>
</li><!-- /.dropdown -->
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<li class="dropdown pull-right searchbox">
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