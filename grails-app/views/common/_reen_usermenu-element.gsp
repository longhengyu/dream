<li class="<g:if test="${controllerName == controller && actionName == action}">active</g:if>">
<g:link controller="${controller}" action="${action}">
    <g:message code="${messageCode}"/>
</g:link>
</li>