$(document).ready(function(){
    $('#btnSubmitSearch').click(function(){
        var val = $('#selectCat').val();
        var q = $("#txtSearch").val();
        var Params = new URLSearchParams(window.location.search.toString());
        Params.delete('q');
        Params.set("q", q);
        if (val != '0')
        {
            Params.set("cat", val);
        }
        else {
            Params.delete('cat');
        }
        var new_url = window.location.origin + '/search' + '?' + Params.toString();
        window.location.href = new_url;
    });
    $("#txtSearch").on('keyup keypress', function (e) {
        if (e.which === 13) {
            var val = $('#selectCat').val();
            var q = $("#txtSearch").val();
            var Params = new URLSearchParams(window.location.search.toString());
            Params.delete('q');
            Params.set("q", q);
            if (val != '0') {
                Params.set("cat", val);
            }
            else {
                Params.delete('cat');
            }
            var new_url = window.location.origin + '/search' + '?' + Params.toString();
            window.location.href = new_url;
        }
    });
    $('#selectCat').click({
    });
});