<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>
<g:if test="${purchaseInstance?.dateCreated}">
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="purchase.label.create.date" default="Date Created" /></label>
        <div class="col-sm-8">
            <p class="form-control-static"><g:formatDate date="${purchaseInstance?.dateCreated}" /></p>
        </div>
    </div>
</g:if>
<sec:ifAllGranted roles="ROLE_ADMIN">
<g:if test="${purchaseInstance?.owner}">
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="purchase.label.purchase.owner" default="Owner" /></label>
        <div class="col-sm-8">
            <p class="form-control-static"><g:link controller="user" action="show" id="${purchaseInstance?.owner?.id}">${purchaseInstance?.owner?.encodeAsHTML()}</g:link></p>
        </div>
    </div>
</g:if>
</sec:ifAllGranted>
<g:if test="${purchaseInstance?.product}">
<div class="form-group">
    <label class="col-sm-4 control-label"><g:message code="purchase.label.product.name" default="Product" /></label>
    <div class="col-sm-8">
        <p class="form-control-static"><g:link controller="product" action="show" id="${purchaseInstance?.product?.id}"><g:message code="product.info.name.${purchaseInstance.product.code}" default="${purchaseInstance.product.name}"/></g:link></p>
    </div>
</div>
</g:if>
<div class="form-group">
    <label class="col-sm-4 control-label"><g:message code="purchase.label.status" default="Status" /></label>
    <div class="col-sm-8">
        <p class="form-control-static">
            <g:if test="${purchaseInstance?.datePay}">
                <span class="label label-success"><g:message code="purchase.text.paid.at" args="[formatDate(date:purchaseInstance?.datePay)]"/></span>
            </g:if><g:else>
            <span class="label label-danger"><g:message code="purchase.text.not.paid.yet" default="Not Paid Yet" /></span>
        </g:else>
        </p>
    </div>

</div>
<g:if test="${purchaseInstance?.purchaseNumber}">
<div class="form-group">
    <label class="col-sm-4 control-label"><g:message code="purchase.label.order.number" default="Order Number" /></label>
    <div class="col-sm-8">
        <p class="form-control-static"><g:fieldValue bean="${purchaseInstance}" field="purchaseNumber"/></p>
    </div>
</div>
</g:if>
<g:if test="${purchaseInstance?.paymentMethod}">
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="purchase.label.payment.method" default="Payment Method" /></label>
        <div class="col-sm-8">
            <p class="form-control-static"><g:message code="payment.method.name.${purchaseInstance.paymentMethod}"/></p>
        </div>
    </div>
</g:if>

<g:if test="${purchaseInstance?.datePay && flash.message}">
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="user.account.server.ip.address" default="Server IP address" /></label>
        <div class="col-sm-8">
            <p class=""><g:fieldValue bean="${purchaseInstance?.owner?.server}" field="ipAddr"/></p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="login.label.username" default="Username" /></label>
        <div class="col-sm-8">
            <p class="form-control-static"><g:fieldValue bean="${purchaseInstance?.owner}" field="username"/></p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label"><g:message code="user.account.vpn.password" default="VPN Password"/></label>
        <div class="col-sm-8">
            <p class="form-control-static"><g:vpnPassword/></p>
        </div>
    </div>
</g:if>

