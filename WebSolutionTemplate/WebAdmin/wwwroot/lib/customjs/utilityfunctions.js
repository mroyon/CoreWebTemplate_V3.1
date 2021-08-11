/*!
 * Utility functions JavaScript Library v1.0
 *
 * Copyright Mahmudur rahman Foundation and other contributors
 * Released under the MIT license
 * https://jquery.org/license
 * Date: 2021-03-02T17:08Z
 */
'use strict';
$(function () {
    $("[requiredmarkup]").after($("<span>", {
        class: "required"
    }).html("*"));
});

function showErrorAlert(title, text, btntext) {
    swal({
        title: title,
        text: text,
        type: "error",
        showCancelButton: false,
        //confirmButtonClass: 'btn-danger',
        confirmButtonText: btntext
    });
};
function showSuccessAlert(title, text, btntext) {
    swal({
        title: title,
        text: text,
        type: "success",
        showCancelButton: false,
        //confirmButtonClass: 'btn-success',
        confirmButtonText: btntext
    });
};
function showInformationAlert(title, text, btntext) {
    swal({
        title: title,
        text: text,
        type: "info",
        showCancelButton: false,
        //confirmButtonClass: 'btn-info',
        confirmButtonText: btntext
    });
};
function showWarningAlert(title, text, btntext) {

    swal({
        title: title,
        text: text,
        type: "warning",
        showCancelButton: false,
        //confirmButtonClass: 'btn-warning',
        confirmButtonText: btntext
    });

};

function _cusTriggerModal(modalID, htmldata) {

    var modid = modalID + '-content';
    var modcontainerid = modalID + '-container';

    $('#' + modid).html('');
    $('#' + modid).html(htmldata);
    $('#' + modcontainerid).modal({ backdrop: 'static', keyboard: false });
}


function _cusCloseModal(modalID) {
    var modid = modalID + '-content';
    var modcontainerid = modalID + '-container';

    $('#' + modid).html('');
    $('#' + modcontainerid).modal('hide');
}



function _cusFormValidate(formID) {

    var flg = false;
    var form = $('#' + formID);
    jQuery.validator.unobtrusive.parse();
    jQuery.validator.unobtrusive.parse(form);

    if (form.valid()) {
        flg = true;
    }
    else {
        flg = false;
    }

    return flg;
}

$(document).ready(function () {
    $('#divprogress').hide();
});
//$("input[required]").parent("label").addClass("required");