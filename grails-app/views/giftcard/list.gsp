
<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pkglayout">
		<g:set var="entityName" value="${message(code: 'giftcard.label', default: 'Giftcard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-giftcard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-giftcard" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'giftcard.code.label', default: 'Code')}" />
					
						<th><g:message code="giftcard.product.label" default="Product" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'giftcard.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="dateUsed" title="${message(code: 'giftcard.dateUsed.label', default: 'Date Used')}" />
					
						<th><g:message code="giftcard.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${giftcardInstanceList}" status="i" var="giftcardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${giftcardInstance.id}">${fieldValue(bean: giftcardInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: giftcardInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: giftcardInstance, field: "status")}</td>
					
						<td><g:formatDate date="${giftcardInstance.dateUsed}" /></td>
					
						<td>${fieldValue(bean: giftcardInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${giftcardInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
