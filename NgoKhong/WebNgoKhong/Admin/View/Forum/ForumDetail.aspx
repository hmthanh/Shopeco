<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ForumDetail.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
                <div class="title" id="title_page" runat="server" style="text-align: left;">RAO VẶT</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude col-sm-8">Thông tin người rao vặt</div>
                            
                        </div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="dvDanhSachNguoiDung" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 300px;">Tên người dùng</td>
                                        <td id="soDienThoai" runat="server">hoang</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td id="maDonHang" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td id="tenKhachHang" runat="server">abc@gmail.com</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 300px;">Địa chỉ</td>
                                        <td id="diaChi" runat="server">abc</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Đăng nhập lần cuối</td>
                                        <td id="datecreate" runat="server">17/03/2018</td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Mã rao vặt</td>
                                        <td id="adsCode" runat="server">RV001</td>
                                    </tr>
                                </tbody>
                               
                            </table>
                        </div>

                        <div id="adsTitle" runat="server" class="">
                            <div class="ptieude">
                               Tin rao vặt
                            </div>
                        </div>
                        <div id="tbDsMuaHang" runat="server">
                            <table class="table table-bordered table-hover dataTable" style="text-align:center;">
                                <tbody id="dsMuaHang" runat="server">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
</asp:Content>