
<%@ page import="com.pkgplan.dream.Purchase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-purchase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-purchase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="purchase.owner.label" default="Owner" /></th>
					
						<th><g:message code="purchase.product.label" default="Product" /></th>
					
						<g:sortableColumn property="datePay" title="${message(code: 'purchase.datePay.label', default: 'Date Pay')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'purchase.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="paymentMethod" title="${message(code: 'purchase.paymentMethod.label', default: 'Payment Method')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "owner")}</g:link></td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "product")}</td>
					
						<td><g:formatDate date="${purchaseInstance.datePay}" /></td>
					
						<td><g:formatDate date="${purchaseInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: purchaseInstance, field: "paymentMethod")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${purchaseInstanceList.getTotalCount()}" params="${flash}" />
			</div>
		</div>
	</body>
</html>
