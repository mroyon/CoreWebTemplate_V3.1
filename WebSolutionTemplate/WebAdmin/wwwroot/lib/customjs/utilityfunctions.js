/******************************************
 * Utility Functions
 * 
 ******************************************/

'use strict';

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


$(document).ready(function () {
    $('#divprogress').hide();
    //$.ajaxSetup({
    //    beforeSend: function () {
    //        // show gif here, eg:
    //        $('#divprogress').show();
    //    },
    //    complete: function () {
    //        $('#divprogress').hide();
    //    },
    //    success: function (response) {
    //        if (response != null)
    //            if (response.status === "success") {
    //                showSuccessAlert(response.title, response.responsetext, "OK");
    //            }
    //            else if (response.status === "failed") {
    //                showErrorAlert(response.title, response.responsetext, "OK");
    //            }
    //            else if (response.status === "error") {
    //                showErrorAlert(response.title, response.responsetext, "OK");
    //            }
    //            else if (response.status === "Error") {
    //                showErrorAlert(response.title, response.responsetext, "OK");
    //            }
    //    },
    //    failure: function (response) {
    //        showErrorAlert(response.title, response.responseJSON.Error, "OK");
    //    },
    //    error: function (response) {
    //        showErrorAlert(response.title, response.responseJSON.Error, "OK");
    //    }
    //});
});
//$("input[required]").parent("label").addClass("required");