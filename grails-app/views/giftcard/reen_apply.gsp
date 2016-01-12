<%@ page import="com.pkgplan.dream.Giftcard" %>
<html>
<head>
    <title><g:message code="introducer.title.label"  /></title>
    <meta name="layout" content="reen_layout" />
</head>

<div class="container inner">
    <div class="row">

        <g:if test="${com.pkgplan.dream.Impl.HelperService.isMobile() == false}">
            <g:render template="/layouts/reen_sidemenu"/>
        </g:if>


        <div class="col-md-9 inner-left-md border-left">

            <!-- ============================================================= SECTION – HERO ============================================================= -->

            <section id="hero" class="inner-bottom-xs">
                <header>
                    <h2><g:message code="introducer.title.label"/></h2>
                </header>
            </section>

        <!-- ============================================================= SECTION – CONTENT ============================================================= -->
            <g:if test="${hasServer == false}">
            <section class="light-bg inner-xs inner-left-xs inner-right-xs">

                <h3 class="team-headline sidelines text-center"><span><g:message code="introducer.free.giftcard.title"/></span></h3>

                <div id="verify-friend-Modal">
                    <g:render template="/giftcard/verifyFriend"/>
                </div>
            </section>
            </g:if>

            <section class="light-bg inner-xs inner-left-xs inner-right-xs">



                <h3 class="team-headline sidelines text-center"><span><g:message code="introducer.free.trail.title"/></span></h3>

                <div class="content-settings">
                    <div class="small">
                        <p><g:message code="introducer.free.giftcard.description"/></p>
                    </div>
                </div>
                <div class="inner-xxs text-center">
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
                                <th class="vcenter"><g:message code="introducer.referral.label.name" default="Name"/></th>
                                <th class="vcenter"><g:message code="introducer.referral.label.register.date" default="Register Date" /></th>
                                <th class="vcenter"><g:message code="introducer.referral.label.status" default="Status" /></th>
                            </tr>
                            </thead>
                            <tbody class="small">
                            <g:each in="${referrals}" status="i" var="referral">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td class="vcenter">${referral.username}</td>


                                    <td class="vcenter">${formatDate(date:referral?.dateCreated)}</td>

                                    <td class="vcenter">
                                        <g:if test="${referral.hasPurchased() == true}">
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
            </section>

        </div>

    </div><!-- /.row -->
</div><!-- /.container -->

</html>