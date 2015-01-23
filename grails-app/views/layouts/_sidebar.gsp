<sec:ifLoggedIn>
<div class="well sidebar-nav">
    <ul class="nav nav-list">
        <li class="nav-header"><g:message code="side.menu.title.menu"/></li>

            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:render template="/common/usermenu-element" model="[controller: 'user', action: 'list', messageCode: 'side.menu.list.account']"/>
                <g:render template="/common/usermenu-element" model="[controller: 'server', action: 'list', messageCode: 'side.menu.list.server']"/>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_USER">
                <g:render template="/common/usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
            </sec:ifAllGranted>
            <g:render template="/common/usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>

            <sec:ifAllGranted roles="ROLE_ADMIN">
				<g:render template="/common/usermenu-element" model="[controller: 'giftcard', action: 'list', messageCode: 'side.menu.my.giftcard']"/>
            </sec:ifAllGranted>

        <li class="nav-header"><g:message code="side.menu.title.link"/></li>
        <li><a href="/home/manual/"><g:message code="nav.item.manual"/></a></li>
    </ul>
</div>
</sec:ifLoggedIn>


