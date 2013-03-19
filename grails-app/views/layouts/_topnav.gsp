<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-th-list"></span>
            </a>
            <a href="${resource(dir: '') ?: '/'}" class="brand">
                <img class="logo" src="${resource(dir:'img',file:'logo.png')}" title="bizstrap" alt="logo">Dream VPN
            </a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right">
                    <g:render template="/home/nav_item" model="[controller: 'home', action: 'index', home: true]"/>
                    <g:render template="/home/nav_item" model="[controller: 'home', action: 'manual', home: false]"/>
                    <g:render template="/home/nav_item" model="[controller: 'home', action: 'contact', home: false]"/>

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