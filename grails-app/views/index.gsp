<!DOCTYPE html>



<html>
<head>
    <title>Welcome to Dream VPN</title>
    <meta name="layout" content="pkglayout" />
</head>
<body>
<h3>Welcome to Dream VPN.</h3>
<p>This is a demo vpn provider site.</p>
<h3>Controllers</h3>
<div class="dialog" style="margin-left:20px;width:60%;">
    <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
    </ul>
</div>
</body>
</html>
