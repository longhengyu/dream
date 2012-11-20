<body>
<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<sec:ifAllGranted roles="ROLE_ADMIN">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</sec:ifAllGranted>
<g:render template="/user/panel"/>
<g:render template="/profile/panel"/>
</body>