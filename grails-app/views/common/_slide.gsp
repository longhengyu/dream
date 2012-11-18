<style>
    #scrollable-1 {
        position:relative;
        width:650px;
        height:125px;
        overflow:hidden;
    }
    #scrollable-1 li {
        float:left;
        margin-right:15px;
    }
    .demo {
        width: 650px;
        position: relative;
        margin: 0 auto;
    }
    .demo img {
        display:block;
        width:195px;
        height:110px;
        border:5px solid #444;
        border-radius:4px;
        box-shadow:0 0 6px rgba(0, 0, 0, .4);
    }
    .switchable-triggers {
        text-align: left;
        margin-bottom: 3px !important;;
    }
    .switchable-triggers li {
        display:inline-block;
        *display: inline;
        *zoom: 1;
        margin:0 3px;
        color:#c6c6c6;
        font-size:28px;
        font-weight:bold;
        text-shadow:0 2px 1px rgba(0, 0, 0, .4);
        cursor:pointer;
    }
    .switchable-triggers li.current { color:#8ab516; }

    .demo li {
        padding-left:0 !important;
    }
</style>
<div class="demo">

<div id="scrollable-1">
    <ul style="position: absolute; left: 0px; width: 2640px; transition-property: none; transition-duration: 500ms; transition-timing-function: ease-in-out;">
        <li><img src="${resource(dir:'images/sites',file:'facebook.jpg')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'twitter.png')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'wikipedia.png')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'youtube.jpg')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'pandora_m.jpg')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'hulu_m.jpg')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'picasa_m.jpg')}"></li>
        <li><img src="${resource(dir:'images/sites',file:'appengine_m.png')}"></li>
    </ul>
</div>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<g:javascript src="lib/switchable-2.0.min.js"/>
<script type="text/javascript">
$(function() {
  /**
   * Horizontal
   */
  $('#scrollable-1').switchable({
    triggers: '&bull;',
    putTriggers: 'insertBefore',
    panels: 'li',
    easing: 'ease-in-out',

    effect: 'scrollLeft',
    steps: 2,
    visible: 3, // important
    end2end: true,

    autoplay: true
  });
});
</script>