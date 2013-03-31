<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-magic"></i> <g:message code="product.list.admin.title" default="VPN Plan List" /></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <g:if test="${productInstanceList.size() > 0}">

                        <table class="table table-bordered table-striped" id="purchase-history">
                            <thead>
                            <tr>
                                <th><g:message code="product.label.code" default="Code" /></th>
                                <th><g:message code="product.label.product.name" default="Name" /></th>
                                <th><g:message code="product.label.product.price" default="Price" /></th>
                                <th><g:message code="product.label.status" default="Status" /></th>
                                <th><g:message code="purchase.label.action" default="Action" /></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${productInstanceList}" status="i" var="productInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                    <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "code")}</g:link></td>

                                    <td><g:message code="product.info.name.${productInstance.name}" default="${productInstance.name}"/></td>

                                    <td>${productInstance.price}</td>

                                    <td>
                                        ${productInstance.status}
                                    </td>
                                    <td>
                                        <div class="center">
                                            <div class="purchase-button">
                                                <form method="POST" action="/product/delete">
                                                    <input type="hidden" name="id" value="${productInstance?.id}"/>
                                                    <button type="submit" class="btn btn-danger btn-small"
                                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                        <i class="icon-white icon-trash"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                                                    </button>
                                                    <g:link class="btn btn-primary btn-small" action="edit" id="${productInstance?.id}">
                                                        ${message(code: 'default.button.edit.label', default: 'Edit')} <i class="icon-white icon-double-angle-right"></i>
                                                    </g:link>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </g:each>

                            </tbody>
                        </table>

                        <div class="pagination text-center">
                            <pkg:paginate total="${productInstanceTotal}" params="${flash}" />
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</div>

