<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/GianHangLogin.master" CodeFile="ThongBao.aspx.cs" Inherits="GianHangLogin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <form runat="server" method="post">
        <div data-v-fe11aa12="" class="wrapper route-index ">
            <div data-v-fe11aa12="" class="account-container container grid">
                <div class="cell">
                    <div class="title">Chào mừng đến với Shopeco - Kênh Người bán</div>
                    <div class="subtitle" style="margin-bottom: 100px;">
                        Shopeco - Kênh Người bán là công cụ quản lý shop, giúp bạn dễ phân loại sản phẩm, theo dõi đơn hàng, chăm sóc khách hàng và đánh giá hoạt động của shop.<br>
                        Click vào đây để <b><a href="<%=GetRouteUrl("gianhang_createshop",new { }) %>" style="text-decoration: none">Tạo gian hàng</a></b>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <style type="text/css">
        .login {
            float: none;
            margin: 0 auto;
        }
    </style>
</asp:Content>
