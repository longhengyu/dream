<div class="row-fluid">
    <div class="span12 box">
        <div class="box-head">
            <h3><i class="icon-white icon-user"></i> <g:message code="user.account.title"/></h3>
        </div>
        <div class="box-content">
            <div class="content-inner">
                <div class="content-settings">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#accountinfo"><g:message code="user.account.tab.user"/></a></li>
                            <li ><a data-toggle="tab" href="#profile"><g:message code="user.account.tab.profile"/></a></li>
                            </ul>
                        <div class="tab-content">
                            <g:render template="tabAccount"/>
                            <g:render template="tabProfile"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>