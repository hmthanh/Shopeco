<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Cart.aspx.cs" Inherits="DonHang_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../../Content/UI/css/newbootstrap/bootstrap.css" rel="stylesheet" />
	<link href="../../Content/UI/css/newbootstrap/bootstrap.min.css" rel="stylesheet" />
	<link href="../../Content/UI/css/StyleSheet.css" rel="stylesheet" />

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

		function DatHang() {
			var HoTen = $("#ContentPlaceHolder1_txtFullname").val();
			var DienThoai = $("#ContentPlaceHolder1_txtPhone").val();
			var DiaChi = $("#ContentPlaceHolder1_txtAddress").val();
			var GhiChu = $("#ContentPlaceHolder1_txtDesc").val();
			var ID = $("#ContentPlaceHolder1_hdidUser").val();

			if (HoTen == "" || HoTen == null) {
				return;
			}
			if (DienThoai == "" || DienThoai == null) {
				return;
			}
			if (DiaChi == "" || DiaChi == null) {
				return;
			}
			if (ID == "" || ID == null) {
				return;
			}
			$.ajax({
				type: 'GET',
				url: "../Ajax.aspx?Action=DatHang&HoTen=" + HoTen + "&DienThoai=" + DienThoai + "&DiaChi=" + DiaChi + "&GhiChu=" + GhiChu + "&ID=" + ID,
				success: function (data) {
					if (data == 'True') {
						window.location.href = "/user/bought";
					}
					else if (data == 'Empty') {
						alert("Không có sản phẩm trong giỏ hàng !");
					}
					else {
						alert("Đặt hàng không thành công !");
					}
				}
			});

		}

		function ThayDoiSoLuong(idProduct) {
			//var num = $("#txtSoLuong" + idLoaiHangHoa).val();

			//if (SoLuong.trim() == "")
			//    SoLuong = "0";

			//if (DonGia.trim() == "")
			//    DonGia = "0";

			//var ThanhTien = Number(SoLuong) * Number(DonGia);

			//$("#txtThanhTien" + idLoaiHangHoa).val(ThanhTien);
			//$("#spThanhTien" + idLoaiHangHoa).html(ThanhTien.toString().replace(/\./g, '').replace(/\,/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VNĐ");

			//var TongTien = 0;
			//$("input[type='text'][name='ThanhTien']").each(function () {

			//    TongTien += Number($(this).val());
			//});

			//$("#ContentPlaceHolder1_lblTongTien").html(TongTien.toString().replace(/\./g, '').replace(/\,/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VNĐ")
			var name = '#slQuantity' + idProduct;
			var num = $(name).val();
			//var num = 6;

			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			}
			else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function () {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					if (xmlhttp.responseText == "True") {
						window.location.reload();
					}
					else
						alert("Lỗi !")
				}
			}
			xmlhttp.open("GET", "../Ajax.aspx?Action=ThayDoiSoLuong&idSanPham=" + idProduct + "&SoLuong=" + num, true);
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- Main Container  -->
	<div class="main-container container">
		<div class="row"><%=GetDuongDan() %></div>
		<!--Middle Part Start-->



		<!--Middle Part End -->
		<form runat="server" id="orderForm" novalidate="novalidate" class="needs-validation">
			<div class="checkout-product-ordered-list">
				<div class="checkout-product-ordered-list__header-block">
					<div class="checkout-product-ordered-list__headers">
						<div class="checkout-product-ordered-list__header checkout-product-ordered-list__header--product">
							<div class="checkout-product-ordered-list__title">Sản phẩm</div>
						</div>
						<div class="checkout-product-ordered-list__header checkout-product-ordered-list__header--variation"></div>
						<div class="checkout-product-ordered-list__header">Đơn giá</div>
						<div class="checkout-product-ordered-list__header">Số lượng</div>
						<div class="checkout-product-ordered-list__header checkout-product-ordered-list__header--subtotal">Thành tiền</div>
					</div>
				</div>
				<div class="checkout-product-ordered-list__content">
					<div class="" id="cartProduct" runat="server">
					</div>

					<div class="_1r8NL4">
						<div class="_2X6jGK Ycio_F _37sKog">Tổng thanh toán:</div>
						<div class="_2X6jGK bYNx7P _3CkY6E _37sKog" id="totalPrice" runat="server"></div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="col-xs-9">
					
				</div>
				<div class="col-xs-3">
					<asp:Button ID="btnContinue" OnClick="btnContinue_Click" Text="Tiến hành đặt hàng" runat="server" class="btn btn-primary btn-lg btn-block stardust-button stardust-button--primary stardust-button--large _1rgnQx _2nbLIV" style="margin-top: 20px;"></asp:Button>
				</div>
			</div>
			
		</form>
		<div class="container" id="errorEmpty" runat="server">
			<div data-v-fe11aa12="" class="route-index ">
				<div data-v-fe11aa12="" class="account-container container grid">
					<div class="cell">
						<div id="ContentPlaceHolder1_contentMasterpageUser_title" class="title">Giỏ hàng của bạn rỗng !</div>
						<div id="ContentPlaceHolder1_contentMasterpageUser_subtitle" class="subtitle" style="margin-bottom: 100px;">
							Vui lòng mua hàng để tiếp tục thanh toán.<br>
							Click vào đây để <b><a href="<%=GetRouteUrl("home", new {}) %>">tiếp tục xem hàng</a></b>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<input id="hdidUser" runat="server" hidden="hidden" style="display: none" />
		<!-- //Main Container -->
		<%--<script src="../../Content/UI/css/newbootstrap/bootstrap.min.js"></script>--%>
		<script src="../../Content/UI/css/newbootstrap/bootstrap.bundle.min.js"></script>
		<script>
			// Example starter JavaScript for disabling form submissions if there are invalid fields
			(function () {
				'use strict'

				window.addEventListener('load', function () {
					// Fetch all the forms we want to apply custom Bootstrap validation styles to
					var forms = document.getElementsByClassName('needs-validation')

					// Loop over them and prevent submission
					Array.prototype.filter.call(forms, function (form) {
						form.addEventListener('submit', function (event) {
							if (form.checkValidity() === false) {
								event.preventDefault()
								event.stopPropagation()
							}
							form.classList.add('was-validated')
						}, false)
					})
				}, false)


				//function updateAddress() {
				//    var no = $('#ContentPlaceHolder1_txtNo').val();
				//    var huyen = $('#ContentPlaceHolder1_slProvince').children("option:selected").html();
				//    var tinh = $('#ContentPlaceHolder1_slCity').children("option:selected").html();

				//    var address = $('#ContentPlaceHolder1_txtAddress').val().split(', ');
				//    no = (no == null) ? 'Xã' : no;
				//    huyen = (huyen == null) ? 'Quận' : huyen;
				//    tinh = (tinh == null) ? 'Thành phố' : tinh;
				//    var addr = no + ', ' + huyen + ', ' + tinh;
				//    $('#ContentPlaceHolder1_txtAddress').val(addr);
				//}
				//function changeProvince() {
				//    var district = $('#ContentPlaceHolder1_slProvince').val();

				//    $.ajax({
				//        type: "GET",
				//        url: '../Ajax/LayDiaChi.aspx?a=hamlet&district=' + district,
				//        success: function (data) {
				//            var obj = JSON.parse(data);
				//        }
				//    });
				//}
				//function changeCity() {
				//    var city = $('#ContentPlaceHolder1_slCity').val();

				//    $.ajax({
				//        type: "GET",
				//        url: '../Ajax/LayDiaChi.aspx?a=district&city=' + city,
				//        success: function (data) {
				//            var obj = JSON.parse(data);
				//            var cmbHuyen = $('#ContentPlaceHolder1_slProvince');
				//            var maqh = cmbHuyen.val();
				//            cmbHuyen.find('option').remove();
				//            jQuery.each(obj, function (i, item) {
				//                if (i == 0) {

				//                    cmbHuyen.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));

				//                }
				//                else {
				//                    cmbHuyen.append($('<option>', { value: item.maqh, text: item.name }));
				//                }
				//                //$("#maincontent_mainboard_idQuanHuyen").val(item.maqh);
				//            });


				//            cmbHuyen.val(obj[0].maqh);

				//            updateAddress();
				//        }
				//    });

				//}

				//$('#ContentPlaceHolder1_slCity').change(function () {
				//    updateAddress();
				//});
				//$('#ContentPlaceHolder1_slProvince').change(function () {
				//    updateAddress();
				//});
				//$('#ContentPlaceHolder1_txtNo').on('keypress', function (e) {
				//    var charac = String.fromCharCode(e.keyCode);
				//    var no = $('#ContentPlaceHolder1_txtNo').val() + charac.toString();
				//    var huyen = $('#ContentPlaceHolder1_slProvince').children("option:selected").html();
				//    var tinh = $('#ContentPlaceHolder1_slCity').children("option:selected").html();

				//    var address = $('#ContentPlaceHolder1_txtAddress').val().split(', ');
				//    no = (no == null) ? 'Xã' : no;
				//    huyen = (huyen == null) ? 'Quận' : huyen;
				//    tinh = (tinh == null) ? 'Thành phố' : tinh;
				//    var addr = no + ', ' + huyen + ', ' + tinh;
				//    $('#ContentPlaceHolder1_txtAddress').val(addr);
				//});
				//$('#ContentPlaceHolder1_txtNo').change(function () {
				//    updateAddress();
				//});
			}())
		</script>
	</div>
</asp:Content>