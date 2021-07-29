/******************************************
 * Utility Functions
 * 
 ******************************************/

'use strict';

var methodTypePost = "POST";
var methodTypeGet = "GET";

function PostObjectProxy(url, params, successCallback, isStringify = false) {

    if (url == "") {
        return;
    }

    if (params != null) {
        params = isStringify == false ? params : JSON.stringify(params);
    }
    else {
        var params = "";
    }
    var tokenValue = $('#X-CSRF-TOKEN-WEBADMINHEADER').val();

    try {

        $.ajax({
            type: methodTypePost,
            url: url,
            data: params,
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
var ajaxPostObjectHandler = function (url, parameters, func, isStringify) {

    function onSuccess(response) {
        if (response === 'SESSION_EXPIRED') {
            showInformationAlert("Error", "Your session is expired. Please login to continue.", "OK");
            window.location.href = '/Account/login';
        }
        else
            func(response);
    };
    try {
        PostObjectProxy(url, parameters, onSuccess, isStringify);
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }
};

function PostParamsProxy(url, params, successCallback, isStringify = false) {

    if (url == "") {
        return;
    }

    if (params != null) {
        params = isStringify == false ? params : JSON.stringify(params);
    }
    else {
        var params = "";
    }
    var tokenValue = $('#X-CSRF-TOKEN-WEBADMINHEADER').val();

    try {

        $.ajax({
            type: methodTypePost,
            url: url,
            data: params,
            async: false,
            cache: false,
            //dataType: "json",
            //contentType: "application/json; charset=utf-8",
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
var ajaxPostParamsHandler = function (url, parameters, func, isStringify) {

    function onSuccess(response) {
        if (response === 'SESSION_EXPIRED') {
            showInformationAlert("Error", "Your session is expired. Please login to continue.", "OK");
            window.location.href = '/Account/login';
        }
        else
            func(response);
    };
    try {
        PostParamsProxy(url, parameters, onSuccess, isStringify);
    } catch (e) {
        showErrorAlert("Error", e.message, "OK");
    }
};

function GetProxy(url, params, successCallback, isStringify = false) {

    if (url == "") {
        return;
    }

    if (params != null)
        params = isStringify == false ? params : JSON.stringify(params);
    else
        params = "";

    var tokenValue = $('#X-CSRF-TOKEN-WEBADMINHEADER').val();

    try {
        $.ajax({
            type: methodTypeGet,
            url: url,
            data: params,
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


/// CALLING PROCS
/*
 
// GET 
 ajaxGetHandler("/Account/ChangePassword", { returnUrl: "/"}, function (data) {

            $('#modal-content-common').html('');
                $('#modal-content-common').html(data);
                $('#modal-container-common').modal({ backdrop: 'static', keyboard: false });

        }, false, false);

-------------------

var dataobject = { culture: culture, returnUrl: returnUrl };

//// multiple params post
//ajaxPostParamsHandler("/Home/SetLanguage", dataobject, function (data) {
//    if (data !== "INVALID_PARAMETERS") {
//        alert("There is a problem on server side. Please try again later.");

//        window.location.reload();
//    }
//    else {
//        alert("There is a problem on server side. Please try again later.");
//    }
//}, false);


//single object post
ajaxPostObjectHandler("/Home/SetLanguage2", dataobject, function (data) {
    if (data !== "INVALID_PARAMETERS") {
        alert("There is a problem on server side. Please try again later.");

        window.location.reload();
    }
    else {
        alert("There is a problem on server side. Please try again later.");
    }
}, true);


        /// <summary>
        /// SetLanguage
        /// </summary>
        /// <param name="objlangmodel"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SetLanguage2([FromBody] testmodel objlangmodel)
        {
            Response.Cookies.Append(
                CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(objlangmodel.culture)),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1), Secure = true, SameSite = SameSiteMode.Strict }
            );
            return LocalRedirect(objlangmodel.returnUrl);
        }
 
 
 */