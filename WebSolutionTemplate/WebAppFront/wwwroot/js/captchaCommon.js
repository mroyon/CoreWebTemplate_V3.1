function GetNewCaptcha() {
    try {
        var values = [];
        var jqXHR = $.ajax({
            url: "/Common/getCaptcha",
            type: 'GET',
            contentType: 'application/x-www-form-urlencoded',
            dataType: "json",
            async: false,
            success: function (data) { }
        });
        var datar = JSON.parse(jqXHR.responseText);
        console.log(datar);
        var dt = datar["result"];
        values.push(dt["imagecaptcha"]);
        values.push(dt["codeenc"]);
        return values;
    } catch (e) {
        console.log(e.message);
        //swal("Error", e.message, "warning");
        //$.alert({
        //    title: _getCookieForLanguage("_informationTitle"),
        //    content: e.message,
        //    type: 'red'
        //});
    }
}