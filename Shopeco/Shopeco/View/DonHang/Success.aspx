<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Success.aspx.cs" Inherits="DonHang_Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function DeleteSanPham(idSanPham, idMau, idSize) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "True")
                        window.location.reload();
                    else
                        alert("Lỗi !")
                }
            }
            xmlhttp.open("GET", "../Ajax.aspx?Action=DeleteSanPham&idSanPham=" + idSanPham + "&idMau=" + idMau + "&idSize=" + idSize, true);
            xmlhttp.send();
        }
        function UpdateQuantity(idSanPham, idMau, idSize) {
            //alert($(this).val())
            var soluong = $("#Quantity-" + idSanPham + "-" + idMau + "-" + idSize).val();
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "True")
                        window.location.reload();
                    else
                        alert("Lỗi !")
                }
            }
            xmlhttp.open("GET", "../Ajax.aspx?Action=UpdateQuantity&idSanPham=" + idSanPham + "&idMau=" + idMau + "&idSize=" + idSize + "&SoLuong=" + soluong, true);
            xmlhttp.send();
        }
        function TextBox_AddToIntValue(targetId, addToValue) {

            var input = document.getElementById(targetId);
            var textInt = parseInt(input.value);
            if (isNaN(textInt)) {
                textInt = 0;
            }
            var total_quantity = textInt + addToValue;
            //input.value=total_quantity;

            if (total_quantity <= 1) {
                input.value = 1;
            } else {
                input.value = total_quantity;
            }
            var arr = targetId.split('-');
            UpdateQuantity(arr[1], arr[2], arr[3]);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="wrapper main-content" role="main">

    <Style>
        .cart__row {
            margin-top: 0px;
            margin-bottom: 30px;
        }

        table.full {
            width: 100%;
            margin-bottom: 0px;
        }
    </Style>
    <!-- /templates/cart.liquid -->
    <form id="update_cart" action="Checkout"  method="post" novalidate class="cart table-wrap">
        <div>
        <a style="float: right; margin-bottom: 16px;" href="/checkout" name="checkout" class="checkout_btn btn">Check Out</a>

        <h2>Shopping Cart</h2>
            </div>
        <div style="background-color:#f9e0e4;margin-top: 30px;"><h1 style="color:green;padding:10px">Payment success</h1></div>
        <div class="grid cart__row">

            <div class="grid__item two-thirds small--one-whole">
                <label for="CartSpecialInstructions">Special instructions for seller</label>
                <textarea name="note" class="input-full" id="CartSpecialInstructions"></textarea>
            </div>
            <div class="grid__item text-right one-third small--one-whole">
                <p>
                    <span class="cart__subtotal-title">Subtotal</span>
                    <span class="h3 cart__subtotal" id="spTotal" runat="server">
                        $00.0
                    </span>
                </p>
                <script src="/content/js/jquery.countdownTimer_2hours.js" type="text/javascript"></script>
                <script>


                    var time_minute = 1500 / 60;
                    //   alert(time_minute);
                    var hours = Math.floor(time_minute / 60);
                    var minutes = Math.floor(time_minute % 60);

                    $(function () {
                        $('#hm_timer').countdowntimer({
                            hours: hours,
                            minutes: minutes,
                            seconds: 00
                        });
                    });
                </script>
                <p class="timer_box">
                    <span class="cart_text">Cart will expire in </span>
                    <span id="hm_timer" class="cart_time"></span>
                </p>
                
                <a type="button" href="/checkout" name="checkout" class="checkout_btn btn" >Check Out</a>

                <p class="currency_info">
                    Tees 365 process all orders in USD.
                    While the content of your cart is currently displayed in
                    <span class="selected-currency"></span>,
                    you will check out using USD at the most current exchange rate.
                </p>
            </div>
        </div>

        <div class="grid cart__row cart_boxS">
            <div class="grid__item large--one-half checkout-logos">
                <div class="we-accept">
                    <p> We Gladly Accept </p>
                    <img src="/Content/image/cart_left_image.png">
                </div>
            </div>

            <div class="grid__item large--one-half text-right secure-shopping">
                <p> Secure Shopping  </p>
                <img src="/Content/image/cart_right_image.png">
            </div>

        </div>

    </form>
</main>
</asp:Content>

