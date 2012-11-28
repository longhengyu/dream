<li class="side-menu">
<g:remoteLink id="side-menu-${controller}" controller="${controller}" action="${action}" update="[success:'main-content']" onclick="" onSuccess="decorateMenu('side-menu-${controller}')">
    <div class="<g:if test="${controllerName == controller}">side-menu-selected</g:if>"><g:message code="${messageCode}"/></div>
</g:remoteLink>
</li>