<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-gift"></i> <g:message code="giftcard.list.title"/></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${giftcardInstanceList.size() > 0}">

                        <table class="table table-bordered table-striped" id="giftcard-list">
                            <thead>
                            <tr>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <th><g:message code="purchase.label.purchase.owner" default="Owner" /></th>
                                </sec:ifAllGranted>
                                <th><g:message code="giftcard.label.code" default="Code"/></th>
                                <th><g:message code="purchase.label.product.name" default="Product" /></th>
                                <th><g:message code="purchase.label.status" default="Status" /></th>
                                <th><g:message code="purchase.label.action" default="Action" /></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${giftcardInstanceList}" status="i" var="giftcardInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <td><g:link controller="user" action="show" id="${giftcardInstance.owner.id}">${fieldValue(bean: giftcardInstance, field: "owner")}</g:link></td>
                                        <td><g:link action="show" id="${giftcardInstance.id}">${giftcardInstance.code}</g:link></td>
                                    </sec:ifAllGranted>
                                    <sec:ifAllGranted roles="ROLE_USER">
                                        <td>${giftcardInstance.code}</td>
                                    </sec:ifAllGranted>
                                    <td><g:message code="product.info.name.${giftcardInstance.product.code}" default="${giftcardInstance.product.name}"/></td>

                                    <td>
                                        <g:if test="${giftcardInstance.dateUsed}">
                                            <span class="label label-important"><g:message code="giftcard.status.used" default="Used" /></span>
                                        </g:if><g:else>
                                        <span class="label label-success"><g:message code="giftcard.status.available" default="Available" /></span>
                                    </g:else>
                                    </td>
                                    <td>
                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                            <div class="center">
                                                <div class="purchase-button">
                                                    <form method="POST" action="/giftcard/delete">
                                                        <input type="hidden" name="id" value="${giftcardInstance?.id}"/>
                                                        <button type="submit" class="btn btn-danger btn-small"
                                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                            <i class="icon-white icon-trash"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </sec:ifAllGranted>
                                        <sec:ifAllGranted roles="ROLE_USER">
                                            <g:if test="${giftcardInstance.dateUsed}">
                                                <div class="purchase-button">
                                                    <a href="#" class="btn btn-success btn-small"
                                                       data-toggle="modal" data-target="#puchase-${giftcardInstance.purchase.purchaseNumber}">
                                                        <i class="icon-file-alt"></i> ${message(code: 'purchase.button.detail', default: 'Detail')}
                                                    </a>
                                                </div>
                                                <div id="puchase-${giftcardInstance.purchase.purchaseNumber}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                        <h4 id="myModalLabel"><i class="icon-white icon-file-alt"></i> <g:message code="purchase.title.order.info"/></h4>
                                                    </div>
                                                    <div class="purchase-detail-frame">
                                                        <g:render template="/purchase/purchaseDetail" model="[purchaseInstance: giftcardInstance.purchase]"/>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                                    </div>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="center">
                                                    <div class="purchase-button">

                                                            <g:link class="btn btn-primary btn-small" controller="product" action="list">
                                                                ${message(code: 'giftcard.button.use.it', default: 'Use Now')} <i class="icon-white icon-double-angle-right"></i>
                                                            </g:link>

                                                    </div>
                                                </div>
                                            </g:else>
                                        </sec:ifAllGranted>
                                    </td>
                                </tr>
                            </g:each>

                            </tbody>
                        </table>

                        <div class="pagination text-center">
                            <pkg:paginate total="${giftcardInstanceTotal}" params="${flash}" />
                        </div>
                    </g:if><g:else>
                        <div class="inner-margin-left">
                            <g:message code="giftcard.text.no.giftcard.yet" default="You have no Giftcard."/>
                        </div>
                    </g:else>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <div class="form-horizontal">
                            <div class="form-actions text-right">
                                <form method="POST" action="/giftcard/create">
                                    <g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                                </form>
                            </div>
                        </div>
                     </sec:ifAllGranted>
                </div>
            </div>
        </div>
    </div>
</div>