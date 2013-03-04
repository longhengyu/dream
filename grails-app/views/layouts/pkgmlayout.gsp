<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0"/>
        <title><g:layoutTitle default="Dream VPN" /></title>
        <g:render template="/layouts/resource"/>
        <link rel="stylesheet" href="http://twitter.github.com/bootstrap/assets/css/docs.css">
        <link rel="stylesheet" href="${resource(dir:'css',file:'dream-doc.css')}" />
        <g:layoutHead />
    </head>
    <body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">

        <g:render template="/layouts/topnav"/>

        <div class="container">
            <g:render template="/home/index_body_right"/>
            <hr>
            <g:render template="/common/footer"/>
        </div><!--/.fluid-container-->
    </body>
</html>