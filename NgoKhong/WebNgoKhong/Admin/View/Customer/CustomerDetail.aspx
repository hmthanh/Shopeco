<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerDetail.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

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
                <div class="title" id="title_page" runat="server" style="text-align: left;">NGƯỜI DÙNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude col-sm-8">Thông tin tài khoản</div>
                            <div class="col-sm-4" style="margin-bottom: 20px;">
                                <asp:Button ID="btnEdit" OnClick="btnEdit_Click" CssClass="btn btn-info" Text="Chỉnh sửa người dùng" runat="server"></asp:Button>
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
                                        <td style="width: 300px;">Mã tài khoản</td>
                                        <td id="usUserID" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Username</td>
                                        <td id="usUsername" runat="server"></td>
                                    </tr>
									 <tr>
                                        <td style="width: 300px;">Ngày đăng ký</td>
                                        <td id="dateUserCreate" runat="server"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

<%--                        <div class="">
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

                    <%--//////////////////////////////////////////////////--%>
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude col-sm-8">Thông tin khách hàng</div>
                            <%--<div class="col-sm-4" style="margin-bottom: 20px;">
                                <asp:Button ID="Button3" OnClick="btnEdit_Click" CssClass="btn btn-info" Text="Chỉnh sửa thông tin" runat="server"></asp:Button>
                            </div>--%>
                        </div>
                        <%--<div class="row">
                            <div id="bangChiTietDonHang" class="">
                            </div>
                        </div>--%>
                        <div id="Div3" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
									<tr>
                                        <td style="width: 300px;">Mã khách hàng</td>
                                        <td id="usCustomerCode" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tên khách hàng</td>
                                        <td id="usTenNguoiDung" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td id="usSoDienThoai" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td id="usEmail" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Địa chỉ</td>
                                        <td id="usDiaChi" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Đăng nhập lần cuối</td>
                                        <td id="datecreate" runat="server"></td>
                                    </tr>
                                    <%--<tr>
                                        <td style="width: 300px;">Mã rao vặt</td>
                                        <td id="adsCode" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Mã gian hàng</td>
                                        <td id="shopCode" runat="server"></td>
                                    </tr>--%>
									<tr>
                                        <td style="width: 300px;">Đơn hàng đã đặt mua</td>
                                        <td id="usBought" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Tổng tiền đã đặt hàng</td>
                                        <td id="usTotalMoney" runat="server"></td>
                                    </tr>
                                </tbody>
                               
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            <section class="content">
                <div class="title" id="Div2" runat="server" style="text-align: left;">GIAN HÀNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude col-sm-8">Thông tin gian hàng</div>
                            <div class="col-sm-4" style="margin-bottom: 20px;">
                                <asp:Button ID="btnEditShop" OnClick="btnEditShop_Click" CssClass="btn btn-info" Text="Chỉnh sửa thông tin" runat="server"></asp:Button>
                            </div>
                        </div>
                        <div id="divGianHang" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
									
									<tr>
                                        <td style="width: 300px;">Mã gian hàng</td>
                                        <td id="ghMaGianHang" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tên gian hàng</td>
                                        <td id="ghTen" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Địa chỉ gian hàng</td>
                                        <td id="ghDiaChi" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Chủ gian hàng</td>
                                        <td id="ghChuGianHang" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td id="ghSoDienThoai" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td id="ghEmail" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Mô tả</td>
                                        <td id="ghMoTa" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Ngày đăng ký</td>
                                        <td id="ghDateCreate" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Sản phẩm đăng bán</td>
                                        <td id="ghProductSold" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Đơn hàng đã được đặt</td>
                                        <td id="ghOrderSet" runat="server"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>

            <section class="content">
                <div class="title" id="divRaoVat" runat="server" style="text-align: left;">RAO VẶT</div>
                <div class="box">
                    <div class="box-body">
                        <div class="">
                            <div class="ptieude col-sm-8">Thông tin rao vặt</div>
                            <div class="col-sm-4" style="margin-bottom: 20px;">
                                <asp:Button ID="btnEditAds" OnClick="btnEditAds_Click" CssClass="btn btn-info" Text="Chỉnh sửa thông tin" runat="server"></asp:Button>
                            </div>
                        </div>
                        <div id="div4" runat="server">
                            <table class="table table-bordered table-hover dataTable">
                                <tbody>
									<tr>
                                        <td style="width: 300px;">Mã rao vặt</td>
                                        <td id="rvMaRaoVat" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Tên rao vặt</td>
                                        <td id="rvTen" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Số điện thoại</td>
                                        <td id="rvSoDienThoai" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Địa chỉ</td>
                                        <td id="rvDiaChi" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px;">Email</td>
                                        <td id="rvEmail" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Ngày đăng ký</td>
                                        <td id="rvDateCreate" runat="server"></td>
                                    </tr>
									<tr>
                                        <td style="width: 300px;">Tổng số rao vặt</td>
                                        <td id="rvStatistic" runat="server"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
</asp:Content>