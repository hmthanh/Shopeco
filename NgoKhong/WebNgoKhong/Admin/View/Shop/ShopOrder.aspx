<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ShopOrder.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        
        .img-hinhanh{
            width: 100px;
        }
        .btn.active{
                border: 4px solid gray;
        }
        .ptieude {
            color: #0084d2;
            font-size: 20px;
        }

        .row {
            margin: 0;
        }
    </style>
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
                        <div id="Div1" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 300px;">Tên gian hàng</td>
                                        <td id="tenGianHang" runat="server"></td>
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
                                    <tr>
                                        <td style="width: 300px;">Mã gian hàng</td>
                                        <td id="shopCode" runat="server"></td>
                                    </tr>
                                </tbody>
                               
                            </table>
                        </div>
                        <div class="">
                            <div class="ptieude">
                               Danh sách đơn hàng đã được đặt
                            </div>
                        </div>
						<div class="row">
							<div class="form-group col-xs-3" >
								<label for="">Từ ngày </label>
								<input type="text" class="form-control datepicker" id="dateFrom" runat="server" placeholder="Từ ngày">
							</div>

							<div class="form-group col-xs-3" >
								<label for="">Đến ngày </label>
								<input type="text" class="form-control datepicker" id="dateTo" runat="server" placeholder="Đến ngày">
							</div>

							<div class="form-group col-xs-3" >
								<label for="">Tình trạng </label>

								<select name="status" id="slStatus" class="form-control" required="required" runat="server">
									<option value="-1">-- Chọn tình trạng --</option>
									<option value="0">Mới tạo</option>
									<option value="1">Đang xử lý</option>
									<option value="2">Hoàn tất</option>
									<option value="3">Hủy</option>
								</select>
							</div>
							<asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary col-xs-3" style="margin-top: 25px;" Text="Tìm kiếm" OnClick="btnSearch_Click"></asp:Button>
						</div>
	
						<div id="mainDataTable">
							<table id="table" data-search="true" data-show-columns="true" data-pagination="false" data-toggle="table">
								<thead>
									<tr>
										<th data-field="col1" data-sortable="true">Ngày mua</th>
										<th data-field="col2" data-sortable="true">Mã đơn hàng</th>
										<th data-field="col3" data-sortable="true" width="200">Mã khách hàng</th>
										<th data-field="col4" data-sortable="true">Tên khách hàng</th>
										<th data-field="col5" data-sortable="true">Trạng thái</th>
										<th data-field="col6" data-sortable="true">Tổng tiền</th>
										<th data-field="col7" data-sortable="true">Xóa</th>
									</tr>
								</thead>
								<tbody  id="dvDanhSachNguoiDung" runat="server">
								</tbody>
							</table>
                        </div>
						<div class="pnPaging">
							<table style="text-align:center;">
								<tbody  id="dvPaging" runat="server">

								</tbody>
							</table>
						</div>
						<script src="../../../Content/UI/js/bootstrap-table.min.js"></script>
						<div class="mt-10" style="margin-top: 20px;"></div>
						<table class="table table-bordered table-hover dataTable">
							<tbody>
								<tr>
									<td style="width: 300px;">Tổng số sản phẩm</td>
									<td id="totalProduct" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Sản phẩm mới tạo</td>
									<td id="totalProductNew" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Sản phẩm đang xử lý</td>
									<td id="totalProductProcessing" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Sản phẩm hoàn tất</td>
									<td id="totalProductComplete" runat="server"></td>
								</tr>
								<tr>
									<td style="width: 300px;">Sản phẩm hủy</td>
									<td id="totalProductCancel" runat="server"></td>
								</tr>
							</tbody>
						</table>
                    </div>
                </div>
            </section>
        </div>
	
	<script>
		$(document).ready(function () {
			$('.datepicker').datepicker({
				autoclose: true,
				todayHighlight: true,
				format: 'dd/mm/yyyy'
			});
		});
	</script>

</asp:Content>