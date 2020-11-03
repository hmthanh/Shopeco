<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
        <input type="hidden" id="_idSanPham" runat="server" />
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title" id="title_page" runat="server" style="text-align: left;">THÔNG TIN SẢN PHẨM</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude">Chi tiết sản phẩm</div>
                        </div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="dvDanhSachNguoiDung" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 200px;">Mã sản phẩm</td>
                                        <td id="maSanPham" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Tên sản phẩm</td>
                                        <td id="tenSanPham" runat="server">San pham A</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Loại sản phẩm</td>
                                        <td id="loaiSanPham" runat="server">hoang</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Giá</td>
                                        <td id="gia" runat="server">abc</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Ngày tạo</td>
                                        <td id="dateCreate" runat="server">17/03/2018</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Hiển thị Sản phẩm Hot</td>
                                        <td id="setHot" runat="server">
                                            <div class='btn-group btn-group-toggle' data-toggle='buttons' id="divSetHot" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Hiển thị trang chủ</td>
                                        <td id="setHome" runat="server">
                                            <div class='btn-group btn-group-toggle' data-toggle='buttons' id="divSetHome" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Tình trạng</td>
                                        <td runat="server">
                                            <div class="col-sm-12" id="tinhTrang" runat="server">
                                                <div class='btn-group btn-group-toggle' data-toggle='buttons'>
                                                    <label class='btn btn-success ' id="lb1" runat="server">
                                                        <input type='radio' name='options' id='option1' autocomplete='off' checked>Đã duyệt
                                                    </label>
                                                    <label class='btn btn-danger' id="lb2" runat="server">
                                                        <input type='radio' name='options' id='option2' autocomplete='off'>Chưa duyệt
                                                    </label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 200px;">Mô tả</td>
                                        <td id="Td1" runat="server">
                                            <textarea runat="server" id="moTa" class="ckeditor"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                               
                            </table>
                        </div>

                        <%--<div class="">
                            <div class="ptieude">
                               Lịch sử mua hàng
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
                        </div>--%>
                    </div>
                </div>
            </section>
        </div>
    <script>

        $('#ContentPlaceHolder1_lb1').click(function () {
            var idSanPham = $('#ContentPlaceHolder1__idSanPham').val();
            var data = { action: 'TrangThaiSanPham', idSanPham: idSanPham, id: 1 };

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
        });
        $('#ContentPlaceHolder1_lb2').click(function () {
            var idSanPham = $('#ContentPlaceHolder1__idSanPham').val();
            var data = { action: 'TrangThaiSanPham', idSanPham: idSanPham, id: 0 };

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
        });
        $('#ContentPlaceHolder1_divSetHot').click(function () {
            var idSanPham = $('#ContentPlaceHolder1__idSanPham').val();
            var data = { Action: 'ShowProductHot', idSanPham: idSanPham };
            $.ajax({
                type: 'GET',
                url: '../../Ajax.aspx?Action=ShowProductHot&id=' + idSanPham,
                success: function (data) {
                    if (data == 'True')
                    {
                        location.reload();
                    }
                    else
                    {
                        alert("Không thể cập nhât !");
                    }
                }
            });
        });

        $('#ContentPlaceHolder1_divSetHome').click(function () {
            var idSanPham = $('#ContentPlaceHolder1__idSanPham').val();
            var data = { Action: 'ShowProductHome', idSanPham: idSanPham };
            $.ajax({
                type: 'GET',
                url: '../../Ajax.aspx?Action=ShowProductHome&id=' + idSanPham,
                success: function (data) {
                    if (data == 'True') {
                        location.reload();
                    }
                    else {
                        alert("Không thể cập nhât !");
                    }
                }
            });
        });
    </script>
</asp:Content>