<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Order - Copy.aspx.cs" Inherits="DonHang_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../../Content/UI/css/newbootstrap/bootstrap.css" rel="stylesheet" />
	<link href="../../Content/UI/css/newbootstrap/bootstrap.min.css" rel="stylesheet" />
	<link href="../../Content/UI/css/StyleSheet.css" rel="stylesheet" />
	<link href="../../Content/UI/css/Cart.css" rel="stylesheet" />
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
		<div class="row">
			<div class="col-xs-12">
				<h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Giỏ hàng <span>(3 sản phẩm)</span></h5>
			</div>

			<div class="col-xs-8 cart-col-1">
				<form id="shopping-cart">
					<div class="row shopping-cart-item">
						<div class="col-xs-3 img-thumnail-custom">
							<p class="image">
								<img class="img-responsive" src="/images/SanPham/798efcf14a17f4f48a3364c7156c4b62.jpg">
							</p>
						</div>
						<div class="col-right">
							<div class="box-info-product">
								<input type="hidden" class="hidden-quantity" name="quantity[326504629201370]" value="1">
								<p class="name">
									<a href="https://tiki.vn/may-anh-canon-m10-kit-15-45mm-trang-p479435.html?src=cart-page&amp;spid=191744" target="_blank">Máy ảnh Canon M10 KIT 15-45mm - Trắng                                                                                            </a>
								</p>
								<p class="get-id" data-js-stock="191744"></p>
								<p class="seller-by">
									Sản phẩm của gia hàng <span class="firm"><a href="javascript:void(0)">Tiki Trading</a></span>
								</p>
								<p class="action">
									<a href="javascript:void(0);" class="btn btn-link btn-item-delete" data-sku="6001444509443" data-title="Máy ảnh Canon M10 KIT 15-45mm - Trắng" data-item-id="326504629201370" data-product-id="191744" data-product-brand="Canon" data-item-qty="1" data-item-price="5990000" data-product-category="Máy Ảnh - Máy Quay Phim/Máy ảnh Mirrorless">Xóa
									</a>
									<a href="javascript:void(0);" class="btn btn-link btn-save-for-later" data-sku="6001444509443" data-title="Máy ảnh Canon M10 KIT 15-45mm - Trắng" data-product-id="191744">Để dành mua sau
									</a>
								</p>
							</div>
							<div class="box-price">
								<p class="price">5.990.000&nbsp;₫</p>
								<p class="price2">10.500.000&nbsp;₫</p>
							</div>
							<div class="quantity-block">
								<div class="input-group bootstrap-touchspin">
									<span class="input-group-btn">
										<button class="btn btn-default bootstrap-touchspin-down" type="button">-</button></span><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input type="tel" class="form-control quantity-r2 quantity js-quantity-product" data-js-qty="" value="1" style="display: block;"><span class="input-group-addon bootstrap-touchspin-postfix" style="display: none;"></span><span class="input-group-btn">
											<button class="btn btn-default bootstrap-touchspin-up" type="button">+</button></span>
								</div>
							</div>
						</div>
					</div>


				</form>

				<input value="191744,3073539" type="hidden" id="idProduct-cart">
			</div>






			<div class="col-xs-4 cart-col-2">
				<div id="right-affix" class="affix-top">

					<div class="each-row">

						<div class="box-style fee">

							<p class="list-info-price">
								<span>Tạm tính: </span>
								<strong>19.079.000&nbsp;₫</strong>
							</p>
						</div>
						<div class="box-style fee">
							<div class="total2 clearfix">
								<span class="text-label">Thành tiền: </span>
								<div class="amount">
									<p>
										<strong>19.079.000&nbsp;₫ </strong>
									</p>
									<p class="text-right">
										<small>(Đã bao gồm VAT)</small>
									</p>
								</div>
							</div>
						</div>
						<button type="button" class="btn btn-large btn-block btn-danger btn-checkout" onclick="location.href='/checkout/shipping?is_sent_as_gift=0';return false;">Tiến hành đặt hàng</button>
					</div>
				</div>
			</div>
		</div>
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
				<div class="row">

					<div class="col-md-2"></div>
					<div class="col-md-4">
						<h4 class="mb-3 h-header">Thông tin người mua hàng</h4>
						<div class="row">
							<div class="col-md-12 mb-6">
								<label for="ContentPlaceHolder1_txtHoTen">Họ và tên</label>
								<input type="text" class="form-control" id="txtHoTen" runat="server" placeholder="Nguyễn Văn A" value="" required="">
								<div class="invalid-feedback">
									Vui lòng nhập họ và tên
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label for="ContentPlaceHolder1_txtSoDienThoai">Số điện thoại</label>
							<div class="input-group">
								<input type="text" class="form-control" id="txtSoDienThoai" runat="server" placeholder="Số điện thoại" required="">
								<div class="invalid-feedback" style="width: 100%;">
									Vui lòng nhập số điện thoại
								</div>
							</div>
						</div>
						<h4 class="mb-3 h-header">Hình thức thanh toán</h4>
						<div class="row">
							<div class="checkbox">
								<label for="ContentPlaceHolder1_payOnline">
									<asp:RadioButton ID="payOnline" type="radio" name="paymentmenthod" value="" runat="server" required="" OnCheckedChanged="payOnline_CheckedChanged" AutoPostBack="true" />
									Thanh toán online
								</label>
								<div class="invalid-feedback">
									Vui lòng chọn hình thức thanh toán
								</div>
								<img src="../../images/HeThong/logoNL.png" />
							</div>
						</div>
						<div class="row">
							<div class="checkbox">
								<label for="ContentPlaceHolder1_payOffline">
									<asp:RadioButton ID="payOffline" type="radio" name="paymentmenthod" runat="server" required="" OnCheckedChanged="payOffline_CheckedChanged" AutoPostBack="true" />
									Thanh toán khi nhận hàng
								</label>
								<div class="invalid-feedback">
									Vui lòng chọn hình thức thanh toán
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<h4 class="mb-3 h-header">Thông tin người nhận hàng</h4>
						<div class="row">
							<div class="col-md-12 mb-6">
								<label for="ContentPlaceHolder1_txtFullname">Họ và tên</label>
								<input type="text" class="form-control" id="txtFullname" runat="server" placeholder="Nguyễn Văn A" value="" required="">
								<div class="invalid-feedback">
									Vui lòng nhập họ và tên
								</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="ContentPlaceHolder1_txtPhone">Số điện thoại</label>
							<div class="input-group">
								<input type="text" class="form-control" id="txtPhone" runat="server" placeholder="Số điện thoại" required="">
								<div class="invalid-feedback" style="width: 100%;">
									Vui lòng nhập số điện thoại
								</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="ContentPlaceHolder1_slCity">Tỉnh</label>
							<asp:DropDownList class="custom-select d-block w-100" ID="slCity" runat="server" required="required" OnSelectedIndexChanged="slCity_SelectedIndexChanged" AutoPostBack="True">
							</asp:DropDownList>
							<div class="invalid-feedback">
								Vui lòng chọn tỉnh 
							</div>
						</div>

						<div class="mb-3">
							<label for="ContentPlaceHolder1_slProvince">Huyện</label>
							<asp:DropDownList class="custom-select d-block w-100" ID="slProvince" runat="server" required="" AutoPostBack="True" OnLoad="slProvince_Load">
							</asp:DropDownList>
							<div class="invalid-feedback">
								Vui lòng chọn tỉnh trước để chọn huyện
							</div>
						</div>
						<div class="mb-3">
							<label for="ContentPlaceHolder1_txtNo">Số nhà</label>
							<asp:TextBox type="text" class="form-control" ID="txtNo" runat="server" placeholder="Số nhà" required=""></asp:TextBox>
							<div class="invalid-feedback">
								Vui lòng nhập địa chỉ
							</div>
						</div>
						<%--<div class="mb-3">
                            <label for="ContentPlaceHolder1_txtAddress">Địa chỉ</label>
                            <asp:TextBox type="text" class="form-control" id="txtAddress" runat="server" placeholder="Địa chỉ" disabled="disabled"  AutoPostBack="True" ></asp:TextBox>
                        </div>--%>

						<div class="mb-3">
							<label for="ContentPlaceHolder1_txtDesc">Mô tả</label>
							<textarea class="form-control" id="txtDesc" runat="server" placeholder=""></textarea>

						</div>
						<div class="mb-3">
							<div class="invalid-feedback" id="msgError" runat="server" style="display: block !important">
								Đặt hàng không thành công
							</div>
						</div>
						<asp:Button runat="server" ID="btnOrder" Text="Đặt hàng" CssClass="btn btn-primary btn-lg btn-block stardust-button stardust-button--primary stardust-button--large _1rgnQx _2nbLIV" OnClick="btnOrder_Click" />
						<%--<button ID="btnOrder" css="btn btn-primary btn-lg btn-block stardust-button stardust-button--primary stardust-button--large _1rgnQx _2nbLIV" >Đặt hàng</button>--%>
					</div>

					<div class="col-md-2"></div>
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

			}())
		</script>
	</div>
</asp:Content>
