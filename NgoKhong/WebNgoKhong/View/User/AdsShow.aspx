<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="AdsShow.aspx.cs" Inherits="View_User_User" %>

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
        <div id="ember6145" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #ffc200;" class="shop-setting-header__icon">
                    <svg style="background: #ffc200;" viewBox="0 0 12 11">
                                            <path d="M10.9 6.8s-.7.7-.8 1.6c-.1.5 0 1.1 0 1.1v.1h-.2c-.2 0-.6-.1-.9-.3-.1-.1-.2-.2-.4-.3-.2-.2-.5-.4-.7-.6-.3-.3-.5-.6-.7-.8l-.1-.1c0-.1-.1-.2-.1-.3-.2-.2-.3-.4-.3-.5 0-.1-.1-.2-.1-.3v-.2h.1s.6.1 1.1 0c.2-.1.4-.1.5-.2.3-.1.6-.3.8-.4.2-.1.3-.3.3-.3.3-.3.9-.4 1.3-.1.1 0 .1.1.2.1.1.1.1.1.1.2.3.4.3 1-.1 1.3zm.9-1.5c.1-.1.2-.2.2-.4s-.1-.3-.2-.5c-.2-.2-.6-.2-.8 0-.6-.3-1.3-.2-1.8.2-.2 0-.3.1-.3.2 0 0-.2.2-.5.4-.2.1-.4.1-.6.2-.4.1-.9 0-.9 0-.1 0-.5 0-.8.2-.2.2-.3.5-.3.8v.3c.1.2.2.5.4.7.1.1.1.2.2.3-.1.6 0 1.2.5 1.7.4.4 1 .6 1.6.5.5.4 1 .6 1.4.6h.1c.3 0 .5-.1.7-.3.3-.3.2-.7.2-.8v-.9c.1-.6.6-1.1.6-1.1.5-.6.7-1.4.3-2.1zM7.6.8L4.5 3.2 1.5.8h6.1zM.9 6.7c-.1 0-.2-.1-.2-.2V1.2L4.2 4c.1.1.2.1.3.1.1 0 .2 0 .3-.1l3.5-2.8v3.6c.3-.2.5-.4.5-.4.1-.1.2-.1.3-.2V.4c0-.1 0-.2-.1-.2-.1-.2-.2-.2-.2-.2H.4C.3 0 .2 0 .2.1 0 .2 0 .3 0 .4v6.7c0 .2.2.4.4.4h5.4c-.2-.3-.3-.6-.3-.8H.9z"></path></svg>
                </div>

                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title">Tin rao vặt</div>
                    <div class="shop-setting-header__subtitle">Danh sách tin rao vặt</div>
                </div>
                <div class="shop-setting-header__buttons">
                </div>
            </div>
            <hr class="shop-setting-header__seperator ">
        </div>
        <div class=" tab-action">
            <div class="tabs">
                <a href="<%=GetRouteUrl("userads", new { }) %>" id="ember1144" class="tabs__tab ember-view">Tất cả</a>
                <a href="<%=GetRouteUrl("useradsshow", new { }) %>" id="ember1168" class="tabs__tab ember-view active ">Tin đăng hiển thị</a>
                <a href="<%=GetRouteUrl("useradshidden", new { }) %>" id="ember31168" class="tabs__tab ember-view ">Tin đăng hết hạn</a>
            </div>
        </div>
        <div id="editPage" class="content">
            <table id="table" data-search="true" data-show-columns="false" data-pagination="true" data-height="500">
                <thead>
                    <tr>
                        <th data-field="col1" data-sortable="true">Mã tin đăng</th>
                        <th data-field="col2" data-sortable="true">Ngày đăng</th>
                        <th data-field="col3" data-sortable="true" width="200">Ngày hết hạn</th>
                        <th data-field="col4" data-sortable="true">Tiêu đề</th>
                        <th data-field="col5" data-sortable="true">Giá</th>
                        <th data-field="col6" data-sortable="true">Xem chi tiết</th>
                        <%--<th data-field="col5" data-sortable="true">Đơn giá</th>
                        <th data-field="col7" data-sortable="true">Thành tiền</th>
                        <th data-field="col8" data-sortable="true">Tình trạng</th>--%>
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
                url: '../Ajax.aspx?Action=UserAds&type=1',
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

