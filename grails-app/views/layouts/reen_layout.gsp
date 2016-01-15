<!DOCTYPE html>
<html>
    <head>
        <!-- Meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="author" content="">
        <meta name="keywords" content="${message(code: 'main.meta.keywords', default: 'keywords')}" />
        <meta name="description" content="${message(code: 'main.footer.desc.aboutus', default: 'description')}" />

        <title><g:layoutTitle default="Dream VPN" /></title>
        <g:render template="/layouts/reen_resource"/>
    </head>
    <body>

        <g:render template="/layouts/reen_topnav"/>

        <main>
            <g:layoutBody />
        </main>

        <g:render template="/layouts/reen_footer"/>

        <g:render template="/layouts/reen_foot_resource"/>

    </body>
</html>