<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>



<html>
<head>
    <title>Welcome to Dream VPN</title>
    <meta name="layout" content="pkglayout" />
</head>
<body>
<h3>Welcome to Dream VPN</h3>
<p>This is a demo vpn provider site.</p>
<h3>Controllers</h3>
<div class="dialog" style="margin-left:20px;width:60%;">
    <ul>
        <sec:ifLoggedIn>
            <sec:ifAllGranted roles="ROLE_USER">
                <g:set var="userInstance" value="${User.findByUsername(sec.loggedInUserInfo(field:'username'))}"/>
                <li class="controller"><g:link controller="user" action="show" id="${userInstance.id}">My Account</g:link></li>
                <li class="controller"><g:link controller="profile" action="show" id="${userInstance.profile?.id}">My Profile</g:link></li>
                <li class="controller"><g:link controller="logout">Logout</g:link></li>
            </sec:ifAllGranted>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li class="controller"><g:link controller="login">Login</g:link></li>
        </sec:ifNotLoggedIn>
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
