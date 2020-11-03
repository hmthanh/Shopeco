<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="UserEditInfo.aspx.cs" Inherits="View_User_Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
    <div class="wrapper" style="background: #fafafa; padding-top: 23px;">
        <div class="grid">
            <div class="route-settings__menu">
                <div id="ember4554" class="ember-view">
                    <div class="card-panel">
                        <div class="card-panel__section">
                            <div class="card-panel__title">Tài khoản</div>
                            <div id="ember4555" class="shop-setting-link ember-view">
                                <a href="<%=GetRouteUrl("user_info",new { }) %>" id="ember4556" class="shop-setting-link__link ember-view">
                                    <div style="background: #49cbdd;" class="shop-setting-link__icon">
                                        <svg style="fill: #49cbdd;" viewBox="0 0 32 32">
                                            <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                    </div>
                                    <div class="shop-setting-link__caption">Thông tin</div>
                                    <div style="background: #49cbdd;" class="shop-setting-link__active-bar"></div>
                                </a>
                            </div>
                            <div id="ember4557" class="shop-setting-link ember-view">
                                <a href="<%=GetRouteUrl("user_changepass",new { }) %>" id="ember4558" class="shop-setting-link__link ember-view">
                                    <div style="background: #6897d6;" class="shop-setting-link__icon">
                                        <svg style="fill: #6897d6;" viewBox="0 0 32 32">
                                            <path d="M31 23.5h-3.1c.1.3.1.7.1 1 0 2.8-2.2 5-5 5s-5-2.2-5-5c0-.4 0-.7.1-1h-5.2c.1.3.1.7.1 1 0 2.8-2.2 5-5 5s-5-2.2-5-5c0-.4 0-.7.1-1H3c-1.1 0-2-.9-2-2v-14c0-1.1.9-2 2-2h17c1.1 0 2 .9 2 2v2h7c.6 0 1 .4 1 1l2 12c0 .5-.4 1-1 1zm-8 4c1.7 0 3-1.3 3-3 0-1.6-1.3-3-3-3s-3 1.3-3 3c0 1.6 1.3 3 3 3zm-15 0c1.7 0 3-1.3 3-3 0-1.6-1.3-3-3-3s-3 1.3-3 3c0 1.6 1.3 3 3 3zm12-19c0-.6-.4-1-1-1H4c-.6 0-1 .4-1 1v12c0 .6.4 1 1 1 .9-1.2 2.3-2 4-2 1.6 0 3.1.8 4 2h7c.3-.4.6-.7 1-1v-12zm2 3v4h6.8l-.8-4h-6zm7.2 6H22v2.1c.3-.1.7-.1 1-.1 1.6 0 3.1.8 4 2h3l-.8-4z"></path></svg>
                                    </div>
                                    <div class="shop-setting-link__caption">Đổi mật khẩu</div>
                                    <div style="background: #6897d6;" class="shop-setting-link__active-bar"></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col route-settings__main">
                
                    <script>
                        $(document).ready(function () {
                            $('#ember4555').addClass("active");
                        });
                    </script>
                    <div id="ember6145" class="shop-setting-header ember-view">
                        <div class="shop-setting-header__content">
                            <div style="background: #49cbdd;" class="shop-setting-header__icon">
                                <svg viewBox="0 0 32 32">
                                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                            </div>
                            <div class="shop-setting-header__caption ">
                                <div class="shop-setting-header__title">Tài Khoản</div>
                                <div class="shop-setting-header__subtitle">Thông tin tài khoản</div>
                            </div>
                        </div>
                        <hr class="shop-setting-header__seperator">
                    </div>
                    <div class="seller-profile" style="margin: 0 auto; width: 80%;">
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                                Họ và tên
                            </div>
                            <div class="edit-input">
                                <div id="ember4813432" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="name" placeholder="Họ và tên" maxlength="80" id="txtTen" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                                Địa chỉ
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-input">
                                <div id="sdfsdffsdf" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="Address" placeholder="Địa chỉ" maxlength="80" id="txtDiaChi" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28.38 26.45a1.75 1.75 0 0 0-.66-1.45c-.45-.32-5.17-3.46-5.71-3.81a2.33 2.33 0 0 0-2.3.14c-.46.24-1.84 1-2.52 1.41A33.76 33.76 0 0 1 13 19.06a33.57 33.57 0 0 1-3.71-4.2c.39-.68 1.18-2.06 1.42-2.51a3 3 0 0 0 .36-1.35 1.71 1.71 0 0 0-.23-.9C10.48 9.49 7.32 4.75 7 4.32a2 2 0 0 0-2.84-.22S0 7.11 0 8.8c.16 4.84 4.86 10.51 8.77 14.41s9.6 8.59 14.44 8.74c1.72.06 4.69-4.11 4.72-4.15a2.46 2.46 0 0 0 .44-1.4z"></path></svg>
                                Số điện thoại
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-input">
                                <div id="ember4142" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="phone" placeholder="Số điện thoại" maxlength="80" id="txtPhone" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                                Email
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-input">
                                <div id="ember4142" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="email" placeholder="Email" maxlength="80" id="txtEmail" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="edit-row btn-group" style="padding: 0px 300px;"> 
                        <%--<button id="btnLuuThongTin" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">Lưu</button>--%>
                        <%--<input type="button" id="btnLuu" onclick="btnLuuThongTin_Click" runat="server" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" text="Lưu"/>--%>
                        <%--<button id="btnLuuThongTin" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" onclick="btnLuuThongTin_Click">Lưu</button>--%>
                        <asp:Button class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server"  Text="Lưu" OnClick="btnLuuThongTin_Click"></asp:Button>
                        <asp:Button id="btnHuy" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view " runat="server" OnClick="btnHuy_Click" Text="Hủy"></asp:Button>
                    </div>
                    <link href="../Content/gianhang/css/shopinfo.css" rel="stylesheet" />
                    <style>
                        .btn-group, .btn-group, .btn-group {
                            margin-top: 0 !important;
                        }
                    </style>
                    <link href="../Content/gianhang/css/shopcustom.css" rel="stylesheet" />
                
            </div>
        </div>
    </div></form>
</asp:Content>
