
<%@ page import="com.pkgplan.dream.Purchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-purchase" class="content scaffold-show" role="main">
			<h3>Purchase</h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list purchase">

                <g:if test="${purchaseInstance?.dateCreated}">
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="purchase.dateCreated.label" default="Date Created" /></span>

                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${purchaseInstance?.dateCreated}" /></span>

                    </li>
                </g:if>

                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:if test="${purchaseInstance?.owner}">
                    <li class="fieldcontain">
                        <span id="owner-label" class="property-label"><g:message code="purchase.owner.label" default="Owner" /></span>

                            <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${purchaseInstance?.owner?.id}">${purchaseInstance?.owner?.encodeAsHTML()}</g:link></span>

                    </li>
                    </g:if>
                </sec:ifAllGranted>
			
				<g:if test="${purchaseInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="purchase.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${purchaseInstance?.product?.id}">${purchaseInstance?.product?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			

				<li class="fieldcontain">
					<span id="datePay-label" class="property-label">Status</span>
                    <g:if test="${purchaseInstance?.datePay}">
						<span class="property-value" aria-labelledby="datePay-label">Paid at <g:formatDate date="${purchaseInstance?.datePay}" /></span>
                    </g:if><g:else>
                        <span class="property-value" aria-labelledby="datePay-label">
                           Not Paid Yet. <g:link action="buy" id="${purchaseInstance.id}">Pay Now</g:link>
                            <a id="buyTaobao" href="http://shop67794942.taobao.com/shop/view_shop.htm" target="_blank">Pay Now</a>
                        </span>
                    </g:else>
				</li>
			
				<g:if test="${purchaseInstance?.purchaseNumber}">
				<li class="fieldcontain">
					<span id="paymentNumber-label" class="property-label"><g:message code="purchase.paymentNumber.label" default="Payment Number" /></span>
					
						<span class="property-value" aria-labelledby="paymentNumber-label"><g:fieldValue bean="${purchaseInstance}" field="purchaseNumber"/></span>
					
				</li>
				</g:if>
			

			
				<g:if test="${purchaseInstance?.paymentMethod}">
				<li class="fieldcontain">
					<span id="paymentMethod-label" class="property-label"><g:message code="purchase.paymentMethod.label" default="Payment Method" /></span>
					
						<span class="property-value" aria-labelledby="paymentMethod-label"><g:fieldValue bean="${purchaseInstance}" field="paymentMethod"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${purchaseInstance?.id}" />
					<g:link class="edit" action="edit" id="${purchaseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
