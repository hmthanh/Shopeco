<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/AdminMaster.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ThemBacSi.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script>
		$(document).ready(function () {
			$('#col7').addClass("active");
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
	<form action="" method="POST" role="form" enctype="multipart/form-data">
		<div id="content">
			<div id="content-header">
				<div id="breadcrumb"><a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="#" class="current">Bác sĩ</a> </div>
			</div>
			<div class="container">
				<div class="row" style="padding: 30px;">
					<legend>Thêm bác sĩ</legend>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label for="">Tên bác sĩ</label>
							<input type="text" class="form-control" id="txtName" placeholder="Tên bác sĩ" runat="server">
						</div>
						<div class="form-group">
							<label for="">Username</label>
							<input type="text" class="form-control" id="txtUsername" placeholder="Tên đăng nhập" runat="server">
						</div>
						<div class="form-group">
							<label for="">Mật khẩu</label>
							<input type="password" class="form-control" id="txtPassword" placeholder="Mật khẩu" runat="server">
						</div>
						<div class="form-group">
							<label for="">Email</label>
							<input name="email" id="txtEmail" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Chọn ảnh đại diện</label>
							<div class="custom-file">
								<asp:FileUpload ID="fileHinhAnh" ClientIDMode="Static" onchange="this.form.submit()" runat="server" AllowMultiple="true" />
								<input type="hidden" id="hdHinhAnh" runat="server" />
							</div>
						</div>
						<div class="form-group">
							<div id="imgUploaded" runat="server"></div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<label for="">Số điện thoại</label>
							<input name="phone" id="txtPhone" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Chuyên khoa</label>
							<input name="specialist" id="txtSpecialist" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Nơi công tác</label>
							<input name="regency" id="txtRegency" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Công việc</label>
							<input name="working" id="txtWorking" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Kinh nghiệm</label>
							<input name="experience" id="txtExperience" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Giáo dục</label>
							<input name="education" id="txtEducation" class="form-control" required="required" runat="server" />
						</div>
						<div class="form-group">
							<label for="">Thông tin mô tả</label>
							<input name="phone" id="txtDescription" class="form-control" required="required" runat="server" />
						</div>
						
					</div>
				</div>
				<div class="row">
					<div class="alert alert-danger" id="msgError" runat="server">

					</div>
				</div>
				<div class="row">
					<asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Thêm bác sĩ" OnClick="btnAdd_Click"></asp:Button>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function () {
				$('#datatableBootstrap').DataTable();
			});
		</script>
	</form>
</asp:Content>
