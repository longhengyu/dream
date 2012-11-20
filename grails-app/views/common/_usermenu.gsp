<div class="userMenu">
    <ul>
        <li class="side-menu">
            <g:remoteLink controller="home" action="index" update="[success:'main-content']" onSuccess="decorateMenu()">
                <div class="<g:if test="${controllerName == 'home'}">side-menu-selected</g:if>"><g:message code="side.menu.home"/></div>
            </g:remoteLink>
        </li>
        <li class="side-menu">
            <g:remoteLink controller="user" action="show" update="[success:'main-content']" onSuccess="decorateMenu()">
                <div><g:message code="side.menu.my.account"/></div>
            </g:remoteLink>
        </li>
        <li class="side-menu">
            <g:link controller="home" action="index"><div>Don't click</div></g:link>
        </li>
        <li class="side-menu">
            <g:link controller="home" action="index"><div>Nothing</div></g:link>
        </li>
        <li class="side-menu">
            <g:link controller="home" action="index"><div>I'm not Ajax</div></g:link>
        </li>
    </ul>
</div>
<script type="text/javascript">
    function decorateMenu() {
        $(".side-menu-selected").each(function(){$(this).removeClass("side-menu-selected")});
        $(".menu-clicked").each(function(){$(this).find("div").addClass("side-menu-selected")});
    }
    $(".side-menu a").mouseover(function() {
        $(this).addClass("menu-clicked");
    });
    $(".side-menu a").mouseout(function() {
        $(this).removeClass("menu-clicked");
    });
</script>