<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="Rating.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <link href="../../Content/UI/css/bootstrap-table.min.css" rel="stylesheet" />
    <script src="../../Content/UI/js/bootstrap-table.min.js"></script>
    <script src="../../Content/UI/js/bootstrap-table-vi-VN.js"></script>
    <%--<script src="../../Content/UI/js/bootstrap-table-locale-all.min.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#ads').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div class="">
        <div id="ember1266" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #62b450;" class="shop-setting-header__icon ">
                    <svg viewBox="0 0 32 32">
                        <path d="M16 4.83l3.18 7 .48 1.06 1.16.11 6.76.61L22.27 19l-.75.75.2 1 1.38 7.19-6.1-3.72-1-.64-1 .64-6.15 3.7 1.42-7.16.21-1-.76-.76-5.31-5.39 6.77-.61 1.16-.11.48-1.06 3.18-7M16 0l-5 11-11 1 8.3 8.37L6 32l10-6.07L26 32l-2.31-11.63L32 12l-11-1-5-11z"></path></svg>
                </div>
                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Đánh giá Shop</div>
                    <div class="shop-setting-header__subtitle">Xem đánh giá Shop của bạn</div>
                </div>
                <div class="shop-setting-header__buttons ">
                    <span style="font-size: 40px; font-weight: 500; color: #EE4D2D;">0.0</span>
                    <span style="font-size: 24px; font-weight: 500; color: #8c8c8c;">&nbsp;/&nbsp;5</span>

                </div>
            </div>
            <hr class="shop-setting-header__seperator ">
        </div>
        <div id="ember1272" class="rating-product-view-item ember-view">
            <div class="rating__options">
                <div id="ember1282" class="shopee-switch-button shopee-switch-button--selected ember-view"><span class="shopee-switch-button__title">Tất cả</span><!----></div>
                <div id="ember1284" class="shopee-switch-button ember-view"><span class="shopee-switch-button__title">5 Sao</span><!----></div>
                <div id="ember1286" class="shopee-switch-button ember-view"><span class="shopee-switch-button__title">4 Sao</span><!----></div>
                <div id="ember1288" class="shopee-switch-button ember-view"><span class="shopee-switch-button__title">3 Sao</span><!----></div>
                <div id="ember1290" class="shopee-switch-button ember-view"><span class="shopee-switch-button__title">2 Sao</span><!----></div>
                <div id="ember1292" class="shopee-switch-button ember-view"><span class="shopee-switch-button__title">1 Sao</span><!----></div>
            </div>
            <ul class="rating__list">
                <!---->
            </ul>
            <div id="ember1301" class="no-result center ember-view"><span class="no-result__image ic-no-rating"></span>
                <div class="center no-result__text">Chưa có đánh giá nào dành cho Shop của bạn<!----></div>
            </div>
        </div>
    </div>



    <script>
        $(document).ready(function () {
            var data = [];
            $.ajax({
                type: "GET",
                url: '../Ajax.aspx?Action=UserAds',
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



            $(function () {


                //$(".mybtn-btm").click(function () {
                //    $('#table').bootstrapTable('scrollTo', 'bottom');
                //});

            });
        });
    </script>
</asp:Content>

