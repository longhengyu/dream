<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewpoint" content="width=device-width, initial-scale=1.0"/>
        <title><g:layoutTitle default="Dream VPN" /></title>
        <g:render template="/layouts/resource"/>
        <g:layoutHead />
    </head>
    <body>

        <g:render template="/layouts/topnav"/>
        <!-- TODO: make language in topnav , see header.gsp-->

        <div class="container">
            <g:render template="/home/index_body_right"/>
            <hr>

            <g:render template="/common/footer"/>

        </div><!--/.fluid-container-->
    </body>
</html>