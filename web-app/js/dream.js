$(function (){

    $('.carousel').carousel({
        interval: 3000
    })


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

