<g:if test="${productInstance.status == 'OnSell'}">
    <div class="span4">
        <div class="well product-list">

            <h3 class="muted dropdown text-${i}"><g:message code="product.info.name.${productInstance.code}" default="${productInstance.name}"/>
                <span class="label label-${i} price pull-right">${fieldValue(bean: productInstance, field: "price")} RMB</span>
            </h3>
            <img src="${fieldValue(bean: productInstance, field: "imageUrl")}"/>
            <hr>
            <p><g:message code="product.info.description.${productInstance.code}" default="${productInstance.description}"/></p>
            <hr>
            <g:form action="save" controller="purchase">
                <g:hiddenField name="product.id" value="${productInstance.id}"/>
                <g:hiddenField name="owner.id" value="${sec.loggedInUserInfo(field:"id")}"/>
                <div class="text-right">
                    <button class="btn btn-large btn-${i}" type="submit">
                        <i class="icon-shopping-cart icon-white"></i>
                        ${message(code: 'product.button.buy.now')}
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</g:if>