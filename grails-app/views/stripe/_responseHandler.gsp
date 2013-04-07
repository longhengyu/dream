<r:script>
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
</r:script>