﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="View_User_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../Content/UI/css/login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .Shopee-input__error-msg{
            margin-left: 20px;
        }
    </style>
    <form runat="server" method="post" style="margin-top: 40px;">
        <div data-v-fe11aa12="" class="wrapper" style=" margin-top: 10px;">
            <div data-v-fe11aa12="" class="account-container grid">
                <div data-v-fe11aa12="" class="login" style="margin: 0 auto;">
                    <div data-v-44c03dd9="" data-v-fe11aa12="" class="signin-panel" style="height: auto;">
                        <div data-v-44c03dd9="" class="signin">
                            <div data-v-44c03dd9="">
                                <div data-v-44c03dd9="" class="signin-title">
                                    <i data-v-44c03dd9="" class="Shopee-icon">
                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="33 0 32 32" style="enable-background: new 33 0 32 32;" xml:space="preserve">
                                            <path d="M61.7,8.9h-6.2c-0.1-2.7-1.5-8.4-6-8.4c-4.8,0-5.9,6.1-5.9,8.4h-6.2c-1.7,0-1.4,1.7-1.4,1.7l1.2,16.6c0,0-0.1,3.6,3.2,3.7 c0.2,0,17.9,0,18.3,0c3.1-0.2,3.1-3.8,3.1-3.8L63,10.5C63.1,10.6,63.3,8.8,61.7,8.9z M49.6,2c3.9,0.1,4.3,6.3,4.3,6.9h-8.7 C45.2,8.4,45.5,2.1,49.6,2z M54.4,23.3c-0.3,3.3-3.9,3.4-4.5,3.4c-2.8-0.1-4.5-1.6-4.5-1.6l0,0c-0.1-0.1-0.2-0.2-0.2-0.4 c0-0.3,0.2-0.5,0.5-0.5c0.1,0,0.2,0,0.3,0.1l0,0l0,0l0,0c0.2,0.1,1.7,1.3,3.9,1.4c1.6-0.1,3.3-0.8,3.4-2.5c0.2-2.4-3.2-3.3-3.8-3.5 s-4.1-1.1-3.9-3.9c0.1-1.2,1.1-3.2,3.9-3.3c2.5,0,3.8,1.1,3.8,1.1l0,0c0.1,0.1,0.2,0.2,0.2,0.3c0,0.3-0.2,0.5-0.5,0.5 c-0.1,0-0.2,0-0.3-0.1l0,0c0,0-1.5-0.9-3.2-0.9c-1.9,0.1-2.9,1.4-2.9,2.5c0,1.8,2.4,2.5,2.9,2.7C51.8,19.4,54.6,20.3,54.4,23.3z"></path></svg></i>
                                    Đăng Ký Tài Khoản
       
                                </div>
                                <div data-v-44c03dd9="" class="signin-form">
                                    
                                    <%--<div   data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtTenGianHang" type="name" placeholder="Tên gian hàng" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgTenGianHang" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>--%>
                                    <!---->

                                    <%--<div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtNguoiDaiDien" type="name1" placeholder="Họ Tên đầy đủ" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgNguoiDaiDien" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>--%>
                                    <!---->

<%--                                    <div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtTenDangNhap" type="text" placeholder="Tên đăng nhập " resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgTenDangNhap" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>--%>

                                    <div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtPhone" type="text" placeholder="Email hoặc Số điện thoại" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgPhone" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>

                                    <div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtUsername" type="text" placeholder="Username" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgUsername" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>

                                    <%--<div      data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        </svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtTenDangNhap" type="text" placeholder="tên đăng nhập" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgTenDangNhap" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>--%>

                                    <div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        <%--<path fill="#000000" d="M891 455.1c-4.9-11.5-13-21.3-23.2-28.1-5.1-3.4-10.8-6.2-16.8-8.1-6-1.9-12.5-2.9-19-2.9v-96c0-44.1-9-86.3-25.2-124.6C782.5 137.9 742 89.2 691 54.7c-25.5-17.2-53.7-30.9-83.8-40.3C577.1 5 545.1 0 512 0c-44.1 0-86.3 9-124.6 25.2C329.9 49.5 281.2 90 246.7 141c-17.2 25.5-30.9 53.7-40.3 83.8C197 254.9 192 286.9 192 320v96c-8.7 0-17.2 1.8-24.9 5-11.5 4.9-21.3 13-28.1 23.2-3.4 5.1-6.2 10.8-8.1 16.8-1.9 6-2.9 12.5-2.9 19v480c0 8.7 1.8 17.2 5 24.9 4.9 11.5 13 21.3 23.2 28.1 5.1 3.4 10.8 6.2 16.8 8.1 6 1.9 12.5 2.9 19 2.9h640c8.7 0 17.2-1.8 24.9-5 11.5-4.9 21.3-13 28.1-23.2 3.4-5.1 6.2-10.8 8.1-16.8 1.9-6 2.9-12.5 2.9-19V480c0-8.7-1.8-17.2-5-24.9zM256 320c0-35.4 7.2-69 20.1-99.7 19.4-45.9 51.9-85 92.8-112.7 20.4-13.8 42.9-24.7 67-32.2C459.9 68 485.4 64 512 64c35.4 0 69 7.2 99.7 20.1 45.9 19.4 85 51.9 112.7 92.8 13.8 20.4 24.7 42.9 32.2 67 7.5 24 11.5 49.6 11.5 76.2v96H256V320z m576 160v480H192V480h640z"></path><path fill="#000000" d="M512 576c-35.3 0-64 28.7-64 64 0 23.7 12.9 44.3 32 55.4V832c0 17.7 14.3 32 32 32s32-14.3 32-32V695.4c19.1-11.1 32-31.7 32-55.4 0-35.3-28.7-64-64-64z"></path>--%></svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtPassword1" type="password" placeholder="Nhập mật khẩu" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgPassword1" class="Shopee-input__error-msg" runat="server">*</p>
                                        <!---->
                                    </div>

                                    <div data-v-44c03dd9="" class="Shopee-input" max-length="16">
                                        <div class="Shopee-input__inner Shopee-input__inner--normal">
                                            <div class="Shopee-input__prefix">
                                                <!---->
                                                <i class="Shopee-input__prefix-icon Shopee-icon">
                                                    <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                        <%--<path fill="#000000" d="M891 455.1c-4.9-11.5-13-21.3-23.2-28.1-5.1-3.4-10.8-6.2-16.8-8.1-6-1.9-12.5-2.9-19-2.9v-96c0-44.1-9-86.3-25.2-124.6C782.5 137.9 742 89.2 691 54.7c-25.5-17.2-53.7-30.9-83.8-40.3C577.1 5 545.1 0 512 0c-44.1 0-86.3 9-124.6 25.2C329.9 49.5 281.2 90 246.7 141c-17.2 25.5-30.9 53.7-40.3 83.8C197 254.9 192 286.9 192 320v96c-8.7 0-17.2 1.8-24.9 5-11.5 4.9-21.3 13-28.1 23.2-3.4 5.1-6.2 10.8-8.1 16.8-1.9 6-2.9 12.5-2.9 19v480c0 8.7 1.8 17.2 5 24.9 4.9 11.5 13 21.3 23.2 28.1 5.1 3.4 10.8 6.2 16.8 8.1 6 1.9 12.5 2.9 19 2.9h640c8.7 0 17.2-1.8 24.9-5 11.5-4.9 21.3-13 28.1-23.2 3.4-5.1 6.2-10.8 8.1-16.8 1.9-6 2.9-12.5 2.9-19V480c0-8.7-1.8-17.2-5-24.9zM256 320c0-35.4 7.2-69 20.1-99.7 19.4-45.9 51.9-85 92.8-112.7 20.4-13.8 42.9-24.7 67-32.2C459.9 68 485.4 64 512 64c35.4 0 69 7.2 99.7 20.1 45.9 19.4 85 51.9 112.7 92.8 13.8 20.4 24.7 42.9 32.2 67 7.5 24 11.5 49.6 11.5 76.2v96H256V320z m576 160v480H192V480h640z"></path><path fill="#000000" d="M512 576c-35.3 0-64 28.7-64 64 0 23.7 12.9 44.3 32 55.4V832c0 17.7 14.3 32 32 32s32-14.3 32-32V695.4c19.1-11.1 32-31.7 32-55.4 0-35.3-28.7-64-64-64z"></path>--%></svg></i>
                                                <!---->
                                            </div>
                                            <input id="txtPassword2" type="password" placeholder="Nhập lại mật khẩu" resize="vertical" rows="2" minrows="2" class="Shopee-input__input" runat="server">
                                            <!---->
                                        </div>
                                        <p id="msgPassword2" class="Shopee-input__error-msg" runat="server">* </p>
                                        <!---->
                                    </div>

                                    <!---->
                                    <div data-v-44c03dd9="" class="grid">
                                        <div data-v-44c03dd9="" class="remember col-8">
                                            <p id="msgRegister" class="Shopee-input__error-msg" runat="server"></p>
                                            <%--<label data-v-44c03dd9="" class="Shopee-checkbox">
                                                <input id="isRememberMe" type="checkbox" class="Shopee-checkbox__input" value="Nhớ tôi" runat="server">
                                                <span class="Shopee-checkbox__indicator"><i class="Shopee-icon">
                                                    <svg data-name="图层 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024">
                                                        <path d="M415.95 736a31.55 31.55 0 0 1-22.6-9.4l-192-192a32 32 0 0 1 45.3-45.3l169.3 169.4 361.4-361.4a32 32 0 0 1 45.3 45.3l-384 384a32 32 0 0 1-22.7 9.4z" data-name="Layer 2"></path></svg></i></span> <span class="Shopee-checkbox__label">Nhớ tôi</span></label>--%>
                                        </div>
                                        <%--<div data-v-44c03dd9="" class="forget col-8"><a data-v-44c03dd9="" href="https://mall.Shopee.vn/buyer/login/reset/?entrance=%2F%2Fbanhang.Shopee.vn%2F">Quên mật khẩu?</a></div>--%>
                                    </div>
                                    <asp:Button ID="btDangKy" runat="server" OnClick="btDangKy_Click" data-v-44c03dd9="" class="Shopee-button Shopee-button--primary Shopee-button--block Shopee-button--round" Text="Đăng ký">
                                            
                                    </asp:Button>
                                </div>
                                <div>
                                    <p style="padding-left: 40px;">>> Đến trang <a style="font-weight:bold" href="/login">đăng nhập</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

