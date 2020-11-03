<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/AdminMaster.master" AutoEventWireup="true" CodeFile="DsBacSi.aspx.cs" Inherits="View_Home_Index" %>

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
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, menuPromotion %>" /></a></div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">    
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="fa fa-list-alt"></i></span>
                            <h5><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:name.language, headerDoctor %>" /></h5>
                            
                        </div>
                        <div class="widget-content">
							<div class="row">
								<a class="btn btn-success"  style="float:right; margin-right: 20px; margin-bottom: 10px;" href="<%=GetRouteUrl("adddoctor", new { }) %>"><asp:Literal ID="Literal1" runat="server" Text="<%$Resources:name.language, btnAddDoctor %>" /></a>
							</div>
                            <table id="datatableBootstrap" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:name.language, tdNo %>" /></th>
                                        <th><asp:Literal ID="Literal5" runat="server" Text="<%$Resources:name.language, menuDoctor %>" /></th>
                                        <th><asp:Literal ID="Literal6" runat="server" Text="<%$Resources:name.language, tdRegency %>" /></th>
                                        <th><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:name.language, tdPhone %>" /></th>
                                        <th><asp:Literal ID="Literal8" runat="server" Text="<%$Resources:name.language, tdEmail %>" /></th>
                                        <th><asp:Literal ID="Literal9" runat="server" Text="<%$Resources:name.language, tdDetail %>" /></th>
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