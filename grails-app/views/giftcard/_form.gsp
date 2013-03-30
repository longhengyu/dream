<%@ page import="com.pkgplan.dream.Giftcard" %>

<div class="fieldcontain ${hasErrors(bean: giftcardInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="giftcard.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${giftcardInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: giftcardInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="giftcard.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.pkgplan.dream.Product.list()}" optionKey="id" required="" value="${giftcardInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: giftcardInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="giftcard.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${com.pkgplan.auth.User.list()}" optionKey="id" required="" value="${giftcardInstance?.owner?.id}" class="many-to-one"/>
</div>

