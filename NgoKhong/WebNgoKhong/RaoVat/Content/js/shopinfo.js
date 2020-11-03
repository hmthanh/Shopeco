$(document).ready(function () {
    function changeCity() {
        var city = $('#cmbTinh').val();
        $.ajax({
            type: "GET",
            url: '../Ajax/LayDiaChi.aspx?a=district&city=' + city,
            success: function (data) {
                var obj = JSON.parse(data);
                var cmbHuyen = $('#cmbHuyen');
                cmbHuyen.find('option').remove();
                jQuery.each(obj, function (i, item) {
                    if (i == 0) {
                        cmbHuyen.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));
                    }
                    else {
                        cmbHuyen.append($('<option>', { value: item.maqh, text: item.name }));
                    }
                });
                changeProvince();
            }
        });
    }
    function isPostBack() { //function to check if page is a postback-ed one
        return document.getElementById('_ispostback').value == 'True';
    }
    function changeProvince() {
        var district = $('#cmbHuyen').val();
        $.ajax({
            type: "GET",
            url: '../Ajax/LayDiaChi.aspx?a=hamlet&district=' + district,
            success: function (data) {
                var obj = JSON.parse(data);
                var cmbXa = $('#cmbXa');
                cmbXa.find('option').remove();
                jQuery.each(obj, function (i, item) {
                    if (i == 0) {
                        cmbXa.append($('<option selected="selected" value="' + item.xaid + '">' + item.name + '</option>'));
                    }
                    else {
                        cmbXa.append($('<option>', { value: item.xaid, text: item.name }));
                    }
                });
            }
        });
    }

    $.ajax({
        type: "GET",
        url: '../Ajax/LayDiaChi.aspx?a=city',
        success: function (data) {
            var obj = JSON.parse(data);
            var cmbTinh = $('#cmbTinh');
            cmbTinh.find('option').remove();
            jQuery.each(obj, function (i, item) {
                if (i == 0) {
                    cmbTinh.append($('<option selected="selected" value="' + item.matp + '">' + item.name + '</option>'));
                }
                else {
                    cmbTinh.append($('<option>', { value: item.matp, text: item.name }));
                }
            });
            changeCity();
        }
    });
    ////////////////////////////////////////////////////
    $('#cmbTinh').change(function () {
        changeCity();
    });


    //$('#cmbTinh').change(function () {
    //    var type = $('#slTinh').val();
    //    var city = $('#cmbTinh').val();
    //    $.ajax({
    //        type: "GET",
    //        url: '../Ajax/LayDiaChi.aspx?a=district&type=' + type + '&city=' + city,
    //        success: function (data) {
    //            console.log(data);
    //            var obj = JSON.parse(data);
    //            var cmbTinh = $('#cmbHuyen');
    //            cmbTinh.find('option').remove();
    //            jQuery.each(obj, function (i, item) {
    //                if (i == 0) {
    //                    cmbTinh.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));
    //                }
    //                else {
    //                    cmbTinh.append($('<option>', { value: item.maqh, text: item.name }));
    //                }
    //            });
    //        }
    //    });
    //});
    ////////////////////////////////////////////////////
    $('#cmbHuyen').change(function () {
        changeProvince();
    });
});