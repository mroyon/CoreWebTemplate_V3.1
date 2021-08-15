/*!
 * side menu functions JavaScript Library v1.0 
 *
 * Copyright Mahmudur rahman Foundation and other contributors
 * Released under the MIT license
 * https://jquery.org/license
 * Date: 2021-03-02T17:08Z
 */


'use strict';

function addUser() {

    //var dataobject = { culture: culture, returnUrl: returnUrl };
    //showInformationAlert("info", "addUser", "OK");
    ajaxGetHandler("/Account/AddUser", { returnUrl: "/" }, function (response) {
            $("#maincontainer").html(response);
        }, false, false);
}

$(function () {

    //$('body').on('click', '#ahrefchange_password', function (e) {
    //    ajaxGetHandler("/Account/ChangePassword", { returnUrl: "/" }, function (data) {
    //        _cusTriggerModal("modal-common", data);
    //    }, false, false);
    //});

    //$('body').on('click', '#btnchangepassword', function (e) {
    //    try {
    //        event.preventDefault();
    //        if (_cusFormValidate('frmchangepassword')) {
    //            var dataobject = {
    //                emailaddress: $("#emailaddress").val(),
    //                password: $("#password").val(),
    //                newpassword: $("#newpassword").val(),
    //                confirmpassword: $("#confirmpassword").val()
    //            };
    //            ajaxPostObjectHandler("/Account/ChangePasswordPost", dataobject, function (response) {
    //                _cusCloseModal('modal-common');
    //            }, true);
    //        }

    //    } catch (e) {
    //        showErrorAlert("Error", e.message, "OK");
    //    }
    //});

});
