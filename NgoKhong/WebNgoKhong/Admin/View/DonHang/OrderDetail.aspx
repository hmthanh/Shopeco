<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
                <div class="title" id="title_page" runat="server" style="text-align: left;">CHI TIẾT ĐƠN HÀNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude">Chi tiết đơn hàng</div>
                        </div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="dvDanhSachNguoiDung" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 300px;">Mã đơn hàng</td>
                                        <td id="maDonHang" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tên khách hàng</td>
                                        <td id="tenKhachHang" runat="server">Võ Ánh Hồng</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td id="soDienThoai" runat="server">123456789</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Địa chỉ</td>
                                        <td id="diaChi" runat="server">0908708367</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td id="email" runat="server">0123456789</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Ngày tạo</td>
                                        <td id="datecreate" runat="server">17/03/2018</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tình trạng</td>
                                        <td >
                                            <div class="col-sm-12" id="tinhTrang" runat="server">
                                                
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="">
                            <div class="ptieude">
                                Chi tiết sản phẩm
                            </div>
                        </div>
                        <div id="Div1" runat="server">
                            <table class="table table-bordered table-hover dataTable" style="text-align:center;">
                                <tbody id="dsMuaHang" runat="server">
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="7"><div class="col-sm-9">
                                            </div>
                                            <div class="col-sm-3">
                                                Tổng tiền: <span style="font-weight: 800;" id="spTotal" runat="server"></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>
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
</asp:Content>