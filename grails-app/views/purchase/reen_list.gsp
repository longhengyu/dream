<%@ page import="com.pkgplan.dream.Purchase" %>

<html>
<head>
    <title><g:message code="purchase.title.purchase.history" args="[entityName]" /></title>
    <g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
    <meta name="layout" content="reen_layout" />
</head>

<div class="container inner">
    <div class="row">

        <g:render template="/layouts/reen_sidemenu"/>

        <div class="col-md-9 inner-left-md border-left">

            <!-- ============================================================= SECTION – HERO ============================================================= -->

            <section id="hero" class="inner-bottom-xs">
                <header>
                    <h2><g:message code="purchase.title.purchase.history"/></h2>
                </header>
            </section>



            <section id="contact-names" class="small light-bg">
                <table class="table table-bordered table-striped tabel-custom" id="purchase-history">
                    <thead>
                    <tr>

                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <th class="vcenter"><g:message code="purchase.label.purchase.owner" default="Owner" /></th>
                        </sec:ifAllGranted>
                        <th class="vcenter" style="width:15%"><g:message code="purchase.label.product.name" default="Product" /></th>
                        <th class="vcenter" style="width:40%"><g:message code="purchase.label.create.date" default="Date Created" /></th>
                        <th class="vcenter" style="width:20%"><g:message code="purchase.label.status" default="Status" /></th>
                        <th class="vcenter" style="width:25%"><g:message code="purchase.label.action" default="Action" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseInstanceList}" status="i" var="purchaseInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <td class="vcenter"><g:link action="show" id="${purchaseInstance.id}">${fieldValue(bean: purchaseInstance, field: "owner")}</g:link></td>
                        </sec:ifAllGranted>
                        <td class="vcenter" ><g:message code="product.info.name.${purchaseInstance.product.code}" default="${purchaseInstance.product.name}"/></td>
                        <td class="vcenter" ><g:formatDate date="${purchaseInstance.dateCreated}" /></td>
                        <td class="vcenter" >
                            <g:if test="${purchaseInstance.datePay}">
                                <span class="label label-success"><g:message code="purchase.text.paid" default="Already Paid" /></span>
                            </g:if><g:else>
                                <span class="label label-danger"><g:message code="purchase.text.not.paid.yet" default="Not Paid" /></span>
                            </g:else>
                        </td>
                        <td class="vcenter" >

                            <g:if test="${purchaseInstance.datePay}">
                                <div class="purchase-button">
                                    <button type="button" class="btn btn-info btn-small  btn-custom-padding" data-toggle="modal" href="#puchase-${purchaseInstance.purchaseNumber}"><i class="icon-file-alt"></i> ${message(code: 'purchase.button.detail', default: 'Detail')}</button>
                                </div>
                                <div class="modal fade" id="puchase-${purchaseInstance.purchaseNumber}" tabindex="-1" role="dialog" aria-labelledby="modal-contact01" aria-hidden="true">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="icon-cancel-1"></i></span></button>
                                                <h4 class="modal-title">订单详情</h4>
                                            </div><!-- /.modal-header -->

                                            <div class="modal-body">

                                                <section class="light-bg inner-xs inner-left-xs inner-right-xs">

                                                    <form class="form-horizontal tabel-custom">
                                                        <g:render template="reen_show_detail" model="[purchaseInstance: purchaseInstance]"/>
                                                    </form>

                                                </section>
                                            </div><!-- /.modal-body -->



                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div><!-- /.modal -->
                            </g:if>
                            <g:else>
                                <div class="center">
                                    <div class="purchase-button">
                                        <form method="POST" action="/purchase/delete">
                                            <input type="hidden" name="id" value="${purchaseInstance?.id}"/>

                                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                                <button type="submit" class="btn btn-danger btn-small btn-custom-padding"
                                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                    <i class="icon-white icon-trash"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}
                                                </button>
                                            </sec:ifAllGranted>

                                            <sec:ifAllGranted roles="ROLE_USER">
                                                <button type="submit" class="btn btn-danger btn-small btn-custom-padding"
                                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                    <i class="icon-white icon-trash"></i> ${message(code: 'purchase.button.cacel', default: 'Cancel')}
                                                </button>

                                                <g:link class="btn btn-primary btn-small btn-custom-padding" action="show" id="${purchaseInstance?.id}">
                                                    ${message(code: 'purchase.button.pay', default: 'Pay')} <i class="icon-white icon-double-angle-right"></i>
                                                </g:link>
                                            </sec:ifAllGranted>

                                        </form>
                                    </div>
                                </div>

                            </g:else>

                        </td>
                    </tr>
                    </g:each>

                    </tbody>
                </table>
            </section>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

</html>
