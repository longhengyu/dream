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
        <dt>${fieldValue(bean: productInstance, field: "name")} - Price: ${fieldValue(bean: productInstance, field: "price")} RMB</dt>
        <dd>
        <div class="product-img ${(i % 2) == 0 ? 'float-right' : 'float-left'}"><img src="${fieldValue(bean: productInstance, field: "imageUrl")}"/></div>
        <div class="product-content float-left"><h5>${fieldValue(bean: productInstance, field: "description")}</h5>
            <div class="price center"><span>Price: <b>${fieldValue(bean: productInstance, field: "price")}</b> RMB</span></div>
            <div class="buy-button">
                <g:submitButton class="" id="buyOnline" name="login" value="Buy Now" />
                <div class="float-right display-table"><div> You can use it immediately after billing.</div></div>
            </div>
            <div class="buy-button buy-from-taobao">
                you can also buy from <a target="_blank" href="http://shop67794942.taobao.com/shop/view_shop.htm" id="buyTaobao" >Taobao</a>,
                it may take a while for our stuff to activate your account.
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