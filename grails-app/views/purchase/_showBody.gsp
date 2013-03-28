<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-list-alt"></i> <g:message code="purchase.title.order.pay"/></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <div id="show-purchase" class="content scaffold-show" role="main">

                        <g:if test="${flash.message}">
                            <div class="alert alert-success">
                                ${flash.message}
                            </div>
                        </g:if>
                        <div class="row-fluid">
                            <div class="inner-margin-left">
                                <g:render template="purchaseDetail" model="[purchaseInstance: purchaseInstance]"/>
                            </div>
                        </div>

                        <g:if test="${!purchaseInstance?.datePay}">

                            <div class="inner-margin-left">
                                <h4 class="pay-with-title"><g:message code="purchase.menu.pay.with" default="Pay With" />
                                </h4>
                            </div>
                            <div class="row-fluid">
                                <div class="span1"></div>
                                <div class="span3"></div>
                                <div class="span3"></div>
                                <div class="span3 text-center">${message(code:'payment.method.description.giftcard')} <a data-placement="top" data-content="${message(code:'payment.method.description.giftcard.get')}" rel="popover" id="no-ip-assigned" href="#"><i class="icon-info-sign"></i></a>
                                </div>
                            </div>
                            <div class="row-fluid features-two">
                                    <div class="span1"></div>
                                    <g:render template="paymentSubmitButton" model="[paymentId: 0, icon: 'icon-credit-card']"/>
                                    <g:render template="paymentSubmitButton" model="[paymentId: 1, icon: 'icon-paypal']"/>
                                    <g:render template="paymentSubmitButton" model="[paymentId: 2, icon: 'icon-gift']"/>
                                    <div class="span2"></div>
                            </div>
                            <div class="form-horizontal">
                                <div class="form-actions text-right">

                                    <form method="POST" action="/purchase/delete">
                                        <input type="hidden" name="id" value="${purchaseInstance?.id}"/>
                                        <button type="submit" class="btn btn-danger"
                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                            <i class="icon-white icon-trash"></i> ${message(code: 'purchase.button.cacel.this', default: 'Cancel')}
                                        </button>
                                        <g:link class="btn btn-inverse" action="list">
                                            <i class="icon-white icon-list-alt"></i> ${message(code: 'purchase.button.back.to.list', default: 'Back To List')}
                                        </g:link>
                                    </form>



                                </div>
                            </div>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

