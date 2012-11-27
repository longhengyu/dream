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
    background: rgba(88, 165, 46, 0.50);
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
        <div style="float:left"><img src="${fieldValue(bean: productInstance, field: "imageUrl")}" style="width:242;height: 288;margin: 13px"/></div>
        <div style="float:left;padding:10px 8px;width:340px"><p>${fieldValue(bean: productInstance, field: "description")}</p></div>
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