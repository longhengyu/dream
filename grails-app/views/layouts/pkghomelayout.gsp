<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><g:layoutTitle default="Dream VPN" /></title>
    <g:render template="/layouts/resource"/>
    <link rel="stylesheet" href="${resource(dir:'css',file:'dream-top.css')}" />
    <script src="https://gathercontent.com/assets/js/global/modernizr-2.5.3.min.js"></script>
    <script src="https://gathercontent.com/assets/js/global/selectivizr.js"></script>
    <script type="text/javascript" src="https://gathercontent.com/assets/js/global/_dynamic.php?v=1363777876"></script>
</head>
<body>
<div class="page-content-wrapper">
    <%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
    <% def locale=RequestContextUtils.getLocale(request)%>

    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-th-list"></span>
                </a>
                <a href="${resource(dir: '') ?: '/'}" class="brand">
                    <img class="logo" src="${resource(dir:'img',file:'logoimg_white.png')}" title="bizstrap" alt="logo">
                </a>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li>
                            <g:link controller="home" action="manual">
                                <g:message code="nav.item.manual"/>
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="home" action="contact">
                                <g:message code="nav.item.contact"/>
                            </g:link>
                        </li>
                        <sec:ifLoggedIn>
                            <li class="menu-item highlight-item">
                                <g:link action="show" controller="user"><sec:username/></g:link>
                            </li>
                            <li class="menu-item login-item">
                                <g:link controller='logout' action="index"><g:message code="login.msg.logout"/></g:link>
                            </li>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <li class="menu-item highlight-item">
                                <g:link action="index" controller="register"><g:message code="login.link.register.new.user"/></g:link>
                            </li>
                            <li class="menu-item login-item">
                                <g:link action="auth" controller="login" class="btn btn-inverse btn-mini"><g:message code="login.button.login"/></g:link>
                            </li>
                        </sec:ifNotLoggedIn>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="bfh-languages" data-language="${locale}" data-flags="true"></span><b class="caret"></b></a>
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
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="hero-unit">
        <div class="container">
            <g:layoutBody />
        </div>
    </div>

    <div class="container">
        <div class="row get-started-now">
            <div class="span10 offset1 white-panel button-text-panel">
                <h2><g:message code="main.ready.to.go"/></h2>
                <a href="/register" class="btn btn-large btn-warning"><g:message code="main.ready.to.go.button"/></a>
            </div>
        </div>
    </div>
    
    <div class="main-container">
  
<div class="container-fluid" id="team">
	<div class="container dark">
		<h1><g:message code="product.list.title" /></h1>
			<ul class="thumbnails row-fluid span12">
			  
			
			  <li class="span4">
			    <div class="thumbnail">
			      <img alt="" src="${resource(dir:'img',file:'1.png')}">
			      <h3><span class="big-size"><g:message code="main.plan.price.1" /></span> / <g:message code="main.plan.period.1" /></h3>
			      <p><g:message code="main.plan.description.1" /></p>

			    </div>
			  </li>
			  
			  <li class="span4">
			    <div class="thumbnail">
			      <img alt="" src="${resource(dir:'img',file:'2.png')}">
			      <h3><span class="big-size"><g:message code="main.plan.price.2" /></span> / <g:message code="main.plan.period.2" /></h3>
			      <p><g:message code="main.plan.description.2" /></p>

			    </div>
			  </li>
			
			  <li class="span4">
			    <div class="thumbnail">
                    <img alt="" src="${resource(dir:'img',file:'3.png')}">
                    <h3><span class="big-size"><g:message code="main.plan.price.3" /></span> / <g:message code="main.plan.period.3" /></h3>
                    <p><g:message code="main.plan.description.3" /></p>

                </div>
			  </li>
			 </ul>
		</div>
	</div>
	</div>
    

    <div class="push"><!--//--></div>
</div> <!-- page-content-wrapper -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="inline-brand">
                    <a href="${resource(dir: '') ?: '/'}" class="brand">
                        <img src="${resource(dir:'img',file:'logoimg_white.png')}" title="bizstrap" alt="logo">
                    </a>
                </div>
                <p>Our mission is to bring content harmony to everyone.</p>
            </div>
        </div>
        <div class="row links-horizontal">
            <div class="span12">
                <a href="https://twitter.com/pkgplan" class="twitter-link">Follow us on Twitter</a>
            </div>
        </div>

    </div>
</footer>



</body>
</html>
