<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="BacSi.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#col7').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="#" class="current">Bác sĩ</a> </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">    
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-list-alt"></i></span>
                            <h5>Danh sách các bác sĩ</h5>
                            <span class="label label-info">Featured</span>
                        </div>
                        <div class="widget-content">
                            <table id="datatableBootstrap" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Bác sĩ</th>
                                        <th>Chuyên khoa</th>
                                        <th>Số điện thoại</th>
                                        <th>Email</th>
                                        <th>Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody id="tableContain" runat="server">
                                    
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