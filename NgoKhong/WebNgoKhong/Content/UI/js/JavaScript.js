$(document).ready(function () {
    
    var quantitiy = 0;
    $('.bootstrap-touchspin-up').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#txtSoLuong').val());

        // If is not undefined

        $('#txtSoLuong').val(quantity + 1);


        // Increment

    });

    $('.bootstrap-touchspin-down').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#txtSoLuong').val());

        // If is not undefined

        // Increment
        if (quantity > 1) {
            $('#txtSoLuong').val(quantity - 1);
        }
    });
});