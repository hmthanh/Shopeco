$(document).ready(function () {
    var Params = new URLSearchParams(window.location.search.toString());
    var from = Params.get("from");
    if (from != "" || from != null) {
        $("#ragFrom").val(from);
    }
    var to = Params.get("to");
    if (to != "" || to != null) {
        $("#ragTo").val(to);
    }
    
    if (from != null && to != null) {
        var listRange = $('.chooseLabel_1hY5');
        for (var m = 0; m < listRange.length; m++) {
            var f = listRange[m].dataset.from;
            var t = listRange[m].dataset.to;
            if (f == from && t == to)
            {
                $(listRange[m]).css({ "background-color": "#e5101d", "color": "white" });
            }
        }
    }
    function modifyURLQuery(url, param) {
        var value = {};

        var query = String(url).split('?');

        if (query[1]) {
            var part = query[1].split('&');

            for (i = 0; i < part.length; i++) {
                var data = part[i].split('=');

                if (data[0] && data[1]) {
                    value[data[0]] = data[1];
                }
            }
        }

        value = $.extend(value, param);

        // Remove empty value
        for (i in value) {
            if (!value[i]) {
                delete value[i];
            }
        }

        // Return url with modified parameter
        if (value) {
            return query[0] + '?' + $.param(value);
        } else {
            return query[0];
        }
    }
    function GetSearchResult(_param) {
        var searchParams = new URLSearchParams(window.location.search.toString());
        var nameParam = _param.substring(0, 3);
        var valueParam = _param.replace(nameParam + '=', '');

        var values = searchParams.getAll(nameParam);
        if (jQuery.inArray(valueParam, values) != -1)
        {
            searchParams.delete(nameParam);
            for (var i = 0; i < values.length; i++) {
                
                if (values[i] != valueParam)
                {
                    searchParams.append(nameParam, values[i]);
                }
            }
        }
        else {
            searchParams.append(nameParam, valueParam);
        }
        return searchParams.toString();
    }

    $(".input-cb-custom").click(function () {
        var q = this.dataset.code;
        if (q == null)
        {
            return;
        }
        
        var search = GetSearchResult(q);
        var new_url = window.location.origin + window.location.pathname + '?' + search;
        window.location.href = new_url;
    });
    $(".inputGroupPrice_2OmV button").click(function () {
        var from = $("#ragFrom").val();
        if (from == "")
        {
            return;
        }
        var to = $("#ragTo").val();
        if (to == "") {
            return;
        }

        var search = window.location.search.toString();
        var res_url = search;

        var pattern = new RegExp("from=\\d+", "g");
        var strF = search.match(pattern);
        if (strF != null) {
            for (var i = 0; i < strF.length; i++) {

                res_url = res_url.replace(strF[i] + '&', '');
                res_url = res_url.replace('&' + strF[i], '');
                res_url = res_url.replace(strF[i], '');
                
            }
        }

        pattern = new RegExp("to=\\d+", "g");
        var strT = res_url.match(pattern);
        if (strT != null) {
            for (var i = 0; i < strT.length; i++) {
                
                res_url = res_url.replace(strT[i] + '&', '');
                res_url = res_url.replace('&' + strT[i], '');
                res_url = res_url.replace(strT[i], '');
            }
        }
        if(search == "")
        {
            res_url = res_url + "?from=" + from + "&to=" + to;
        }
        else {
            res_url = res_url + "&from=" + from + "&to=" + to;
        }
        //alert("sdf");
        
        var new_url = window.location.origin + window.location.pathname + res_url;
        window.location.href = new_url;
    });
    $(".chooseLabel_1hY5").click(function () {
        var from = this.dataset.from;
        if (from == "") {
            return;
        }
        var to = this.dataset.to;
        if (to == "") {
            return;
        }
        var search = window.location.search.toString();
        var res_url = search;

        var pattern = new RegExp("from=\\d+", "g");
        var strF = search.match(pattern);
        if (strF != null) {
            for (var i = 0; i < strF.length; i++) {

                res_url = res_url.replace(strF[i] + '&', '');
                res_url = res_url.replace('&' + strF[i], '');
                res_url = res_url.replace(strF[i], '');
            }
        }

        pattern = new RegExp("to=\\d+", "g");
        var strT = res_url.match(pattern);
        if (strT != null) {
            for (var i = 0; i < strT.length; i++) {

                res_url = res_url.replace(strT[i] + '&', '');
                res_url = res_url.replace('&' + strT[i], '');
                res_url = res_url.replace(strT[i], '');
            }
        }
        //alert(res_url);
        if (search == "") {
            res_url = res_url + "?from=" + from + "&to=" + to;
        }
        else {
            res_url = res_url + "&from=" + from + "&to=" + to;
        }
        var new_url = window.location.origin + window.location.pathname + res_url;
        window.location.href = new_url;
    });
    
    
    function chooseOneOption(_option) {
        var params = new URLSearchParams(window.location.search.toString()); //window.location.search.toString();
        var hasName = params.has(_option);
        
        if (hasName) {
            params.delete(_option);
            return "?" + params.toString();
        }
        switch (_option) {
            case "popula":
                params.delete("greate");
                params.delete("lowerp");
                params.delete("newest");
                params.delete("seller");
                break;
            case "newest":
                params.delete("greate");
                params.delete("lowerp");
                params.delete("popula");
                params.delete("seller");
                break;
            case "seller":
                params.delete("greate");
                params.delete("lowerp");
                params.delete("popula");
                params.delete("newest");
                break;
            case "greate":
                params.delete("lowerp");
                params.delete("seller");
                params.delete("popula");
                params.delete("newest");
                break;
            case "lowerp":
                params.delete("greate");
                params.delete("seller");
                params.delete("popula");
                params.delete("newest");
                break;
            default:
                break;
        }
        params.set(_option, "1");
        return "?" + params.toString();
    };
    function removeOption(_url, _option)
    {
        _option = _option + "=1";
        _url = _url.replace(_option + "&", "");
        _url = _url.replace("&" + _option, "");
        _url = _url.replace(_option, "");

        return _url;
    }
    $(".Shopee-sort-by-options__option").click(function () {
        var option = this.dataset.option;
        if (option == null || option == "") {
            return;
        }
        var search = window.location.search.toString();
        
        search = chooseOneOption(option);
        var new_url = window.location.origin + window.location.pathname + search;
        window.location.href = new_url;

    });
    //$(".Shopee-mini-page-controller__next-btn").click(function () {
    //    var search = window.location.search.toString();
    //    var page = this.data.page;
    //    var pattern = new RegExp("p=\\d+");
    //    var pages = search.match(pattern);
    //    var res_url = search;
    //    if (pages != null) {
    //        for (var i = 0; i < pages.length; i++) {
    //            res_url = res_url.replace(pages[i] + '&', '');
    //            res_url = res.replace('&' + pages[i], '');
    //            res_url = res.replace(pages[i], '');
    //        }
    //    }
    //    else {
    //        if (res_url == '') {
    //            res_url = res_url + '?' + page;
    //        }
    //        else {
    //            res_url = res_url + '&' + page;
    //        }
    //    }

    //    if (res_url == '') {
    //        res_url = res_url + '?' + ragCode;
    //    }
    //    else {
    //        res_url = res_url + '&' + ragCode;
    //    }

    //    var new_url = window.location.origin + window.location.pathname + res_url;
    //    window.location.href = new_url;
    //});
    if (Params.has("page"))
    {
        var page = parseInt(Params.get("page"));
        $("#btnNext").attr("data-page", Params.get("page"));
        if (page > 1)
        {
            $("#btnBack").removeAttr("disabled");
            $("#btnBack").removeClass("Shopee-button-outline--disabled");
        }
        else {
            $("#btnBack").attr("disabled", "disabled");
            $("#btnBack").addClass("Shopee-button-outline--disabled");
        }
    }
    else {
        $("#btnBack").attr("disabled", "disabled");
        $("#btnBack").addClass("Shopee-button-outline--disabled");
    }
    $("#btnNext").click(function () {
        Params = new URLSearchParams(window.location.search.toString());
        var page;
        
        if (Params.has("page")) {
            page = Params.get("page");
        }
        else {
            page = 1;
        }
        var p = parseInt(page);
        p++;
        Params.set("page", p);

        var res_url = window.location.origin + window.location.pathname + '?' + Params.toString();
        window.location.href = res_url;
    });

    $("#btnBack").click(function () {
        Params = new URLSearchParams(window.location.search.toString());
        var page;
        if (Params.has("page"))
        {
            page = Params.get("page");
        }
        else {
            page = 2;
        }
        var p = parseInt(page);
        p--;
        Params.set("page", p);

        var res_url = window.location.origin + window.location.pathname + '?' + Params.toString();
        window.location.href = res_url;
    });
});