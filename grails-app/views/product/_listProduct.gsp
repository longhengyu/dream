<div id="pricewrap">
	<div class="row-fluid">
		<div class="span12">
		    <div class="pricing-table-wrapper">
               	<div class="pricing-table row-fluid">
				<g:each in="${productInstanceList}" status="i" var="productInstance">
				    <g:render template="listProductElement" model="[productInstance: productInstance, i: i]"/>
				</g:each>
				</div>
          	</div>
       </div>
    </div>
</div>
