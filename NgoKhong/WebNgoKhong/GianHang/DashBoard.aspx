<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/GianHang.master" CodeFile="DashBoard.aspx.cs" Inherits="GianHang_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <link href="../Content/gianhang/css/seller-new.css" rel="stylesheet" />
    <form runat="server" method="post">
        <div class="container" style="margin-top: 45px;">
            <div class="cell">
                <div class="title">Chào mừng đến với Ngộ Không - Kênh Người bán</div>
                <div class="subtitle">Kênh Người bán là công cụ quản lý shop, giúp bạn dễ phân loại sản phẩm, theo dõi đơn hàng, chăm sóc khách hàng và đánh giá hoạt động của shop.</div>
                <div class="buttons">
                    <%--<a id="ember12004" class="home-big-button ember-view" href="<%= GetRouteUrl("gianhang_shopedit") %>">
                        <div style="background-image: url('/Content/gianhang/img/bg-wallet.png'); background-size: cover;" class="home-big-button__icon">
                            <div class="home-big-button__badge  ">
                                <div id="ember1222" class="liquid-container ember-view" style="">
                                    <div id="ember1225" class="liquid-child ember-view" style="top: 0px; left: 0px;"></div>
                                </div>
                            </div>
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Tạo gian hàng</div>
                    </a>--%>
                    <a id="ember1185" class="home-big-button ember-view" href="<%=GetRouteUrl("gianhang_shopproduct", new { })%>">
                        <div style="background-image: url('/Content/gianhang/img/bg-product.png'); background-size: cover;" class="home-big-button__icon">
                            <div class="home-big-button__badge ">
                                <div id="ember1187" class="liquid-container ember-view" style="">
                                    <div id="ember1190" class="liquid-child ember-view" style="top: 0px; left: 0px;"></div>
                                </div>
                            </div>
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M29.5 12.4h-1.8v18H4.3v-18H2.5V7h7.8c-.4-.6-.6-1.2-.6-1.8 0-2 1.6-3.6 3.6-3.6 1.1 0 2.1.5 2.7 1.3.6-.8 1.6-1.3 2.7-1.3 2 0 3.6 1.6 3.6 3.6 0 .6-.2 1.3-.5 1.8h7.8v5.4zM16.9 28.6h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm-10.8 9h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm7.2-16.2c-1 0-1.8.8-1.8 1.8S12.3 7 13.3 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm5.4 0c-1 0-1.8.8-1.8 1.8S17.7 7 18.7 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm9 5.4H4.3v1.8h23.5V8.8z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Sản phẩm</div>
                    </a>
                   <%-- <a id="ember1192" class="home-big-button ember-view" href="<%=GetRouteUrl("gianhang_shopcategories", new { })%>">
                        <div style="background-image: url('/Content/gianhang/img/bg-category.png'); background-size: cover;" class="home-big-button__icon">
                            <div class="home-big-button__badge  ">
                                <div id="ember1194" class="liquid-container ember-view" style="">
                                    <div id="ember1197" class="liquid-child ember-view" style="top: 0px; left: 0px;"></div>
                                </div>
                            </div>
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M27 15h-8c-1.1 0-2-1.2-2-2.3V5c0-1.1.9-2 2-2h8.1c1 0 1.9.9 1.9 1.9V13c0 1.1-.9 2-2 2zm0-9c0-.6-.4-1-1-1h-6c-.6 0-1 .4-1 1v6c0 .6.4 1 1 1h6.1c.6 0 .9-.4.9-1V6zm-14 9H5c-1.1 0-2-1.2-2-2.3V5c0-1.1.9-2 2-2h8.1c1 0 1.9.9 1.9 1.9V13c0 1.1-.9 2-2 2zm0-9c0-.6-.4-1-1-1H6c-.6 0-1 .4-1 1v6c0 .6.4 1 1 1h6.1c.6 0 .9-.4.9-1V6zm14 23h-8c-1.1 0-2-1.2-2-2.3V19c0-1.1.9-2 2-2h8.1c1.1 0 1.9.9 1.9 1.9V27c0 1.1-.9 2-2 2zm0-9c0-.6-.4-1-1-1h-6c-.6 0-1 .4-1 1v6c0 .6.4 1 1 1h6.1c.6 0 .9-.4.9-1v-6zm-14 9H5c-1.1 0-2-1.2-2-2.3V19c0-1.1.9-2 2-2h8.1c1.1 0 1.9.9 1.9 1.9V27c0 1.1-.9 2-2 2zm0-9c0-.6-.4-1-1-1H6c-.6 0-1 .4-1 1v6c0 .6.4 1 1 1h6.1c.6 0 .9-.4.9-1v-6z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Danh mục của Shop</div>
                    </a>--%>
                    <a id="ember1199" class="home-big-button ember-view"  href="<%=GetRouteUrl("gianhang_saleorder", new { })%>">
                        <div style="background-image: url('/Content/gianhang/img/bg-sales.png'); background-size: cover;" class="home-big-button__icon">
                            <div class="home-big-button__badge  ">
                                <div id="ember1201" class="liquid-container ember-view" style="">
                                    <div id="ember1204" class="liquid-child ember-view" style="top: 0px; left: 0px;">0</div>
                                </div>
                            </div>
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Đơn Bán</div>
                    </a>
                    <%--<a id="ember1213" class="home-big-button ember-view" href="<%= GetRouteUrl("", new { }) %>">
                        <div style="background-image: url('/Content/gianhang/img/bg-income.png'); background-size: cover;" class="home-big-button__icon">
                            <div class="home-big-button__badge  ">
                                <div id="ember1215" class="liquid-container ember-view" style="">
                                    <div id="ember1218" class="liquid-child ember-view" style="top: 0px; left: 0px;"></div>
                                </div>
                            </div>
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M27.8 27.1H8.5c-1 0-1.8-.8-1.8-1.8v-1.8h1.8v.9c0 .5.4.9.9.9H27c.5 0 .9-.4.9-.9V12.2c0-.5-.4-.9-.9-.9h-1v-.9c0-.5-.4-.9-.9-.9h2.6c1 0 1.8.8 1.8 1.8v14c.1 1-.7 1.8-1.7 1.8zm-5.3-5.2H3.2c-1 0-1.8-.8-1.8-1.8v-14c0-1 .8-1.8 1.8-1.8h19.3c1 0 1.8.8 1.8 1.8v14c0 1-.8 1.8-1.8 1.8zm0-15c0-.5-.4-.9-.9-.9H4.1c-.5 0-.9.4-.9.9v12.3c0 .5.4.9.9.9h17.6c.5 0 .9-.4.9-.9V6.9zm-7 8c0 1.1-.8 2.2-2.1 2.4v1.1h-1v-1.1c-1.4-.2-2.2-1.1-2.2-1.1l.8-1.1s.9.9 1.9.9c.6 0 1.1-.4 1.1-1 0-1.4-3.7-1.2-3.7-3.7 0-1.2.9-2.1 2.1-2.3V7.8h1v1.1c1.3.1 1.9.9 1.9.9l-.5 1.2s-.8-.7-1.8-.7c-.7 0-1.1.4-1.1 1-.1 1.3 3.6 1.1 3.6 3.6z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Doanh thu</div>
                    </a>--%>
                    
                    <!---->
                    <a id="ember1228" class="home-big-button ember-view" href="<%= GetRouteUrl("gianhang_shopinfo", new { })%>">
                        <div style="background-image: url('/Content/gianhang/img/bg-settings.png'); background-size: cover;" class="home-big-button__icon">
                            <svg class="home-big-button__svg" viewBox="0 0 32 32">
                                <path d="M31.3 16c0 2-1.5 3.6-3.5 3.8-.2.7-.5 1.2-.8 1.9 1.2 1.5 1.2 3.7-.2 5.2-1.4 1.4-3.6 1.4-5.2.2-.6.3-1.2.6-1.9.8-.2 2-1.8 3.5-3.8 3.5s-3.6-1.5-3.8-3.5c-.7-.2-1.2-.5-1.9-.8-1.5 1.2-3.7 1.2-5.2-.2-1.4-1.4-1.4-3.6-.2-5.2-.3-.6-.6-1.2-.8-1.9C2.3 19.6.7 18 .7 16s1.5-3.6 3.5-3.8c.2-.7.5-1.2.8-1.9-1.2-1.5-1.2-3.7.2-5.1s3.6-1.4 5.2-.2c.6-.3 1.2-.6 1.9-.8.1-2 1.7-3.5 3.7-3.5s3.6 1.5 3.8 3.5c.7.2 1.2.5 1.9.8 1.5-1.2 3.7-1.2 5.2.2 1.4 1.4 1.4 3.6.2 5.2.3.6.6 1.2.8 1.9 1.8.1 3.4 1.7 3.4 3.7zm-5-1.9c-.3-1.4-.9-2.9-1.7-4l.9-.9c.8-.8.8-1.9 0-2.7s-1.9-.8-2.7 0l-.9.9c-1.1-.9-2.6-1.4-4-1.7V4.5c0-1.1-.9-1.9-1.9-1.9s-1.9.9-1.9 1.9v1.1c-1.4.3-2.9.9-4 1.7l-.9-.7c-.8-.8-1.9-.8-2.7 0s-.8 1.9 0 2.7l.9.9c-.9 1.1-1.4 2.6-1.7 4H4.5c-1.1 0-1.9.9-1.9 1.9S3.5 18 4.5 18h1.1c.3 1.4.9 2.9 1.7 4l-.9.9c-.8.8-.8 1.9 0 2.7s1.9.8 2.7 0l.9-.9c1.1.9 2.6 1.4 4 1.7v1.1c0 1.1.9 1.9 1.9 1.9s1.9-.9 1.9-1.9v-1.1c1.4-.3 2.9-.9 4-1.7l.9.9c.8.8 1.9.8 2.7 0s.8-1.9 0-2.7l-.9-.9c.9-1.1 1.4-2.6 1.7-4h1.1c1.1 0 1.9-.9 1.9-1.9s-.9-1.9-1.9-1.9h-1zM16 21.7c-3.2 0-5.7-2.6-5.7-5.7s2.6-5.7 5.7-5.7 5.7 2.6 5.7 5.7-2.5 5.7-5.7 5.7zm0-9.5c-2.1 0-3.8 1.7-3.8 3.8s1.7 3.8 3.8 3.8 3.8-1.7 3.8-3.8-1.7-3.8-3.8-3.8z"></path></svg>
                        </div>
                        <div class="home-big-button__title">Thiết lập Shop</div>
                    </a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
