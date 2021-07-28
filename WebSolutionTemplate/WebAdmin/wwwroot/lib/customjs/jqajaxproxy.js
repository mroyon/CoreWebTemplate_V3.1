/******************************************
 * Utility Functions
 * 
 ******************************************/

'use strict';

var methodTypePost = "POST";
var methodTypeGet = "GET";

function PostProxy(url, params, successCallback, isStringify = false) {

    if (url == "") {
        return;
    }

    if (params != null)
        var jsonData = isStringify == false ? params : JSON.stringify(params);
    else
        var jsonData = "";

    //console.log(jsonData.culture);
    //console.log(jsonData.returnUrl);
    //console.log(jsonData);

    var dataobject = {};
    dataobject.culture = jsonData.culture;
    dataobject.returnUrl = jsonData.returnUrl;

    console.log(dataobject);


    var tokenValue = $('#X-CSRF-TOKEN-WEBADMINHEADER').val();

    try {
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(jsonData),
            async: false,
            cache: false,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            headers: {
                'X-CSRF-TOKEN-WEBADMINHEADER': tokenValue
            },
            beforeSend: function () {
                $('#divprogress').show();
            },
            success: successCallback,
            error: function (xhr, textStatus, errorThrown) {
                $('#divprogress').hide();
                showErrorAlert("Error", errorThrown, "OK");
            },
            failure: function (response) {
                showErrorAlert("Error", response, "OK");
            },
            complete: function () {
                $('#divprogress').hide();
            },
        });
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }

};
var ajaxPostHandler = function (url, parameters, func, isStringify) {

    function onSuccess(response) {
        if (response === 'SESSION_EXPIRED') {
            showInformationAlert("Error", "Your session is expired. Please login to continue.", "OK");
            window.location.href = '/Account/login';
        }
        else
            func(response);
    };
    try {
        PostProxy(url, parameters, onSuccess, isStringify);
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }
};


function GetProxy(url, params, successCallback, isStringify = false) {

    if (url == "") {
        return;
    }

    if (params != null)
        var jsonData = isStringify == false ? params : JSON.stringify(params);
    else
        var jsonData = "";

    //console.log(params)
    //console.log(jsonData);
    //console.log(JSON.stringify(params));
    //console.log(JSON.stringify(jsonData));

    var tokenValue = $('#X-CSRF-TOKEN-WEBADMINHEADER').val();

    try {
        $.ajax({
            type: methodTypeGet,
            url: url,
            data: jsonData,
            contentType: "application/json",
            async: false,
            cache: false,
            headers: {
                'X-CSRF-TOKEN-WEBADMINHEADER': tokenValue
            },
            beforeSend: function () {
                $('#divprogress').show();
            },
            success: successCallback,
            error: function (xhr, textStatus, errorThrown) {
                $('#divprogress').hide();
                showErrorAlert("Error", errorThrown, "OK");
            },
            failure: function (response) {
                showErrorAlert("Error", response, "OK");
            },
            complete: function () {
                $('#divprogress').hide();
            },
        });
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }

};
var ajaxGetHandler = function (url, parameters, func, isStringify) {

    function onSuccess(response) {
        if (response === 'SESSION_EXPIRED') {
            showInformationAlert("Error", "Your session is expired. Please login to continue.", "OK");
            window.location.href = '/Account/login';
        }
        else
            func(response);
    };
    try {
        GetProxy(url, parameters, onSuccess, isStringify);
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }
};
