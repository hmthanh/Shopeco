<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="CustomerEditInfo.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <style>
        .ember-text-field{
            width: 100%;
        }

    </style>
    <script>
        $(document).ready(function () {
            $('#customerinfo').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div class="">
        <div id="ember6145" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #00bfa5;" class="shop-setting-header__icon">
                    <svg viewBox="0 0 32 32">
                        <path d="M16 20.8h10.9v-.9H16v.9zm0-2.1h10.9v-.9H16v.9zm0-2h10.9v-.9H16v.9zm0-2h6.6v-.9H16v.9zM29 23c0 .5-.4.9-.9.9H4c-.5.1-1-.4-1-.9V8.2c0-.5.4-.9.9-.9h5.3v2.1h1.9V7.3h4.3v2.1h1.9V7.3h4.5v2.1h1.9V7.3H28c.5 0 .9.4.9.9V23zm0-17.6H3c-1 0-1.9.8-1.9 1.9V24c0 1 .8 1.9 1.9 1.9h26c1 0 1.9-.8 1.9-1.9V7.3c-.1-1-.9-1.9-1.9-1.9z"></path><path d="M13.3 20.8H6.1c-.4-.6-.2-1.8.2-2.3.2-.2 1.6-.6 2.3-.7-.7-.6-1.2-1.6-1.2-2.6 0-1.4.4-2.6 2.3-2.6s2.3 1.2 2.3 2.6c0 1-.4 2-1.2 2.6.7.2 2.1.5 2.3.7.4.5.6 1.7.2 2.3z"></path></svg>
                </div>
                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Mua hàng</div>
                    <div class="shop-setting-header__subtitle">Thông tin mua hàng</div>
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