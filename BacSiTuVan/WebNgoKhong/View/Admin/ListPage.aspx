<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ListPage.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="#" class="current">Tables</a> </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-list-alt"></i></span>
                            <h5>Danh sách các trang</h5>
                            <span class="label label-info">Featured</span>
                        </div>
                        <div class="widget-content">
                            <div class="">
                                <a href="<%=GetRouteUrl("editpage", new { })%>" class="btn btn-primary" style="margin-bottom: 10px; float:right;">Thêm trang mới</a>
                            </div>
                            <table class="table table-bordered table-striped with-check">
                                <thead>
                                    <tr>
                                        <th>Số thứ tự</th>
                                        <th>Tiêu đề</th>
                                        <th>Loại trang</th>
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
</asp:Content>
