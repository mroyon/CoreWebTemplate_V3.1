
/*!
 * custom file upload profile pic Library v1.0
 *
 * Copyright Mahmudur rahman Foundation and other contributors
 * Date: 2021-03-02T17:08Z
 */




(function ($) {

    "use strict";

    var methods = {
        init: function (options) {

        },
        show: function () { },// IS
        hide: function () { },// GOOD
        update: function (content) { }// !!!
    };

    $.fn.propicfileuploader = function (options) {

        /*
         *  _divid: 'profilephoto',
                _columnname: 'userprofilephoto',
                _addbuttontext: '@SharedLocalizer.GetLocalizedHtmlString("ADD_IMAGE")',
                _removebuttontext: '@SharedLocalizer.GetLocalizedHtmlString("REMOVE_IMAGE")',
         */
        var defaults = {
            _divid: '_defaultdivid',
            _uploadedfileextension: 'jpg, .png, .jpeg, .bmp',
            _fileinputid: '_defaultfileinputid',
            _columnname: '_defaultcolumnname',
            _removebuttontext: '_defaultremovebuttontext',
        };

        var options = $.extend({}, defaults, options);
        var blankimageurl = '../img/blankprofile.png';
        var stringbuilder = '';

        this.initialize = function () {
            stringbuilder = '<div id="' + options._divid + '">';
            stringbuilder += '<label>';

            if (options._uploadedfileextension != '') 
                stringbuilder += '<input type="file" hidden accept="' + options._uploadedfileextension + '" ngf-select ng-model="new_files" id="' + options._fileinputid + '" ng-change="fs.uploadFiles(new_files)">';
            else
                stringbuilder += '<input type="file"  hidden accept=".doc, .docx, .pdf, .xls, .xlsx, jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" ngf-select ng-model="new_files" id="' + options._fileinputid + '" ng-change="fs.uploadFiles(new_files)">';

            stringbuilder += '<img src="' + blankimageurl + '" style="cursor: pointer;" id="btnuploadcls" class=" btnuploadcls image--cover" width="120px" height="131px" />';

            stringbuilder += '</label>';
            stringbuilder += '</div>';
            stringbuilder += '<span class="btn btn-primary invisible " id="btn_removeimage" >' + options._removebuttontext + '</span>';
            stringbuilder += '<input type="hidden" id="' + options._columnname + '" />';//TPhotoContainer
            stringbuilder += '<input type="hidden" id="TMPFileName" />';

            stringbuilder += '';
            this.append(stringbuilder);
            return this;
        };

        $(document).ready(function () {

            $('#btn_removeimage').on('click', function (event) {
                $('#btnuploadcls').attr('src', blankimageurl);
                $('#btn_removeimage').addClass("invisible");
                $('#' + options._columnname + '').val('');
            });

            $('#' + options._fileinputid).change(function () {
                var fileUpload = $('#' + options._fileinputid).get(0);
                var files = fileUpload.files;
                var fileData = new FormData();
                for (var i = 0; i < files.length; i++) {

                    fileData.append(files[i].name, files[i]);
                    var filesize = files[i].size;
                    var fileName = files[i].name;
                    var filetype = files[i].type;
                    var fileURL = [];
                    var str = "";

                    $('#btn_removeimage').removeClass("invisible");

                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var extension = fileName.split('.').pop().toLowerCase();
                        extension = '.' + extension;
                        var cont = event.target.result
                        var base64String = cont.replace(/^[^,]*,/, '');

                        var imgsource = '';
                        if (extension == '.jpg' || extension == '.png' || extension == '.bmp' || extension == '.gif' || extension == '.jpeg')
                            imgsource = event.target.result;

                        $('#btnuploadcls').attr('src', imgsource);
                        $('#' + options._columnname + '').val(base64String);

                    }
                    reader.readAsDataURL(files[i]);

                }
            });

        });

        this.preloadphoto = function (_photocontainercontent) {
            var blankimageurl = '../img/blankprofile.png';

            if (_photocontainercontent == '') {
                $('#btn_removeimage').addClass("invisible");
                $('#btnuploadcls').attr('src', blankimageurl);
            }
            else {
                $('#btn_removeimage').removeClass("invisible");
                $('#btnuploadcls').attr('src', _photocontainercontent);
            }
        }

        return this.initialize();
    };

})(jQuery);
