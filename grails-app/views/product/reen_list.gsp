<html>
<head>
    <title><g:message code="product.list.title" /></title>
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
    <meta name="layout" content="reen_layout" />
</head>

<div class="container inner">
    <div class="row">

        <g:render template="/layouts/reen_sidemenu"/>

        <sec:ifNotLoggedIn>
            <g:render template="reen_listBody"/>
        </sec:ifNotLoggedIn>
        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="reen_listBody"/>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="listBodyAdmin"/>
        </sec:ifAllGranted>

    </div><!-- /.row -->
</div><!-- /.container -->

</html>