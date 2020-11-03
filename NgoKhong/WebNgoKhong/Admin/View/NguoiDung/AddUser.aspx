<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style>
		.fstMultipleMode {
			width: 100%;
		}

			.fstMultipleMode .fstControls {
				width: 100% !important;
			}

		.fstChoiceItem {
			font-size: 1.4rem !important;
		}

		.fstResultItem {
			font-size: 1.5rem !important;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<link href="../../../Content/admin/fastselect.min.css" rel="stylesheet" />
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="title" id="title_page" runat="server" style="text-align: left;">TÀI KHOẢN HỆ THỐNG</div>
			<div class="box">
				<div class="box-body">
					<div class="">
						<div class="ptieude">Thêm sản phẩm</div>
					</div>
					<%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
					<div id="dvDanhSachNguoiDung" runat="server">
						<table class="table table-bordered table-hover dataTable">
							<tbody>
								<tr>
									<td style="width: 300px;">Tên đăng nhập</td>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="txtUsername" placeholder="Tên đăng nhập" runat="server" />
											<div class="invalid-feedback " id="msgUsername" runat="server">
												Tên không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Quyền truy cập</td>
									<td>
										<div class="row">

											<asp:ListBox ID="slPermission" class="multipleSelect" SelectionMode="multiple" name="language" runat="server">
												<asp:ListItem Value="1">Quản lý website</asp:ListItem>
												<asp:ListItem Value="2">Quản lý khách hàng</asp:ListItem>
												<asp:ListItem Value="3" Selected>Quản lý sản phẩm</asp:ListItem>
												<asp:ListItem Value="4" Selected>Quản lý đơn hàng</asp:ListItem>
												<asp:ListItem Value="5">Quản lý rao vặt</asp:ListItem>
												<asp:ListItem Value="6">Tài khoản hệ thống</asp:ListItem>
											</asp:ListBox>
											<script src="../../../Content/admin/build.min.js"></script>
											<script src="../../../Content/admin/fastselect.standalone.js"></script>
											<script>
												$('.multipleSelect').fastselect();
											</script>
											<%--<input type="text" class="form-control" id="Text1" placeholder="Tên đăng nhập" runat="server" />--%>
											<div class="invalid-feedback " id="msgAdminType" runat="server">
												Tên không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Mật khẩu</td>
									<td>
										<div class="row">
											<input type="password" class="form-control" id="txtPassword1" placeholder="Mật khẩu" runat="server" />
											<div class="invalid-feedback " id="msgPassword" runat="server">
												Mật khẩu không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Mật khẩu lần 2</td>
									<td>
										<div class="row">
											<input type="password" class="form-control" id="txtPassword2" placeholder="Nhập lại mật khẩu" runat="server" />
											<div class="invalid-feedback " id="msgPassword2" runat="server">
												Mật khẩu không trùng nhau
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Tên người dùng</td>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="txtFullName" placeholder="Họ và tên" runat="server" />
											<div class="invalid-feedback " id="msgFullName" runat="server">
												Tên không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Email</td>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="txtEmail" placeholder="Email" runat="server" />
											<div class="invalid-feedback " id="msgEmail" runat="server">
												Email không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="width: 300px;">Số điện thoại</td>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="txtPhone" placeholder="Số điện thoại" runat="server" />
											<div class="invalid-feedback " id="msgPhone" runat="server">
												Số điện thoại không hợp lệ
											</div>
										</div>
									</td>
								</tr>


								<tr>
									<td style="width: 300px;">Địa chỉ</td>
									<td>
										<div class="row">
											<input type="text" class="form-control" id="txtAddress" placeholder="Địa chỉ" runat="server" />
											<div class="invalid-feedback " id="msgAddress" runat="server">
												Địa chỉ không hợp lệ
											</div>
										</div>
									</td>
								</tr>
								<%--<tr>
                                        <td style="width: 300px;">Mã gian hàng</td>
                                        <td>
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtShopCode" placeholder="Mã gian hàng" runat="server"/>
                                                <div class="invalid-feedback " id="msgShopCode" runat="server">
                                                    Mã gian hàng không hợp lệ
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Mã rao vặt</td>
                                        <td>
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtAdsCode" placeholder="Mã rao vặt" runat="server"/>
                                                <div class="invalid-feedback " id="msgAdsCode" runat="server">
                                                    Mã rao vặt không hợp lệ
                                                </div>
                                            </div>
                                        </td>
                                    </tr>--%>
							</tbody>
						</table>
					</div>

					<div class="row" style="margin-left: 30px;">
						<asp:Button CssClass="btn btn-info" ID="btnUpdate" runat="server" Text="Tạo mới" OnClick="btnUpdate_Click"></asp:Button>
						<asp:Button CssClass="btn btn-reddit" ID="btnCancel" runat="server" Text="Hủy" OnClick="btnCancel_Click"></asp:Button>
					</div>
				</div>
			</div>
		</section>
	</div>
</asp:Content>