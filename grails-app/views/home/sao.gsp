<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Dream VPN</title>
    <meta name="viewport" content="width=device-width">
    <g:render template="/layouts/resource"/>
    <link rel="stylesheet" href="${resource(dir:'css',file:'dream-top.css')}" />
    <script src="https://gathercontent.com/assets/js/global/modernizr-2.5.3.min.js"></script>
    <script src="https://gathercontent.com/assets/js/global/selectivizr.js"></script>
    <script type="text/javascript" src="https://gathercontent.com/assets/js/global/_dynamic.php?v=1363777876"></script>

</head>
<body>
    <div class="page-content-wrapper">
        <header class="header">
                <div class="row">
                    <div class="span3">
                        <a href="${resource(dir: '') ?: '/'}" class="brand">
                            <img class="logo" src="${resource(dir:'img',file:'logo_white.png')}" title="bizstrap" alt="logo">Dream VPN
                        </a>
                    </div>

                    <div class="menu span9 pull-right">
                        <ul class="menu-list">
                            <li class="menu-item">
                                <a href="https://gathercontent.com/how-it-works">Home</a>
                            </li>
                            <li class="menu-item">
                                <a href="https://gathercontent.com/features">User Manual</a>
                            </li>
                            <li class="menu-item highlight-item">
                                <a href="https://gathercontent.com/signup">Language</a>
                            </li>
                            <li class="menu-item login-item">
                                <a href="https://gathercontent.com/login" class="btn btn-inverse btn-mini">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
        </header>


        <div class="hero-unit">
            <div class="container">
                <h1>Wall Breaking is Simple.</h1>
                <h2>We provide REAL Internet solutions for users in China.</h2>

                <ul class="row ">
                    <li class="span3 plan float-up">
                        <p>Plan</p>
                        <p>Architect &amp; organise your content with drag &amp; drop.</p>
                    </li>

                    <li class="span3 structure float-up">
                        <p>Structure</p>
                        <p>Structure specific rules &amp; guidelines for your content.</p>
                    </li>

                    <li class="span3 collaborate float-up">
                        <p>Collaborate</p>
                        <p>Get the content you need from your team, clients &amp; contributors.</p>
                    </li>

                    <li class="span3 deliver float-up">
                        <p>Deliver</p>
                        <p>Get approval &amp; export your content to CMS with our plugins or via the API.</p>
                    </li>
                </ul>
            </div>
        </div>

        <div class="container">
            <div class="row get-started-now">
                <div class="span10 offset1 white-panel button-text-panel">
                    <h2>Ready to get a Dream VPN?</h2>
                    <a href="signup" class="btn btn-large btn-warning">Get Started Now</a>
                </div>
            </div>
        </div>

        <div class="push"><!--//--></div>
    </div> <!-- page-content-wrapper -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <div class="footer-brand">
                        <a href="${resource(dir: '') ?: '/'}">
                            <img src="${resource(dir:'img',file:'logo_white.png')}" title="bizstrap" alt="logo">
                            <span>Dream VPN</span>
                        </a>
                    </div>
                    <p>Our mission is to bring content harmony to everyone.</p>
                </div>
            </div>
            <div class="row links-horizontal">
                <div class="span12">
                    <a href="http://twitter.com/gathercontent" class="twitter-link">Follow us on Twitter</a>
                </div>
            </div>

            </div>
    </footer>



</body>
</html>
