<g:if test="${pageRedirect == true}">
    <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs">

        <div class="alert alert-success small" >
            <g:message code="purchase.success.redirect.discription"/>
        </div>

    </section>
    <script>setTimeout(function(){window.location = '/purchase/show/${purchaseInstance.id}'}, 3000)</script>
</g:if>
<g:else>
<%@ page import="com.pkgplan.dream.Purchase" %>
<html>
<head>
    <title><g:message code="purchase.title.order.pay"/></title>
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
                    <h2><g:message code="purchase.title.order.pay"/></h2>
                </header>
            </section>

            <!-- ============================================================= SECTION – HERO : END ============================================================= -->


            <!-- ============================================================= SECTION – CONTENT ============================================================= -->
            <g:if test="${flash.message}">
                <section id="contact-names" class="tint-bg inner-xxs inner-left-xs inner-right-xs outer-bottom-xs">
                    <p>${flash.message}</p>
                </section>
            </g:if>
            <g:if test="${flash.error}">
                <section id="contact-names" class="danger-bg inner-xxs inner-left-xs inner-right-xs outer-bottom-xs">
                    <p>${flash.error}</p>
                </section>
            </g:if>


            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs">
                <%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
                <% def locale=RequestContextUtils.getLocale(request)%>


                <h3 class="team-headline sidelines text-center"><span>订单信息</span></h3>

                <form class="form-horizontal">
                    <g:render template="reen_show_detail" model="[purchaseInstance: purchaseInstance]"/>

                </form>

            </section>

            <g:if test="${!purchaseInstance?.datePay}">
            <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs outer-sm">



                <h3 class="team-headline sidelines text-center"><span><g:message code="purchase.menu.pay.with" default="Pay With" /></span></h3>

                <div class="row inner-top-sm text-center">

                    <div class="col-xs-6 inner-bottom-sm">
                        <figure class="member">

                            <div class="icon-overlay icn-link">

                                <form method="post" action="/purchase/buildAlipayRequest">
                                    <input type="hidden" id="purchaseId" value="${purchaseInstance?.id}" name="purchaseId">
                                    <a href="javascript:;" onclick="parentNode.submit();"><img src="${resource(dir:'images/art',file:'human03.jpg')}" class="img-circle"></a>
                                </form>
                            </div><!-- /.icon-overlay -->

                            <figcaption>

                                <h3>
                                    支付宝
                                    <span>实时开通</span>
                                </h3>
                                <p>桌面版支付宝，推荐PC用户使用</p>

                            </figcaption>

                        </figure>
                    </div><!-- /.col -->

                    <div class="col-xs-6 inner-bottom-sm">
                        <figure class="member">

                            <div class="icon-overlay icn-link">
                                <a data-toggle="modal" href="#modal-pay-giftcard"><img src="${resource(dir:'images/art',file:'human01.jpg')}" class="img-circle"></a>
                            </div><!-- /.icon-overlay -->

                            <figcaption>

                                <h3>
                                    礼品券码
                                    <span>实时开通</span>
                                </h3>

                            </figcaption>

                            <div class="small">
                                <a type="button" class="btn btn-success btn-small  btn-custom-padding" data-toggle="modal" href="#modal-pay-giftcard-howtobuy">如何购买礼品券</a>
                            </div><!-- /.col -->

                        </figure>
                    </div><!-- /.col -->
                </div>
                <div class="row inner-top-sm text-center">

                    <div class="col-xs-6 inner-bottom-sm">
                        <figure class="member">

                            <div class="icon-overlay icn-link">
                                <a data-toggle="modal" href="#modal-buy-alipay-mobile"><img src="${resource(dir:'images/art',file:'human03.jpg')}" class="img-circle"></a>
                            </div><!-- /.icon-overlay -->

                            <figcaption>

                                <h3>
                                    支付宝扫码
                                    <span>实时开通</span>
                                </h3>
                                <p>推荐手机用户使用</p>

                            </figcaption>

                        </figure>
                    </div><!-- /.col -->

                    <div class="col-xs-6 inner-bottom-sm">
                        <figure class="member">

                            <div class="icon-overlay icn-link">
                                <a data-toggle="modal" href="#modal-buy-wechat-mobile"><img src="${resource(dir:'images/art',file:'human03.jpg')}" class="img-circle"></a>
                            </div><!-- /.icon-overlay -->

                            <figcaption>

                                <h3>
                                    微信扫码
                                    <span>实时开通</span>
                                </h3>
                                <p>推荐手机用户使用</p>

                            </figcaption>

                        </figure>
                    </div><!-- /.col -->



                </div>

            </section>
            </g:if>
            <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->


            <form method="POST" action="/purchase/delete">
                <g:if test="${!purchaseInstance?.datePay}">
                    <input type="hidden" name="id" value="${purchaseInstance?.id}"/>
                    <button type="submit" class="btn btn-default btn-warning btn-one-line"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                        ${message(code: 'purchase.button.cacel.this', default: 'Cancel')}
                    </button>
                </g:if>

                <g:link class="btn btn-default btn-info btn-one-line" action="list">
                    ${message(code: 'purchase.button.back.to.list', default: 'Back To List')}
                </g:link>
            </form>

        </div><!-- ./col -->

    </div><!-- /.row -->
</div><!-- /.container -->

<g:if test="${!purchaseInstance?.datePay}">
<div class="modal fade" id="modal-pay-giftcard" tabindex="-1" role="dialog" aria-labelledby="modal-pay-giftcard" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="icon-cancel-1"></i></span></button>
                <h4 class="modal-title"><g:message code="giftcard.use.title"/></h4>
            </div><!-- /.modal-header -->

            <div class="modal-body" id="modal-pay-giftcard-body">

                <g:render template="/giftcard/reen_use" />

            </div><!-- /.modal-body -->

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="modal-pay-giftcard-howtobuy" tabindex="-1" role="dialog" aria-labelledby="modal-pay-giftcard-howtobuy" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="icon-cancel-1"></i></span></button>
                <h4 class="modal-title">购买礼品券方法</h4>
            </div><!-- /.modal-header -->

            <div class="modal-body">

                <section id="contact-names" class="light-bg inner-xs inner-left-xs inner-right-xs">

                    怎么说，说吧。

                </section>



            </div><!-- /.modal-body -->

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-buy-alipay-mobile" tabindex="-1" role="dialog" aria-labelledby="modal-buy-alipay-mobile" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="icon-cancel-1"></i></span></button>
                <h4 class="modal-title">支付宝扫码支付</h4>
            </div><!-- /.modal-header -->

            <div class="modal-body">

                <section id="contact-names" class="small light-bg inner-xs inner-left-xs inner-right-xs">

                    <p>请扫描下面二维码，支付成功后将订单编号的最后 6 位填入验证。<br>可保存二维码图片到手机，然后从支付宝 “扫一扫” --> "相册" 选择图片。</p>

                </section>



            </div><!-- /.modal-body -->

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-buy-wechat-mobile" tabindex="-1" role="dialog" aria-labelledby="modal-buy-wechat-mobile" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="icon-cancel-1"></i></span></button>
                <h4 class="modal-title">微信扫码支付</h4>
            </div><!-- /.modal-header -->

            <div class="modal-body">

                <section id="contact-names" class="small light-bg inner-xs inner-left-xs inner-right-xs">

                    <p>请扫描下面二维码，支付成功后将订单编号的最后 6 位填入验证。<br>可保存二维码图片到手机，然后从微信 “扫一扫” --> "相册" 选择图片。</p>

                </section>

            </div><!-- /.modal-body -->

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</g:if>

</html>
</g:else>