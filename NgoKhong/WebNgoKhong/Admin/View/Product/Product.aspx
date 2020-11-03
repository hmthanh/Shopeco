<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script>
		$(document).ready(function () {
		});
		function DeleteSanPham(idSanPham) {
			if (confirm("Bạn có muốn xóa không ?")) {
				$.ajax({
					type: "POST",
					url: "/Admin/View/SanPham/SanPham.aspx/DeleteSanPham",
					data: "{idSanPham:'" + idSanPham + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (datas) {
						if (datas.d == "True")
							location.reload();
						else {
							alert("Không thể xóa sản phẩm");
						}
					},
					error: function () { alert("Không thể xóa.Lỗi function") }
				});
			}
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="title">DANH SÁCH SẢN PHẨM</div>
			<div class="box">
				<div class="box-body">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-4">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
									<select id="slGianHang" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
									<input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tên sản phẩm..." />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
									<select id="slLoaiSanPham" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
								</div>
							</div>
							<div class="col-lg-2" style="text-align: right">
								<asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
							</div>
						</div>
					</div>

					<div class="form-group" style="display: none">
						<div class="row">
							<div class="col-sm-8">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
									<input type="text" id="txtUrlQuet" runat="server" class="form-control" placeholder="Nhập url quét..." />
								</div>
							</div>
							<div class="col-sm-4">
								<div style="text-align: right;">
									<asp:LinkButton class="btn btn-primary" ID="btQuet" runat="server" OnClick="btQuet_Click"><i class="fa fa-search"></i><span> Quét sản phẩm</span></asp:LinkButton>
									<a class="btn btn-primary" href="<%=GetRouteUrl("adminCapNhatSanPham", new { id = 0}) %>"><i class="glyphicon glyphicon-plus"></i>Thêm</a>
								</div>
							</div>
						</div>
					</div>
					<div>
						<table id="table" data-search="true" data-sort="true" data-show-columns="true" data-pagination="false" data-toggle="table" class="table table-bordered table-hover dataTable" style="text-align: center;">
							<thead>
								<tr>
									<th class='th'>STT
									</th>
									<th class='th'>Mã sản phẩm
									</th>
									<th class='th'>Mã gian hàng
									</th>
									<th class='th'>Tên sản phẩm
									</th>
									<th class='th'>Giá cũ
									</th>
									<th class='th'>Giá mới
									</th>
									<th class='th'>Ngày tạo
									</th>
									<th class='th'>Loại sản phẩm
									</th>
									<th class='th'>Tình trạng
									</th>
								</tr>
							</thead>
							<tbody id="dvDanhSachLoaiTinTuc" runat="server">
							</tbody>
						</table>
					</div>
					<div class="pnPaging">
						<table>
							<tbody id="divPaging" runat="server">
							</tbody>
						</table>
					</div>
					<div class="mt-10" style="margin-top: 20px;"></div>
						<table class="table table-bordered table-hover dataTable">
						<tbody>
							<tr>
								<td style="width: 300px;">Tổng số sản phẩm</td>
								<td id="totalCol1" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng tiền</td>
								<td id="totalCol2" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng số sản phẩm đã duyệt</td>
								<td id="totalCol3" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng số sản phẩm chưa duyệt</td>
								<td id="totalCol4" runat="server"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
</asp:Content>