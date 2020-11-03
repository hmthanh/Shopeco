<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
         });
         function DeleteLoaiSanPham(idLoaiSanPham) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/SanPham/LoaiSanPham.aspx/DeleteLoaiSanPham",
                data: "{idLoaiSanPham:'" + idLoaiSanPham + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể xóa loại sản phẩm");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
            });
             }
         }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title">DANH SÁCH LOẠI SẢN PHẨM</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tên loại sản phẩm..."/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <%--<select id="slLoaiSPCapCha" runat="server" class="form-control select2" ></select>--%>
                                <asp:DropDownList ID="ddlLoaiSP" class="form-control select2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSP_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                      </div>
                </div>
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <select id="slLoaiSPCap2" runat="server" class="form-control select2" ></select>
                            </div>
                        </div>
                      </div>
                </div>
            
            <div class="form-group">
            <div class="row">
                <div class="col-sm-9">
                    
                </div>
                 <div class="col-sm-3">
                        <div style="text-align:right;">
                            <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                            <a class="btn btn-primary" href="<%=GetRouteUrl("adminCapNhatLoaiSanPham",new { id= 0 }) %>"><i class="glyphicon glyphicon-plus"></i> Thêm</a>
                        </div>
                    </div>
                </div>
                </div>
            <div id="dvDanhSachLoaiSanPham" runat="server">

            </div>
        </div>
        </div>
    </section>
    <!-- /.content -->
    </div>
</asp:Content>
