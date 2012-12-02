<div id="list-purchase" class="content scaffold-list" role="main">
    <h3><g:message code="purchase.history.list.title" default="My Purchase History" /></h3>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <th><g:message code="purchase.owner.label" default="Owner" /></th>
            </sec:ifAllGranted>
            <th><g:message code="purchase.product.label" default="Product" /></th>
            <th><g:message code="purchase.dateCreated.label" default="Date Created" /></th>
            <th><g:message code="purchase.status.label" default="Status" /></th>
            <th><g:message code="purchase.action.label" default="Action" /></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "owner")}</g:link></td>
                </sec:ifAllGranted>
                <td>${fieldValue(bean: purchaseInstance, field: "product")}</td>

                <td><g:formatDate date="${purchaseInstance.dateCreated}" /></td>

                <td>
                    <g:if test="${purchaseInstance.datePay}">
                        Paid
                    </g:if><g:else>
                        Not Paid
                    </g:else>
                </td>
                <td>
                    <g:if test="${purchaseInstance.datePay}">
                        <a href="" onclick="toggleDetail(this);return false;">Detail</a>
                    </g:if><g:else>
                        <a href="">Pay</a> &nbsp;&nbsp; <a href="">Cancel</a>
                </g:else>
                </td>
            </tr>
            <g:if test="${purchaseInstance.datePay}">
                <tr class="purchase-detail-box hide">
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "owner")}</g:link></td>
                    </sec:ifAllGranted>
                    <td colspan="4">
                        <ol class="property-list purchase-detail">
                            <li class="fieldcontain">
                                <span id="datePay-label" class="property-label"><g:message code="date.pay" default="Date Pay" /></span>
                                <span class="property-value" aria-labelledby="datePay-label"><g:formatDate date="${purchaseInstance.datePay}" /></span>
                            </li>
                            <li class="fieldcontain">
                                <span id="payment-label" class="property-label"><g:message code="date.pay" default="Payment Method" /></span>
                                <span class="property-value" aria-labelledby="payment-label">${purchaseInstance.paymentMethod}</span>
                            </li>
                            <li class="fieldcontain">
                                <span id="purchaseNumber-label" class="property-label"><g:message code="purchase.number" default="Purchase Number" /></span>
                                <span class="property-value" aria-labelledby="datePay-label">${purchaseInstance.purchaseNumber}</span>
                            </li>
                        </ol>
                    </td>
                </tr>
            </g:if>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${purchaseInstanceList.getTotalCount()}" params="${flash}" />
    </div>
</div>

<script>
    function toggleDetail(it) {
        $(it).parent().parent().next().toggle("slow");
    }
</script>