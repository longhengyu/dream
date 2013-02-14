<li class="<g:if test="${controllerName == controller && actionName == action}">active</g:if><g:elseif test="${controllerName != controller && home == true}">active</g:elseif>">
    <g:link controller="${controller}" action="${action}">
        <g:message code="nav.item.${action}"/>
    </g:link>
</li>
