<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>

<header>
    <div class="inner">
        <h1><a href="${resource(dir: '') ?: '/'}"><g:message code='site.head.title'/></a></h1>
        <h2><g:message code="site.head.subtitle"/></h2>
        <a href="http://twitter.com/pkgplan" class="button"><small>Follow us on</small>Twitter</a>
        <div class="lang-select">
            <ul class="">
                <li class="lang-comp <g:if test="${locale.toString().startsWith('en') || !locale.toString()}">lang-selected</g:if>"><span><g:link absolute="${request.forwardURI}" params="[lang:'en']">English</g:link></span></li>
                <li class="lang-comp <g:if test="${locale.toString().equals('zh_CN')}">lang-selected</g:if>"><span><g:link absolute="${request.forwardURI}" params="[lang:'zh_CN']">中文</g:link></span></li>
                <li class="lang-comp <g:if test="${locale.toString().equals('ja')}">lang-selected</g:if>"><span><g:link absolute="${request.forwardURI}" params="[lang:'ja']">日本語</g:link></span></li>
            </ul>
        </div>
    </div>
</header>