/*!
 * datatable proxy functions JavaScript Library v1.0 
 *
 * Copyright Mahmudur rahman Foundation and other contributors
 * Released under the MIT license
 * https://jquery.org/license
 * Date: 2021-03-02T17:08Z
 */

'use strict';


var dir = $("html").attr("dir");


$.extend(true, $.fn.dataTable.defaults, {
    "lengthMenu": [[10, 25, 50, 100, 200], [10, 25, 50, 100, 200]],
    "bDestroy": true,
    "processing": true, // for show progress bar
    "serverSide": true, // for process server side
    "filter": true, // this is for disable filter (search box)
    "orderMulti": false, // for disable multiple column at once
    "responsive": true,
    "bAutoWidth": false,
    "autoWidth": false,
    //"pagingType": "full_numbers"
    "pagingType": "simple_numbers",
    "stripeClasses": [],
    //lengthChange:false,
    //"dom": 'C<"clear">Blfrtip<>',
    dom: '<"row w-100  mb-3"<"col-lg-12"B>><"row   mb-3"<"col-lg-12">><"row w-100 "<"col-lg-2"l><"col-lg-7"><"col-lg-2"f>>rt<"row w-100"<"col-lg-6"i><"col-lg-6 text-center"p>>',
    "language":
    {
        "url": (dir == 'rtl' ? "//cdn.datatables.net/plug-ins/1.10.20/i18n/Arabic.json" : ""),
        "processing": "<div class='overlay custom-loader-background'><i class='fa fa-cog fa-spin custom-loader-color'></i></div>",
        "infoFiltered": ""
    },
    "drawCallback": function (settings) {
        if (Math.ceil((this.fnSettings().fnRecordsDisplay()) / this.fnSettings()._iDisplayLength) > 1) {
            $('#Dt_paginate').css("display", "block");
        } else {
            $('#Dt_paginate').css("display", "none");
        }
    }
});
$.fn.DataTable.ext.pager.numbers_length = 4;
$.fn.dataTable.Buttons.defaults.dom.button.className = 'btn';

$.extend($.fn.dataTable.defaults, {
    buttons: {
        buttons: [
            {
                extend: 'copy',
                className: 'btn btn-secondary mr-1',
            },
            {
                extend: 'excel',
                className: 'btn btn-secondary mr-1',
            },
            {
                extend: 'csv',
                className: 'btn btn-secondary mr-1',
            },
            {
                extend: 'pdf',
                className: 'btn btn-secondary mr-1',
            }
        ]
    }
});

$.fn.dataTable.json = function (opts) {
    // Configuration options
    var conf = $.extend({
        pages: 10,     // number of pages to cache
        url: '',      // script url
        data: null,   // function or object with parameters to send to the server
        // matching how `ajax.data` works in DataTables
        method: 'POST' // Ajax HTTP method
    }, opts);


    return function (request, drawCallback, settings) {
        var ajax = true;
        var requestStart = request.start;
        var requestLength = request.length;


        if (ajax) {

            request.start = requestStart;
            request.length = requestLength;
            if ($.isFunction(conf.data)) {
                var c = conf.data(request);
                if (d) {
                    $.extend(request, d);
                }
            }
            else if ($.isPlainObject(conf.data)) {
                $.extend(request, conf.data);
            }

            settings.jqXHR = $.ajax({
                "type": conf.method,
                "url": conf.url,
                "data": request,
                "dataType": "json",
                "cache": false,
                //"dataSrc": "json.data",
                //"dataSrc": "",
                'beforeSend': function (request) {
                    request.setRequestHeader("X-CSRF-TOKEN-WEBADMINHEADER", $('#X-CSRF-TOKEN-WEBADMINHEADER').val());
                },
                "success": function (json) {
                    drawCallback(json);
                }
            });
        }
    }
};