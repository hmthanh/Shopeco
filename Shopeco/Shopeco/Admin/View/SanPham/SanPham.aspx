<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="SanPham.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
         });
         function DeleteSanPham(idSanPham) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 $.ajax({
                     type: "POST",
                     url: "/Admin/View/SanPham/SanPham.aspx/DeleteSanPham",
                     data: "{idSanPham:'" + idSanPham + "'}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (datas) {
                         if (datas.d == "True")
                             location.reload();
                         else {
                             alert("Không thể xóa sản phẩm");
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
    <div class="title">DANH SÁCH SẢN PHẨM</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tên sản phẩm..."/>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <select id="slLoaiSanPham" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
                            </div>
                        </div>
                        <div class="col-lg-2" style="text-align:right">
                            <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                        </div>
                      </div>
                </div>
            
            <div class="form-group" >
            <div class="row">
                <div class="col-sm-8">
                    <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtUrlQuet" runat="server" class="form-control" placeholder="Nhập url quét..."/>
                            </div>
                </div>
                 <div class="col-sm-4">
                        <div style="text-align:right;">
                            <asp:LinkButton class="btn btn-primary" ID="btQuet" runat="server" OnClick="btQuet_Click"><i class="fa fa-search"></i><span> Quét sản phẩm</span></asp:LinkButton>
                            <%--<a class="btn btn-primary" href="<%=GetRouteUrl("adminCapNhatSanPham", new { id = 0}) %>"><i class="glyphicon glyphicon-plus"></i> Thêm</a>--%>
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
