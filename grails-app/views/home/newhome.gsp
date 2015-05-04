<%--
  Created by IntelliJ IDEA.
  User: longhengyu
  Date: 15/4/25
  Time: 上午12:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><g:message code="site.page.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- stylesheets -->

    <link rel="stylesheet" href="${resource(dir:'css/bootstrap',file:'bootstrap.min.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'theme.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'animate.css')}" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'font-awesome.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'bootstrap-formhelpers-countries.flags.css')}" />

    <!-- javascript -->
    <script src="${resource(dir: 'js/lib', file: 'jquery-1.8.3.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'theme.js')}"></script>


    <script src="${resource(dir:'js',file:'bootstrap-formhelpers-languages.codes.js')}"></script>
    <script src="${resource(dir:'js',file:'bootstrap-formhelpers-languages.js')}"></script>

</head>
<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>
<body id="home">
<header class="navbar navbar-inverse hero" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${resource(dir: '') ?: '/'}" class="navbar-brand">Dream VPN</a>
        </div>
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav navbar-right">
                <sec:ifLoggedIn>
                    <li>
                        <g:link controller="product" action="list">
                            <g:message code="nav.item.index"/>
                        </g:link>
                    </li>
                </sec:ifLoggedIn>
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

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="bfh-languages" data-language="${locale}" data-flags="true"></span><b class="caret"></b></a>
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
        </nav>
    </div>
</header>

<div id="hero">
    <div class="container">
        <h1 class="hero-text animated fadeInDown">
            <g:message code="main.title.free.to.surf"/>

        </h1>
        <p class="sub-text animated fadeInDown">
            <g:message code="main.title.free.to.surf.sub"/>
        </p>
        <div class="cta animated fadeInDown">
            <g:link action="auth" controller="login" class="button-outline"><g:message code="login.button.login"/></g:link>
            <g:link action="index" controller="register" class="button"><g:message code="login.link.register.new.user"/></g:link>
        </div>
        <div class="img"></div>
    </div>
</div>

<div id="features">
    <div class="container">
        <div class="row header">
            <div class="col-md-12">
                <h2><g:message code="main.title.free.to.surf"/></h2>
                <p><g:message code="main.title.free.to.surf.sub"/></p>
            </div>
        </div>
        <div class="row feature">
            <div class="col-md-6 info">
                <h4><g:message code="main.merit.simple"/></h4>

                    <g:message code="main.merit.simple.description"/>

            </div>
            <div class="col-md-6 image">
                <img src="${resource(dir:'img',file:'figure-1.png')}" class="img-responsive" alt="feature1" />
            </div>
        </div>
        <div class="divider"></div>
        <div class="row feature backwards">
            <div class="col-md-6 info">
                <h4><g:message code="main.merit.fast"/></h4>
                <g:message code="main.merit.fast.description"/>
            </div>
            <div class="col-md-6 image">
                <img src="${resource(dir:'img',file:'board2.png')}" class="img-responsive" alt="feature2" />
            </div>
        </div>
        <div class="divider"></div>
        <div class="row feature">
            <div class="col-md-6 info">
                <h4><g:message code="main.merit.transparent"/></h4>
                <g:message code="main.merit.transparent.description"/>
            </div>
            <div class="col-md-6 image">
                <img src="${resource(dir:'img',file:'figure-3.png')}" class="img-responsive" alt="feature1" />
            </div>
        </div>
        <div class="divider"></div>
        <div class="row feature backwards">
            <div class="col-md-6 info">
                <h4><g:message code="main.merit.cheap"/><g:message code="main.merit.cheap"/><g:message code="main.merit.cheap"/><g:message code="main.merit.cheap"/></h4>
                <p>
                    <g:message code="main.merit.cheap.description"/> <g:message code="main.merit.cheap.description"/> <g:message code="main.merit.cheap.description"/> <g:message code="main.merit.cheap.description"/> <g:message code="main.merit.cheap.description"/>
                </p>
            </div>
            <div class="col-md-6 image">
                <img src="${resource(dir:'img',file:'board4.png')}" class="img-responsive" alt="feature2" />
            </div>
        </div>
    </div>
</div>

<div id="pricing">
    <div class="container">
        <div class="row header">
            <div class="col-md-12">
                <h3>Easy to go, Easy to setup.</h3>
                <p>3 plans for your needs</p>
            </div>
        </div>
        <div class="row charts">
            <div class="col-md-4">
                <div class="chart first">
                    <div class="thumbnail">
                        <img alt="" src="${resource(dir:'img',file:'1.png')}">
                    </div>
                    <div class="quantity">
                        <span class="dollar">RMB</span>
                        <span class="price">26</span>
                        <span class="period">/ <g:message code="main.plan.period.1" /></span>
                    </div>
                    <div class="plan-name"><g:message code="main.plan.description.1" /></div>
                    <div class="specs">

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.2.v"/></span>
                            <g:message code="main.product.li.2.t"/>
                        </div>

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.4.v"/></span>
                            <g:message code="main.product.li.4.t"/>
                        </div>
                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.5.v"/></span>
                            <g:message code="main.product.li.5.t"/>
                        </div>
                    </div>
                    <g:link action="index" controller="register" class="btn-signup button-clear">
                        <span><g:message code="main.ready.to.go.button"/></span>
                    </g:link>
                </div>
            </div>
            <div class="col-md-4">
                <div class="chart featured">
                    <div class="thumbnail">
                        <img alt="" src="${resource(dir:'img',file:'2.png')}">
                    </div>
                    <div class="quantity">
                        <span class="dollar">RMB</span>
                        <span class="price">72</span>
                        <span class="period">/ <g:message code="main.plan.period.2" /></span>
                    </div>
                    <div class="plan-name"><g:message code="main.plan.description.2" /></div>
                    <div class="specs">

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.2.v"/></span>
                            <g:message code="main.product.li.2.t"/>
                        </div>

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.4.v"/></span>
                            <g:message code="main.product.li.4.t"/>
                        </div>
                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.5.v.3"/></span>
                            <g:message code="main.product.li.5.t"/>
                        </div>
                    </div>
                    <g:link action="index" controller="register" class="btn-signup button-clear">
                        <span><g:message code="main.ready.to.go.button"/></span>
                    </g:link>
                </div>
            </div>
            <div class="col-md-4">
                <div class="chart last">
                    <div class="thumbnail">
                        <img alt="" src="${resource(dir:'img',file:'3.png')}">
                    </div>
                    <div class="quantity">
                        <span class="dollar">RMB</span>
                        <span class="price">280</span>
                        <span class="period">/ <g:message code="main.plan.period.3" /></span>
                    </div>
                    <div class="plan-name"><g:message code="main.plan.description.3" /></div>
                    <div class="specs">

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.2.v"/></span>
                            <g:message code="main.product.li.2.t"/>
                        </div>

                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.4.v"/></span>
                            <g:message code="main.product.li.4.t"/>
                        </div>
                        <div class="spec">
                            <span class="variable"><g:message code="main.product.li.5.v.5"/></span>
                            <g:message code="main.product.li.5.t"/>
                        </div>
                    </div>
                    <g:link action="index" controller="register" class="btn-signup button-clear">
                        <span><g:message code="main.ready.to.go.button"/></span>
                    </g:link>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="slider">
    <div class="container">
        <div class="row header">
            <div class="col-md-12">
                <h3>理所应当，打得开所有的网站</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 slide-wrapper">
                <div class="slideshow">
                    <div class="btn-nav prev"></div>
                    <div class="btn-nav next"></div>
                    <div class="slide active">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/slider/slide3.png" alt="slide3" />
                    </div>
                    <div class="slide">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/slider/slide4.png" alt="slide4" />
                    </div>
                    <div class="slide">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/slider/slide1.png" alt="slide1" />
                    </div>
                    <div class="slide">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/slider/slide5.png" alt="slide5" />
                    </div>
                    <div class="slide">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/slider/slide2.png" alt="slide2" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="testimonials">
    <div class="container">
        <div class="row header">
            <div class="col-md-12">
                <h3>我们的朋友怎么说:</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="testimonial pull-right">
                    <div class="quote">
                        I am just quoting some stuff but I am seriously happy about this product. Has a lot of powerful
                        features and is so easy to set up, I could stay customizing it day and night, it's just so much fun!
                        <div class="arrow-down">
                            <div class="arrow"></div>
                            <div class="arrow-border"></div>
                        </div>
                    </div>
                    <div class="author">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/testimonials/testimonial1.jpg" class="pic" alt="testimonial1" />
                        <div class="name">John McClane</div>
                        <div class="company">Freelancer</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="testimonial">
                    <div class="quote">
                        This thing is one of those tools that everybody should be using. I really like it and with this ease to use, you can kickstart your projects and apps and just focus on your business!
                        <div class="arrow-down">
                            <div class="arrow"></div>
                            <div class="arrow-border"></div>
                        </div>
                    </div>
                    <div class="author">
                        <img src="http://lit-coast-9918.herokuapp.com/react12/images/testimonials/testimonial2.jpg" class="pic" alt="testimonial2" />
                        <div class="name">Quevedo Waldemar</div>
                        <div class="company">Engineer</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="cta">
    <p>
        <g:message code="main.ready.to.go"/>
    </p>
    <g:link action="index" controller="register">
        <span><g:message code="main.ready.to.go.button"/></span>
    </g:link>
</div>



<div id="footer-white">
    <div class="container">

        <div class="row credits">
            <div class="col-md-12">
                Copyright © 2014. <a href="http://www.miitbeian.gov.cn/" target="_blank">沪ICP备15003002号</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>