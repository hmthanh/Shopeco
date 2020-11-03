<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="BangGia.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, tdPrice%>" /></a></div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-list-alt"></i></span>
                            <h5>Bảng giá</h5>
                            <span class="label label-info">Featured</span>
                        </div>
                        <div class="widget-content">
                            <table id="datatableBootstrap" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Ngày</th>
                                        <th>Bênh nhân</th>
                                        <th>Yêu cầu</th>
                                        <th>Bác sĩ</th>
                                        <th>Giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>09:27 AM</td>
                                        <td>
                                           Nguyễn Văn A
                                        </td>
                                        <td><a href="<%=GetRouteUrl("topic", new { id = 1}) %>">Viêm nướu có thể tiến triển làm ảnh hưởng tới phần xương bao quanh và nâng đỡ răng ?</a></td>
                                        <td>
                                           Bác sĩ A
                                        </td>
                                        <td>
                                           2.000.000 VNĐ
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>09:27 AM</td>
                                        <td>
                                           Nguyễn Văn A
                                        </td>
                                        <td><a href="<%=GetRouteUrl("topic", new { id = 1}) %>">Viêm nướu có thể tiến triển làm ảnh hưởng tới phần xương bao quanh và nâng đỡ răng ?</a></td>
                                        <td>
                                           Bác sĩ A
                                        </td>
                                        <td>
                                           2.000.000 VNĐ
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function () {
        $('#datatableBootstrap').DataTable();
    });
    </script>
</asp:Content>
