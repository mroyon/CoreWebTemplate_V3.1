/******************************************
 * Change Password
 * All function related with Change Password
 ******************************************/

'use strict';

$(function () {

    $('body').on('click', '#ahrefchange_password', function (e) {
        $("#modal-container").remove();

        ajaxGetHandler("/Account/ChangePassword", { returnUrl: "/"}, function (data) {

            $('#modal-content-common').html('');
                $('#modal-content-common').html(data);
                $('#modal-container-common').modal({ backdrop: 'static', keyboard: false });
           
        }, false, false);
    });

    $('body').on('click', '#btn-common-modal-close', function (event) {
        try {
            event.preventDefault();
            $('#modal-content-common').html('');
            $('#modal-container-common').modal('hide');

        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

    function func(val) {
        showErrorAlert("Error", val, "OK");
        console.log(val);
    }

    $('body').on('click', '#btnchangepassword', function (e) {
        try {
            event.preventDefault();
            var form = $('#frmchangepassword');
            jQuery.validator.unobtrusive.parse();
            jQuery.validator.unobtrusive.parse(form);

            if (form.valid()) {

                ajaxPostHandler("/Account/ChangePassword", null, function (data) {
                    if (data !== "INVALID_PARAMETERS") {
                        showSuccessAlert("Success", data.response, "OK");
                    }
                    else {
                        alert("There is a problem on server side. Please try again later.");
                    }
                }, false);
            }
            else {

            }

        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

});
