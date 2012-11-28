<%@ page import="com.pkgplan.dream.Product" %>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<sec:ifAllGranted roles="ROLE_ADMIN">
    <div class="nav" role="navigation">
        <ul>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</sec:ifAllGranted>

<h3><g:message code="product.list.title" default="Available VPN Plans" /></h3>


<g:render template="dropDown"/>

