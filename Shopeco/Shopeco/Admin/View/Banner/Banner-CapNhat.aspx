﻿<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" validateRequest="false" AutoEventWireup="true" CodeFile="Banner-CapNhat.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTin_CapNhat" %>

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
    <div class="title">CẬP NHẬT BANNER</div>
    <div class="box">
        <div class="box-body">
            <form class="form-horizontal" runat="server">
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Tiêu đề: </b>
                    </div>
                    <div class="col-md-10">
                        <input id="txtTieuDe" placeholder="Nhập tên tiêu đề banner..." class="form-control" runat="server" type="text" />
                        <span id="MessageMaKH" runat="server" class="validationMessage" style="display: none"></span>
                    </div>
                </div>
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Số thứ tự: </b>
                    </div>
                    <div class="col-md-10">
                        <input id="txtSoThuTu" readonly="" placeholder="Nhập số thứ tự..." class="form-control" runat="server" type="text" />
                        <span id="Span1" runat="server" class="validationMessage" style="display: none"></span>
                    </div>
                </div>
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Ảnh: </b>
                    </div>
                    <div class="col-md-4">
                            <div class="span12 controls">
                                <input id="imageUploadInput" name="imageUploadInput" type="file" runat="server" /></div>
                        </div>
                    <div class="col-md-6 centerImg">
                            <div class="span12" id="imagePreviewContainer" runat="server">
                                <img id="imglogo" runat="server" src="/images/MacDinh.png" style="width:70px"/></div>
                        </div>
                        <%--<div class="row-fluid"><p>Lưu ý: Ảnh không vượt quá 2MB</p></div>--%>
                </div>

                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Kích hoạt: </b>
                    </div>
                    <div class="col-md-10">
                        <input id="ckKichHoat" runat="server" checked="checked" type="checkbox" />
                    </div>
                </div>
                <div class="box-footer">
                    <asp:Button ID="btLuu" runat="server" Text="LƯU" class="btn btn-primary btn-flat" OnClick="btLuu_Click" />
                    <asp:Button ID="btHuy" runat="server" Text="HỦY" class="btn btn-primary btn-flat" OnClick="btHuy_Click"/>
                </div>
               
            </form>
            
        </div>
    </div>
    </section>
    <!-- /.content -->
  </div>
</asp:Content>
