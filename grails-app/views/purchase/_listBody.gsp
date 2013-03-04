<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-list-alt"></i> <g:message code="purchase.title.purchase.history"/></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${purchaseInstanceList.size() > 0}">

                    <table class="table table-bordered table-striped" id="purchase-history">
                        <thead>
                        <tr>
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
                                        <span class="label label-success"><g:message code="purchase.text.paid" default="Already Paid" /></span>
                                    </g:if><g:else>
                                        <span class="label label-important"><g:message code="purchase.text.not.paid.yet" default="Not Paid" /></span>
                                    </g:else>
                                </td>
                                <td>
                                    <g:if test="${purchaseInstance.datePay}">
                                        <div class="purchase-button">
                                            <a href="#" class="btn btn-success btn-small"
                                               data-toggle="modal" data-target="#puchase-${purchaseInstance.purchaseNumber}">
                                                <i class="icon-file-alt"></i> ${message(code: 'purchase.button.detail', default: 'Detail')}
                                            </a>
                                        </div>
                                        <div id="puchase-${purchaseInstance.purchaseNumber}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 id="myModalLabel"><i class="icon-white icon-file-alt"></i> <g:message code="purchase.title.order.info"/></h4>
                                            </div>
                                            <div class="purchase-detail-frame">
                                                <g:render template="purchaseDetail" model="[purchaseInstance: purchaseInstance]"/>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </div>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class="center">
                                            <div class="purchase-button">
                                                <form method="POST" action="/purchase/delete">
                                                    <input type="hidden" name="id" value="${purchaseInstance?.id}"/>
                                                    <button type="submit" class="btn btn-small"
                                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                        <i class="icon-white icon-trash"></i> ${message(code: 'purchase.button.cacel', default: 'Cancel')}
                                                    </button>
                                                    <g:link class="btn btn-primary btn-small" action="show" id="${purchaseInstance?.id}">
                                                        ${message(code: 'purchase.button.pay', default: 'Pay')} <i class="icon-white icon-double-angle-right"></i>
                                                    </g:link>
                                                </form>
                                            </div>
                                        </div>
                                    </g:else>
                                </td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>

                    <div class="pagination text-center">
                        <pkg:paginate total="${purchaseInstanceTotal}" params="${flash}" />
                    </div>
                    </g:if><g:else>
                        <div class="inner-margin-left">
                            <g:message code="purchase.text.no.purchase.yet" args="['/product/list']"/>
                        </div>
                    </g:else>

                </div>
            </div>
        </div>
    </div>
</div>