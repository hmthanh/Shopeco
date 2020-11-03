<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/AdminMaster.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="EditPage.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- CK Editor -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.4.5/ckeditor.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2/js/epiceditor.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, menuNoti%>" /></a></div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-list-alt"></i></span>
                            <h5>Sửa trang</h5>
                            <span class="label label-info">Featured</span>
                        </div>
                        <div class="widget-content">
                            <table class="table table-bordered table-striped with-check">
                                <tbody>
                                    <tr>
                                        <td width="200">Tiêu đề</td>
                                        <td>
                                            <div class="input-group" style="width: 100%;">
                                                <input type="text" name="" id="txtTitle" runat="server" class="form-control" value="" required="required" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200">Loại trang</td>
                                        <td>
                                            <div class="input-group" style="width: 100%;">
                                                <asp:DropDownList AutoPostBack="True" ID="slType" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200">Nội dung</td>
                                        <td>
                                            <div class="input-group">
                                                <div class="form-group">
                                                    <textarea name="" id="areaContent" runat="server" class="form-control ckeditor" required="required"></textarea>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <div class="container">
                                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Cập nhật" OnClick="btnUpdate_Click"></asp:Button>
                                                <a id="btnBack" href="<%=GetRouteUrl("listpage", new {}) %>" class="btn btn-info">Quay lại</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>

                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
