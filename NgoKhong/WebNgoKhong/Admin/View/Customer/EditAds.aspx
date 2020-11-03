<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="EditAds.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
                            <div class="ptieude">Chỉnh sửa thông tin rao vặt</div>
                        </div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="dvDanhSachNguoiDung" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
                                    <tr>
                                        <td style="width: 300px;">Tên rao vặt</td>
                                        <td>
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtShopName" placeholder="Tên gian hàng" runat="server"/>
                                                <div class="invalid-feedback " id="msgShopName" runat="server">
                                                    Tên không hợp lệ
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Địa chỉ</td>
                                        <td >
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtAddress" placeholder="Địa chỉ" runat="server"/>
                                                <div class="invalid-feedback " id="msgAddress" runat="server">
                                                    Địa chỉ không hợp lệ
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td>
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtEmail" placeholder="Email" runat="server"/>
                                                <div class="invalid-feedback " id="msgEmail" runat="server">
                                                    Email không hợp lệ
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td >
                                            <div class="row">
                                                <input type="text" class="form-control" id="txtPhone" placeholder="Số điện thoại" runat="server"/>
                                                <div class="invalid-feedback " id="msgPhone" runat="server">
                                                    Số điện thoại không hợp lệ
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
                            <asp:Button CssClass="btn btn-info" ID="btnUpdate" runat="server" Text="Cập nhật" OnClick="btnUpdate_Click"></asp:Button>
                            <asp:Button CssClass="btn btn-reddit" ID="btnCancel" runat="server" Text="Hủy" OnClick="btnCancel_Click"></asp:Button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
</asp:Content>