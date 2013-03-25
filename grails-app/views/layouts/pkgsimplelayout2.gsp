<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewpoint" content="width=device-width, initial-scale=1.0"/>
    <title><g:layoutTitle default="Dream VPN" /></title>
    <g:render template="/layouts/resource"/>
    <link rel="stylesheet" href="${resource(dir:'css',file:'origin.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dream-top.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'login.css')}" />

</head>

<body>

<div class="notification-bar ajax-notification-bar"><button class="close">&times;</button></div>

<div class="wrapper ajax-wrapper">

    <div class="client-banner cf">
        <div class="container">
            <div class="row">
                <div class="inner-wrapper cf span12">
                    <div class="left">
                        <a href="${resource(dir: '') ?: '/'}" class="brand">
                            <img class="logo" src="${resource(dir:'img',file:'logoimg.png')}" title="bizstrap" alt="logo">
                        </a>

                    </div>

                    <div class="right micro-text">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <g:layoutBody/>


</div>
</body></html>
