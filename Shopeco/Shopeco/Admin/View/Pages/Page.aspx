<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" validateRequest="false" AutoEventWireup="true" CodeFile="Page.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTin_CapNhat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script>
        $("#ContentPlaceHolder1_imageUploadInput").change(function () {
            $("#ContentPlaceHolder1_imagePreviewContainer").empty();
            var image = this.files[0];
            //alert(image)
            $("#ContentPlaceHolder1_imagePreviewContainer").innerHTML = '';
            //var imgCaption = document.createElement("p");
            //imgCaption.innerHTML = image.name;
            var imgElement = document.createElement("img");
            imgElement.width = 65;
            imgElement.height = 50;
            imgElement.src = window.URL.createObjectURL(image);
            imgElement.onload = function () {
                window.URL.revokeObjectURL(this.src);
            };
            $("#ContentPlaceHolder1_imagePreviewContainer").innerHTML = ''; // clear existing content
            //$("#imagePreviewContainer").append(imgCaption);
            $("#ContentPlaceHolder1_imagePreviewContainer").append(imgElement);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title" id="Title" runat="server">CẬP NHẬT SẢN PHẨM</div>
    <div class="box">
        <div class="box-body">
            <form class="form-horizontal" runat="server">
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Thông tin : </b>
                    </div>
                    <div class="col-md-10 input-group" >
                        <select id="slLoaiThongTin" runat="server" class="form-control"></select>
                    </div>
                </div>
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Nội dung : </b>
                    </div>
                    <div class="col-md-10">
                        <textarea id="txtMoTa" class="ckeditor" runat="server"></textarea>
                    </div>
                </div>
                <div class="box-footer">
                    <asp:Button ID="btLuu" runat="server" Text="CẬP NHẬT" class="btn btn-primary btn-flat" OnClick="btLuu_Click" />
                </div>
               
            </form>
            
        </div>
    </div>
    </section>
    <!-- /.content -->
  </div>
    <script>
        $(document).ready(function () {
            $('form select').change(function () {
                var id = $(this).val();
                var url = location.origin + location.pathname + '?id=' + id;
                location.href = url;
            });
        });
    </script>
</asp:Content>
