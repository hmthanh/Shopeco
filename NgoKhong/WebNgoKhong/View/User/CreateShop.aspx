<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="CreateShop.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <script>
        $(document).ready(function () {
            $('#shopinfo').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div data-v-fe11aa12="" class="route-index ">
        <div data-v-fe11aa12="" class="account-container container grid">
            <div class="cell">
                <div id="title" class="title" runat="server">Chào mừng đến với Gian hàng</div>
                <div id="subtitle" class="subtitle" runat="server" style="margin-bottom: 100px;">
                    Gian hàng là công cụ giúp bạn dễ phân loại sản phẩm và theo dõi đơn hàng.<br>
                    Bạn vẫn chưa có gian hàng, click vào đây để <b><asp:LinkButton ID="btnCreateShop" OnClick="btnCreateShop_Click" Text="Tạo gian hàng" runat="server"></asp:LinkButton></b>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .login {
            float: none;
            margin: 0 auto;
        }
    </style>
</asp:Content>