<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTin_CapNhat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function XoaHinhAnh(id, TenAnh) {
            if (confirm("Bạn có muốn xóa không ?")) {
                document.getElementById(id).style.display = "none";
                document.getElementById("ContentPlaceHolder1_hdHinhAnh").value = document.getElementById("ContentPlaceHolder1_hdHinhAnh").value.replace(TenAnh + "|~~~~|", "");
            }
        }
        var listSize = [];
        function CapNhatListSize(value, id) {
            if ($("#ContentPlaceHolder1_listSize").val() != "")
                listSize = $("#ContentPlaceHolder1_listSize").val().split('-');
            var indextt = jQuery.inArray(id, listSize);
            if (value == true) {
                if (indextt == -1)
                    listSize.push(id);
            }
            else
                listSize.splice(indextt, 1);
            $("#ContentPlaceHolder1_listSize").val(listSize);
        }
        var listMau = [];
        function CapNhatListMau(value, id) {
            if ($("#ContentPlaceHolder1_listMau").val() != "")
                listMau = $("#ContentPlaceHolder1_listMau").val().split('-');

            var indextt = jQuery.inArray(id, listMau);
            if (value == true) {
                if (indextt == -1)
                    listMau.push(id);
            }
            else
                listMau.splice(indextt, 1);
            $("#ContentPlaceHolder1_listMau").val(listMau);
        }
    </script>
    <style>
        .divAnh {
            width: 100px;
            float: left;
            /* padding-right: 5px; */
            padding-bottom: 1px;
            position: relative;
            border-right-style: groove;
        }

        .imgDel {
            position: absolute;
            top: 0px;
            right: 12px;
            cursor: pointer;
            color: red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="title">CẬP NHẬT SẢN PHẨM</div>
            <div class="box">
                <div class="box-body">
                    <div class="form-horizontal" runat="server">
                        <input id="listImg" runat="server" hidden />
                        <input id="listSize" runat="server" hidden />
                        <input id="listMau" runat="server" hidden />
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Mã sản phẩm: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="txtMaSanPham" placeholder="Nhập mã sản phẩm..." class="form-control" runat="server" type="text" />
                                <span id="Span3" runat="server" class="validationMessage" style="display: none"></span>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Tên sản phẩm (*): </b>
                            </div>
                            <div class="col-md-10">
                                <input id="txtTenSP" placeholder="Nhập tên sản phẩm..." class="form-control" runat="server" type="text" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Giá: </b>
                            </div>
                            <div class="col-md-5">
                                <input id="txtGiaCu" oninput="format_curency(this)" placeholder="Nhập giá cũ..." class="form-control" runat="server" type="text" />
                            </div>
                            <div class="col-md-5">
                                <input id="txtGiaMoi" oninput="format_curency(this)" placeholder="Nhập giá mới..." class="form-control" runat="server" type="text" />
                            </div>
                        </div>

                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Loại SP cấp 1 (*): </b>
                            </div>
                            <div class="col-md-10">
                                <%--<select id="slLoaiSanPham" class="form-control select2" runat="server"></select>--%>
                                <asp:DropDownList ID="ddlLoaiSPCap1" class="form-control select2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSPCap1_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Loại SP cấp 2 (*): </b>
                            </div>
                            <div class="col-md-10">
                                <asp:DropDownList ID="ddlLoaiSPCap2" class="form-control select2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSPCap2_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Loại SP cấp 3 (*): </b>
                            </div>
                            <div class="col-md-10">
                                <select id="slLoaiSPCap3" class="form-control select2" runat="server"></select>
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Thương hiệu (*): </b>
                            </div>
                            <div class="col-md-10">
                                <select id="slThuongHieu" class="form-control select2" runat="server"></select>
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

                        <div class="form-group col-md-12">
                            <div class="col-md-2">
                                <b>Chọn ảnh: </b>
                            </div>
                            <div class="col-md-8">
                                <label class="img-pr-left custom-upload">
                                    <asp:FileUpload ID="fileHinhAnh" ClientIDMode="Static" onchange="this.form.submit()" runat="server" AllowMultiple="true" />
                                    <input type="hidden" id="hdHinhAnh" runat="server" />
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="col-md-2"></div>
                            <div class="col-md-10">
                                <div id="listImgHangHoa" runat="server" style="border-style: groove; min-height: 100px">
                                </div>
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <div class="col-md-2">
                                <b>Màu: </b>
                            </div>
                            <div class="col-md-10" id="dvColor" runat="server"></div>
                        </div>
                        <div class="form-group col-md-12">
                            <div class="col-md-2">
                                <b>Size: </b>
                            </div>
                            <div class="col-md-10" id="dvSize" runat="server"></div>
                        </div>
                        
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Trang chủ: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="ckTrangChu" runat="server" checked="checked" type="checkbox" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Tin HOT: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="ckTinHot" runat="server" checked="checked" type="checkbox" />
                            </div>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Đã duyệt: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="ckKichHoat" runat="server" checked="checked" type="checkbox" />
                            </div>
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="btLuu" runat="server" Text="LƯU" class="btn btn-primary btn-flat" OnClick="btLuu_Click" />
                            <asp:Button ID="btHuy" runat="server" Text="HỦY" class="btn btn-primary btn-flat" OnClick="btHuy_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</asp:Content>