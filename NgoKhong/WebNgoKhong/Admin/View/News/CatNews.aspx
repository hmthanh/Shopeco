﻿<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="CatNews.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
         });
         function DeleteLoaiTinTuc(idLoaiTinTuc) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/TinTuc/LoaiTinTuc.aspx/DeleteLoaiTinTuc",
                data: "{idLoaiTinTuc:'" + idLoaiTinTuc + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể xóa loại tin tức");
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
    <div class="title">DANH SÁCH LOẠI TIN TỨC</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtTenLoai" runat="server" class="form-control" placeholder="Tìm kiếm theo tên loại tin tức..."/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                <input type="text" id="txtMoTa" runat="server" class="form-control" placeholder="Tìm kiếm theo mô tả..."/>
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
                            <a class="btn btn-primary" href="/admin/category-news/new-update-0"><i class="glyphicon glyphicon-plus"></i> Thêm</a>
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
