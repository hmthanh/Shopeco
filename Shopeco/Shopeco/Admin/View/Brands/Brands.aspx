<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="Admin_View_Brands_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
         });
         function DeleteBrands(idBrand) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                     type: "POST",
                     url: "/Admin/View/Brands/Brands.aspx/DeleteBrands",
                     data: "{idBrand:'" + idBrand + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (datas) {
                         if (datas.d == "True")
                             location.reload();
                         else {
                             alert("Không thể xóa thương hiệu này!");
                         }
                     },
                     error: function () { alert("Không thể xóa.Lỗi function") }
                 });
             }
         }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title">DANH SÁCH SLIDE</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <asp:TextBox type="text" id="txtTieuDe" runat="server" class="form-control" placeholder="Tìm kiếm theo tiêu đề..."/>
                            </div>
                        </div>
                        <%--<div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtMoTa" runat="server" class="form-control" placeholder="Tìm kiếm theo mô tả..."/>
                            </div>
                        </div>--%>
                      </div>
                </div>
            
            <div class="form-group">
            <div class="row">
                <div class="col-sm-9">
                </div>
                 <div class="col-sm-3">
                        <div style="text-align:right;">
                            <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                            <a class="btn btn-primary" href="<%=GetRouteUrl("adminbrandsupdate", new { id=0}) %>"><i class="glyphicon glyphicon-plus"></i> Thêm</a>
                        </div>
                    </div>
                </div>
                </div>
            <div id="dvDanhSachLoaiTinTuc" runat="server">

            </div>
        </div>
        </div>
    </section>
    <!-- /.content -->
    </div>
 </form>
</asp:Content>