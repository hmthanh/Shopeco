<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="AdsEditInfo.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <style>
        .ember-text-field{
            width: 100%;
        }

    </style>
    <script>
        $(document).ready(function () {
            $('#adsinfo').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div class="">
        <div id="ember6145" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #ff5722;" class="shop-setting-header__icon">
                    <svg style="color:white" viewBox="0 0 32 32"><path d="M20.69 16.36a1.73 1.73 0 1 1 1.73-1.73 1.73 1.73 0 0 1-1.73 1.73zm-6.91 0a1.73 1.73 0 1 1 1.73-1.73 1.73 1.73 0 0 1-1.73 1.73zm-6.91 0a1.73 1.73 0 1 1 1.73-1.73 1.73 1.73 0 0 1-1.73 1.73zm20.7-6.48A11.47 11.47 0 0 0 26 9.06a10.55 10.55 0 0 1 1.17 2.63 8.46 8.46 0 0 1 1.28 1.15 6.74 6.74 0 0 1 1.82 4.53 7.32 7.32 0 0 1-3.95 6.2l-.1.06v3.2L22.48 25H21c-.37 0-.74 0-1.1-.06a15.42 15.42 0 0 1-3.29 1 12.33 12.33 0 0 0 2 .55 12.84 12.84 0 0 0 2.42.23c.37 0 .76 0 1.18-.06L28 29.41v-4.83a8.82 8.82 0 0 0 4-7.22 8.94 8.94 0 0 0-4.42-7.48zm-.39 1.8A10.55 10.55 0 0 0 26 9.06 14.3 14.3 0 0 0 13.78 2.8C6.15 2.8 0 8 0 14.48a11.09 11.09 0 0 0 5.18 9.11v5.91l7.07-3.42c.51 0 1 .08 1.56.08a16.31 16.31 0 0 0 2.87-.26 15.42 15.42 0 0 0 3.29-1c4.51-1.9 7.63-5.85 7.63-10.42a10 10 0 0 0-.42-2.8zM16.86 24.15a14.43 14.43 0 0 1-2.9.33h-1.9L6.87 27v-4.36a9.59 9.59 0 0 1-5.18-8.16c0-5.53 5.41-10 12.09-10a13.13 13.13 0 0 1 9.43 3.75 9.88 9.88 0 0 1 1.62 2.2 8.54 8.54 0 0 1 1 4.06c.04 4.63-3.83 8.51-8.97 9.66z"></path></svg>
                </div>
                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Rao vặt</div>
                    <div class="shop-setting-header__subtitle">Thông tin rao vặt</div>
                </div>
                <div class="shop-setting-header__buttons">
                </div>
            </div>
            <hr class="shop-setting-header__seperator ">
        </div>
        <div class="seller-profile" style="margin: 0 auto; width: 80%; padding-right: 75px; margin-right: 100px;">
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
                            <input type="text" name="name" placeholder="Họ và tên" maxlength="80" id="txtFullName" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                        <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                    Email
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-input">
                    <div id="sdfsdffsdf" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="text" name="email" placeholder="Email" maxlength="80" id="txtEmail" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            <%--//////////////////////////////////////////////////////////////--%>
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                        <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                    Số điện thoại
                </div>
                <div class="edit-input">
                    <div id="ember4813432" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="text" name="phone" placeholder="Số điện thoại" maxlength="80" id="txtPhone" class="ember-text-field ember-view" runat="server">
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="edit-row">
                <div class="edit-label">
                    <svg viewBox="0 0 32 32">
                        <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                    Địa chỉ
                </div>
            </div>
            <div class="edit-row">
                <div class="edit-input">
                    <div id="ember4142" class="shopee-textbox ember-view">
                        <div class="shopee-validation-toast"></div>
                        <div class="input">
                            <input type="text" name="address" placeholder="Địa chỉ" maxlength="80" id="txtAddress" class="ember-text-field ember-view" runat="server">
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