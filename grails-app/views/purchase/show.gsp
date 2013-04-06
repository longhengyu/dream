<g:if test="${pageRedirect == true}">
    <div class="modal-body popup-title" id="use-stripe-body">
        <div class="row-fluid">
            <div class="well-white bottom20px">
                <div class="page-header">
                    <h3><g:message code="purchase.success.title"/></h3>
                </div>
                <div class="padding20px form">
                    <div class="alert alert-success" >
                        <g:message code="purchase.success.redirect.discription"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>setTimeout(function(){window.location = '/purchase/show/${purchaseInstance.id}'}, 3000)</script>
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

