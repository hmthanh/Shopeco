<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Statistic.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
    <input type="hidden" value="0" id="idDonHang" runat="server" />
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title" id="title_page" runat="server" style="text-align: left;">ĐƠN HÀNG ĐƠN HÀNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
							<div class="ptieude">Thống kê đơn hàng</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-lg-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <select id="slGianHang" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
                                    </div>
                                </div>
								<div class="col-lg-3">
									<input type="text" id="txtDateFrom" runat="server" class="form-control datepicker" placeholder="Lọc theo ngày bắt đầu" style="width: 200px; padding-left: 15px;" />
								</div>
								<div class="col-lg-3">
									<input type="text" id="txtDateTo" runat="server" class="form-control datepicker" placeholder="Lọc theo ngày kết thúc" style="width: 200px; padding-left: 15px;" />
								</div>
								<div class="col-lg-2">
									<asp:LinkButton class="btn btn-primary" ID="btnSearch" runat="server" OnClick="btnSearch_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
								</div>
							</div>
						</div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="dvDanhSachNguoiDung" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 300px;">Tổng số đơn hàng</td>
                                        <td id="totalOrder" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tổng số khách hàng đã mua</td>
                                        <td id="totalCustomer" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số đơn hàng mới tạo</td>
                                        <td id="totalOrderCreate" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Số đơn hàng đang giao</td>
                                        <td id="totalOrderProcessing" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Số đơn hàng hoàn tất</td>
                                        <td id="totalOrderComplete" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Số đơn hàng đã hủy</td>
                                        <td id="totalOrderCancel" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tổng doanh thu</td>
                                        <td id="totalMoney" runat="server"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    <script>
        $(document).ready(function () {
            $('#ContentPlaceHolder1_tinhTrang label').click(function () {
                var input = $(this).children('input').attr('id');
                var idDonHang = $('#ContentPlaceHolder1_idDonHang').val();
                var id = input.substr(6, 1);
                
                var data = { action: 'CapNhatTrangThai', idDonHang: idDonHang, id: id };

                $.ajax({
                    type: 'get',
                    url: location.origin + '/Ajax/Ajax_DonHang.aspx',
                    dataType: "JSON",
                    data: data,
                    success: function (data) {
                        if (data == 1) {
                            alert("Đã cập nhật trạng thái thành công !");
                            location.reload();
                        }
                    }
                });
                //$.ajax({
                //    type: 'GET',
                //    url: "../View/DonHang/Ajax_DonHang.aspx",
                //    dataType: 'JSON',
                //    data: data,
                //    success: function (data) {
                //        alert("sdf");
                //        console.log(data);
                //    }
                //});
            });
        });
    </script>
	
	<script src="../../../Content/UI/js/bootstrap-datepicker.min.js"></script>
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