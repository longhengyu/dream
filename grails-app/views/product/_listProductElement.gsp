
<g:if test="${productInstance.status == 'OnSell'}">
<ul class="pricing-column span4">
    <li class="pricing-title pricing-title-${i} text-${i}"><g:message code="product.info.name.${productInstance.code}" default="${productInstance.name}"/></li>
    <li class="pricing-price">${fieldValue(bean: productInstance, field: "price")} RMB <span class="small">/ <g:message code="main.plan.period.${i+1}" /></span>
    </li>
	<li><img alt="" src="${resource(dir:'img',file:(i+1)+'.png')}"></li>
    <g:set var="messagecode" value='product.info.description.${productInstance.code}'/>
    <g:each in="${(message(code: messagecode)).split('\\|')}" var="desc">
    	<li><g:message code="${desc}" /></li>
    </g:each>
    <li class="pricing-button">
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
    </li>
</ul>
</g:if>               	



   