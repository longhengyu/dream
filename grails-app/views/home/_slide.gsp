<section class="demo">

    <!-- styles for this demo -->
    <style>
    #slide {
        /* Required Styles */
        position:relative;
        width:550px;
        height:310px;
        overflow:hidden;

        float:left;
        border:10px solid #444;
        border-radius:5px;
        box-shadow:0 0 6px rgba(0, 0, 0, .4);
    }
    #slide li {
        position:absolute;
    }
    #slide img {
        display:block;
        width:550px;
        height:310px;
    }
    #slide em {
        display:block;
        position:absolute;
        bottom:0;
        width:100%;
        height:60px;
        background:rgba(0, 0, 0, .7);
        color:#fff;
        font-size:30px;
        line-height:60px;
        text-indent:1em;
    }

    #triggers {
        float:right;
        margin-top:1px;
    }
    #triggers li {
        margin-bottom:8px;
        *margin-bottom:5px;
    }
    #triggers img {
        display:block;
        width:124px;
        height:70px;
        border:3px solid #444;
        border-radius:4px;
        box-shadow:0 0 3px rgba(0, 0, 0, .4);
        cursor:pointer;
    }

    #mask {
        display:block;
        position:absolute;
        top:1px;
        right:0;
        width:124px;
        height:70px;
        border:3px solid #8ab516;
        border-radius:4px;
    }

    .demo {
        width: 720px;
        padding-left: 0;
        padding-right: 0;
    }
    </style>

    <div style="position:relative" class="wrap clearfix">
        <ul id="slide">
            <li style="opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="/images/p1.jpg">
                <em>One Man Band</em>
            </li>
            <li style="opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="/images/p2.jpg">
                <em>Geri’s Game</em>
            </li>
            <li style="opacity: 0; z-index: 1; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="/images/p3.jpg">
                <em>WALL E</em>
            </li>
            <li style="opacity: 1; z-index: 4; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;">
                <img src="/images/p4.jpg">
                <em>The Incredibles</em>
            </li>
        </ul>
        <ul id="triggers">
            <li class=""><img src="/images/p1.jpg"></li>
            <li class=""><img src="/images/p2.jpg"></li>
            <li class=""><img src="/images/p3.jpg"></li>
            <li class="current"><img src="/images/p4.jpg"></li>
        </ul>
        <div id="mask" style="top: 253px; transition-property: none; transition-duration: 500ms; transition-timing-function: ease;"></div>
    </div>

</section>