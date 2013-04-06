<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>
<g:if test="${purchaseInstance?.dateCreated}">
    <div class="title display-table">
        <p><g:message code="purchase.label.create.date" default="Date Created" /></p>
        <span class="pull-right"><g:formatDate date="${purchaseInstance?.dateCreated}" /></span>
    </div>
</g:if>
<sec:ifAllGranted roles="ROLE_ADMIN">
    <g:if test="${purchaseInstance?.owner}">
        <div class="title display-table">
            <p><g:message code="purchase.label.purchase.owner" default="Owner" /></p>
            <span class="pull-right"><g:link controller="user" action="show" id="${purchaseInstance?.owner?.id}">${purchaseInstance?.owner?.encodeAsHTML()}</g:link></span>
        </div>
    </g:if>
</sec:ifAllGranted>
<g:if test="${purchaseInstance?.product}">
    <div class="title display-table">
        <p><g:message code="purchase.label.product.name" default="Product" /></p>
        <span class="pull-right"><g:link controller="product" action="show" id="${purchaseInstance?.product?.id}"><g:message code="product.info.name.${purchaseInstance.product.code}" default="${purchaseInstance.product.name}"/></g:link></span>
    </div>
</g:if>
<div class="title display-table">
    <p><g:message code="purchase.label.status" default="Status" /></p>
    <span class="pull-right">
        <g:if test="${purchaseInstance?.datePay}">
            <g:message code="purchase.text.paid.at" args="[formatDate(date:purchaseInstance?.datePay)]"/>

        </g:if><g:else>
        <span class="label label-important">
            <g:message code="purchase.text.not.paid.yet" default="Not Paid Yet" />
        </span>
    </g:else>
    </span>
</div>
<g:if test="${purchaseInstance?.purchaseNumber}">
    <div class="title display-table">
        <p><g:message code="purchase.label.order.number" default="Order Number" /></p>
        <span class="pull-right"><g:fieldValue bean="${purchaseInstance}" field="purchaseNumber"/></span>
    </div>
</g:if>
<g:if test="${purchaseInstance?.paymentMethod}">
    <div class="title display-table">
        <p><g:message code="purchase.label.payment.method" default="Payment Method" /></p>
        <span class="pull-right"><g:message code="payment.method.name.${purchaseInstance.paymentMethod}"/></span>
    </div>
</g:if>