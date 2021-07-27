/******************************************
 * Change Password
 * 
 ******************************************/

'use strict';

$(function () {

    $('body').on('click', '#ahrefchange_password', function (e) {
        $("#modal-container").remove();
        $.get("/Account/ChangePassword", null, function (data) {
            $('#modal-content-common').html('');
            $('#modal-content-common').html(data);
            $('#modal-container-common').modal({ backdrop: 'static', keyboard: false });
        });
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


    $('body').on('click', '#btnchangepassword', function (e) {
        try {
            event.preventDefault();
            var form = $('#frmchangepassword');
            jQuery.validator.unobtrusive.parse();
            jQuery.validator.unobtrusive.parse(form);

            if (form.valid()) {
                $.ajax({
                    type: "POST",
                    url: "/Account/ChangePassword",
                    headers: {
                        'X-CSRF-TOKEN-WEBADMINHEADER': $('#X-CSRF-TOKEN-WEBADMINHEADER').val()
                    },
                    data: { my: "data" },
                    success: function (response) {
                        alert("Hello: ");
                    },
                    failure: function (response) {
                        console.log(response);
                    },
                    error: function (response) {
                        console.log(response);
                    }
                })
             

            }
            else {

            }

        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

});
