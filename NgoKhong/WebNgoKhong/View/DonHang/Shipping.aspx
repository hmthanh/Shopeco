<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shipping.aspx.cs" MasterPageFile="~/Layout/MasterPage.master" Inherits="View_DonHang_finishCheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../../Content/UI/css/newbootstrap/bootstrap.css" rel="stylesheet" />
	<link href="../../Content/UI/css/newbootstrap/bootstrap.min.css" rel="stylesheet" />
	<style>
		.checkbox label, .radio label {
			font-size: 14px;
		}

		.route-index {
			background: #fff;
			background-size: cover;
			padding-top: 56px;
		}

		body.layout-2 .container, body.layout-1 .container {
			max-width: 1650px;
			padding: 0;
			width: 95%;
		}

		.route-index .container {
			width: 100%;
			height: 100%;
			min-height: 100%;
			text-align: center;
			display: table;
			overflow: hidden;
			position: relative;
			z-index: 0;
		}

		.grid, .sortable-items, .tabs, [class*=block-grid] {
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-webkit-flex-wrap: wrap;
			-ms-flex-wrap: wrap;
			flex-wrap: wrap;
			-webkit-align-items: flex-start;
			-ms-flex-align: start;
			align-items: flex-start;
			-webkit-align-content: flex-start;
			-ms-flex-line-pack: start;
			align-content: flex-start;
			-webkit-justify-content: flex-start;
			-ms-flex-pack: start;
			justify-content: flex-start;
		}

		.route-index .container .cell {
			display: table-cell;
			vertical-align: middle;
		}

			.route-index .container .cell > .title {
				font-size: 32px;
			}

			.route-index .container .cell > .title {
				margin-top: 1em;
				font-size: 40px;
				color: #666;
				font-weight: 400;
			}

			.route-index .container .cell > .subtitle {
				font-size: 18px;
				margin-top: 24px;
				line-height: 24px;
			}

			.route-index .container .cell > .subtitle {
				font-size: 22px;
				line-height: 32px;
				font-weight: 300;
				color: #666;
				margin: 40px auto 0;
				max-width: 1200px;
			}
	</style>
	<style>
		.custom-select {
			height: auto;
		}

		.btnDelete {
			cursor: pointer;
			border: 1px solid #e2e1e1;
			padding: 3px 5px;
			border-radius: 99%;
			background-color: #e2e1e1;
		}

		.h-header {
			color: #373737;
			overflow: hidden;
			font-weight: 700;
			font-size: 18px;
			border: 1px solid #e4e4e4;
			border-left: 5px solid #f7941d;
			padding: 0 10px;
			line-height: 29px;
			margin-bottom: 10px;
			padding-right: 0;
			position: relative;
			/* margin: 0px 30px; */
			background-color: #e2e1e1;
			padding: 5px;
			margin-top: 10px;
		}

		.inline-block {
			display: inline-block;
			text-align: left;
		}

		.list-group-item:hover {
			font-weight: 700;
			background-color: #f9f9f9;
		}


		.align-v {
			display: flex;
			align-items: center;
			justify-content: center;
		}

		.product-box, .product-item {
			width: 80%;
		}

		.container {
			max-width: 960px;
		}

		.lh-condensed {
			line-height: 1.25;
		}
	</style>
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
	<style>
		.checkout-product-ordered-list {
			margin-top: 0.75rem;
			box-shadow: rgba(0, 0, 0, 0.05) 0px 0.0625rem 0.0625rem 0px;
			border-radius: 0.1875rem;
		}

		.checkout-product-ordered-list__header-block {
			height: 3.125rem;
			box-shadow: rgba(0, 0, 0, 0.09) 0px 0.0625rem 0.0625rem 0px;
			margin-bottom: 0.75rem;
			padding: 0px 2.5rem;
			background: rgb(255, 255, 255);
			border-radius: 0.1875rem;
		}

		.checkout-product-ordered-list__headers {
			display: flex;
			width: 100%;
			-webkit-box-align: center;
			align-items: center;
			font-size: 1.4rem;
			color: rgb(187, 187, 187);
		}

		.checkout-product-ordered-list__header:first-child {
			-webkit-box-pack: start;
			justify-content: flex-start;
			text-align: left;
			-webkit-box-flex: 4;
			flex: 2 1 0%;
		}

		.checkout-product-ordered-list__header--product {
			-webkit-box-flex: 4;
			flex: 4 1 0%;
		}

		.checkout-product-ordered-list__header {
			-webkit-box-flex: 1;
			-webkit-box-pack: center;
			justify-content: center;
			text-align: center;
			flex: 1 1 0%;
		}

		.checkout-product-ordered-list__title {
			height: 4.375rem;
			font-size: 1.6rem;
			color: rgb(34, 34, 34);
		}

		.checkout-product-ordered-list__header-block, .checkout-product-ordered-list__title {
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		.checkout-product-ordered-list__header {
			-webkit-box-flex: 1;
			-webkit-box-pack: center;
			justify-content: center;
			text-align: center;
			flex: 1 1 0%;
		}

		.checkout-product-ordered-list__header--subtotal, .checkout-product-ordered-list__header--variation {
			-webkit-box-flex: 2;
			flex: 2 1 0%;
		}

		.checkout-product-ordered-list__header {
			-webkit-box-flex: 1;
			-webkit-box-pack: center;
			justify-content: center;
			text-align: center;
			flex: 1 1 0%;
		}

		.checkout-product-ordered-list__content > .checkout-product-ordered-list-item, .checkout-product-ordered-list__content > .checkout-shop-order-group {
			box-shadow: rgba(0, 0, 0, 0.09) 0px 0.0625rem 0.0625rem 0px;
			border-radius: 0.1875rem;
			overflow: hidden;
		}

		.checkout-shop-order-group {
			background: rgb(255, 255, 255);
		}

		.checkout-product-ordered-list-item {
			position: relative;
			background: rgb(255, 255, 255);
		}

		.checkout-shop-order-group .checkout-product-ordered-list-item-shop-info {
			border-width: initial;
			border-style: none;
			border-color: initial;
			border-image: initial;
		}

		.checkout-product-ordered-list-item-shop-info {
			display: flex;
			-webkit-box-align: center;
			align-items: center;
			height: 3.75rem;
			padding: 0px 2.5rem;
			border-bottom: 0.0625rem solid rgba(0, 0, 0, 0.09);
		}

		.checkout-product-ordered-list-item-shop-info__shop-icon {
			display: inline-flex;
		}

		.checkout-product-ordered-list-item-shop-info__shop-icon-link {
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		.checkout-product-ordered-list-item-shop-info__shop-icon svg {
			width: 0.9375rem;
			height: 0.9375rem;
			fill: rgb(34, 34, 34);
		}

		svg:not(:root) {
			overflow: hidden;
		}

		.stardust-icon {
			stroke: currentColor;
			fill: currentColor;
			width: 1em;
			height: 1em;
		}

		.checkout-product-ordered-list-item-shop-info__shop-name {
			color: rgba(0, 0, 0, 0.8);
			font-family: HelveticaNeueMedium, HelveticaNeue-Medium, "Helvetica Neue Medium", "Helvetica Neue", "Arial Bold", arial, sans-serif;
			margin-left: 0.3125rem;
			text-decoration: none;
		}

		.checkout-product-ordered-list-item-shop-info__chat-button {
			-webkit-box-align: center;
			align-items: center;
			cursor: pointer;
			user-select: none;
			display: inline-flex;
			color: rgb(0, 191, 165);
			margin-left: 0.625rem;
			border-left: 1px solid rgba(0, 0, 0, 0.09);
		}

		svg:not(:root) {
			overflow: hidden;
		}

		.checkout-product-ordered-list-item-shop-info__webchat-icon {
			width: 1.25rem;
			height: 0.9375rem;
			margin-left: 0.625rem;
			margin-right: 0.25rem;
		}

		.shopee-svg-icon {
			display: inline-block;
			width: 1em;
			height: 1em;
			fill: currentColor;
			position: relative;
		}

		.checkout-product-ordered-list-item__items {
			padding-bottom: 1.25rem;
			border-bottom: 0.0625rem dashed rgba(0, 0, 0, 0.09);
		}

		.checkout-product-ordered-list-item__item {
			margin-bottom: 10px;
			display: flex;
			text-overflow: ellipsis;
			font-size: 1.4rem;
			color: rgb(34, 34, 34);
			padding: 0px 2.5rem;
			overflow: hidden;
		}

		.checkout-product-ordered-list-item__header:first-child {
			-webkit-box-pack: start;
			justify-content: flex-start;
			-webkit-box-flex: 4;
			flex: 6 1 0%;
		}

		.checkout-product-ordered-list-item__header--product {
			-webkit-box-flex: 4;
			flex: 4 1 0%;
		}

		.checkout-product-ordered-list-item__header {
			-webkit-box-flex: 1;
			text-overflow: ellipsis;
			display: flex;
			-webkit-box-pack: center;
			justify-content: center;
			-webkit-box-align: center;
			align-items: center;
			flex: 1 1 0%;
			overflow: hidden;
		}

		.checkout-product-ordered-list-item__header--variation {
			-webkit-box-pack: start;
			justify-content: flex-start;
			color: rgb(146, 146, 146);
			-webkit-box-flex: 2;
			flex: 2 1 0%;
		}


		.checkout-product-ordered-list-item__header:last-child {
			-webkit-box-pack: end;
			justify-content: flex-end;
		}

		.checkout-product-ordered-list-item__header--subtotal {
			-webkit-box-flex: 2;
			flex: 2 1 0%;
		}


		.checkout-product-ordered-list-item__action, .checkout-product-ordered-list-item__actions {
			display: flex;
			min-width: 0px;
			min-height: 0px;
		}

		.checkout-product-ordered-list-item__actions {
			background-color: rgb(250, 253, 255);
			border-bottom: 0.0625rem dashed rgba(0, 0, 0, 0.09);
		}

		.checkout-product-ordered-list-item__action--left {
			-webkit-box-flex: 4;
			flex: 4 1 0%;
		}

		.checkout-product-ordered-list-item__action {
			-webkit-box-orient: vertical;
			-webkit-box-direction: normal;
			flex-direction: column;
		}

		.checkout-product-ordered-list-item__action, .checkout-product-ordered-list-item__actions {
			display: flex;
			min-width: 0px;
			min-height: 0px;
		}

		._1pkbuI {
			background-color: rgb(250, 253, 255);
			display: flex;
			-webkit-box-pack: end;
			justify-content: flex-end;
			-webkit-box-align: center;
			align-items: center;
			height: 4.5625rem;
			padding: 0px 2.5rem;
		}

		._1wd2xT {
			font-size: 1.4rem;
			color: rgb(146, 146, 146);
		}

		.ZwtlWT {
			margin-left: 1.25rem;
			font-size: 1.25rem;
			color: rgb(238, 77, 45);
		}

		.checkout-product-ordered-list__content > .checkout-product-ordered-list-item + .checkout-product-ordered-list-item, .checkout-product-ordered-list__content > .checkout-shop-order-group + .checkout-product-ordered-list-item, .checkout-product-ordered-list__content > .checkout-shop-order-group + .checkout-shop-order-group {
			margin-top: 0.75rem;
		}

		.checkout-product-ordered-list__content > .checkout-product-ordered-list-item, .checkout-product-ordered-list__content > .checkout-shop-order-group {
			box-shadow: rgba(0, 0, 0, 0.09) 0px 0.0625rem 0.0625rem 0px;
			border-radius: 0.1875rem;
			overflow: hidden;
		}

		.checkout-shop-order-group {
			background: rgb(255, 255, 255);
		}

		.checkout-product-ordered-list-item {
			position: relative;
			background: rgb(255, 255, 255);
		}


		.checkout-product-ordered-list-item-shop-info__shop-icon {
			display: inline-flex;
		}


		.checkout-product-ordered-list-item__header--variation {
			-webkit-box-pack: start;
			justify-content: flex-start;
			color: rgb(146, 146, 146);
			-webkit-box-flex: 2;
			flex: 2 1 0%;
		}


		.checkout-product-ordered-list-item__product-info {
			display: flex;
			-webkit-box-orient: vertical;
			-webkit-box-direction: normal;
			flex-direction: column;
			-webkit-box-pack: center;
			justify-content: center;
			margin: 0px 0.9375rem;
			overflow: hidden;
		}

		.checkout-product-ordered-list-item__product-name {
			white-space: nowrap;
			text-overflow: ellipsis;
			overflow: hidden;
		}

		._1r8NL4 {
			box-shadow: rgba(0, 0, 0, 0.05) 0px 0.0625rem 0.0625rem 0px;
			padding-top: 0.9375rem;
			display: grid;
			grid-template-columns: 1fr max-content max-content;
			5 grid-template-rows: auto;
			background: rgb(255, 254, 251);
			border-top: 0.0625rem solid rgb(241, 240, 237);
			grid-column-gap: 0.625rem;
		}

		._3H1NVA {
			grid-row-start: 11;
			grid-row-end: 12;
		}

		.Ycio_F {
			grid-column-start: 2;
			grid-column-end: 3;
		}

		._2X6jGK {
			font-size: 1.5rem;
			color: rgba(0, 0, 0, 0.54);
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		._3H1NVA {
			grid-row-start: 11;
			grid-row-end: 12;
		}

		._3CkY6E {
			height: 2.5rem;
			min-width: 6.25rem;
			grid-column-start: 3;
			grid-column-end: 4;
			-webkit-box-pack: end;
			justify-content: flex-end;
			padding: 0px 1.5625rem 0px 0.625rem;
		}

		._2X6jGK {
			font-size: 1.5rem;
			color: rgba(0, 0, 0, 0.54);
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		._3zEJev {
			grid-row-start: 12;
			grid-row-end: 13;
		}

		.Ycio_F {
			grid-column-start: 2;
			grid-column-end: 3;
		}

		._2X6jGK {
			font-size: 1.5rem;
			color: rgba(0, 0, 0, 0.54);
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		._3zEJev {
			grid-row-start: 12;
			grid-row-end: 13;
		}

		._3CkY6E {
			height: 2.5rem;
			min-width: 6.25rem;
			grid-column-start: 3;
			grid-column-end: 4;
			-webkit-box-pack: end;
			justify-content: flex-end;
			padding: 0px 1.5625rem 0px 0.625rem;
		}

		._2X6jGK {
			font-size: 1.5rem;
			color: rgba(0, 0, 0, 0.54);
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		._37sKog {
			grid-row-start: 21;
			grid-row-end: 22;
		}

		.Ycio_F {
			grid-column-start: 2;
			grid-column-end: 3;
		}

		._2X6jGK {
			font-size: 1.5rem;
			color: rgba(0, 0, 0, 0.54);
			display: flex;
			-webkit-box-align: center;
			align-items: center;
		}

		._37sKog {
			grid-row-start: 21;
			grid-row-end: 22;
		}

		.bYNx7P {
			height: 3.125rem;
			font-size: 1.75rem;
			color: rgb(238, 77, 45);
		}

		._3CkY6E {
			height: 2.5rem;
			min-width: 6.25rem;
			grid-column-start: 3;
			grid-column-end: 4;
			-webkit-box-pack: end;
			justify-content: flex-end;
			padding: 0px 1.5625rem 0px 0.625rem;
		}

		._1nqViI {
			grid-column-start: 1;
			grid-column-end: 4;
			display: flex;
			height: 5.9375rem;
			-webkit-box-pack: end;
			justify-content: flex-end;
			margin-top: 0.625rem;
			padding: 0px 11.5rem;
			border-top: 0.0625rem dashed rgba(0, 0, 0, 0.09);
		}

		._32OJur {
			grid-row-start: 22;
			grid-row-end: 23;
		}

		button--primary {
			color: rgb(255, 255, 255);
			background: rgb(238, 77, 45);
		}


		.page-checkout .stardust-button {
			display: flex;
			-webkit-box-align: center;
			align-items: center;
			-webkit-box-pack: center;
			justify-content: center;
			align-self: flex-start;
			box-shadow: rgba(0, 0, 0, 0.03) 0px 0.0625rem 0.0625rem 0px;
			color: rgb(85, 85, 85);
			text-transform: capitalize;
			background: rgb(255, 255, 255);
			border-width: 0.0625rem;
			border-style: solid;
			border-color: rgba(0, 0, 0, 0.09);
			border-image: initial;
			outline: none;
			border-radius: 0.125rem !important;
		}

		._2nbLIV {
			opacity: 0.7;
		}

		._1rgnQx {
			width: 20.125rem;
			align-self: center !important;
			border-width: initial;
			border-style: none;
			border-color: initial;
			border-image: initial;
			border-radius: 0.125rem;
			padding: 0px;
		}

		.stardust-button--primary {
			background-color: rgb(238, 77, 45);
			color: rgb(255, 255, 255);
			border-color: rgb(205, 48, 17);
		}

		.stardust-button--large, .stardust-button--small {
			font-family: -apple-system, "Helvetica Neue", Helvetica, Roboto, "Droid Sans", Arial, sans-serif;
			font-weight: 400;
		}

		.stardust-button--large {
			font-size: 16px;
			border-radius: 6px;
			padding: 12px 14px;
		}

		.stardust-button--primary {
			background-color: #ee4d2d;
			border-color: #cd3011;
			color: #fff;
		}

		.stardust-button--primary {
			background-color: #ee4d2d;
			border-color: #cd3011;
			color: #fff;
		}

		.stardust-button--large, .stardust-button--small {
			font-family: -apple-system,Helvetica Neue,Helvetica,Roboto,Droid Sans,Arial,sans-serif;
			font-weight: 400;
		}

		.stardust-button--large {
			font-size: 16px;
			border-radius: 6px;
			padding: 12px 14px;
		}

		._37sKog {
			-ms-grid-row: 21;
			grid-row-start: 21;
			grid-row-end: 22;
			-ms-grid-row-span: 1;
		}

		.bYNx7P {
			height: 3.125rem;
			font-size: 1.8rem;
			color: #ee4d2d;
		}

		._3CkY6E {
			padding: 0 1.5625rem 0 .625rem;
			height: 2.5rem;
			min-width: 6.25rem;
			-ms-grid-column: 3;
			grid-column-start: 3;
			grid-column-end: 4;
			-ms-grid-column-span: 1;
			-webkit-box-pack: end;
			-webkit-justify-content: flex-end;
			-moz-box-pack: end;
			-ms-flex-pack: end;
			justify-content: flex-end;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<!-- Main Container  -->
	<form runat="server">
		<div class="main-container container">
			<!--Middle Part End -->
			<div class="container" id="errorEmpty" runat="server">
				<div data-v-fe11aa12="" class="route-index ">
					<div data-v-fe11aa12="" class="account-container container grid">
						<div class="cell">
							<%--<div id="title" runat="server" class="title ">Bạn chưa đăng nhập</div>--%>
							<div id="subtitle" runat="server" class="subtitle" style="margin-bottom: 100px;">
								Để tiếp tục mua hàng bạn phải
								<a ID="btnLogin" class="btn btn-primary" href="<%=GetRouteUrl("login", new { retUrl = (GetRouteUrl("ordershop", new { }))}) %>">Đăng nhập</a>
								&nbsp;  <a href="<%=GetRouteUrl("register",  new { retUrl = (GetRouteUrl("ordershop", new { }))}) %>" class="btn btn-success">Đăng ký</a><br />
								hoặc <a href="<%=GetRouteUrl("ordershop", new {}) %>" class="btn btn-danger">Tiếp tục</a> với khách vãng lai	
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
		</div>
	</form>
</asp:Content>