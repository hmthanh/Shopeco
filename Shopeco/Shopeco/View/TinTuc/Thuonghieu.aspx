<%@ Page Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="ThuongHieu.aspx.cs" Inherits="View_TinTuc_Thuonghieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <!-- Main Container  -->
	<div class="main-container container">
		<div class="row">
			<!--Left Part Start -->
            <aside class="col-md-3 col-sm-4 col-xs-12 content-aside left_column " id="column-left">
                
                <div class="module product-simple">
                    <h3 class="modtitle">
                        <span>Sản phẩm HOT</span>
                    </h3>
                    <div class="modcontent">
                        <div class="so-extraslider" >
                            <!-- Begin extraslider-inner -->
                            <div class=" extraslider-inner" id="dvSanPhamHot" runat="server">

                            </div>
                            <!--End extraslider-inner -->
                        </div>
                    </div>
                </div>
                <div class="module product-simple">
                    <h3 class="modtitle">
                        <span>Tin tức khác</span>
                    </h3>
                    <div class="modcontent">
                        <div class="so-extraslider" >
                            <!-- Begin extraslider-inner -->
                            <div class=" extraslider-inner" id="dvTinTucKhac" runat="server">
                            </div>
                            <!--End extraslider-inner -->
                        </div>
                    </div>
                </div> 
            </aside>
            <!--Left Part End -->
			
			<!--Middle Part Start-->
			<div id="content" class="col-md-9 col-sm-8">
				<div class="article-info">
					<div class="blog-header">
						<h3 id="hTieuDe" runat="server"></h3>
					</div>
					<div class="form-group" id="dvAnh" runat="server">
						
					</div>
					
					<div class="article-description" id="dvNoiDung" runat="server">
						<p>Morbi tempus, non ullamcorper euismod, erat odio suscipit purus, nec ornare lacus turpis ac purus. Mauris cursus in mi vel dignissim. Morbi mollis elit ipsum, a feugiat lectus gravida non. Aenean molestie justo sed aliquam euismod. Maecenas laoreet bibendum laoreet. Morbi tempor massa sit amet purus lobortis, non porta tellus dignissim. </p>
						<p>Proin dictum justo a nisl pellentesque egestas.Nulla commodo euismod nisi ac bibendum. Mauris in pellentesque tellus, in cursus magna. Sed volutpat dui bibendum mi molestie, at volutpat nunc dictum. Fusce sagittis massa id eros scelerisque, eget accumsan magna lacinia. Nullam posuere neque at neque dictum interdum</p>
						<p> Mauris cursus in mi vel dignissim. Morbi mollis elit ipsum, a feugiat lectus gravida non. Aenean molestie justo sed aliquam euismod. Maecenas laoreet bibendum laoreet. Morbi tempor massa sit amet purus lobortis, non porta tellus dignissim. Proin dictum justo a nisl pellentesque egestas.Nulla commodo euismod nisi ac bibendum. Mauris in pellentesque tellus, in cursus magna. Sed volutpat dui bibendum mi molestie, at volutpat nunc dictum. Fusce sagittis massa id eros scelerisque, eget accumsan magna lacinia. Nullam posuere neque at neque dictum interdum</p>
					</div>
					
					
				</div>

			</div>
			
			
		</div>
		<!--Middle Part End-->
	</div>
	<!-- //Main Container -->
</asp:Content>

