<sec:ifLoggedIn>You are logged in as <sec:username/> (<g:link controller='logout' action="index">Logout</g:link> )</sec:ifLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">Some admin info</sec:ifAnyGranted>
<sec:ifNotLoggedIn>
    <g:link controller="login" action='index'>Login</g:link>
    <g:link controller="register" action='index'>Sign Up</g:link>
</sec:ifNotLoggedIn>