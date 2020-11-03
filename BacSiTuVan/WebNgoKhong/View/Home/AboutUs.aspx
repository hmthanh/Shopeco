<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <script>
        $(document).ready(function () {
            $('#col1').addClass("active");
        });
    </script>
    <div class="container">
        <div class="main-contain" style="margin-top: 10px;">
        </div>
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Title!</strong> Alert body ...
        </div>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Giới thiệu</h3>
                </div>
                <div class="panel-body">
                    <div class="bootstrap-table">
                        <div class="fixed-table-container" style="height: 392px; padding-bottom: 40px;">
                            <div class="fixed-table-header" style="margin-right: 0px;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="" data-field="col1">
                                                <div class="th-inner sortable both">No.</div>
                                                <div class="fht-cell" style="width: 225px;"></div>
                                            </th>
                                            <th style="" data-field="col2">
                                                <div class="th-inner sortable both">Mã đơn hàng</div>
                                                <div class="fht-cell" style="width: 211px;"></div>
                                            </th>
                                            <th style="" data-field="col3">
                                                <div class="th-inner sortable both">Tên khách hàng</div>
                                                <div class="fht-cell" style="width: 241px;"></div>
                                            </th>
                                            <th style="" data-field="col4">
                                                <div class="th-inner sortable both">Địa chỉ</div>
                                                <div class="fht-cell" style="width: 145px;"></div>
                                            </th>
                                            <th style="" data-field="col5">
                                                <div class="th-inner ">Số điện thoại</div>
                                                <div class="fht-cell" style="width: 171px;"></div>
                                            </th>
                                            <th style="" data-field="col6">
                                                <div class="th-inner ">Tình trạng</div>
                                                <div class="fht-cell" style="width: 140px;"></div>
                                            </th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="fixed-table-body">
                                <div class="fixed-table-loading" style="top: 41px;">Đang tải...</div>
                                <table id="table" data-search="true" data-show-columns="false" data-pagination="true" data-height="500" class="table table-hover" style="margin-top: -40px;">
                                    <thead>
                                        <tr>
                                            <th style="" data-field="col1">
                                                <div class="th-inner sortable both">Ngày đặt hàng</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                            <th style="" data-field="col2">
                                                <div class="th-inner sortable both">Mã đơn hàng</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                            <th style="" data-field="col3">
                                                <div class="th-inner sortable both">Tên khách hàng</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                            <th style="" data-field="col4">
                                                <div class="th-inner sortable both">Địa chỉ</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                            <th style="" data-field="col5">
                                                <div class="th-inner ">Số điện thoại</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                            <th style="" data-field="col6">
                                                <div class="th-inner ">Tình trạng</div>
                                                <div class="fht-cell"></div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-index="0">
                                            <td style="">1</td>
                                            <td style="">Hoang Minh</td>
                                            <td style="">234</td>
                                            <td style="">A</td>
                                            <td style="">3423</td>
                                            <td style="">
                                                <div class=""></div>
                                            </td>
                                        </tr>
                                        <tr data-index="1">
                                            <td style="">2</td>
                                            <td style="">Nguyen Van B</td>
                                            <td style="">234</td>
                                            <td style="">B</td>
                                            <td style="">234</td>
                                            <td style="">
                                                <div class=""></div>
                                            </td>
                                        </tr>
                                        <tr data-index="2">
                                            <td style="">3</td>
                                            <td style="">Tran Thi C</td>
                                            <td style="">0945</td>
                                            <td style="">C</td>
                                            <td style="">234234</td>
                                            <td style="">
                                                <div class=""></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="fixed-table-footer" style="display: none;">
                                <table>
                                    <tbody>
                                        <tr></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="fixed-table-pagination">

                            <div class="pull-right pagination" style="display: none;">
                                <ul class="pagination">
                                    <li class="page-item page-pre"><a class="page-link" href="#">‹</a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item page-next"><a class="page-link" href="#">›</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </div>
            <div class="clearfix"></div>
        </div>
</asp:Content>