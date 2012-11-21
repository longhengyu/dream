<div class="userMenu">
    <ul>
        <li class="side-menu">
            <g:remoteLink id="side-menu-home" controller="home" action="index" update="[success:'main-content']" onclick="" onSuccess="decorateMenu('side-menu-home')">
                <div class="<g:if test="${controllerName == 'home'}">side-menu-selected</g:if>"><g:message code="side.menu.home"/></div>
            </g:remoteLink>
        </li>
        <li class="side-menu">
            <g:remoteLink id="side-menu-user" controller="user" action="show" update="[success:'main-content']" onclick="" onSuccess="decorateMenu('side-menu-user')">
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
    function decorateMenu(myId) {
        $(".side-menu .side-menu-selected").each(function(){
            $(this).removeClass("side-menu-selected");
        });
        $("#" + myId).find("div").addClass("side-menu-selected");
    }
</script>