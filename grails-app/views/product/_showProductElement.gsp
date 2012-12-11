<g:if test="${productInstance.status == 'OnSell'}">
    <dt><g:message code="product.info.name.${productInstance.code}" default="${productInstance.name}"/></dt>
    <dd>
        <div class="product-img ${(i % 2) == 0 ? 'float-right' : 'float-left'}"><img src="${fieldValue(bean: productInstance, field: "imageUrl")}"/></div>
        <div class="product-content float-left"><h5><g:message code="product.info.description.${productInstance.code}" default="${productInstance.description}"/></h5>
            <div class="banner-text center"><span><g:message code="product.info.price"/> : <b>${fieldValue(bean: productInstance, field: "price")} RMB</b></span></div>
            <div class="buy-button">
                <div class="center float-left" style="width:135px">
                    <g:form action="save" controller="purchase">
                        <g:hiddenField name="product.id" value="${productInstance.id}"/>
                        <g:hiddenField name="owner.id" value="${sec.loggedInUserInfo(field:"id")}"/>
                        <g:submitButton class="buyOnline buyOnline-color-1" value="${message(code: 'product.button.buy.now')}"  name="generate"/>
                    </g:form>
                    </div>
                <div class="float-right display-table"><div><g:message code="product.info.buy.now"/> </div></div>
            </div>
            <div class="buy-button buy-from-taobao">
                <g:message code="product.info.buy.taobao" args="['http://shop67794942.taobao.com/shop/view_shop.htm']"/>
            </div>
        </div>
    </dd>
</g:if>