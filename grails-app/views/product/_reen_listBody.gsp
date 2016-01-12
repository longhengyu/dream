<div class="col-md-9 inner-left-md border-left">

    <!-- ============================================================= SECTION – HERO ============================================================= -->

    <section id="hero" class="inner-bottom-xs">
        <header>
            <h2><g:message code="product.list.title" default="Available VPN Plans" /></h2>
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
                            <span class="currency">RMB</span>
                            <span class="amount amount-small">${fieldValue(bean: productInstance, field: "price")}</span>
                            <%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
                            <% def locale=RequestContextUtils.getLocale(request)%>
                            <g:if test="${locale.toString().equals('en_US')}"><span style="margin-left: 28px">&nbsp;</span><br><span style="margin-right: 70px">&nbsp;</span></g:if>
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
                        <li><i class="icon-window"></i> <g:message code="product.info.description.${productInstance.code}.1"/></li>
                        <li><i class="icon-switch"></i> <g:message code="product.info.description.${productInstance.code}.2"/></li>
                        <li><i class="icon-users"></i> <g:message code="product.info.description.${productInstance.code}.3"/></li>
                    </ul><!-- /.features -->

                </div><!-- /.plan -->
            </div><!-- /.col -->
            </g:if>
            </g:each>





        </div><!-- /.row -->


    </section>
    <!-- ============================================================= SECTION – CONTENT : END ============================================================= -->

</div><!-- ./col -->