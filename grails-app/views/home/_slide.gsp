<section class="pkgslide">

    <!-- styles for this demo -->
    <style>
    #slide {
        /* Required Styles */
        position:relative;
        width:512px;
        height:313px;
        overflow:hidden;

        float:left;
        border:0px solid #444;
        border-radius:5px;
        box-shadow:0 0 6px rgba(0, 0, 0, .4);
    }
    #slide li {
        position:absolute;
    }
    #slide img {
        display:block;
        width:512px;
        height:311px;
    }
    #slide em {
        display:block;
        position:absolute;
        bottom:-2px;
        width:100%;
        height:60px;
        background:rgba(0, 0, 0, .7);
        color:#fff;
        font-size:30px;
        line-height:60px;
        text-indent:1em;
    }

    #triggers {
        float:left;
        margin-top:1px;
    }
    #triggers li {
        margin-bottom:8px;
        *margin-bottom:5px;
    }
    #triggers img {
        display:block;
        width:118px;
        height:66px;
        border:3px solid #444;
        border-radius:4px;
        box-shadow:0 0 3px rgba(0, 0, 0, .4);
        cursor:pointer;
    }

    #mask {
        display:block;
        position:absolute;
        top:1px;
        right:6px;
        width:118px;
        height:66px;
        border:3px solid #8ab516;
        border-radius:4px;
    }

    .pkgslide {
        width: 662px;
        padding-left: 0;
        padding-right: 0;
    }
    </style>

    <div style="position:relative" class="wrap clearfix">
        <ul id="slide">
            <li style="padding-left:0;opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="images/sites/facebook.jpg">
                <em>Facebook</em>
            </li>
            <li style="padding-left:0;opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="images/sites/twitter.png">
                <em>Twitter</em>
            </li>
            <li style="padding-left:0;opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="images/sites/youtube.jpg">
                <em>YouTube</em>
            </li>
            <li style="padding-left:0;opacity: 1; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="images/sites/wikipedia.png">
                <em>Wiki pedia</em>
            </li>
        </ul>
        <ul id="triggers">
            <li><img src="images/sites/facebook.jpg"></li>
            <li><img src="images/sites/twitter.png"></li>
            <li><img src="images/sites/youtube.jpg"></li>
            <li><img src="images/sites/wikipedia.png"></li>
        </ul>
        <div id="mask"></div>
    </div>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <g:javascript src="lib/switchable-2.0.min.js"/>
    <script>
        $(function() {
            $('#slide').switchable({
                triggers: $('#triggers').find('li'),
                effect: 'fade',
                autoplay: true,
                onSwitch: function(event, currentIndex) {
                    var api = this,
                            cfg = api.config;

                    new $.switchable.Anim(
                            $('#mask'),
                            {top:1 + 80 * currentIndex},
                            cfg.duration,
                            cfg.easing
                    ).run();
                }
            });
        });
    </script>

</section>