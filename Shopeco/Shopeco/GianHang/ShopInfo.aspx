<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MainBoard.master" CodeFile="ShopInfo.aspx.cs" Inherits="GianHang_ShopInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
    <input type="hidden" id="_ispostback" value="<%=Page.IsPostBack.ToString()%>" />
    <form runat="server">
        <script>
            $(document).ready(function () {
                $('#ember4556').addClass("active");
            });
        </script>
        <div class="">
            <div id="ember6145" class="shop-setting-header ember-view">
                <div class="shop-setting-header__content">
                    <div style="background: #49cbdd;" class="shop-setting-header__icon">
                        <svg viewBox="0 0 32 32">
                            <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                    </div>
                    <div class="shop-setting-header__caption ">
                        <div class="shop-setting-header__title" style="padding-top: 12px;">Thông tin gian hàng</div>
                        <%--<div class="shop-setting-header__subtitle">Thông tin của gian hàng</div>--%>
                    </div>
                    <div class="shop-setting-header__buttons ">
                        <div id="btnEdit" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">
                            <svg viewBox="0 0 32 32">
                                <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                            Chỉnh sửa thông tin
                        </div>
                    </div>
                </div>
                <hr class="shop-setting-header__seperator ">
            </div>
            <div id="ember6146" class="setting-card__row setting-card__row--disabled ember-view">
                <div class="setting-card__icon">
                    <svg style="fill: #5c6bc0" viewBox="0 0 32 32">
                        <defs></defs><path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                </div>

                <div class="setting-card__title">Tên gian hàng</div>
                <div id="tenGianHang" class="setting-card__subtitle" runat="server"></div>
            </div>
            <div id="ember6148" class="setting-card__row setting-card__row--disabled ember-view">
                <div class="setting-card__icon">
                    <svg viewBox="0 0 32 32">
                                    <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                </div>

                <div class="setting-card__title">Địa chỉ gian hàng</div>
                <div id="diaChiGianHang" class="setting-card__subtitle" runat="server"></div>
            </div>
            <div id="ember6148" class="setting-card__row setting-card__row--disabled ember-view">
                <div class="setting-card__icon">
                    <svg viewBox="0 0 32 32">
                        <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                </div>
                <div class="setting-card__title">Mô tả gian hàng</div>
                <div id="moTaGianHang" class="setting-card__subtitle" runat="server"></div>
            </div>
            <div id="ember6148" class="setting-card__row setting-card__row--disabled ember-view">
                <div class="setting-card__icon">
                    <svg style="fill: #5c6bc0" viewBox="0 0 1024 1024">
                        <path d="M512 1007.7c-8.5 0-16.7-3.4-22.7-9.4L88.6 595.8c-28-26.7-50-58.1-65.3-93.4C7.8 466.6 0 428.5 0 389.3c0-76.1 29.6-147.7 83.5-201.5 53.8-53.8 125.4-83.5 201.5-83.5 86.4 0 167.2 38.6 221.7 105.8l5.4 6.6 5.4-6.6c54.4-67.3 135.2-105.8 221.7-105.8 76.1 0 147.7 29.6 201.5 83.5s83.5 125.4 83.5 201.5c0 39.2-7.8 77.3-23.3 113-15.2 35.3-37.2 66.7-65.2 93.4l-401 402.6c-6 6-14.2 9.4-22.7 9.4zM285 168.3c-59 0-114.5 23-156.3 64.7S64 330.3 64 389.3c0 61.3 24.5 118.2 69 160.4.2.2.4.4.7.6l378.4 380 378.5-380.1.6-.6c44.4-42.2 68.9-99.1 68.9-160.3 0-59-23-114.5-64.7-156.3S798 168.3 739 168.3c-67 0-129.7 29.9-171.9 82.1l-30.2 37.4c-6.1 7.5-15.2 11.9-24.9 11.9s-18.8-4.4-24.9-11.9l-30.2-37.4C414.7 198.2 352 168.3 285 168.3z"></path></svg>
                </div>
                <div class="setting-card__title">Chủ gian hàng</div>
                <div id="chuGianHang" class="setting-card__subtitle" runat="server"></div>
            </div>
            <div id="ember6148" class="setting-card__row setting-card__row--disabled ember-view">
                <div class="setting-card__icon">
                    <svg viewBox="0 0 32 32">
                                    <path d="M28.38 26.45a1.75 1.75 0 0 0-.66-1.45c-.45-.32-5.17-3.46-5.71-3.81a2.33 2.33 0 0 0-2.3.14c-.46.24-1.84 1-2.52 1.41A33.76 33.76 0 0 1 13 19.06a33.57 33.57 0 0 1-3.71-4.2c.39-.68 1.18-2.06 1.42-2.51a3 3 0 0 0 .36-1.35 1.71 1.71 0 0 0-.23-.9C10.48 9.49 7.32 4.75 7 4.32a2 2 0 0 0-2.84-.22S0 7.11 0 8.8c.16 4.84 4.86 10.51 8.77 14.41s9.6 8.59 14.44 8.74c1.72.06 4.69-4.11 4.72-4.15a2.46 2.46 0 0 0 .44-1.4z"></path></svg>
                </div>
                <div class="setting-card__title">Số điện thoại</div>
                <div id="soDienThoai" class="setting-card__subtitle" runat="server"></div>
            </div>
        </div>

        <link href="../Content/gianhang/css/shopinfo.css" rel="stylesheet" />
        <link href="../Content/gianhang/css/shopcustom.css" rel="stylesheet" />

    </form>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <%--<script src="../Content/gianhang/js/shopinfo.js"></script>--%>
    <script>
        $(document).ready(function () {
            $("#btnEdit").click(function () {
                window.location.href = "/gianhang/editinfo";
            });
            function changeCity() {
                var city = $('#maincontent_mainboard_cmbTinh').val();
                $.ajax({
                    type: "GET",
                    url: '../Ajax/LayDiaChi.aspx?a=district&city=' + city,
                    success: function (data) {
                        var obj = JSON.parse(data);
                        var cmbHuyen = $('#maincontent_mainboard_cmbHuyen');
                        cmbHuyen.find('option').remove();
                        jQuery.each(obj, function (i, item) {
                            if (i == 0) {
                                cmbHuyen.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));
                            }
                            else {
                                cmbHuyen.append($('<option>', { value: item.maqh, text: item.name }));
                            }
                        });
                        changeProvince();
                    }
                });
            }
            function isPostBack() { //function to check if page is a postback-ed one
                return document.getElementById('_ispostback').value == 'True';
            }
            function changeProvince() {
                var district = $('#maincontent_mainboard_cmbHuyen').val();
                $.ajax({
                    type: "GET",
                    url: '../Ajax/LayDiaChi.aspx?a=hamlet&district=' + district,
                    success: function (data) {
                        var obj = JSON.parse(data);
                        var cmbXa = $('#maincontent_mainboard_cmbXa');
                        cmbXa.find('option').remove();
                        jQuery.each(obj, function (i, item) {
                            if (i == 0) {
                                cmbXa.append($('<option selected="selected" value="' + item.xaid + '">' + item.name + '</option>'));
                            }
                            else {
                                cmbXa.append($('<option>', { value: item.xaid, text: item.name }));
                            }
                        });
                    }
                });
            }

            $.ajax({
                type: "GET",
                url: '../Ajax/LayDiaChi.aspx?a=city',
                success: function (data) {
                    var obj = JSON.parse(data);
                    var cmbTinh = $('#maincontent_mainboard_cmbTinh');
                    cmbTinh.find('option').remove();
                    jQuery.each(obj, function (i, item) {
                        if (i == 0) {
                            cmbTinh.append($('<option selected="selected" value="' + item.matp + '">' + item.name + '</option>'));
                        }
                        else {
                            cmbTinh.append($('<option>', { value: item.matp, text: item.name }));
                        }
                    });
                    changeCity();
                }
            });
            ////////////////////////////////////////////////////
            $('#maincontent_mainboard_cmbTinh').change(function () {
                changeCity();
            });
            $('#maincontent_mainboard_cmbHuyen').change(function () {
                changeProvince();
            });
        });
    </script>
</asp:Content>