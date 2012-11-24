<%@ page import="com.pkgplan.dream.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="product.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${productInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${productInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="product.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: productInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="product.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${productInstance.constraints.status.inList}" required="" value="${productInstance?.status}" valueMessagePrefix="product.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pYear', 'error')} required">
	<label for="pYear">
		<g:message code="product.pYear.label" default="PY ear" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pYear" type="number" min="0" value="${productInstance.pYear}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pMonth', 'error')} required">
	<label for="pMonth">
		<g:message code="product.pMonth.label" default="PM onth" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pMonth" type="number" min="0" value="${productInstance.pMonth}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pDay', 'error')} required">
	<label for="pDay">
		<g:message code="product.pDay.label" default="PD ay" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pDay" type="number" min="0" value="${productInstance.pDay}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pHour', 'error')} required">
	<label for="pHour">
		<g:message code="product.pHour.label" default="PH our" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pHour" type="number" min="0" value="${productInstance.pHour}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'pMinute', 'error')} required">
	<label for="pMinute">
		<g:message code="product.pMinute.label" default="PM inute" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pMinute" type="number" min="0" value="${productInstance.pMinute}" required=""/>
</div>

