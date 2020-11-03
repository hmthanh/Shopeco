<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">

    <div class="container">
        <div class="main-contain" style="margin-top: 10px;">
        </div>
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Title!</strong> Alert body ...
        </div>
        <div class="container">
            <table id="table" data-search="true" data-show-columns="false" data-pagination="true" data-height="500">
                <thead>
                    <tr>
                        <th data-field="col1" data-sortable="true">Ngày đặt hàng</th>
                        <th data-field="col2" data-sortable="true">Mã đơn hàng</th>
                        <th data-field="col3" data-sortable="true">Tên khách hàng</th>
                        <th data-field="col4" data-sortable="true" width="200">Địa chỉ</th>
                        <th data-field="col5">Số điện thoại</th>
                        <th data-field="col6">Tình trạng</th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="clearfix"></div>
    </div>

    <script>
        $(document).ready(function () {
            var data = [];
            $.ajax({
                type: "GET",
                url: '../Ajax.aspx?Action=DoctorEvaluate',
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
                }
            });
        });
    </script>
</asp:Content>