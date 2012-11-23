<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<% def locale=RequestContextUtils.getLocale(request)%>
<g:if test="${locale.toString().equals('ja')}">
    <div style="margin-left:10px">
    <!-- Rakuten Widget FROM HERE --><script type="text/javascript">rakuten_design="slide";rakuten_affiliateId="0ce12f9a.2204adaf.0ce12f9b.28f0600f";rakuten_items="ctsmatch";rakuten_genreId=0;rakuten_size="200x600";rakuten_target="_blank";rakuten_theme="gray";rakuten_border="off";rakuten_auto_mode="on";rakuten_genre_title="off";rakuten_recommend="on";</script><script type="text/javascript" src="http://xml.affiliate.rakuten.co.jp/widget/js/rakuten_widget.js"></script><!-- Rakuten Widget TO HERE -->
    </div>
</g:if>