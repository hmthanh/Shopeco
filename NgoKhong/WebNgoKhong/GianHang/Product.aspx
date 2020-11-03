<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MainBoard.master" CodeFile="Product.aspx.cs" Inherits="GianHang_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
    <script>
        $(document).ready(function () {
            $('#ember4558').addClass("active");
        });
    </script>
    <script>
        $(document).ready(function () {
        });
        function DeleteSanPham(idSanPham) {
            if (confirm("Bạn có muốn xóa không ?")) {
                $.ajax({
                    type: "POST",
                    url: "/Admin/View/SanPham/SanPham.aspx/DeleteSanPham",
                    data: "{idSanPham:'" + idSanPham + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (datas) {
                        if (datas.d == "True")
                            location.reload();
                        else {
                            alert("Không thể xóa sản phẩm");
                        }
                    },
                    error: function () { alert("Không thể xóa.Lỗi function") }
                });
            }
        }
    </script>
    <div id="ember6145" class="shop-setting-header ember-view">
        <div class="shop-setting-header__content">
            <div style="background: #49cbdd;" class="shop-setting-header__icon">
                <svg viewBox="0 0 32 32">
                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
            </div>
            <div class="shop-setting-header__caption ">
                <div class="shop-setting-header__title" style="padding-top:13px">Thông tin sản phẩm</div>
                <%--<div class="shop-setting-header__subtitle">Danh sách sản phẩm</div>--%>
            </div>
            <div class="shop-setting-header__buttons">
                <div id="btnAddProduct" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">
                    <svg viewBox="0 0 32 32">
                        <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                    Thêm sản phẩm
                </div>
            </div>
        </div>
        <hr class="shop-setting-header__seperator ">
    </div>
    <script src="../Content/gianhang/js/product.js"></script>
    <form runat="server" id="dsSanPham">
        <div id="editPage" class="content">
            <div class="box-body with-gap setting-card--form">
                <div class="row" style="display:flexbox; justify-content:space-between;">
                    <div class="col-6 shopee-textbox">
                        <div class="input">
                            <input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tên sản phẩm..." />
                        </div>
                    </div>
                    <div class="col-6 shopee-textbox" style="display:none">
                        <select id="slLoaiSanPham" runat="server" class="custom-select ember-text-field ember-view" data-placeholder="Select a State" style="width: 100%;"></select>
                    </div>
                    <div class="col-2" style="text-align: right">
                        <%--<asp:LinkButton class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>--%>
                    </div>
                </div>
            </div>
            <div id="dvDanhSachLoaiTinTuc" runat="server">
            </div>
        </div>
    </form>
    <script>
        $('#btnAddProduct').click(function () {
            window.location.href = "/gianhang/addproduct";
        });
    </script>
</asp:Content>