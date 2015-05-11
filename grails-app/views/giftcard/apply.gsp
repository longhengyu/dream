<%@ page import="com.pkgplan.dream.Giftcard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="pkglayout">
    <title><g:message code="introducer.title.label"  /></title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-gift"></i> <g:message code="introducer.title.label"/></h3>
        </div>
        <div class="box-content">
            <g:if test="${hasServer == false}">
                <div class="content-inner">
                    <div class="page-header test-margin-left vpn-info">
                        <h4><g:message code="introducer.free.trail.title"/></h4>
                    </div>
                    <div class="content-settings">

                        <div id="verify-friend-Modal">
                            <g:render template="/giftcard/verifyFriend"/>
                        </div>
                    </div>
                </div>
            </g:if>

            <div class="content-inner">
                <div class="page-header test-margin-left vpn-info">
                    <h4><g:message code="introducer.free.giftcard.title"/></h4>
                </div>
                <div class="content-settings">
                    <div class="test-margin-left">
                        <p><g:message code="introducer.free.giftcard.description"/></p>
                    </div>
                </div>
                <div class="padding20px form features-two">
                    <h3>${sec.loggedInUserInfo(field:'username')}</h3>
                </div>

                <g:if test="${referrals.size() != 0}">
                    <div class="page-header test-margin-left vpn-info">
                        <h5><g:message code="introducer.referral.title" default="Name"/></h5>
                    </div>
                    <div class="content-settings test-margin-left">
                        <table class="table table-bordered table-striped" id="giftcard-list">
                            <thead>
                                <tr>
                                    <th><g:message code="introducer.referral.label.name" default="Name"/></th>
                                    <th><g:message code="introducer.referral.label.register.date" default="Register Date" /></th>
                                    <th><g:message code="introducer.referral.label.status" default="Status" /></th>
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${referrals}" status="i" var="referral">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${referral.username}</td>


                                    <td>${formatDate(date:referral?.dateCreated)}</td>

                                    <td><g:if test="${referral.hasPurchased() == true}">
                                        <g:message code="introducer.referral.status.bought" default="Started Using" />
                                        </g:if>
                                        <g:else><g:message code="introducer.referral.status.not.yet" default="Ready to Use" />
                                        </g:else>
                                    </td>


                                </tr>
                            </g:each>

                            </tbody>
                        </table>

                    </div>

                </g:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>

