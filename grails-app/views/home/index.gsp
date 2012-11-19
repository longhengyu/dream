<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>



<html xmlns:wb=“http://open.weibo.com/wb”>
<head>
    <title>Welcome to Dream VPN</title>
    <meta name="layout" content="pkglayout" />
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>
<h3><g:message code="main.title.free.to.surf"/></h3>
<g:render template="/common/jiathis"/>
<g:render template="/home/slide"/>
<h3><g:message code="main.title.whatsnew"/></h3>
<p>Developing ... You can find us on Weibo.
<wb:follow-button uid="3123398953" type="red_1" width="67" height="24" ></wb:follow-button>
</p>
<div class="dialog" style="margin-left:20px;width:60%;">
    <ul>
        <sec:ifLoggedIn>
            <sec:ifAllGranted roles="ROLE_USER">
                <g:set var="userInstance" value="${User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
                <li class="controller"><g:link controller="user" action="show" id="${userInstance.id}">My Account</g:link></li>
                <li class="controller"><g:link controller="logout">Logout</g:link></li>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>
    </ul>
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <h2>Admin Tool</h2>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </sec:ifAllGranted>
</div>
</body>
</html>
