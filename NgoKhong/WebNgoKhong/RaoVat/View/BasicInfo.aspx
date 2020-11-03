<%@ Page Title="" Language="C#" MasterPageFile="~/RaoVat/Layout/RaoVat.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="BasicInfo.aspx.cs" Inherits="RaoVat_View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <%--<link href="../RaoVat/Content/css/bootstrap.css" rel="stylesheet" />--%>
    <script src="../RaoVat/Content/js/bootstrap-formhelpers-phone.format.js"></script>
    <script src="../RaoVat/Content/js/bootstrap-formhelpers-phone.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.4.5/ckeditor.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2/js/epiceditor.min.js"></script>
    <style>
        .pnTinDang {
            color: #373737;
            overflow: hidden;
            font-weight: 700;
            font-size: 18px;
            border: 1px solid #e4e4e4;
            border-left: 5px solid #f7941d;
            padding: 0 10px;
            line-height: 29px;
            margin-bottom: 10px;
            padding-right: 0;
            position: relative;
            /* margin: 0px 30px; */
            background-color: #e2e1e1;
            padding: 5px;
            margin-top: 10px;
        }

        .item-menu:hover {
            padding: 10px;
            background-color: #ff9800;
            color: white !important;
        }

        .item-menu.active {
            background-color: #ff9800;
            color: white !important;
        }

        .item-menu {
            padding: 10px;
        }

        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        .alert {
            position: relative;
            padding: .75rem 1.25rem;
            margin-bottom: 1rem;
            border: 1px solid transparent;
            border-radius: .25rem;
        }

        .col-form-label {
            font-size: 18px;
            line-height: 32px;
            text-align: right;
        }

        a:hover {
            color: black !important;
        }

        .list-items {
            color: #404040;
        }

        .price {
            color: #c90927;
            font-weight: 700;
        }

        .card-title {
            font-size: initial;
        }

        .card-body > * {
            text-align: left;
        }

        .card-body {
            padding: 1.25rem 0;
        }

        .btn-search {
            width: 100%;
            font-size: 14px;
        }

        .card-img {
            width: 130px;
            height: 100px;
            margin: 10px 0;
        }

        .router-list {
            margin: 0;
            background-color: transparent;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0;
        }

            .router-list > li {
                display: inline-block;
                font-size: 11px;
                display: inline;
                color: #33659c;
            }

            .router-list .item {
                color: #33659c;
                content: "\BB ";
                padding: 0 5px;
            }

        #frmSearch {
            padding: 20px 30px;
            background-color: white;
            margin-top: 20px;
        }

        .item-menu:hover {
            padding: 10px;
            background-color: #ff9800;
            color: white !important;
        }

        .item-menu.active {
            background-color: #ff9800;
            color: white !important;
        }

        .item-menu {
            padding: 10px;
        }

        #maincontent {
            width: 70%;
        }

        #maincontent_headerTitle {
            padding: 10px;
        }

        header {
            padding: 10px;
        }

        #btnSearch {
            padding: 6px 70px;
            width: 100%;
        }

        .breadcrumb {
            padding: 0;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            content: "\BB ";
        }

        #frmSearch {
            width: 80%;
        }

        .list-items:hover {
            color: black;
            font-weight: 800;
        }

        a:hover, .card-body:hover, .card-title:hover {
            color: black;
            font-weight: 800;
        }

        .header-title {
            font-weight: 800;
        }

        .title-search {
            padding: 14px 10px;
            font-size: 20px;
            margin: 10px;
            text-align: center;
            background-color: #ff9800;
            font-weight: 700;
            color: white;
            text-transform: uppercase;
        }
    </style>
    <%--<div style="text-align:center;">
            <ol class="breadcrumb" style="font-size: 19px; margin-top: 20px; content: ''">
                <li><a  class="item-menu" href="<%=GetRouteUrl("raovat", new {}) %>"> Tin rao vặt</a></li>
                <li><a  class="item-menu active">Đăng tin</a></li>
            </ol>
        </div>--%>
    <div class="container bgGrid" id="maincontent">
        <div class="header-title panel panel-body title-search" >
            <div>ĐĂNG TIN MIỄN PHÍ</div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="card-items-header3" class="card-header panel-body pnTinDang ">
                    Thông tin cơ bản
                </div>
                <nav id="Nav2" runat="server">
                </nav>
                <div class="list-items" id="Div2" runat="server">
                </div>
            </div>
        </div>
        <div class="form-group row">
            <label for="slLinhVuc" class="col-sm-2 col-form-label">Lĩnh vực <span style="color: red;">(*)</span></label>
            <div class="col-sm-10">
                <select class="form-control" runat="server" id="slLinhVuc">
                    <option value="0">Tất cả lĩnh vực</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="slDanhMuc" class="col-sm-2 col-form-label">Danh mục <span style="color: red;">(*)</span></label>
            <div class="col-sm-10">
                <select class="form-control" runat="server" id="slDanhMuc">
                    <option value="0">Tất cả danh mục</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="slTinhThanh" class="col-sm-2 col-form-label">Tỉnh thành <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <select class="form-control" runat="server" id="slTinhThanh">
                    <option value="0">Toàn Quốc</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="slQuanHuyen" class="col-sm-2 col-form-label">Quận huyện <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <select class="form-control" runat="server" id="slQuanHuyen">
                    <option value="0">Tất cả quận huyện</option>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtGia" class="col-sm-2 col-form-label">Giá <span style="color: red;">(*)</span></label>
            <div class="col-sm-10">
                <input class="form-control" runat="server" id="txtGia" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="card-items-header3" class="card-header panel-body pnTinDang">
                    Thông tin liên hệ
                </div>
                <nav id="Nav3" runat="server">
                </nav>
                <div class="list-items" id="Div3" runat="server">
                </div>
            </div>
        </div>

        <div class="form-group row">
            <label for="txtHoTen" class="col-sm-2 col-form-label">Họ và tên <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <input class="form-control" runat="server" type="text" id="txtHoTen" />
            </div>
        </div>

        <div class="form-group row">
            <label for="txtSoDienThoai" class="col-sm-2 col-form-label">Số điện thoại <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <input class="form-control input-medium bfh-phone" data-format="+84 ddd-ddd-dddd" runat="server" type="text" id="txtSoDienThoai" />
            </div>
        </div>
        <div class="form-group row">
            <label for="txtEmail" class="col-sm-2 col-form-label">Email <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <input class="form-control" runat="server" id="txtEmail" type="email" />
            </div>
        </div>
        <div class="form-group row">
            <label for="txtDiaChi" class="col-sm-2 col-form-label">Địa chỉ <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <input class="form-control" runat="server" type="text" id="txtDiaChi" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div id="card-items-header3" class="card-header panel-body pnTinDang">
                    Nội dung tin đăng
                </div>
                <nav id="Nav1" runat="server">
                </nav>
                <div class="list-items" id="Div1" runat="server">
                </div>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtTieuDe" class="col-sm-2 col-form-label">Tiêu đề <span style="color: red;">(*)</span></label>
            <div class="col-sm-10">
                <input class="form-control" runat="server" id="txtTieuDe" />
            </div>
        </div>
        <div class="form-group row">
            <label for="fileUpload" class="col-sm-2 col-form-label">Hình ảnh <span style="color: red;">(*)</span></label>
            <div class="col-sm-10">
                <asp:FileUpload ID="fileHinhAnh" ClientIDMode="Static" CssClass="form-control" onchange="this.form.submit()" runat="server" AllowMultiple="true" />
                <input type="hidden" id="hdHinhAnh" runat="server" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2"></label>
            <div class="col-sm-10">
                <div id="listImgHangHoa" runat="server" style="border-style: groove; min-height: 100px"></div>
            </div>
        </div>
        <div class="form-group row">
            <label for="arMoTa" class="col-sm-2 col-form-label">Mô tả <span style="color: red;"></span></label>
            <div class="col-sm-10">
                <textarea id="arMoTa" class="ckeditor" runat="server"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="alert alert-danger" role="alert" id="msgDanger" runat="server" style="text-align: center;">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm" style="text-align: center;">
                <asp:Button ID="btnLuu" Text="Đăng tin" runat="server" CssClass="btn btn-success btn-lg" Style="margin: 0 auto;" OnClick="btnLuu_Click" />
            </div>
        </div>
        <div class="" style="margin-bottom: 100px;"></div>
    </div>

    </form>
    <script>
        $(document).ready(function () {
            $('#maincontent_slLinhVuc').change(function () {
                var linhVuc = $(this).val();
                $.ajax({
                    url: '../Ajax.aspx',
                    type: "GET",
                    data: { Action: 'LinhVuc', id: linhVuc },
                    dataType: 'html',
                    success: function (s) {
                        $('#maincontent_slDanhMuc').html(s);
                    }
                });
            });

            $('#maincontent_slTinhThanh').change(function () {
                var qh = $(this).val();
                $.ajax({
                    url: '../Ajax.aspx',
                    type: "GET",
                    data: { Action: 'TinhThanh', id: qh },
                    dataType: 'html',
                    success: function (s) {
                        $('#maincontent_slQuanHuyen').html(s);
                    }
                });
            });
        });
    </script>
    <script src="../RaoVat/Content/js/bootstrap.js"></script>
</asp:Content>
