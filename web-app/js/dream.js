$(function (){

    $('.carousel').carousel({
        interval: 3000
    })

    $('.btn-loading').click(function() {
        $(this).addClass('disabled');
        $('.submit-by-enter').prop('readonly', true);
        if ($(this).next().is("img")) {
            $(this).next().show();
        }
    });
    $('.submit-by-enter').keydown(function(event) {
        if (event.keyCode == 13) {
            $('.btn-loading').addClass('disabled');
            $('.submit-by-enter').prop('readonly', true);
            if ($('.btn-loading').next().is("img")) {
                $('.btn-loading').next().show();
            }
        }
    });

    //By default, getTimezoneOffset returns the time zone offset in minutes
    timediff = (-1)*new Date().getTimezoneOffset()/60;
    setCookie("timezone", timediff);

    function setCookie(name, value, expires, path, domain, secure)
    {
        document.cookie= name + "=" + escape(value) +
            ((expires) ? "; expires=" + expires.toGMTString() : "") +
            ((path) ? "; path=" + path : "") +
            ((domain) ? "; domain=" + domain : "") +
            ((secure) ? "; secure" : "");
    }




});
