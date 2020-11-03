<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="ChangePass.aspx.cs" Inherits="View_User_Login" %>

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
                                Mật khẩu
                            </div>
                            <div class="edit-input">
                                <div id="ember4813432" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="password" placeholder="Nhập mật khẩu" maxlength="80" id="txtMatkhau1" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                                Xác nhận mật khẩu
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-input">
                                <div id="sdfsdffsdf" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" name="Address" placeholder="Nhập mật khẩu lần nữa" maxlength="80" id="txtMatkhau2" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <p id="msgError" class="Shopee-input__error-msg" runat="server" style="color:orangered"></p>

                        <div class="edit-row btn-group">
                            <%--<button id="btnLuuThongTin" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">Lưu</button>--%>
                            <%--<input type="button" id="btnLuu" onclick="btnLuuThongTin_Click" runat="server" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" text="Lưu"/>--%>
                            <%--<button id="btnLuuThongTin" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" onclick="btnLuuThongTin_Click">Lưu</button>--%>
                            <asp:Button ID="btnLuuThongTin" CssClass="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" Text="Lưu" OnClick="btnLuuThongTin_Click"></asp:Button>
                            <asp:Button ID="btnHuy" runat="server" CssClass="shopee-button shopee-button--inactive shopee-button--primary ember-view" Text="Hủy" OnClick="btnHuy_Click"></asp:Button>
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
            </div>
        </div>
    </form>
</asp:Content>