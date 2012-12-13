
<%@ page import="com.pkgplan.dream.Purchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="purchase.title.purchase.history"/></title>
	</head>
	<body>

		<div id="show-purchase" class="content scaffold-show" role="main">
			<h3><g:message code="purchase.title.order.info"/></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list purchase">

                <g:if test="${purchaseInstance?.dateCreated}">
                    <li class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="purchase.label.create.date" default="Date Created" /></span>

                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${purchaseInstance?.dateCreated}" /></span>

                    </li>
                </g:if>

                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <g:if test="${purchaseInstance?.owner}">
                    <li class="fieldcontain">
                        <span id="owner-label" class="property-label"><g:message code="purchase.label.purchase.owner" default="Owner" /></span>
                        <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${purchaseInstance?.owner?.id}">${purchaseInstance?.owner?.encodeAsHTML()}</g:link></span>
                    </li>
                    </g:if>
                </sec:ifAllGranted>
			
				<g:if test="${purchaseInstance?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="purchase.label.product.name" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${purchaseInstance?.product?.id}"><g:message code="product.info.name.${purchaseInstance.product.code}" default="${purchaseInstance.product.name}"/></g:link></span>
					
				</li>
				</g:if>


				<li class="fieldcontain">
					<span id="datePay-label" class="property-label"><g:message code="purchase.label.status" default="Status" /></span>
                    <g:if test="${purchaseInstance?.datePay}">
						<span class="property-value" aria-labelledby="datePay-label"><g:message code="purchase.text.paid.at" args="[purchaseInstance?.datePay]"/></span>
                    </g:if><g:else>
                        <span class="property-value" aria-labelledby="datePay-label">
                            <g:message code="purchase.text.not.paid.yet" default="Not Paid Yet" />
                        </span>
                    </g:else>
				</li>
			
				<g:if test="${purchaseInstance?.purchaseNumber}">
                    <li class="fieldcontain">
                        <span id="paymentNumber-label" class="property-label"><g:message code="purchase.label.order.number" default="Order Number" /></span>
                        <span class="property-value" aria-labelledby="paymentNumber-label"><g:fieldValue bean="${purchaseInstance}" field="purchaseNumber"/></span>
                    </li>
				</g:if>
			
                <g:if test="${purchaseInstance?.paymentMethod}">
                    <li class="fieldcontain">
                        <span id="paymentMethod-label" class="property-label"><g:message code="purchase.label.payment.method" default="Payment Method" /></span>
                        <span class="property-value" aria-labelledby="paymentMethod-label"><g:message code="payment.method.name.${purchaseInstance.paymentMethod}"/></span>
                    </li>
				</g:if>
			
			</ol>
            <g:if test="${!purchaseInstance?.datePay}">
                <div class="form-no-decorate">
                    <g:form>
                        <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
                        <div class="banner-text center"><g:message code="purchase.menu.pay.with" default="Pay With" /></div>

                        <div class="center">
                            <g:hiddenField name="paymentMethod" value="0" id="hiddenPaymentMethod"/>

                            <g:each in="${grailsApplication.config.payment.methods}" var="paymentMethod" status="i">
                                <g:render template="paymentSubmitButton" model="[paymentId: i]"/>
                            </g:each>

                        </div>

                        <div class="banner-text center"><g:message code="purchase.menu.other.actions" default="Other Actions" /></div>
                        <div class="center">
                            <g:actionSubmit class="buyOnline buyOnline-color-gray" action="delete"
                                            value="${message(code: 'purchase.button.cacel.this', default: 'Cancel')}"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                            <g:actionSubmit class="buyOnline buyOnline-color-gray-1" action="list"
                                            value="${message(code: 'purchase.button.back.to.list', default: 'Back To List')}"/>

                        </div>
                    </g:form>
                </div>
            </g:if>
		</div>
	</body>
</html>
