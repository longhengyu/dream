<div id="show-profile" class="content scaffold-show" role="main">
    <h3><sec:ifAllGranted roles="ROLE_ADMIN"><g:message code="profile.show.title.admin" default="User Profile"/></sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_USER"><g:message code="user.profile.title" default="My Profile" /></sec:ifAllGranted>
    </h3>
    <div id="profile-panel" class="form-no-decorate">

        <g:render template="/profile/panelBody"/>

    </div>
</div>