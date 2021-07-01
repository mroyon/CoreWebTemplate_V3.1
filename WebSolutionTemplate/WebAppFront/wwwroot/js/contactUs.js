
!(function ($) {
    "use strict";
   
    // Initiate venobox lightbox
    $(document).ready(function () {
        //CreateCaptcha();
    });

})(jQuery);

function CreateCaptcha() {
    try {

        var arrary = GetNewCaptcha();
        $("#imgcaptcha").attr("src", "data:image/png;base64, " + arrary[0]);
        $("#captcha_code").val(arrary[1]);

    } catch (e) {
        console.log(e.message);
        //swal("Error", e.message, "warning")
        //$.alert({
        //    title: _getCookieForLanguage("_informationTitle"),
        //    content: e.message,
        //    type: 'red'
        //});
    }

}