<html>
    <head>
        <g:render template="/layouts/resource"/>
        <title><g:layoutTitle default="Dream VPN" /></title>
        <g:layoutHead />
    </head>
    <body>
        <g:render template="/layouts/header"/>
        <div id="content-wrapper">
            <div class="inner clearfix">
                <section id="main-content">
                    <g:layoutBody />
                </section>

                <aside id="sidebar">
                    <g:render template="/layouts/sidebar"/>
                </aside>
            </div>
        </div>
    </body>
    <footer>
        Copyright &copy; 2011 - 2012 | <a href="http://www.pkgplan.com">pkgplan</a>
    </footer>
</html>