<div class="col-md-3 inner-right-md inner-bottom-sm">

    <!-- ============================================================= SIDE NAVIGATION ============================================================= -->

    <ul class="sidenav">
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="/common/reen_usermenu-element" model="[controller: 'user', action: 'list', messageCode: 'side.menu.list.account']"/>
            <g:render template="/common/reen_usermenu-element" model="[controller: 'server', action: 'list', messageCode: 'side.menu.list.server']"/>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="/common/reen_usermenu-element" model="[controller: 'user', action: 'show', messageCode: 'side.menu.my.account']"/>
        </sec:ifAllGranted>
            <g:render template="/common/reen_usermenu-element" model="[controller: 'product', action: 'list', messageCode: 'side.menu.product.list']"/>
            <g:render template="/common/reen_usermenu-element" model="[controller: 'purchase', action: 'list', messageCode: 'side.menu.my.purchase']"/>

        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="/common/reen_usermenu-element" model="[controller: 'giftcard', action: 'list', messageCode: 'side.menu.my.giftcard']"/>
        </sec:ifAllGranted>

        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="/common/reen_usermenu-element" model="[controller: 'giftcard', action: 'apply', messageCode: 'side.menu.my.free']"/>
        </sec:ifAllGranted>

    </ul><!-- /.sidenav -->

<!-- ============================================================= SIDE NAVIGATION : END ============================================================= -->

</div><!-- /.col -->