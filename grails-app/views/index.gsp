<%@ page import="com.pkgplan.auth.User" %>
<!DOCTYPE html>



<html>
<head>
    <title>Welcome to Dream VPN</title>
    <meta name="layout" content="pkglayout" />
    <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script src="http://cloud.github.com/downloads/jsw0528/jQuery.Switchable/jquery.switchable-2.0.min.js"></script>
</head>
<body>
<h3>Welcome to Dream VPN</h3>
<p>This is a demo vpn provider site.</p>
<h3>Feel Free To Surf These Sites</h3>
<g:render template="/home/slide"/>
<h3>Status</h3>
<p>Developing...</p>
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
