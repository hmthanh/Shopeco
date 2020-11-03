<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" validateRequest="false" AutoEventWireup="true" CodeFile="LoaiSanPham-CapNhat.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTin_CapNhat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        window.onload=function()
        {
            //LoadLoaiSP2();
        }
        //function LoadLoaiSP2() {
        //    var idLoaiSPCap1 = document.getElementById("ContentPlaceHolder1_slLoaiSP").value;
        //    var xmlhttp;
        //    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        //        xmlhttp = new XMLHttpRequest();
        //    }
        //    else {// code for IE6, IE5
        //        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        //    }
        //    xmlhttp.onreadystatechange = function () {
        //        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        //            if (xmlhttp.responseText != "") {
        //                //alert(xmlhttp.responseText);
        //                document.getElementById("ContentPlaceHolder1_slLoaiSPCap2").innerHTML = xmlhttp.responseText;
        //                //if (idQuanHuyen != "")
        //                //    document.getElementById("slQuanHuyen1").value = idQuanHuyen;
        //                document.getElementById("ContentPlaceHolder1_slLoaiSPCap2").value = "";
        //            }
        //            else
        //                alert("Lỗi load loại sản phẩm cấp 2!"); //ErrorGetDistrict
        //        }
        //    }
        //    xmlhttp.open("GET", "../View/SanPham/Ajax_SanPham.aspx?Action=LoadLoaiSP2&idLoaiSPCap1=" + idLoaiSPCap1, true);
        //    xmlhttp.send();
        //}

        $("#ContentPlaceHolder1_imageUploadInput").change(function ()
        {
            $("#ContentPlaceHolder1_imagePreviewContainer").empty();
            var image = this.files[0];
            //alert(image)
            $("#ContentPlaceHolder1_imagePreviewContainer").innerHTML = '';
            //var imgCaption = document.createElement("p");
            //imgCaption.innerHTML = image.name;
            var imgElement = document.createElement("img");
            imgElement.src = window.URL.createObjectURL(image);
            imgElement.onload = function () {
                window.URL.revokeObjectURL(this.src);
            };
            $("#ContentPlaceHolder1_imagePreviewContainer").innerHTML = ''; // clear existing content
            //$("#imagePreviewContainer").append(imgCaption);
            $("#ContentPlaceHolder1_imagePreviewContainer").append(imgElement);
        });



        $("#ContentPlaceHolder1_bannerUploadInput").change(function () {

            $("#ContentPlaceHolder1_bannerPreviewContainer").empty();
            var image = this.files[0];

            $("#ContentPlaceHolder1_bannerPreviewContainer").innerHTML = ''; 
            var imgElement = document.createElement("img");
            imgElement.width = 200;
            imgElement.height = 50;
            imgElement.src = window.URL.createObjectURL(image);

            imgElement.onload = function ()
            {
                window.URL.revokeObjectURL(this.src);
            };
            $("#ContentPlaceHolder1_bannerPreviewContainer").innerHTML = ''; // clear existing content

            $("#ContentPlaceHolder1_bannerPreviewContainer").append(imgElement);
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title">CẬP NHẬT LOẠI SẢN PHẨM</div>
    <div class="box">
        <div class="box-body">
            <form class="form-horizontal" runat="server">
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Tên loại SP (*): </b>
                            </div>
                            <div class="col-md-10">
                                <input id="txtTen" placeholder="Nhập tên loại tin tức..." class="form-control" runat="server" type="text" />
                                <span id="MessageMaKH" runat="server" class="validationMessage" style="display: none"></span>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Loại SP cấp 1: </b>
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList class="form-control select2" ID="ddlLoaiSP" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlLoaiSP_SelectedIndexChanged"></asp:DropDownList>
                                <%--<select class="form-control select2" runat="server" id="slLoaiSP" onchange="LoadLoaiSP2()" ></select>--%>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Loại SP cấp 2: </b>
                            </div>
                            <div class="col-md-10">
                                <select class="form-control select2" runat="server" id="slLoaiSPCap2" ></select>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Mô tả: </b>
                            </div>
                            <div class="col-md-10">
                                <textarea id="txtMoTa" class="ckeditor" runat="server"></textarea>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Icon: </b>
                    </div>
                    <div class="col-md-4">
                            <div class="span12 controls">
                                <input id="imageUploadInput" name="imageUploadInput" type="file" runat="server" /></div>
                        </div>
                    <div class="col-md-6 centerImg">
                            <div class="span12" id="imagePreviewContainer" runat="server">
                                <img id="imglogo" runat="server" src="/Admin/Content/images/MacDinh.png" style="max-width: 50px;"/></div>
                        </div>
                        <%--<div class="row-fluid"><p>Lưu ý: Ảnh không vượt quá 2MB</p></div>--%>
                </div>
                <div class="col-md-12 form-group">
                    <div class="col-md-2">
                        <b>Banner: </b>
                    </div>
                    <div class="col-md-4">
                            <div class="span12 controls">
                                <input id="bannerUploadInput" type="file" runat="server" /></div>
                        </div>
                    <div class="col-md-6 centerImg">
                            <div class="span12" id="bannerPreviewContainer" runat="server">
                                <img id="imgBanner" runat="server" src="/Admin/Content/images/MacDinh.png" style="max-width: 50px;"/></div>
                        </div>
                        <%--<div class="row-fluid"><p>Lưu ý: Ảnh không vượt quá 2MB</p></div>--%>
                </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Kích hoạt: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="ckKichHoat" runat="server" checked="checked" type="checkbox"/>
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
