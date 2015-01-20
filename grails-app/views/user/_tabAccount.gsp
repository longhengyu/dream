<div id="accountinfo" class="tab-pane active">
    <div class="span10">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="row-fluid">
            <div class="inner-margin-left">
                <g:if test="${userInstance?.username}">
                    <div class="title display-table">
                        <p><g:message code="login.label.username" default="Username" /></p>
                        <span class="pull-right"><g:fieldValue bean="${userInstance}" field="username"/></span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.email}">
                    <div class="title display-table">
                        <p><g:message code="login.label.email" default="Email" /></p>
                        <span class="pull-right"><i class="icon-envelope"> </i> <g:fieldValue bean="${userInstance}" field="email"/></span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.enabled}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.enable" default="Enabled" /></p>
                        <span class="pull-right"><g:formatBoolean boolean="${userInstance?.enabled}" /></span>
                    </div>
                </g:if>
                <div class="title display-table">
                    <p><g:message code="user.account.server.ip.address" default="Server IP address" /></p>
                    <span class="pull-right">
                        <g:if test="${serverInstance}">
                            <div class="label label-info"><g:fieldValue bean="${serverInstance}" field="ipAddr"/></div>
                        </g:if>
                        <g:else>
                            <div class="label label-important"><g:message code="user.account.server.not.defined.yet"/></div>
                            <g:message code="user.account.server.not.defined.please" args="['/product/list']"/>
                            <a data-placement="top" data-content="${message(code:'user.account.server.not.defined.disclaimer')}" rel="popover" id="no-ip-assigned" href="#"><i class="icon-info-sign"></i></a>
                        </g:else>
                    </span>
                </div>
                <g:if test="${serverInstance}">
                    <div class="title display-table">
                        <p><g:message code="user.account.vpn.password" default="VPN Password"/></p>
                        <span class="pull-right">
                            <div class="label label-info"><g:vpnPassword/></div>
                        </span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.accountExpired}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.account.expired" default="Account Expired" /></p>
                        <span class="pull-right"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.accountLocked}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.locked" default="Account Locked" /></p>
                        <span class="pull-right"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.dateCreated}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.register.time" default="Date Created" /></p>
                        <span class="pull-right"><g:formatDate date="${userInstance?.dateCreated}" locale="${locale}"/></span>
                    </div>
                </g:if>
                <g:if test="${userInstance?.dateExpired.compareTo(userInstance?.dateCreated) != 0}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.expire.time" default="Date Expired" /></p>
                        <g:if test="${userInstance?.dateExpired > new java.util.Date()}">
                            <span class="pull-right">
                                <div class="label label-success"><g:formatDate date="${userInstance?.dateExpired}" locale="${locale}"/></div>
                            </span>
                        </g:if><g:else>
                            <span class="pull-right">
                                <div class="label label-important"><g:formatDate date="${userInstance?.dateExpired}" locale="${locale}"/>
                                &nbsp;<g:message code="user.account.label.expire.time.already"/>
                                </div>
                            </span>
                        </g:else>

                    </div>
                </g:if>
                <g:if test="${userInstance?.passwordExpired}">
                    <div class="title display-table">
                        <p><g:message code="user.account.label.password.expired" default="Password Expired" /></p>
                        <span class="pull-right"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
                    </div>
                </g:if>
            </div>
        </div>
    </div>
    <div class="span2">
<!--        <g:render template="gravatar"/> -->
    </div>
</div>
