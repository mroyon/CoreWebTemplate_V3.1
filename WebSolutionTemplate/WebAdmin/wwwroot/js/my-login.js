/******************************************
 * My Login
 *
 * Bootstrap 4 Login Page
 *
 ******************************************/

'use strict';

$(function () {

    $('body').on('click', '#btnlogin', function (e) {
        try {
            event.preventDefault();

            if (_cusFormValidate('frmlogin')) {
                var dataobject = { emailaddress: $("#emailaddress").val(), password: $("#password").val()};
                ajaxPostObjectHandler("/Account/Login", dataobject, function (data) {
                    window.location.reload();
                }, true);

            }
        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });


    //$(".my-login-validation").submit(function () {
    //    var form = $(this);
    //    if (form[0].checkValidity() === false) {
    //        event.preventDefault();
    //        event.stopPropagation();
    //    }
        
    //});


    $('body').on('click', '#btnforgetpassword', function (e) {
        try {
            event.preventDefault();

            if (_cusFormValidate('frmforgetpassword')) {
                var dataobject = { emailaddress: $("#emailaddress").val() };
                ajaxPostObjectHandler("/Account/ForgetPassword", dataobject, function (data) {
                }, true);
            }
        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });


    $('body').on('click', '#btnresetpassword', function (e) {
        try {
            event.preventDefault();

            if (_cusFormValidate('frmresetpassword')) {
                
                //var dataobject = { emailaddress: $("#emailaddress").val() };
                //ajaxPostObjectHandler("/Account/ForgetPassword", dataobject, function (data) {
                //}, true); 
            }
        } catch (e) {
            showErrorAlert("Error", e.message, "OK");
        }
    });

    //$(".my-forgetpass-validation").submit(function () {

    //	var form = $(this);
    //	if (form[0].checkValidity() === false) {
    //		event.preventDefault();
    //		event.stopPropagation();
    //	}
    //	form.addClass('was-validated');
    //});
});
