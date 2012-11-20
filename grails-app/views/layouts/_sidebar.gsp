<%
    def springSecurityService
%>
<sec:ifLoggedIn>
    <div class="helloMessage">
        <g:message code="login.msg.hello" args="${[sec.loggedInUserInfo(field:'username')]}"/> (<g:link controller='logout' action="index"><g:message code="login.msg.logout"/></g:link>)
    </div>
    <g:render template="/common/usermenu"/>
</sec:ifLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">

</sec:ifAnyGranted>
<sec:ifNotLoggedIn>
    <g:render template="/login/form"/>

</sec:ifNotLoggedIn>