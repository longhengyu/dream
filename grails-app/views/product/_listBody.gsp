<%@ page import="com.pkgplan.dream.Product" %>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<sec:ifAllGranted roles="ROLE_ADMIN">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</sec:ifAllGranted>

<h3><sec:ifAllGranted roles="ROLE_ADMIN"><g:message code="default.show.label" args="[entityName]" /></sec:ifAllGranted>
<sec:ifAllGranted roles="ROLE_USER"><g:message code="product.list.title" default="Available VPN Plans" /></sec:ifAllGranted>
</h3>


<g:render template="dropDown"/>

<div id="list-product" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />

            <g:sortableColumn property="code" title="${message(code: 'product.code.label', default: 'Code')}" />

            <g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />

            <g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />

            <g:sortableColumn property="status" title="${message(code: 'product.status.label', default: 'Status')}" />

            <g:sortableColumn property="pYear" title="${message(code: 'product.pYear.label', default: 'PY ear')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${productInstanceList}" status="i" var="productInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: productInstance, field: "code")}</td>

                <td>${fieldValue(bean: productInstance, field: "description")}</td>

                <td>${fieldValue(bean: productInstance, field: "price")}</td>

                <td>${fieldValue(bean: productInstance, field: "status")}</td>

                <td>${fieldValue(bean: productInstance, field: "pYear")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${productInstanceTotal}" />
    </div>
</div>