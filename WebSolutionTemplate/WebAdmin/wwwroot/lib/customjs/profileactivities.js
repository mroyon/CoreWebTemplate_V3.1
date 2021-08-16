/******************************************
 * profile activities 
 * All function related with Change Password
 ******************************************/
/*!
 * profileactivities JavaScript Library v1.0
 *
 *
 * Copyright KAF Foundation and other contributors
 * https://jquery.org/license
 *
 * Date: 2021-03-02T17:08Z
 */

'use strict';

function updateLanguage(culture, returnUrl) {
    var dataobject = { culture: culture, returnUrl: returnUrl };
    ajaxPostObjectHandler("/Home/SetLanguage", dataobject, function (response) {
        if (response !== "INVALID_PARAMETERS") {
            window.location.reload();
        }
    }, true);
}

function signOut() {
    var dataobject = {  };
    ajaxPostObjectHandler("/Account/Logout", dataobject, function (response) {
        window.location.reload();
    }, true);
}

$(function () {
    $('body').on('click', '#ahrefchange_password', function (e) {
        ajaxGetHandler("/Account/ChangePassword", { returnUrl: "/" }, function (response) {
            _cusTriggerModal("modal-common", response);
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
                ajaxPostObjectHandler("/Account/ChangePassword", null, function (response) {
                    if (response !== "INVALID_PARAMETERS") {
                        showSuccessAlert("Success", response.response, "OK");
                    }
                }, false);
            }

        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

});
