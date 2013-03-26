<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><g:layoutTitle default="Dream VPN" /></title>
    <g:render template="/layouts/resource"/>
    <link rel="stylesheet" href="${resource(dir:'css',file:'origin.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'dream-top.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'login.css')}" />

</head>

<body>

<div class="wrapper">

    <div class="login-wrapper">
        <div class="logo">
            <div class="custom-logo">
                <div class="inline-brand">
                	<a href="${resource(dir: '') ?: '/'}" class="brand">
                    	<img src="${resource(dir:'img',file:'logoimg.png')}" title="bizstrap" alt="logo">
                    </a>
                </div>
            </div>
        </div>
        <g:layoutBody/>
    </div>
</div>

</body></html>
