<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <link href="../../Content/UI/css/bootstrap-table.min.css" rel="stylesheet" />
    <script src="../../Content/UI/js/bootstrap-table.min.js"></script>
    <script src="../../Content/UI/js/bootstrap-table-vi-VN.js"></script>
    <%--<script src="../../Content/UI/js/bootstrap-table-locale-all.min.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#product').addClass("active");
            

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div class="">
        <div id="ember6145" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #62b450;" class="shop-setting-header__icon">
                    <svg viewBox="0 0 32 32">
                        <path d="M16 4.83l3.18 7 .48 1.06 1.16.11 6.76.61L22.27 19l-.75.75.2 1 1.38 7.19-6.1-3.72-1-.64-1 .64-6.15 3.7 1.42-7.16.21-1-.76-.76-5.31-5.39 6.77-.61 1.16-.11.48-1.06 3.18-7M16 0l-5 11-11 1 8.3 8.37L6 32l10-6.07L26 32l-2.31-11.63L32 12l-11-1-5-11z"></path></svg>
                </div>

                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Sản phẩm</div>
                    <div class="shop-setting-header__subtitle">Danh sách sản phẩm</div>
                </div>
                <div class="shop-setting-header__buttons">
                    <a href="<%=GetRouteUrl("useraddproduct", new object { })%>" id="btnAddProduct" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">
                        <svg viewBox="0 0 32 32">
                            <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                        Thêm sản phẩm
                    </a>
                </div>
            </div>
            <hr class="shop-setting-header__seperator ">
        </div>

        <div id="editPage" class="content">
            
            <table id="table" data-search="true" data-show-columns="false" data-pagination="true" >
                <thead>
                    <tr>
                        <th data-field="col1" data-sortable="true">Mã sản phẩm</th>
                        <th data-field="col2" data-sortable="true" width="200">Tên sản phẩm</th>
                        <th data-field="col3" data-sortable="true">Giá cũ</th>
                        <th data-field="col4" data-sortable="true">Giá mới</th>
                        <th data-field="col5" data-sortable="true">Ngày tạo</th>
                        <th data-field="col6" data-sortable="true">Đã duyệt</th>
                        <th data-field="col7" data-sortable="true">Sửa</th>
                        <th data-field="col8" data-sortable="true">Xóa</th>
                    </tr>
                </thead>
            </table>

        </div>
    </div>



    <script>
        $(document).ready(function () {
            var data = [];
            $.ajax({
                type: "GET",
                url: '../Ajax.aspx?Action=UserProduct',
                success: function (result) {
                    console.log(result);
                    var data = JSON.parse(result);
                    console.log(data);
                    $('#table').bootstrapTable({
                        data: data
                    });

                    $(".mybtn-top").click(function () {
                        $('#table').bootstrapTable('scrollTo', 0);
                    });

                    $(".mybtn-row").click(function () {
                        var index = +$('.row-index').val(),
                            top = 0;
                        $('#table').find('tbody tr').each(function (i) {
                            if (i < index) {
                                top += $(this).height();
                            }
                        });
                        $('#table').bootstrapTable('scrollTo', top);
                    });
                    //var obj = JSON.parse(data);
                    //var cmbHuyen = $('#maincontent_mainboard_cmbHuyen');
                    //cmbHuyen.find('option').remove();
                    //jQuery.each(obj, function (i, item) {
                    //    if (i == 0) {
                    //        cmbHuyen.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));
                    //    }
                    //    else {
                    //        cmbHuyen.append($('<option>', { value: item.maqh, text: item.name }));
                    //    }
                    //});
                    //changeProvince();
                }
            });

            

        });
    </script>
    <script>
        function DeleteSanPham(idSanPham) {
            if (confirm("Bạn có muốn xóa không ?")) {
                $.ajax({
                    type: "GET",
                    url: '../Ajax.aspx?Action=DeleteProduct&id=' + idSanPham,
                    success: function () {
                        window.location.reload();
                    },
                    error: function () { alert("Không thể xóa sản phẩm !") }
                });
            }
    }
    </script>
</asp:Content>