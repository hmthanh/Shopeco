<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master"  ValidateRequest="false" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="View_User_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <script>
        function XoaHinhAnh(id, TenAnh) {
            if (confirm("Bạn có muốn xóa không ?")) {
                document.getElementById(id).style.display = "none";
                document.getElementById("maincontent_mainboard_hdHinhAnh").value = document.getElementById("maincontent_mainboard_hdHinhAnh").value.replace(TenAnh + "|~~~~|", "");
            }
        }
        var listSize = [];
        function CapNhatListSize(value, id) {
            if ($("#maincontent_mainboard_listSize").val() != "")
                listSize = $("#maincontent_mainboard_listSize").val().split('-');
            var indextt = jQuery.inArray(id, listSize);
            if (value == true) {
                if (indextt == -1)
                    listSize.push(id);
            }
            else
                listSize.splice(indextt, 1);
            $("#maincontent_mainboard_listSize").val(listSize);
        }
        var listMau = [];
        function CapNhatListMau(value, id) {
            if ($("#maincontent_mainboard_listMau").val() != "")
                listMau = $("#maincontent_mainboard_listMau").val().split('-');

            var indextt = jQuery.inArray(id, listMau);
            if (value == true) {
                if (indextt == -1)
                    listMau.push(id);
            }
            else
                listMau.splice(indextt, 1);
            $("#maincontent_mainboard_listMau").val(listMau);
        }
    </script>
    <style>
        .custom-select{
            width: 100%;
        }
        .divAnh {
            width: 100px;
            float: left;
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
        .col-8.left, .col-8.right{
            padding-left: 20px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#addproduct').addClass("active");
        });
    </script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.4.5/ckeditor.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2/js/epiceditor.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
    <div id="ember6145" class="shop-setting-header ember-view">
        <div class="shop-setting-header__content">
            <div style="background: #FF8074;" class="shop-setting-header__icon">
                <svg  viewBox="0 0 1024 1024"><path d="M992 832H832V288c0-17.7-14.3-32-32-32s-32 14.3-32 32v544H640V480c0-17.7-14.3-32-32-32s-32 14.3-32 32v352H448V416c0-17.7-14.3-32-32-32s-32 14.3-32 32v416H256V608c0-17.7-14.3-32-32-32s-32 14.3-32 32v224H64V160c0-17.7-14.3-32-32-32S0 142.3 0 160v672c0 35.3 28.7 64 64 64h928c17.7 0 32-14.3 32-32s-14.3-32-32-32z"></path></svg>
            </div>
            <div class="shop-setting-header__caption ">
                <div class="shop-setting-header__title">Thêm sản phẩm</div>
                <div class="shop-setting-header__subtitle">Thông tin sản phẩm</div>
            </div>
        </div>
        <hr class="shop-setting-header__seperator ">
    </div>
    <script src="../Content/gianhang/js/product.js"></script>
    <div class="box-body grid with-gap setting-card--form">
        <div class="form-horizontal" runat="server">
            <input id="listImg" runat="server" hidden />
            <input id="listSize" runat="server" hidden />
            <input id="listMau" runat="server" hidden />
            <div class="row">
                <div class="col-8 left">
                    <div class="seller-profile">
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                                Mã sản phẩm (*):
                            </div>
                            <div class="edit-input">
                                <div id="abcd" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <div class="input">
                                        <input id="txtMaSanPham" placeholder="Nhập mã sản phẩm..." class="ember-text-field ember-view" runat="server" type="text" />
                                        <span id="Span3" runat="server" class="validationMessage" style="display: none"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                                Tên sản phẩm (*): 
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <div class="input">
                                        <input id="txtTenSP" placeholder="Nhập tên sản phẩm..." class="ember-text-field ember-view" runat="server" type="text" />
                                        <span id="Span1" runat="server" class="validationMessage" style="display: none"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M16 20.8h10.9v-.9H16v.9zm0-2.1h10.9v-.9H16v.9zm0-2h10.9v-.9H16v.9zm0-2h6.6v-.9H16v.9zM29 23c0 .5-.4.9-.9.9H4c-.5.1-1-.4-1-.9V8.2c0-.5.4-.9.9-.9h5.3v2.1h1.9V7.3h4.3v2.1h1.9V7.3h4.5v2.1h1.9V7.3H28c.5 0 .9.4.9.9V23zm0-17.6H3c-1 0-1.9.8-1.9 1.9V24c0 1 .8 1.9 1.9 1.9h26c1 0 1.9-.8 1.9-1.9V7.3c-.1-1-.9-1.9-1.9-1.9z"></path></svg>
                                Giá (*): 
                            </div>
                            <div class="edit-input">
                                <div id="ember23423412" class="shopee-textbox ember-view col-md-5 left">
                                    <div class="shopee-validation-toast  "></div>
                                    <div class="input">
                                        <input id="txtGiaCu" oninput="format_curency(this)" placeholder="Nhập giá cũ..." class="ember-text-field ember-view" runat="server" type="text" />

                                        <span id="Span2" runat="server" class="validationMessage" style="display: none"></span>
                                    </div>
                                </div>
                                <div id="ember412" class="shopee-textbox ember-view  col-md-5 right">
                                    <div class="input">
                                        <div class="shopee-validation-toast  "></div>
                                        <input id="txtGiaMoi" oninput="format_curency(this)" placeholder="Nhập giá mới..." class="ember-text-field ember-view" runat="server" type="text" />
                                    </div>
                                </div>
                            </div>
                            <div class="edit-row">
                                <div class="edit-label">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                    Thương hiệu (*): 
                                </div>
                                <div class="edit-input">
                                    <div id="ember412" class="shopee-textbox ember-view">
                                        <div class="shopee-validation-toast  "></div>
                                        <select id="slThuongHieu" class="custom-select ember-text-field ember-view" runat="server"></select>
                                        <span id="Span5" runat="server" class="validationMessage" style="display: none"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-8 right">
                    <div class="seller-profile">
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                Loại SP cấp 1 (*): 
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <%--<select id="slLoaiSanPham" class="custom-select ember-text-field ember-view" runat="server"></select>
                                    <span id="Span4" runat="server" class="validationMessage" style="display: none"></span>--%>
                                    <asp:DropDownList ID="ddlLoaiSPCap1" class="custom-select ember-text-field ember-view" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSPCap1_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                Loại SP cấp 2 (*): 
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <asp:DropDownList ID="ddlLoaiSPCap2" class="custom-select ember-text-field ember-view" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSPCap2_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                Loại SP cấp 3 (*) : 
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <select id="slLoaiSPCap3" class="custom-select ember-text-field ember-view" runat="server"></select>
                                    <span id="Span4" runat="server" class="validationMessage" style="display: none"></span>
                                </div>
                            </div>
                        </div>

                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                Phương thức thanh toán (*) : 
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <select id="slLoaiDatHang" class="custom-select ember-text-field ember-view" runat="server"></select>
                                    <span id="Span6" runat="server" class="validationMessage" style="display: none"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product">
                <div class="edit-row">
                    <div class="edit-label">
                        <svg viewBox="0 0 32 32">
                            <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>
                        Mô tả:  
                    </div>
                    <div class="edit-input">
                        <div id="ember412" class="shopee-textbox ember-view" style="height: auto !important;">
                            <div class="shopee-validation-toast  "></div>
                            <div class="input" style="height: auto !important;">
                                <%--<textarea id="txtMoTa" class="ckeditor ember-text-field ember-view" runat="server"></textarea>--%>
                                <textarea id="txtMoTa" class="ckeditor" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-12 row">
                <div class="col-md-2">
                    <b>Chọn ảnh: </b>
                </div>
                <div class="col-md-8">
                    <label class="img-pr-left custom-upload">
                        <asp:FileUpload ID="fileHinhAnh" ClientIDMode="Static" onchange="this.form.submit()" runat="server" AllowMultiple="true" />
                        <input type="hidden" id="hdHinhAnh" runat="server" />
                        <%--<input type="file" id="FileUploadHinhHangHoa" runat="server" multiple="multiple" />--%>
                        <%--<span class="kv2Btn ng-binding">Chọn ảnh</span>--%>
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
            <div class="form-group col-md-12 row">
                <div class="col-md-2">
                    <b>Màu: </b>
                </div>
                <div class="col-md-10" id="dvColor" runat="server"></div>
            </div>
            <div class="form-group col-md-12 row">
                <div class="col-md-2">
                    <b>Size: </b>
                </div>
                <div class="col-md-10 right" id="dvSize" runat="server"></div>
            </div>
            <div class="row">
                <div class="alert alert-danger" id="msgError" runat="server">

                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="btLuu" runat="server" Text="LƯU" class="btn btn-primary btn-flat" OnClick="btLuu_Click" />
                <asp:Button ID="btHuy" runat="server" Text="HỦY" class="btn btn-primary btn-flat" OnClick="btHuy_Click" />
            </div>
        </div>
    </div>
    <%--<link href="../Content/gianhang/css/AddProduct.css" rel="stylesheet" />--%>
</asp:Content>

