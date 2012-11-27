<!-- styles for this demo -->
<style>
#accordion {
    width:644px;
    overflow:hidden;
}
#accordion dt {
    height:34px;
    margin-top:6px;
    padding-left:20px;
    background: rgba(60, 102, 42, 0.47);
    box-shadow:0 1px 1px rgba(0, 0, 0, .6), 0 1px rgba(255, 255, 255, .15) inset;
    color:#fff !important;

    line-height:34px;
    cursor:pointer;
}
#accordion dt.current {
    background:#317CCF;
    box-shadow:0 0 1px rgba(255, 255, 255, .5) inset, 0 1px rgba(255, 255, 255, .5) inset, 0 2px 4px rgba(0, 0, 0, .6);
    text-shadow:-1px -1px #000;
    color: #FFF !important;
    font-weight:bold;
}
#accordion dd,
#accordion img {
    display:block;
    width:642px;
    height:310px;
}
#accordion dd {
    border: 1px solid #343434;
    border-top-width: 0;
}
#accordion dt.current + dd {
    border-color:#7f9b15;
}
</style>

<dl id="accordion">
    <g:each in="${productInstanceList}" status="i" var="productInstance">
    	<g:if test="${productInstance.status == 'OnSell'}">
        <dt>${fieldValue(bean: productInstance, field: "name")}</dt>
        <dd>
        <div class="product-img ${(i % 2) == 0 ? 'float-right' : 'float-left'}"><img src="${fieldValue(bean: productInstance, field: "imageUrl")}"/></div>
        <div class="product-content float-left"><h5>${fieldValue(bean: productInstance, field: "description")}</h5>
            <div class="price center"><span><g:message code="product.info.price"/> : <b>${fieldValue(bean: productInstance, field: "price")} RMB</b></span></div>
            <div class="buy-button">
                <g:submitButton class="" id="buyOnline" name="login" value="${message(code: 'product.button.buy.now')}" />
                <div class="float-right display-table"><div><g:message code="product.info.buy.now"/> </div></div>
            </div>
            <div class="buy-button buy-from-taobao">
                <g:message code="product.info.buy.taobao" args="['http://shop67794942.taobao.com/shop/view_shop.htm']"/>
            </div>
        </div>
        </dd>
        </g:if>
    </g:each>
</dl>

<script>
    $(function() {
        var Accordion = $('#accordion');

        Accordion.switchable({
            triggers: Accordion.find('dt'),
            triggerType: 'click',
            panels: 'dd',
            effect: 'accordion',
            multiple: false,
            initIndex: null // new value only for accordion
        });

        $("#accordion dt:first-child").click();
    });
</script>