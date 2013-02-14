<li class="<g:if test="${controllerName == controller}">active</g:if>">
<g:link id="side-menu-${controller}" controller="${controller}" action="${action}">
    <g:message code="${messageCode}"/>
</g:link>
</li>