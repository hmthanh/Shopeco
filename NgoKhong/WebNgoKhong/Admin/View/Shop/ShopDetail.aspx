<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ShopDetail.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="title" id="title_page" runat="server" style="text-align: left;">GIAN HÀNG</div>
			<div class="box">
				<div class="box-body">
					<div class="">
						<div class="ptieude col-sm-8">Thông tin gian hàng</div>
						<div class="col-sm-4" style="margin-bottom: 20px;">
							<asp:Button ID="btnEdit" OnClick="btnEdit_Click" CssClass="btn btn-info" Text="Chỉnh sửa thông tin" runat="server"></asp:Button>
						</div>
					</div>
					<div id="dvDanhSachNguoiDung" runat="server">
						<table class="table table-bordered table-hover dataTable">
							<tbody>
								<tr>
									<td style="width: 300px;">Tên gian hàng</td>
									<td id="tenGianHang" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Mã gian hàng</td>
									<td id="shopCode" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Địa chỉ</td>
									<td id="diaChi" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Chủ gian hàng</td>
									<td id="chuGianHang" runat="server"></td>
								</tr>

								<tr>
									<td style="width: 300px;">Email</td>
									<td id="email" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Số điện thoại</td>
									<td id="phone" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Mô tả</td>
									<td id="description" runat="server"></td>
								</tr>
							</tbody>

						</table>
					</div>

					<div class="">
						<div class="ptieude">
							Danh sách sản phẩm của gian hàng
						</div>
					</div>
					<div class="row">
						<div class="form-group col-xs-3">
							<label for="">Từ ngày </label>
							<input type="text" class="form-control datepicker" id="dateFrom" runat="server" placeholder="Từ ngày">
						</div>

						<div class="form-group col-xs-3">
							<label for="">Đến ngày </label>
							<input type="text" class="form-control datepicker" id="dateTo" runat="server" placeholder="Đến ngày">
						</div>

						<div class="form-group col-xs-3">
							<label for="">Tình trạng </label>

							<select name="status" id="slStatus" class="form-control" required="required" runat="server">
								<option value="-1">-- Chọn tình trạng --</option>
								<option value="1">Đã duyệt</option>
								<option value="0">Chưa duyệt</option>
							</select>
						</div>
						<asp:Button ID="btnSearch" runat="server" Style="margin-top: 25px;" CssClass="btn btn-primary col-xs-3" Text="Tìm kiếm" OnClick="btnSearch_Click"></asp:Button>
					</div>
					<div id="mainDataTable">
						<table id="table" data-search="true" data-show-columns="true" data-pagination="false"  data-toggle="table" class="table table-bordered table-hover dataTable" style="text-align: center;">
							<thead>
								<tr>
									<th class='th' style='font-size: 15px; color: white;'>Mã sản phẩm</th>
									<th class='th' style='font-size: 15px; color: white;'>Ngày tạo</th>
									<th class='th' style='font-size: 15px; color: white;'>Tên sản phẩm</th>
									<th class='th' style='font-size: 15px; color: white;'>Hình ảnh</th>
									<th class='th' style='font-size: 15px; color: white;'>Loại sản phẩm</th>
									<th class='th' style='font-size: 15px; color: white;'>Giá</th>
									<th class='th' style='font-size: 15px; color: white;'>Tình trạng</th>
								</tr>
							</thead>
							<tbody id="dsMuaHang" runat="server">
							</tbody>
						</table>
					</div>
					<div class="pnPaging">
						<table style="text-align: center;">
							<tbody id="dvPaging" runat="server">
							</tbody>
						</table>
					</div>
					<div class="mt-10" style="margin-top: 20px;"></div>
					<table class="table table-bordered table-hover dataTable">
						<tbody>
							<tr>
								<td style="width: 300px;">Tổng số sản phẩm</td>
								<td id="totalProduct" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng tiền</td>
								<td id="totalMoney" runat="server"></td>

							</tr>
							<tr>
								<td style="width: 300px;">Sản phẩm đã duyệt</td>
								<td id="totalChecked" runat="server"></td>

							</tr>
							<tr>
								<td style="width: 300px;">Sản phẩm chưa duyệt</td>
								<td id="totalUnCheck" runat="server"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
</asp:Content>
