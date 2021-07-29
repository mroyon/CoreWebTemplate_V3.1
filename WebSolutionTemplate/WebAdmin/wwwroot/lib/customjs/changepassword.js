/******************************************
 * Change Password
 * All function related with Change Password
 ******************************************/

'use strict';

$(function () {

    $('body').on('click', '#ahrefchange_password', function (e) {
        ajaxGetHandler("/Account/ChangePassword", { returnUrl: "/" }, function (data) {
            _cusTriggerModal("modal-common", data);
        }, false, false);
    });

    $('body').on('click', '#btn-common-modal-close', function (event) {
        try {
            event.preventDefault();
            _cusCloseModal('modal-common');
        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });


    $('body').on('click', '#btnchangepassword', function (e) {
        try {
            event.preventDefault();

            if (_cusFormValidate('frmchangepassword')) {
                ajaxPostObjectHandler("/Account/ChangePassword", null, function (data) {
                    if (data !== "INVALID_PARAMETERS") {
                        showSuccessAlert("Success", data.response, "OK");
                    }
                    else {
                        alert("There is a problem on server side. Please try again later.");
                    }
                }, false);
            }

        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

});
