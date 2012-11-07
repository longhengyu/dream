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
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <g:if test="${c.fullName == 'LoginController'}">
                <sec:ifNotLoggedIn>
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                </sec:ifNotLoggedIn>
            </g:if><g:elseif test="${c.fullName == 'LogoutController'}">
                <sec:ifLoggedIn>
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                </sec:ifLoggedIn>
            </g:elseif><g:else>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                </sec:ifAllGranted>
            </g:else>
        </g:each>
    </ul>
</div>
</body>
</html>
