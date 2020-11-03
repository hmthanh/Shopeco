<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="Admin_View_TinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
         });
         function DeleteTinTuc(idTinTuc) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/TinTuc/TinTuc.aspx/DeleteTinTuc",
                data: "{idTinTuc:'" + idTinTuc + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể xóa tin tức");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
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
    <div class="title">DANH SÁCH TIN TỨC</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tiêu đề tin tức..."/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <select id="slLoaiTinTuc" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
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
                            <a class="btn btn-primary" href="<%=GetRouteUrl("adminCapNhatTinTuc", new { id= 0}) %>"><i class="glyphicon glyphicon-plus"></i> Thêm</a>
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