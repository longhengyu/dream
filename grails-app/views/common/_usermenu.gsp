<div class="userMenu">
    <ul>

        <g:render template="/common/usermenu-element" model="[controller: 'home', action: 'index', messageCode: 'side.menu.home']"/>
        <g:render template="/common/usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>

        <sec:ifLoggedIn>
            <g:render template="/common/usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>
        </sec:ifLoggedIn>

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