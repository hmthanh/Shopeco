<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <script>
        $(document).ready(function () {
            $('#userpass').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div class="">
        <div id="ember6145" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #8f67ff;" class="shop-setting-header__icon">
                    <svg  viewBox="0 0 32 32">
                                            <path d="M25.3 4.6c-3.1-3.1-8.1-3.1-11.2 0-3.1 3.1-3.1 8.1 0 11.2s8.1 3.1 11.2 0 3.1-8.1 0-11.2m1.5 12.7c-3.7 3.7-9.5 3.9-13.5.6l-4 3.7 4.6 4.6-1.5 1.5L7.8 23l-2.9 2.6 4.8 4.8-1.5 1.5L2.3 26l.1-.1c-.1-.3 0-.7.3-1l9.3-8.4c-3.1-3.9-2.9-9.7.7-13.3C16.6-.7 23-.7 26.9 3.2c3.8 3.8 3.8 10.2-.1 14.1"></path></svg>
                </div>

                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Tài Khoản</div>
                    <div class="shop-setting-header__subtitle">Thay đổi mật khẩu</div>
                </div>
                <div class="shop-setting-header__buttons">
                </div>
            </div>
            <hr class="shop-setting-header__seperator ">
        </div>
        <div class="seller-profile" style="margin: 0 auto; width: 80%;">
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                        <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                    Mật khẩu cũ
                </div>
                <div class="edit-input">
                    <div id="ember4813432" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="password" name="password" placeholder="Mật khẩu cũ" maxlength="80" id="txtOldPassword" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                    <path d="M28.38 26.45a1.75 1.75 0 0 0-.66-1.45c-.45-.32-5.17-3.46-5.71-3.81a2.33 2.33 0 0 0-2.3.14c-.46.24-1.84 1-2.52 1.41A33.76 33.76 0 0 1 13 19.06a33.57 33.57 0 0 1-3.71-4.2c.39-.68 1.18-2.06 1.42-2.51a3 3 0 0 0 .36-1.35 1.71 1.71 0 0 0-.23-.9C10.48 9.49 7.32 4.75 7 4.32a2 2 0 0 0-2.84-.22S0 7.11 0 8.8c.16 4.84 4.86 10.51 8.77 14.41s9.6 8.59 14.44 8.74c1.72.06 4.69-4.11 4.72-4.15a2.46 2.46 0 0 0 .44-1.4z"></path></svg>
                    Mật khẩu mới
                </div>
                <div class="edit-input">
                    <div id="ember4813432" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="password" name="password" placeholder="Mật khẩu mới" maxlength="80" id="txtNewPassword1" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                        <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                    Xác nhập lại mật khẩu mới
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-input">
                    <div id="sdfsdffsdf" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="password" name="password" placeholder="Xác nhập mật khẩu mới" maxlength="80" id="txtNewPassword2" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            
            <p class="alert alert-danger" id="msgError" runat="server" role="alert"></p>
        </div>
        <div class="edit-row btn-group" style="padding: 0px 300px;">
            <asp:Button ID="btnSave" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" Text="Lưu" OnClick="btnSave_Click"></asp:Button>
            <asp:Button ID="btnCancel" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view " runat="server" OnClick="btnCancel_Click" Text="Hủy"></asp:Button>
        </div>
    </div>

</asp:Content>

