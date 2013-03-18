<div class="well sidebar-nav">
    <ul class="nav nav-list">
        <li class="nav-header"><g:message code="side.menu.title.menu"/></li>
        <g:render template="/common/usermenu-element" model="[controller: 'home', action: 'index', messageCode: 'side.menu.home']"/>
        <g:render template="/common/usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>

        <sec:ifLoggedIn>
            <g:render template="/common/usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
            <g:render template="/common/usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>
        </sec:ifLoggedIn>
        <li class="nav-header"><g:message code="side.menu.title.link"/></li>
        <li><a href="#"><g:message code="nav.item.manual"/></a></li>
    </ul>
</div><!--/.well -->
<g:render template="/common/rakutenWidget"/>


