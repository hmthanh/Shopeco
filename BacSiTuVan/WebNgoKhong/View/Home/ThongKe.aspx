<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/AdminMaster.master" AutoEventWireup="true" CodeFile="ThongKe.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#col3').addClass("active");
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, menuStatistic%>" /></a></div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-user-md"></i></span>
                            <h5><asp:Literal ID="Literal12" runat="server" Text="<%$Resources:name.language, headerQues%>" /></h5>
                        </div>
                        <div class="row" style="padding: 10px 0; margin-left: 0;">
                            <div class="col-md-3">
                                <label><asp:Literal ID="Literal11" runat="server" Text="<%$Resources:name.language, menuDoctor %>" /> : </label>
                                <asp:DropDownList ID="slDoctor" runat="server" type="text" class="form-control" Style="display: inline-block; width: 200px;" OnLoad="slDoctor_Load" />
                                </div>
                                <div class="col-md-3">
                                    <label><asp:Literal ID="Literal1" runat="server" Text="<%$Resources:name.language, labelDateFrom%>" /> : </label>
                                    <input id="dayFrom" runat="server" type="text" class="datepicker" />
                                </div>
                                <div class="col-md-3 ">
                                    <label><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:name.language, labelDateTo%>" /> : </label>
                                    <input id="dayTo" runat="server" type="text" class="datepicker" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnSearch" CssClass="btn btn-success" runat="server" Text="<%$Resources:name.language, btnSearch%>" OnClick="btnSearch_Click"></asp:Button>
                                </div>
                            </div>
                            <div class="widget-content">
                                <table id="datatableBootstrap" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:name.language, tdNo%>" /></th>
                                            <th><asp:Literal ID="Literal5" runat="server" Text="<%$Resources:name.language, tdDay%>" /></th>
                                            <th><asp:Literal ID="Literal6" runat="server" Text="<%$Resources:name.language, tdPatient%>" /></th>
                                            <th><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:name.language, tdContent%>" /></th>
                                            <th><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:name.language, menuDoctor %>" /></th>
                                            <th><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:name.language, tdStatus%>" /></th>
                                            <th><asp:Literal ID="Literal10" runat="server" Text="<%$Resources:name.language, tdPrice%>" /></th>
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