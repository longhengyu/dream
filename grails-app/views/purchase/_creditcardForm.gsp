<%@ page import="com.pkgplan.dream.ProductService" %>
<% def productService %>
<div class="modal-body popup-title" id="use-stripe-body">
    <div class="row-fluid">
        <div class="well-white bottom20px">
            <div class="page-header">
                <h3><g:message code="creditcard.use.title"/></h3>
            </div>
            <div class="padding20px form">
                <g:if test="${flash.error_ajax}">
                    <div class="alert alert-error" role="status">
                        <a class="close" data-dismiss="alert" href="#">×</a>
                        ${flash.error_ajax}
                        <script type="text/javascript">setTimeout(function(){$("#use-stripe-body .alert").fadeOut(1000 );},2000)</script>
                    </div>
                </g:if>
                <div id="payment-errors-precheck" class="hide alert alert-error" role="status">
                    <a class="close" data-dismiss="alert" href="#">×</a>
                    <div class="payment-errors"></div>
                </div>

                <stripe:script formName="payment-form"/>

                <g:form class="form-horizontal" name="payment-form" url="[controller: 'purchase', action: 'buy']">
                    <g:hiddenField name="id" value="${purchaseInstance?.id}"/>
                    <g:hiddenField name="paymentMethod" value="0"/>
                    <g:hiddenField name="cardErrorCode" id="cardErrorCode" value=""/>
                    <g:hiddenField name="amount" id="amount" value="${usdPrice}"/>

                    <div class="control-group price-creditcard">
                        <label class="control-label"><g:message code="creditcard.label.amount"/></label>
                        <div class="controls">
                            <div class="input-prepend">
                                <span class="add-on">$</span>
                                <input class="span4 disabled" disabled="" type="text" autocomplete="off" value="${usdPrice}"/>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <span class="label label-warning">
                                <g:message code="creditcard.description.use.usd"/>
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><g:message code="creditcard.label.card.number"/></label>
                        <div class="controls">
                            <input type="text" class="card-number span6" autocomplete="off" size="20">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><g:message code="creditcard.label.cvc"/></label>
                        <div class="controls">
                            <input type="text" class="card-cvc span2" autocomplete="off" size="4">
                        </div>
                    </div>
                    <g:set var="months" value="${new java.text.DateFormatSymbols().shortMonths}"/>
                    <g:set var="today" value="${new Date()}"/>
                    <div class="control-group">
                        <label class="control-label"><g:message code="creditcard.label.expiration"/></label>
                        <div class="controls">
                            <g:select class="card-expiry-month" name="Month" from="${01..12}"
                                      value="${today.month+1}"  />
                            <span> / </span>
                            <g:select class="card-expiry-year" name="Year" from="${1900+today.year .. 1910+today.year}" value="${today[Calendar.YEAR]}" />
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="btn btn-success"><g:message code="creditcard.button.submit.payment"/></button>
                        </div>
                    </div>
                </g:form>

            </div>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">
        <g:message code="general.close"/>
    </button>
</div>