<sec:ifLoggedIn>You are logged in as <sec:username/> (<g:link controller='logout' action="index">Logout</g:link> )</sec:ifLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">Some admin info</sec:ifAnyGranted>
<sec:ifNotLoggedIn>
    <g:render template="/login/form"/>
</sec:ifNotLoggedIn>