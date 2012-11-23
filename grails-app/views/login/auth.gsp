<html>

<head>
<title><g:message code='spring.security.ui.login.title'/></title>
<meta name='layout' content='pkgwlayout'/>
</head>

<body>
<h4 style="position: absolute;left: 292px; top:13px"><g:message code="login.title"/></h4>
<g:render template="/common/slide"/>
<div class="noSideBar">
    <div class="centerBlockFun">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:render template="/login/form"/>
    </div>
</div>
</body>
</html>
