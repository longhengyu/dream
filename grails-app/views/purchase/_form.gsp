<%@ page import="com.pkgplan.dream.Purchase" %>



<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="purchase.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.pkgplan.auth.User.list()}" optionKey="id" required="" value="${purchaseInstance?.owner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="purchase.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.pkgplan.dream.Product.list()}" optionKey="id" required="" value="${purchaseInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'datePay', 'error')} ">
	<label for="datePay">
		<g:message code="purchase.datePay.label" default="Date Pay" />
		
	</label>
	<g:datePicker name="datePay" precision="day"  value="${purchaseInstance?.datePay}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: purchaseInstance, field: 'paymentMethod', 'error')} ">
	<label for="paymentMethod">
		<g:message code="purchase.paymentMethod.label" default="Payment Method" />
		
	</label>
	<g:textField name="paymentMethod" value="${purchaseInstance?.paymentMethod}"/>
</div>

