<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="CreateAds.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <script>
        $(document).ready(function () {
            $('#ads').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div data-v-fe11aa12="" class="route-index ">
        <div data-v-fe11aa12="" class="account-container container grid">
            <div class="cell">
                <div id="title" class="title" runat="server">Chào mừng đến với Kênh rao vặt</div>
                <div id="subtitle" class="subtitle" runat="server" style="margin-bottom: 100px;">
                    Kênh rao vặt là công cụ giúp bạn đăng các tin rao vặt.<br>
                    Bạn vẫn chưa có kênh rao vặt, click vào đây để <b><asp:LinkButton ID="btnCreateAds" OnClick="btnCreateAds_Click" Text="Tạo kênh rao vặt" runat="server"></asp:LinkButton></b>
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
