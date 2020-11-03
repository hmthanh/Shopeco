<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="ChiTietSanPham.aspx.cs" Inherits="SanPham_ChiTietSanPham" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script>
		var listSize = []
		function ChonSize(id, value) {
			listSize = [];
			listSize.push(id);

			//var indextt = jQuery.inArray(id, listSize);
			//if (value == true) {
			//    if (indextt == -1)
			//        listSize.push(id);
			//}
			//else
			//    listSize.splice(indextt, 1);
		}
		function ThemGioHang() {
			var idSanPham = $("#ContentPlaceHolder1_txtidSanPham").val();
			var idMau = $("#ContentPlaceHolder1_ulMau").children(".active").children("label").children("input").attr("value");


			var SoLuong = $("#txtSoLuong").val();


			// alert(idMau);

			//if (idMau == "undefined" || listSize.length == 0) {
			//    alert("Bạn vui lòng chọn màu và size")
			//}

			//else {
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
						window.location.href = "/cart";
					}
					else
						alert("Lỗi !")
				}
			}
			xmlhttp.open("GET", "../Ajax.aspx?Action=ThemGioHang&idSanPham=" + idSanPham + "&idMau=" + idMau + "&idSize=" + listSize + "&SoLuong=" + SoLuong, true);
			xmlhttp.send();


			//}

		}
	</script>
	<link href="../../Content/UI/css/ProductDetail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- Main Container  -->
	<input type="hidden" id="txtidSanPham" runat="server" />
	<div class="main-container container">
		<div class="row"><%=GetDuongDan() %></div>

		<div class="product-container">
			<meta itemprop="url" content="https://tiki.vn/combo-3-but-gel-thanh-kiem-co-day-treo-muc-den-p10065476.html">
			<div class="row product-summary" itemscope="" itemtype="http://schema.org/Product">
				<div class="product-image">
					<div class="content-product-left class-honizol " id="dvHinhAnh" runat="server">
					</div>
				</div>
				<div class="product-cart">
					<div class="item-box">
						<div id="hTenSanPham" class="item-name" itemprop="name" runat="server"></div>
						<div class="product-brand-block">

							<div class="item-row1 brand-block">
								<div class="item-price">
									<div class="brand-block-row">
										<div class="item-other">
											<div itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
												<meta itemprop="ratingValue" content="0">
												<meta itemprop="ratingCount" content="">
											</div>
											<div class="item-rating" style="display: none;">
												<p class="rating">
													<span class="rating-box">
														<i class="star"></i>
														<i class="star"></i>
														<i class="star"></i>
														<i class="star"></i>
														<i class="star"></i>
														<span style="width: %">
															<i class="star"></i>
															<i class="star"></i>
															<i class="star"></i>
															<i class="star"></i>
															<i class="star"></i>
														</span>
													</span>
													<a id="reiews-url" class="review-url" href="combo-3-but-gel-thanh-kiem-co-day-treo-muc-den-p10065476/nhan-xet">(Xem <span class="-reviews-count"></span>đánh giá)</a>
												</p>
											</div>
										</div>
									</div>
									<div class="brand-block-row">
									</div>
									<div class="brand-block-row">
										<div class="item-brand">
											<h6>Thương hiệu: </h6>
											<p>
												<a href="#">OEM</a>
											</p>
										</div>
										<div class="item-brand item-sku" id="product-sku">
											<h6>Mã sản phẩm: </h6>
											<p id="MaSP" runat="server"></p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row flex">
							<div class="col-xs-7 no-padding-right product-info-block">
								<div class="item-row1">
									<div class="item-price">

										<p class="g-preorder" id="inventory-status-text" style="display: none"></p>

										<div class="price-block show-border">


											<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
												<meta itemprop="priceCurrency" content="VND">
												<meta itemprop="price" content="22000">
												<link itemprop="availability" href="http://schema.org/InStock">
											</div>
											<p class="special-price-item" data-value="22000" id="p-specialprice">
												<span id="flash-sale-price-label" style="display: none;" class="">
													<img class="icon-flash-sale" src="https://salt.tikicdn.com/desktop/img/flash-sale-price-label.png?v=2" width="80">
													<img class="icon-hot-deal" src="https://salt.tikicdn.com/desktop/img/deal-hot@2x.png" width="91">Giá: </span>
												<span class="span-price" id="spanGiaMoi" runat="server">22.000 ₫</span>
											</p>

											<!-- BEGIN INSTALLMENT -->
											<div class="installment-wrap" style="display: none">
											</div>

											<p style="" class="saleoff-price-item" id="p-saving-price">
												<span class="price-label">Tiết kiệm:</span>
												<span id="span-discount-percent" class="discount-percent">19%</span>
												<span id="span-saving-price">(5.000&nbsp;₫)
												</span>
											</p>

											<p style="" class="old-price-item" data-value="27000" id="p-listpirce">
												<span class="price-label">Giá thị trường:</span>
												<span class="span-list-price" id="spanGiaCu" runat="server">27.000&nbsp;₫</span>
											</p>



											<div id="discount-container">
											</div>
											<div id="deal-process" style="display: none;">
												<div data-reactroot=""></div>
											</div>

										</div>
										<!-- SAVE & SUB -->
										<div id="saveSubRoot">
											<div data-reactroot="" class="save-sub  hidden hidden ">
												<div class="hidden">
													<div class="save-sub__qty">
														<span class="save-sub__qty__title">Chọn số lượng sản phẩm mỗi lần giao:</span><select class="save-sub__qty__select"><option value="1">1 sản phẩm</option>
															<option value="2">2 sản phẩm</option>
															<option value="3">3 sản phẩm</option>
															<option value="4">4 sản phẩm</option>
															<option value="5">5 sản phẩm</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<!-- END SAVE & SUB -->
										<div class="top-feature-item bullet-wrap" id="dvThongTinSanPham" runat="server">
											<p>Không có mô tả</p>
										</div>
									</div>
								</div>


								<p class="out-of-stock-msg" style="color: red; display: none;">Sản phẩm đã hết hàng</p>

								<p class="discontinued-msg" style="color: red; display: none;">Ngừng kinh doanh</p>



								<form role="form" id="add-to-cart" action="/checkout/ajaxAdd">
									<!-- Only for js checking baby milk product -->

									<input type="hidden" name="product_type" value="simple">
									<div class="item-product-options">
										<div id="options">
										</div>

										<div id="freeGift">

											<div class="free-gift-block">
												<!-- CATALOG GIFT -->

											</div>
										</div>


									</div>

									<!-- BEGIN ADD TO CART -->

									<div class="item-product-options">
										<div id="add-cart-action">
											<div class="add-cart-action" style="display: block">
												<div class="quantity-box">
													<div id="deal-max" style="display: none;" class="alert alert-warning alert-small deal-max">
														Sản phẩm này có giới hạn số lượng khi đặt hàng:<br>
														Bạn có thể mua tối đa <span></span>sản phẩm cho mỗi đơn hàng
													</div>
													<input id="product_id_for_wishlist" name="id" type="hidden" value="10065476">

													<div id="qtySelector" class="quantity-col1">
														<p class="quantity-label">Số lượng:</p>
														<p class="tiki-number-input">
															<div class="input-group bootstrap-touchspin">
																<span class="input-group-btn">
																	<button class="btn btn-default bootstrap-touchspin-down" type="button">-</button></span><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>
																<input type="text" name="quantity" id="txtSoLuong" value="1" min="1" max="100" class="form-control" style="display: block;" /><span class="input-group-addon bootstrap-touchspin-postfix" style="display: none;"></span><span class="input-group-btn">
																	<button class="btn btn-default bootstrap-touchspin-up" type="button">+</button></span>
															</div>
														</p>
													</div>
													<div class="cta-box">


														<button id="#mainAddToCart" class="add-to-cart  js-add-to-cart is-css" onclick="ThemGioHang();" type="button">
															<span class="text">CHỌN MUA</span>
														</button>

														<a href="javascript:" class="add-to-wishlist  is-css">
															<span class="icon js-product-gift-icon" data-placement="bottom" data-toggle="tooltip" data-title="Thêm Vào Yêu Thích" data-original-title="" title="">
																<i class="ico ico-ic-fav"></i>
															</span>
														</a>
													</div>


												</div>
											</div>
										</div>
									</div>
									<!-- END ADD TO CART -->

								</form>

								<!--bbbb-->
							</div>
							<div class="col-xs-5 product-seller-block">
								<div class="seller-container">
									<div id="seller-list">
										<div data-reactroot="">
											<div class="seller-block-wrap">
												<div class="current-seller" data-id="1">
													<div class="name">
														<i class="tikicon icon-store"></i>
														<div class="text">
															<a id="shopName" runat="server" href=""></a>
															<div class="text-small">Cam kết chính hiệu 100%</div>
														</div>
													</div>
													<div class="warranty-info">
														<i class="tikicon icon-hoan-tien-2"></i>
														<div class="text" id="shopAdress" runat="server">
															<!-- react-text: 13 -->
															Shopee hoàn tiền 111%
                                                                    <!-- /react-text -->
															<!-- react-text: 14 -->
															<!-- /react-text -->
															<span class="seller__attribute__info" data-original-title="" title=""><i class="tikicon icon-info-grey" style="margin-right: 0px;"></i>
																<p class="seller__attribute__info__tooltip">
																	<!-- react-text: 18 -->
																	Chính sách bồi thường -
                                                                            <!-- /react-text -->
																	<a target="_blank" href="https://drive.google.com/file/d/1po3r6qApp-q7JDB5kwGKujVtvInfO-ih/view?usp=sharing">Xem thêm</a>
																</p>
															</span>
															<div class="text-small">Nếu phát hiện hàng giả</div>
														</div>
													</div>
													<a id="linkShop" runat="server" target="_blank" class="view-shop">Xem shop</a>
												</div>
												<div class="other-seller" style="display: none;">
													<p>NHÀ CUNG CẤP KHÁC</p>
													<ul id="otherSellerList" class="other-seller-list "></ul>
													<!-- react-text: 23 -->
													<!-- /react-text -->
												</div>
											</div>
										</div>
									</div>
									<div class="additional">
										<div class="contact">
											<div class="item">
												<i style="margin-top: 5px" class="tikicon icon-phone"></i>
												<!-- <p>
                                        <b>Liên hệ</b><br>
                                        HOTLINE: <a href="tel:1900 6035">1900 6035</a><br>
                                        <small>(1.000đ/phút, 8-21h cả T7, CN)</small>
                                    </p> -->
												<p>
													<b>Liên hệ</b><br>
													Hotline đặt hàng <a id="shopPhone" runat="server" href="tel:0963 537 537">0963 537 537</a><br>
													<small>(Miễn phí, 8-21h cả T7, CN)</small>
												</p>
											</div>
											<div class="item">
												<i style="margin-top: -2px" class="tikicon icon-email"></i>
												<p>
													Email: <a runat="server" id="emailShop" href="mailto:hotro@Shopee.vn"></a>
												</p>
											</div>
										</div>
										<div class="register-to-sell">
											Bạn muốn bán hàng cùng Ngộ Không? <a target="_blank" id="btnDangKy" runat="server">Đăng ký</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="babyMilkConfirm" tabindex="-1" role="dialog" aria-labelledby="babyMilkConfirm" aria-hidden="true">
				<div class="modal-dialog gift-popup">
					<div class="modal-content">
						<div class="modal-body">
							Hình ảnh sản phẩm chỉ mang tính chất trưng bày
                <br>
							<input type="checkbox" onclick="return false;">
							<span>Không hiển thị thông báo này nữa</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">Đồng ý</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="gift-modal" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog gift-popup">
					<div class="modal-content">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<img src="https://vcdn.tikicdn.com/media/upload/2017/12/28/0776f7b927ad5a564e7d42db11ba6073.png" alt="Dịch vụ gói quà, tặng quà với TikiNOW" class="cover">
						<div class="popup-body">
							<p class="title">DỊCH VỤ GÓI QUÀ, GỬI THIỆP</p>
							<div class="content">
								<img src="https://vcdn.tikicdn.com/desktop/img/ic_gift@lg.png" alt="Dịch vụ gói quà, tặng quà với TikiNOW" class="icon">
								<p>
									Nhằm phục vụ nhu cầu tặng quà của bạn, Tiki cung cấp dịch vụ gói quà và gửi thiệp với thông điệp của riêng bạn. Đây là dịch vụ có tính phí và <b>chỉ áp dụng cho các đơn hàng có sử dụng hình thức giao hàng 2 tiếng TikiNOW</b>. Bạn có thể xem biểu phí <a href="https://tiki.vn/top/dich-vu-goi-qua-tang-qua-voi-tikinow" title="Dịch vụ gói quà, tặng quà với TikiNOW" target="_blank">tại đây</a>.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="product-image-modal">
				<div data-reactroot=""></div>
			</div>

		</div>

		
		<!-- Product Tabs -->
		<div id="productTab" class="producttab ">
			<ul class="navTabs_zWyr nav nav-tabs">
				<li class="nav-item active"><a data-toggle="tab" href="#tab-thongtin" class="nav-link">THÔNG TIN</a></li>
				<%--<li class="nav-item"><a data-toggle="tab" href="#tab-danhgia" class="nav-link">ĐÁNH GIÁ</a></li>
                <li class="nav-item"><a data-toggle="tab" href="#tab-binhluan" class="nav-link">BÌNH LUẬN</a></li>--%>
			</ul>
			<div class="tab-content">
				<div id="tab-thongtin" class="tab-pane active">
					<div class="productDescription_3263">
						<div class="editor_m9Ff">
							<div style="font-family: SFUIText, arial;" id="dvThongTinSP" runat="server">
								<div class="attrs-block">
									<h4 style="font-size: 13px; line-height: 40px; font-weight: 400; margin: 0; border-bottom: 1px solid #a2a2a2; margin-bottom: 10px;">THUỘC TÍNH SẢN PHẨM</h4>
									<ul style="font-size: 13px; list-style: none; padding: 0; margin: 0 0 10px; line-height: 1.4;">
										<li style="padding: 5px 12px; background-color: #ebebeb"><strong>Chất vải:</strong><span>Khác.</span> </li>
										<li style="padding: 5px 12px;"><strong>Họa tiết:</strong> <span>Khác.</span></li>

									</ul>
								</div>
								<div class="details-block">
									<h4 style="font-size: 13px; line-height: 40px; font-weight: 400; margin: 0; border-bottom: 1px solid #a2a2a2; margin-bottom: 10px;">CHI TIẾT SẢN PHẨM</h4>
									<div id="editor-content">
										<p>XEM THÊM CÁC SP CỦA SHOP CÁC BẠN CLIK VÀO ĐÂY NHÉ&nbsp;<a href="http://sendo.vn/shop/verygood">http://sendo.vn/shop/verygood</a></p>
										<p><strong>Giới thiệu sản phẩm&nbsp;Áo Thun Nam Cổ Lọ-1764</strong></p>
										<p>Mô tả chi tiết:&nbsp;<em><strong>Áo Thun Nam Cổ Lọ-1764</strong></em></p>
										<p>Áo len nam cổ lọ VNXK</p>
										<p>Phong cách thời trang và nổi bật.</p>
										<p>Freesize 50-70kg. Chất liệu len cotton giữ ấm tốt và cự kỳ thoáng,sợi len đanh đảm bảo chất lượng,độ co giãn đàn hồi tốt. Cam kết không bai nhão không xừ lông sau thời gian dài sử dụng</p>
										<p>, Màu sắc :đen, ghi, xám</p>
										<p>
											<span contenteditable="false">
												<img src="//media3.scdn.vn/img2/2018/9_19/0qayjQ_simg_87e88a_800x800_max.jpg" alt="" width="800" height="800"><span></span><span title="Click and drag to resize">&#8203;</span></span>
										</p>
										<p>
											<span contenteditable="false">
												<img src="//media3.scdn.vn/img2/2018/9_19/VzGA3X_simg_04ee38_750x1125_max.jpg" alt="" width="750" height="1125"><span></span><span title="Click and drag to resize">&#8203;</span></span>
										</p>
										<p>
											<span contenteditable="false">
												<img src="//media3.scdn.vn/img2/2018/9_19/d3UePj_simg_0519c9_800x915_max.jpg" alt="" width="800" height="915"><span></span><span title="Click and drag to resize">&#8203;</span></span>
										</p>
										<p>
											<span contenteditable="false">
												<img src="//media3.scdn.vn/img2/2018/9_19/jSMON6_simg_06da6c_800x802_max.jpg" alt="" width="800" height="802"><span></span><span title="Click and drag to resize">&#8203;</span></span>
										</p>
										<p>
											<span contenteditable="false">
												<img src="//media3.scdn.vn/img2/2018/9_19/Awatds_simg_87e88a_800x800_max.jpg" alt="" width="800" height="800"><span></span><span title="Click and drag to resize">&#8203;</span></span>
										</p>
										<p>
											<br>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="tab-danhgia" class="tab-pane">
					<div class="ratingEmpty_3k2P">
						<div class="content-empty small">
							<div class="ratingImage_1UfE">
								<img class="img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMzU2IiBoZWlnaHQ9IjM1NiIgdmlld0JveD0iMCAwIDM1NiAzNTYiPgogICAgPGRlZnM+CiAgICAgICAgPHBhdGggaWQ9ImEiIGQ9Ik0wIDBoMzU2djM1NkgweiIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8cGF0aCBkPSJNNTUgMzA5aDE5Ii8+CiAgICAgICAgPG1hc2sgaWQ9ImIiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPC9tYXNrPgogICAgICAgIDx1c2UgZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiB4bGluazpocmVmPSIjYSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIyNDYiIGhlaWdodD0iMzgiIHg9Ijc1IiB5PSI3MSIgZmlsbD0iI0VFRjhGRiIgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIiByeD0iMTkiIHRyYW5zZm9ybT0icm90YXRlKC0yNi4yMyAxOTggOTApIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjI0NiIgaGVpZ2h0PSIzOCIgeD0iMzQiIHk9IjEzNCIgZmlsbD0iI0VFRjhGRiIgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIiByeD0iMTkiIHRyYW5zZm9ybT0icm90YXRlKC0yNi4yMyAxNTcgMTUzKSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIyNDYiIGhlaWdodD0iMzgiIHg9IjkxIiB5PSIxNDciIGZpbGw9IiNFRUY4RkYiIGZpbGwtcnVsZT0ibm9uemVybyIgbWFzaz0idXJsKCNiKSIgcng9IjE5IiB0cmFuc2Zvcm09InJvdGF0ZSgtMzMuNTkgMjE0IDE2NikiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMjEyIiBoZWlnaHQ9IjM4IiB4PSI4MyIgeT0iMjA1IiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTMzLjU5IDE4OSAyMjQpIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjE3NiIgaGVpZ2h0PSIzOCIgeD0iOTEiIHk9IjI1MyIgZmlsbD0iI0VFRjhGRiIgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIiByeD0iMTkiIHRyYW5zZm9ybT0icm90YXRlKC0zMy41OSAxNzkgMjcyKSIvPgogICAgICAgIDxnIGZpbGwtcnVsZT0ibm9uemVybyIgbWFzaz0idXJsKCNiKSI+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGN0M3M0UiIGQ9Ik0xMTUuNjc2IDE2My42MjVhNC44ODIgNC44ODIgMCAwIDAtLjIyIDYuNjAzbDIzLjA1NSAyNi43ODVhNC44ODIgNC44ODIgMCAwIDEgMS4xNjUgMy41OWwtMi45MTMgMzUuMjFhNC44ODIgNC44ODIgMCAwIDAgNi43NSA0LjkwMWwzMi41OTItMTMuNjU0YTQuODgyIDQuODgyIDAgMCAxIDMuNzcgMGwzMi41OTIgMTMuNjU0YTQuODgyIDQuODgyIDAgMCAwIDYuNzUtNC45MDFsLTEuODc1LTIyLjY2OGExNjQuODY2IDE2NC44NjYgMCAwIDEtNDIuMzIyLTkuOTM3Yy0yNi4wNDItOS43My00Ny4xNS0yNC4zNjktNTkuMzQ0LTM5LjU4M3oiLz4KICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGQ0UxMiIgZD0iTTIzNy45NCAxNjIuMjkybC0zNC4zOTMtOC4xMDlhNC44ODIgNC44ODIgMCAwIDEtMy4wNTQtMi4yMTZsLTE4LjM0MS0zMC4yMDFhNC44ODIgNC44ODIgMCAwIDAtOC4zNDQgMGwtMTguMzQxIDMwLjJhNC44ODIgNC44ODIgMCAwIDEtMy4wNTQgMi4yMTdsLTM0LjM4IDguMTFjLS45LjIxLTEuNzIuNjc1LTIuMzYzIDEuMzM5IDEyLjE5NCAxNS4yMDcgMzMuMzAxIDI5Ljg1MiA1OS4zNDMgMzkuNTgyYTE2NC44NjYgMTY0Ljg2NiAwIDAgMCA0Mi4zMTUgOS45MzFsLTEuMDM4LTEyLjU0MmE0Ljg4MiA0Ljg4MiAwIDAgMSAxLjE2NS0zLjU5bDIzLjA1Ni0yNi43ODVhNC44ODIgNC44ODIgMCAwIDAtMi41NzEtNy45MzZ6Ii8+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGN0M3M0UiIGQ9Ik02Ni42NDUgMjE1Ljg0NGEyNTEuNzcgMjUxLjc3IDAgMCAxLTE3LjM0NCAxMS45OGwxLjM0IDE4LjkwNGEzLjM0OCAzLjM0OCAwIDAgMCA1LjA4MiAyLjYwNWwyMC41OTgtMTIuNjc3YTMuMzQ4IDMuMzQ4IDAgMCAxIDIuNTUyLS4zOTVsMjMuNDc3IDUuOGEzLjM0OCAzLjM0OCAwIDAgMCA0LjAxOC00LjAxOWwtNS42ODUtMjMuNTA0Yy0uMjEtLjg3LS4wNjQtMS43OS40MDktMi41NTFsMTIuNzctMjAuNTM4YTMuMzQ4IDMuMzQ4IDAgMCAwLTIuNTc5LTUuMDk2bC0xMS4zMjMtLjg3YTIzMC41MzggMjMwLjUzOCAwIDAgMS0zMy4zMTUgMzAuMzZ6Ii8+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGRkNFMTIiIGQ9Ik04NC45MjYgMTgzLjMwNmwtMTUuNTg5LTE4LjQ4OWEzLjM0OCAzLjM0OCAwIDAgMC01LjY0NS44NzdsLTkuMjE0IDIyLjM2YTMuMzQ4IDMuMzQ4IDAgMCAxLTEuODAyIDEuODIxbC0yMi40MzMgOS4xMTRhMy4zNDggMy4zNDggMCAwIDAtLjkwNCA1LjYzOGwxOC40MTUgMTUuNjc3Yy42ODEuNTggMS4xIDEuNDEgMS4xNjYgMi4zMDNsLjM3NSA1LjIxN2EyNTIuNTAzIDI1Mi41MDMgMCAwIDAgMTcuMzQzLTExLjk4IDIzMC41MzggMjMwLjUzOCAwIDAgMCAzMy4zNjktMzAuMzc1bC0xMi43OS0uOTg1YTMuMzQ4IDMuMzQ4IDAgMCAxLTIuMjktMS4xNzh6TTMwOC42NzQgMTkyLjA1MWwtNS4zNTctMi4xNzZhMy4zNDggMy4zNDggMCAwIDEtMS44MjgtMS44MjFsLTkuMjE0LTIyLjM2YTMuMzQ4IDMuMzQ4IDAgMCAwLTUuNjQ2LS44NzdsLTE1LjU4OSAxOC40ODlhMy4zNDggMy4zNDggMCAwIDEtMi4yOTcgMS4xNzhsLTI0LjEwNyAxLjg1NWEzLjM0OCAzLjM0OCAwIDAgMC0yLjU3OCA1LjA5NmwxMi43NyAyMC41MzhjLjQ0Ni43MjUuNTk5IDEuNTkxLjQyOSAyLjQyNCAxMy4xODUtNy45NjggMzAuMjYtMTUuNDU1IDQ5LjQ2Ni0yMS4yIDEuMzIyLS4zOCAyLjYzOS0uNzYyIDMuOTUxLTEuMTQ2eiIvPgogICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjdDNzNFIiBkPSJNMjQ5LjU1MSAyMzguMDI5YTMuMzQ4IDMuMzQ4IDAgMCAwIDQuMDE4IDQuMDE4bDIzLjQ3OC01LjhhMy4zNDggMy4zNDggMCAwIDEgMi41NTEuMzk2bDIwLjU5OCAxMi42NzZhMy4zNDggMy4zNDggMCAwIDAgNS4wODMtMi42MDVsMS43NDEtMjQuMTA3YTMuMzQ4IDMuMzQ4IDAgMCAxIDEuMTY1LTIuMzAzbDE4LjQxNS0xNS42NzdhMy4zNDggMy4zNDggMCAwIDAtLjkwNC01LjYzOGwtMTcuMDU1LTYuOTM4Yy0xLjMxNy4zNy0yLjYzNy43NTMtMy45NTggMS4xNDUtMTkuMjA1IDUuNzQtMzYuMjc1IDEzLjIzMy00OS40NjYgMjEuMjAxdi4xMmwtNS42NjYgMjMuNTEyeiIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="Sản phẩm hiện chưa có đánh giá">
							</div>
							<strong class="title small">Sản phẩm chưa có đánh giá.</strong>
						</div>
					</div>
				</div>
				<div id="tab-binhluan" class="tab-pane">
					<div class="sectionProductComment_1MIy">
						<div>
							<div class="commentEmpty_kkJA">
								<div class="content-empty small">
									<div class="ratingImage_E9zN">
										<img class="img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMzU2IiBoZWlnaHQ9IjM1NiIgdmlld0JveD0iMCAwIDM1NiAzNTYiPgogICAgPGRlZnM+CiAgICAgICAgPHBhdGggaWQ9ImEiIGQ9Ik0wIDBoMzU2djM1NkgweiIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8bWFzayBpZD0iYiIgZmlsbD0iI2ZmZiI+CiAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8L21hc2s+CiAgICAgICAgPHVzZSBmaWxsPSIjRkZGIiBmaWxsLW9wYWNpdHk9IjAiIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjI0NiIgaGVpZ2h0PSIzOCIgeD0iNzUiIHk9IjcxIiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTI2LjIzIDE5OCA5MCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMjQ2IiBoZWlnaHQ9IjM4IiB4PSIzNCIgeT0iMTM0IiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTI2LjIzIDE1NyAxNTMpIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjI0NiIgaGVpZ2h0PSIzOCIgeD0iOTEiIHk9IjE0NyIgZmlsbD0iI0VFRjhGRiIgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIiByeD0iMTkiIHRyYW5zZm9ybT0icm90YXRlKC0zMy41OSAyMTQgMTY2KSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIyMTIiIGhlaWdodD0iMzgiIHg9IjgzIiB5PSIyMDUiIGZpbGw9IiNFRUY4RkYiIGZpbGwtcnVsZT0ibm9uemVybyIgbWFzaz0idXJsKCNiKSIgcng9IjE5IiB0cmFuc2Zvcm09InJvdGF0ZSgtMzMuNTkgMTg5IDIyNCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMTc2IiBoZWlnaHQ9IjM4IiB4PSI5MSIgeT0iMjUzIiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTMzLjU5IDE3OSAyNzIpIi8+CiAgICAgICAgPGcgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIj4KICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNzYgMTI3KSI+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjQ3Rjg1IiBkPSJNMTc5LjY5IDBINzAuNTk5QzU5LjQxNS4wNCA0OS42ODkgNy42NjYgNDcgMTguNTA0aDk5Ljg3YzEzLjQxLjA0IDI0LjI3MSAxMC44ODMgMjQuMzEgMjQuMjcydjUwLjQ1N2EyNC4wNiAyNC4wNiAwIDAgMS0uNzA1IDUuNzY3aDkuMjE1YzEzLjQxLS4wMzkgMjQuMjcxLTEwLjg4MyAyNC4zMS0yNC4yNzJWMjQuMjcyQzIwMy45NjEgMTAuODgyIDE5My4xLjAzOSAxNzkuNjkgMHoiLz4KICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNFNTZDNzciIGQ9Ik0xNzEgNDIuNDI0QzE3MC45NjEgMjguOTUgMTYwLjA5IDE4LjAzOSAxNDYuNjY4IDE4SDQ2LjcwNUEyNC4zMzQgMjQuMzM0IDAgMCAwIDQ2IDIzLjgwM3Y1MC43NzNDNDYuMDM5IDg4LjA1IDU2LjkxIDk4Ljk2MSA3MC4zMzIgOTloOTkuOTYzYy40NjctMS44OTkuNzA0LTMuODQ3LjcwNS01LjgwM1Y0Mi40MjR6Ii8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjN0VENEZCIiBkPSJNMTMyLjggMTI2LjE2M0g5My40MDFsLTMzLjU2MyAzMS40MDVhOS4wODcgOS4wODcgMCAwIDEtOC4yMDMgMi4yMDUgOS4xMjggOS4xMjggMCAwIDEtNi40NTMtNS41NDRsLTEwLjg3LTI4LjAzOEgyNC4yMDFDMTAuODUgMTI2LjE1Mi4wMzkgMTE1LjI5IDAgMTAxLjg3OVY1MS4zMTJDLjAzOSAzNy45IDEwLjg1MSAyNy4wMzkgMjQuMiAyN2gxMDguNmMxMy4zNDkuMDM5IDI0LjE2MSAxMC45IDI0LjIgMjQuMzEydjUwLjUzOWMtLjAzOSAxMy40MS0xMC44NTEgMjQuMjczLTI0LjIgMjQuMzEyeiIvPgogICAgICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjEwOCIgaGVpZ2h0PSIxMyIgeD0iMjUiIHk9IjUyIiBmaWxsPSIjRkZGIiByeD0iNi41Ii8+CiAgICAgICAgICAgICAgICA8cmVjdCB3aWR0aD0iMTA4IiBoZWlnaHQ9IjEzIiB4PSIyNSIgeT0iNzAiIGZpbGw9IiNGRkYiIHJ4PSI2LjUiLz4KICAgICAgICAgICAgICAgIDxyZWN0IHdpZHRoPSI2OCIgaGVpZ2h0PSIxMyIgeD0iMjUiIHk9Ijg5IiBmaWxsPSIjRkZGIiByeD0iNi41Ii8+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" alt="Sản phẩm hiện chưa có hỏi đáp">
									</div>
									<strong class="title small">Sản phẩm hiện chưa có hỏi đáp.</strong>
								</div>
							</div>
						</div>
						<div class="commentInputWrapper_1fw5">
							<div class="commentInput_Tzz6">
								<div class="inner_2DTV">
									<input class="input_SASb" type="text" aria-label="Question for this product" placeholder="Bạn có câu hỏi cho sản phẩm này? Đặt câu hỏi cho Shop." value="">
									<button class="btnSend_1s13" aria-label="Send">
										<span>Gửi</span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M4,42,46,24,4,6,4,20l30,4L4,28Z"></path>
											<path d="M0,0H48V48H0Z" fill="none"></path>
										</g>
										</g></svg></button>
								</div>
								<p class="message_17z1"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //Product Tabs -->

		<!-- Related Products -->
		<div class="related titleLine products-list grid module ">
			<h3 class="modtitle">Sản Phẩm Khác  </h3>

			<div class="releate-products yt-content-slider products-list" id="dvSPLienQuan" runat="server" data-rtl="no" data-loop="yes" data-autoplay="no" data-autoheight="no" data-autowidth="no" data-delay="4" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="3" data-items_column2="3" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-hoverpause="yes">
			</div>
		</div>

		<!-- end Related  Products-->
	</div>
	<script src="../../Content/UI/js/JavaScript.js"></script>
	<!--Middle Part End-->
	


<%--	<div class="form-group box-info-product" id="pnPhone" runat="server">
		<div class="contact-info col-6">
			<div class="input-group phonenumber">
				<label>Số điện thoại</label>
				<input class="form-control" type="text" id="txtSoDienThoai" disabled="disabled" runat="server" style="width: 150px;" />
			</div>
			<div class="cart col-6">
				<input type="button" value="Liên hệ" id="btnContact" class="btn btn-mega btn-lg">
			</div>
		</div>
		<script>
			$("#btnContact").click(function () {
				var PhoneNumber = $(this).text();
				window.location.href = "tel://" + PhoneNumber;
			});
		</script>
	</div>--%>
</asp:Content>
