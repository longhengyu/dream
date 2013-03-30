<div class="well sidebar-nav">
    <ul class="nav nav-list">
        <li class="nav-header"><g:message code="side.menu.title.menu"/></li>
        <sec:ifLoggedIn>
            <g:render template="/common/usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'giftcard', action: 'list', messageCode: 'side.menu.my.giftcard']"/>
        </sec:ifLoggedIn>
        <li class="nav-header"><g:message code="side.menu.title.link"/></li>
        <li><a href="#"><g:message code="nav.item.manual"/></a></li>
    </ul>
</div><!--/.well -->
<g:render template="/common/rakutenWidget"/>


