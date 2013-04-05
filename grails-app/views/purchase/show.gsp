<g:if test="${pageRedirect == true}">
    <script>window.location = '/purchase/show/${purchaseInstance.id}'</script>
</g:if>
<g:else>
    <%@ page import="com.pkgplan.dream.Purchase" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="layout" content="pkglayout">
        <g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
        <r:require module="application"/>
        <title><g:message code="purchase.title.purchase.history"/></title>
    </head>
    <body>
    <g:render template="showBody"/>
    </body>
    </html>
</g:else>

