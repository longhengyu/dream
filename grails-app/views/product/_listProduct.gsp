<div class="row-fluid">
<g:each in="${productInstanceList}" status="i" var="productInstance">
    <g:render template="listProductElement" model="[productInstance: productInstance, i: i]"/>
</g:each>
</div>