<%@ Page Title="" Language="C#" enableEventValidation="false" MasterPageFile="~/RaoVat/Layout/RaoVat.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DangTin.aspx.cs" Inherits="RaoVat_View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
	<%--<link href="../RaoVat/Content/css/bootstrap.css" rel="stylesheet" />--%>
	<script src="../RaoVat/Content/js/bootstrap-formhelpers-phone.format.js"></script>
	<script src="../RaoVat/Content/js/bootstrap-formhelpers-phone.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.4.5/ckeditor.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2/js/epiceditor.min.js"></script>
	<%--<link href="../../Content/UI/css/DangTin.css" rel="stylesheet" />--%>
	<%--<link href="../../Content/UI/css/Examples.css" rel="stylesheet" />--%>
	<link href="../../Content/UI/css/DangTin.css" rel="stylesheet" />
	<script src="../../Content/UI/js/jquery.validate.min.js"></script>
	<%--<div style="text-align:center;">
            <ol class="breadcrumb" style="font-size: 19px; margin-top: 20px; content: ''">
                <li><a  class="item-menu" href="<%=GetRouteUrl("raovat", new {}) %>"> Tin rao vặt</a></li>
                <li><a  class="item-menu active">Đăng tin</a></li>
            </ol>
        </div>--%>
	<input type="hidden" id="pageValue" value="0" runat="server" />
	<div class="container bgGrid" id="maincontent">
		<div class="header-title panel panel-body title-search">
			<div>ĐĂNG TIN MIỄN PHÍ</div>
		</div>
		<div class="abc">
			<div>

				<div id="wrapper">

					<div id="container body-content">


						<div class="progress">
							<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								<span class="sr-only">0% Complete</span>
							</div>
						</div>

						<form class="form-horizontal msf">
							<div class="msf-header">
								<div class="row text-center">
									<div class="msf-step col-md-4 msf-step-active"  runat="server" id="btn1" data-value="1"><i class="fa fa-clipboard"></i><span>Thông tin cơ bản</span></div>
									<div class="msf-step col-md-4" id="btn2"  runat="server" data-value="2"><i class="fa fa-credit-card"></i><span>Thông tin liên hệ</span></div>
									<div class="msf-step col-md-4" id="btn3"  runat="server" data-value="3"><i class="fa fa-check"></i><span>Nội dung tin đăng</span></div>
								</div>
							</div>

							<div class="msf-content">
								<div id="content1" class="msf-view" runat="server" style="display:block;">
									<section>
										<div class="form-group row">
											<label for="slLinhVuc" class="col-sm-2 col-form-label">Lĩnh vực <span style="color: red;">(*)</span></label>
											<div class="col-sm-10">
												<asp:DropDownList CssClass="form-control" runat="server" ID="slLinhVuc" AutoPostBack="true" OnSelectedIndexChanged="slLinhVuc_SelectedIndexChanged">
												</asp:DropDownList>
											</div>
										</div>
										<div class="form-group row">
											<label for="slDanhMuc" class="col-sm-2 col-form-label">Danh mục <span style="color: red;">(*)</span></label>
											<div class="col-sm-10">
												<asp:DropDownList class="form-control" runat="server" id="slDanhMuc">
												</asp:DropDownList>
											</div>
										</div>
										<div class="form-group row">
											<label for="slTinhThanh" class="col-sm-2 col-form-label">Tỉnh thành <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<asp:DropDownList CssClass="form-control" runat="server" ID="slTinhThanh"  AutoPostBack="true" OnSelectedIndexChanged="slTinhThanh_SelectedIndexChanged">
													<%--<option value="0">Toàn Quốc</option>--%>
												</asp:DropDownList>
											</div>
										</div>
										<div class="form-group row">
											<label for="slQuanHuyen" class="col-sm-2 col-form-label">Quận huyện <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<asp:DropDownList class="form-control" runat="server" id="slQuanHuyen">
													<%--<option value="0">Tất cả quận huyện</option>--%>
												</asp:DropDownList>
											</div>
										</div>

										<div class="form-group row">
											<label for="txtGia" class="col-sm-2 col-form-label">Giá <span style="color: red;">(*)</span></label>
											<div class="col-sm-10">
												<input class="form-control" runat="server" id="txtGia" />
											</div>
										</div>
									</section>
								</div>
								<div runat="server" id="content2" class="msf-view" >
									<section>
										<div class="form-group row">
											<label for="txtHoTen" class="col-sm-2 col-form-label">Họ và tên <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<input class="form-control" runat="server" type="text" id="txtHoTen" />
											</div>
										</div>

										<div class="form-group row">
											<label for="txtSoDienThoai" class="col-sm-2 col-form-label">Số điện thoại <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<input class="form-control input-medium bfh-phone" data-format="+84 ddd-ddd-dddd" runat="server" type="text" id="txtSoDienThoai" />
											</div>
										</div>
										<div class="form-group row">
											<label for="txtEmail" class="col-sm-2 col-form-label">Email <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<input class="form-control" runat="server" id="txtEmail" type="email" />
											</div>
										</div>
										<div class="form-group row">
											<label for="txtDiaChi" class="col-sm-2 col-form-label">Địa chỉ <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<input class="form-control" runat="server" type="text" id="txtDiaChi" />
											</div>
										</div>
									</section>
								</div>
								<div id="content3" class="msf-view" runat="server">
									<section>
										<div class="form-group row">
											<label for="txtTieuDe" class="col-sm-2 col-form-label">Tiêu đề <span style="color: red;">(*)</span></label>
											<div class="col-sm-10">
												<input class="form-control" runat="server" id="txtTieuDe" />
											</div>
										</div>
										<div class="form-group row">
											<label for="fileUpload" class="col-sm-2 col-form-label">Hình ảnh <span style="color: red;">(*)</span></label>
											<div class="col-sm-10">
												<asp:FileUpload ID="fileHinhAnh" ClientIDMode="Static" CssClass="form-control" onchange="this.form.submit()" runat="server" AllowMultiple="true" />
												<input type="hidden" id="hdHinhAnh" runat="server" />
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-2"></label>
											<div class="col-sm-10">
												<div id="listImgHangHoa" runat="server" style="border-style: groove; min-height: 100px"></div>
											</div>
										</div>
										<div class="form-group row">
											<label for="arMoTa" class="col-sm-2 col-form-label">Mô tả <span style="color: red;"></span></label>
											<div class="col-sm-10">
												<textarea id="arMoTa" class="ckeditor" runat="server"></textarea>
											</div>
										</div>
										<div class="row">
											<div class="alert alert-danger" role="alert" id="msgDanger" runat="server" style="text-align: center;">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm" style="text-align: center;">
											</div>
										</div>
									</section>
								</div>
							</div>
							<div class="row" style="margin: 0 100px;">
								<div class="">
									<div id="msgError" runat="server" class="alert alert-danger">
										
									</div>
								</div>
							</div>
							<div class="msf-navigation">
								<div class="row">
									<div class="col-md-6">
										<asp:LinkButton id="btnBackStep" type="button" OnClick="btnBackStep_Click" data-type="back" runat="server" class="btn msf-nav-button btn-success"><i class="fa fa-chevron-left"></i>Quay lại </asp:LinkButton>
									</div>

									<div class="col-md-6 col-md-offset-6">
										<asp:LinkButton ID="btnNextStep" OnClick="btnNextStep_Click" runat="server" type="button" data-type="next" CssClass="btn msf-nav-button btn-primary" style="display:inline-block;">Tiếp tục <i class="fa fa-chevron-right"></i></asp:LinkButton>
										<asp:Button ID="btnLuu" Text="Đăng tin" runat="server" CssClass="btn btn-danger btn-lg" OnClick="btnLuu_Click" />
									</div>

								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

		</div>
		<div class="" style="margin-bottom: 100px;"></div>
	</div>

	</form>
    <script>
		$(document).ready(function () {
			//$('#maincontent_slLinhVuc').change(function () {
			//	var linhVuc = $(this).val();
			//	$.ajax({
			//		url: '../Ajax.aspx',
			//		type: "GET",
			//		data: { Action: 'LinhVuc', id: linhVuc },
			//		dataType: 'html',
			//		success: function (s) {
			//			$('#maincontent_slDanhMuc').html(s);
			//		}
			//	});
			//});

			//$('#maincontent_slTinhThanh').change(function () {
			//	var qh = $(this).val();
			//	$.ajax({
			//		url: '../Ajax.aspx',
			//		type: "GET",
			//		data: { Action: 'TinhThanh', id: qh },
			//		dataType: 'html',
			//		success: function (s) {
			//			$('#maincontent_slQuanHuyen').html(s);
			//		}
			//	});
			//});
		});
	</script>
	<script src="../RaoVat/Content/js/bootstrap.js"></script>
	<%--<script src="../../Content/UI/js/DangTin.js"></script>--%>
	<%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>--%>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.2/knockout-min.js"></script>

    <script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
    <script type="text/javascript"   src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.6/jquery.validate.unobtrusive.min.js"></script>
   

    <!-- Latest compiled and minified JavaScript -->
    <script type="text/javascript"  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
	<%--<script src="../../Content/UI/js/multi-step-form.js"></script>--%>
	<script>
		//function checkForm1() {
			
		//	var val1 = $('#maincontent_slLinhVuc').val();
		//	var val2 = $('#maincontent_slDanhMuc').val();
		//	var val3 = $('#maincontent_slTinhThanh').val();
		//	var val4 = $('#maincontent_slQuanHuyen').val();
		//	var val5 = $('#maincontent_txtGia').val();
		//	if (val1 == '' || val1 == '0') {
		//		alert("Bạn phải chọn lĩnh vực !");
		//		return false;
		//	}
		//	if (val2 == '' || val2 == '0') {
		//		alert("Bạn phải chọn danh mục !");
		//		return false;
		//	}
		//	if (val3 == '' || val3 == '0') {
		//		alert("Bạn phải chọn tỉnh thành !");
		//		return false;
		//	}
		//	if (val4 == '' || val4 == '0') {
		//		alert("Bạn phải chọn quận huyện !");
		//		return false;
		//	}
		//	if (val5 == '' || val5 == '0') {
		//		alert("Bạn phải chọn giá !");
		//		return false;
		//	}

		//	return true;
		//}
		//function checkForm2() {

		//	var val1 = $('#maincontent_txtHoTen').val();
		//	var val2 = $('#maincontent_txtSoDienThoai').val();
		//	var val3 = $('#maincontent_txtEmail').val();
		//	var val4 = $('#maincontent_txtDiaChi').val();
		//	if (val1 == '' || val1 == '0') {
		//		alert("Bạn phải chọn họ và tên  !");
		//		return false;
		//	}
		//	if (val2 == '' || val2 == '0') {
		//		alert("Bạn phải chọn số điện thoại !");
		//		return false;
		//	}
		//	if (val3 == '' || val3 == '0') {
		//		alert("Bạn phải chọn email !");
		//		return false;
		//	}
		//	if (val4 == '' || val4 == '0') {
		//		alert("Bạn phải chọn số địa chỉ !");
		//		return false;
		//	}

		//	return true;
		//}
		//function checkForm3() {

		//	var val1 = $('#maincontent_txtHoTen').val();
		//	var val2 = $('#maincontent_txtSoDienThoai').val();
		//	var val3 = $('#maincontent_txtEmail').val();
		//	var val4 = $('#maincontent_txtDiaChi').val();
		//	if (val1 == '' || val1 == '0') {
		//		alert("Bạn phải chọn họ và tên  !");
		//		return false;
		//	}
		//	if (val2 == '' || val2 == '0') {
		//		alert("Bạn phải chọn số điện thoại !");
		//		return false;
		//	}
		//	if (val3 == '' || val3 == '0') {
		//		alert("Bạn phải chọn email !");
		//		return false;
		//	}
		//	if (val4 == '' || val4 == '0') {
		//		alert("Bạn phải chọn số địa chỉ !");
		//		return false;
		//	}

		//	return true;
		//}
			//$('#maincontent_btnLuu').hide();
			//function backStep() {
			//	var s = Number($('.msf-step.msf-step-active').data('value'));
			//	switch (s) {
			//		case 2:
			//			$('#maincontent_btn' + s).removeClass("msf-step-active");
			//			s--;

			//			$('#maincontent_btn' + s).addClass("msf-step-active");
			//			$('#maincontent_btnBackStep').hide();

			//			$('#content2').hide();
			//			$('#maincontent_btnNextStep').show();
			//			$('#maincontent_content1').show();
			//			break;
			//		case 3:
			//			$('#maincontent_btn' + s).removeClass("msf-step-active");
			//			s--;
						
			//			$('#maincontent_btn' + s).addClass("msf-step-active");
			//			$('#maincontent_btnNextStep').show();
			//			$('#maincontent_btnLuu').hide();
					
			//			$('#maincontent_content3').hide();
			//			$('#content2').show();
			//			break;
			//		default:
			//	}
			//}
			//function nextStep() {
			//	var s = Number($('.msf-step.msf-step-active').data('value'));
			//	switch (s) {
			//		case 1:
			//			if (!checkForm1()) {
			//				return;
			//			} 
			//			$('#maincontent_btnBackStep').css('display', 'block');
			//			$('#maincontent_btn' + s).removeClass("msf-step-active");
			//			s++;
					
			//			$('#maincontent_btn' + s).addClass("msf-step-active");

			//			$('#maincontent_content1').hide();
			//			$('#content2').show();
					
			//			break;
			//		case 2:
			//			if (!checkForm2()) {
			//				return;
			//			} 
			//			$('#maincontent_btn' + s).removeClass("msf-step-active");
			//			s++;

			//			$('#maincontent_btn' + s).addClass("msf-step-active");
			//			$('#maincontent_btnNextStep').hide();
			//			$('#maincontent_btnLuu').show();

			//			$('#content2').hide();
			//			$('#maincontent_content3').show();
			//			break;
			//		case 3:
					
			//			break;
			//		default:
			//	}
			//}
		
	</script>
</asp:Content>