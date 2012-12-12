<div id="list-purchase" class="content scaffold-list" role="main">
    <h3><g:message code="purchase.title.purchase.history"/></h3>
    <g:if test="${purchaseInstanceList.getTotalCount() == 0}">
        <p><g:message code="purchase.text.no.purchase.yet"/></p>
    </g:if>
    <g:else>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr class="table-head">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <th><g:message code="purchase.label.purchase.owner" default="Owner" /></th>
                </sec:ifAllGranted>
                <th><g:message code="purchase.label.product.name" default="Product" /></th>
                <th><g:message code="purchase.label.create.date" default="Date Created" /></th>
                <th><g:message code="purchase.label.status" default="Status" /></th>
                <th><g:message code="purchase.label.action" default="Action" /></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <td><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "owner")}</g:link></td>
                    </sec:ifAllGranted>
                    <td><g:message code="product.info.name.${purchaseInstance.product.code}" default="${purchaseInstance.product.name}"/></td>

                    <td><g:formatDate date="${purchaseInstance.dateCreated}" /></td>

                    <td>
                        <g:if test="${purchaseInstance.datePay}">
                            <g:message code="purchase.text.paid" default="Already Paid" />
                        </g:if><g:else>
                            <g:message code="purchase.text.not.paid.yet" default="Not Paid" />
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${purchaseInstance.datePay}">
                            <div class="purchase-button">
                                <g:form>
                                    <g:actionSubmit class="buyButton buyOnline-color-2" action="show" value="${message(code: 'purchase.button.detail', default: 'Detail')}" onclick="toggleDetail(this);return false;" />
                                </g:form>
                            </div>
                        </g:if><g:else>
                        <div class="center">
                            <div class="purchase-button">
                                <g:form>
                                    <g:hiddenField name="id" value="${purchaseInstance?.id}" />
                                    <g:actionSubmit class="buyButton buyOnline-color-1" action="show" value="${message(code: 'purchase.button.pay', default: 'Pay')}" onclick="" />

                                    <g:actionSubmit class="buyButton buyOnline-color-gray" action="delete" value="${message(code: 'purchase.button.cacel', default: 'Cancel')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                </g:form>
                            </div>
                        </div>
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
                                    <span id="datePay-label" class="property-label"><g:message code="purchase.label.pay.date" default="Date Pay" /></span>
                                    <span class="property-value" aria-labelledby="datePay-label"><g:formatDate date="${purchaseInstance.datePay}" /></span>
                                </li>
                                <li class="fieldcontain">
                                    <span id="payment-label" class="property-label"><g:message code="purchase.label.payment.method" default="Payment Method" /></span>
                                    <span class="property-value" aria-labelledby="payment-label"><g:message code="payment.method.name.${purchaseInstance.paymentMethod}"/></span>
                                </li>
                                <li class="fieldcontain">
                                    <span id="purchaseNumber-label" class="property-label"><g:message code="purchase.label.order.number" default="Order Number" /></span>
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
            <g:paginate total="${purchaseInstanceTotal}" params="${flash}" />
        </div>
    </g:else>
</div>

<script>
    function toggleDetail(it) {
        $(it).parent().parent().parent().parent().next().toggle("slow");
    }
</script>