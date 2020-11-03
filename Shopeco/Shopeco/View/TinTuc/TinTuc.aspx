<%@ Page Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="View_TinTuc_TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Main Container  -->
	<div class="main-container container">
		<div class="row"><%=GetDuongDan() %></div>
		<div class="row">
			<!--Left Part Start -->
			<!--Left Part End -->
			
			<!--Middle Part Start-->
			<div id="content" class="col-md-12 col-sm-11">
				<%--<div class="blog-header">
					<h3>Our Blog</h3>
					
				</div>--%>
				<div class="blog-category clearfix">
                    <div class="blog-listitem row" id="dvTinTuc" runat="server">
                    </div>
                    <div class="product-filter product-filter-top filters-panel hidden-sm hidden-xs">
                        <div class="row">
                            <div class="col-sm-12 view-mode" style="text-align:center">
                                <div class="list-view ">
                                    <button type="button" id="grid-view" class="btn btn-view hidden-sm hidden-xs">1</button>
                                    <button type="button" id="list-view" class="btn btn-view list "><i class="fa fa-bars"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-filter product-filter-bottom filters-panel clearfix">
                        <div class="row">
                            <div class="col-md-12">
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<!--Middle Part End-->
	</div>
	<!-- //Main Container -->
    <script>
        $(document).ready(function () {
            $("#page_tintuc").addClass("active");
        });
    </script>
</asp:Content>
