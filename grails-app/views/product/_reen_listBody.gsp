<div class="col-md-9 inner-left-md border-left">

    <!-- ============================================================= SECTION – HERO ============================================================= -->

    <section id="hero" class="inner-bottom-xs">
        <header>
            <h2>VPN套餐</h2>
        </header>
    </section>

    <!-- ============================================================= SECTION – HERO : END ============================================================= -->


    <!-- ============================================================= SECTION – CONTENT ============================================================= -->

    <section id="pricing-tables">

        <div class="row pricing col-3">

            <g:each in="${productInstanceList}" status="i" var="productInstance">
            <g:if test="${productInstance.status == 'OnSell'}">
            <div class="col-lg-4 col-sm-6 ">
                <div class="plan">

                    <header>
                        <h2><g:message code="product.info.name.${productInstance.code}" default="${productInstance.name}"/></h2>

                        <div class="price">
                            <span class="currency">¥</span>
                            <span class="amount amount-small">${fieldValue(bean: productInstance, field: "price")}</span>
                            <span class="period">/ <g:message code="main.plan.period.${i+1}" /></span>
                        </div><!-- /.price -->

                        <g:form action="save" controller="purchase">
                            <g:hiddenField name="product.id" value="${productInstance.id}"/>
                            <g:hiddenField name="owner.id" value="${sec.loggedInUserInfo(field:"id")}"/>
                            <div class="">
                                <button class="btn" type="submit">
                                    ${message(code: 'product.button.buy.now')}
                                </button>
                            </div>
                        </g:form>
                    </header>

                    <ul class="features small">
                        <li><i class="icon-window"></i> 2 台设备同时接入</li>
                        <li><i class="icon-switch"></i> 无限流量</li>
                        <li><i class="icon-users"></i> 24/7 邮件支持</li>
                    </ul><!-- /.features -->

                </div><!-- /.plan -->
            </div><!-- /.col -->
            </g:if>
            </g:each>





        </div><!-- /.row -->


    </section>
    <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

</div><!-- ./col -->