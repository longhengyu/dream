jQuery(document).ready(function() {
    jQuery("#payment-form").submit(function(event) {
        // disable the submit button to prevent repeated clicks
        jQuery('.submit-button').attr("disabled", "disabled");
        // createToken returns immediately - the supplied callback submits the form if there are no errors
        Stripe.createToken({
            number: jQuery('.card-number').val(),
            cvc: jQuery('.card-cvc').val(),
            exp_month: jQuery('.card-expiry-month').val(),
            exp_year: jQuery('.card-expiry-year').val()
        }, stripeResponseHandler);
        return false; // submit from callback
    });
});

function stripeResponseHandler(status, response) {
    if (response.error) {
        // re-enable the submit button
        jQuery('.submit-button').removeAttr("disabled");
        // show the errors on the form
        jQuery(".payment-errors").html(getCardErrorMessageFromCode(response.error.code));
        jQuery("#payment-errors-precheck").show();
        setTimeout(function(){$("#payment-errors-precheck").fadeOut(1000 );},2000)
    } else {
        var form$ = jQuery("#payment-form");
        // token contains id, last4, and card type
        var token = response['id'];
        // insert the token into the form so it gets submitted to the server
        form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
        // and submit
        ajaxSubmitCardForm(form$.get(0));
    }
}

function ajaxSubmitCardForm(cardform) {
    jQuery.ajax(
        {
            type:'POST',
            data:jQuery(cardform).serialize(),
            url:'/purchase/buy',
            success:function(data,textStatus){jQuery('#use-stripe-Modal').html(data);},
            error:function(XMLHttpRequest,textStatus,errorThrown){}
        });
    return false
}