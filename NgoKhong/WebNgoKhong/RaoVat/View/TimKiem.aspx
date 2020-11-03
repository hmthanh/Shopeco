<%@ Page Title="" Language="C#" MasterPageFile="~/RaoVat/Layout/RaoVat.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="RaoVat_View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <input type="hidden" value="" runat="server" id="pageNum" />
    
    <div class="container bgGrid">
        <div class="container wrapper" id="frmSearch" style="display:none;">
            <div class="wrapper">
                <div class="panel panel-body title-search">Tìm kiếm danh sách tin rao vặt</div>
                <div class="">
                    <div class="form-group col-sm-3">
                        <select class="form-control" runat="server" id="slLinhVuc">
                            <option value="0">Tất cả lĩnh vực</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-3">
                        <select class="form-control" runat="server" id="slDanhMuc">
                            <option value="0">Tất cả danh mục</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-3">
                        <select class="form-control" runat="server" id="slTinhThanh">
                            <option value="0">Toàn Quốc</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-3">
                        <select class="form-control" runat="server" id="slQuanHuyen">
                            <option value="0">Tất cả quận huyện</option>
                        </select>
                    </div>
                </div>
                <div class=" ">
                    <div class="form-group col-sm-9">
                        <input value="" class="form-control" runat="server" placeholder="Tìm tin đăng .." name="q" id="txtSearch" />
                    </div>
                    <div class="form-group col-sm-3">
                        <button id="btnSearch" type="button" class="btn-search btn btn-primary ">Tìm</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse" id="sideMenu" runat="server">
                    <ul class="nav in" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
        </div>

        

        <div class="col-sm-6" id="adsListHome">
           <div class="button-menu">
                <div class="btn btn-success">Mới nhất</div>
                <div class="btn btn-success">Hình thức</div>
               <div class="btn btn-success">Toàn quốc</div>
           </div>
           <%--<div id="card-items-header" class="card-header panel-body pnTinDang">
               Tất cả tin đăng
           </div>--%>
           <div class="list-items" id="dsTinDang" runat="server">
           </div>
           <%--<div style="text-align: center">
               <a href="<%=GetRouteUrl("timkiem", new {}) %>" class="btn btn-primary">Xem thêm</a>
           </div>--%>
            <div id="idPaging" runat="server" style="text-align:center;"></div>
            <div class="alert alert-success" id="msgMessage" runat="server">

            </div>
           <div style="margin-bottom: 30px;"></div>
       </div>
        <div style="clear:both;margin-bottom: 30px;"></div>

       <%-- <div class="container bgGrid">
            <div class="row">
                <div class="col-sm-12">
                    <div id="card-items-header3" class="card-header panel-body pnTinDang">
                        Danh sách các danh mục
                    </div>
                    <nav id="Nav1" runat="server">
                    </nav>
                    <div class="list-items" id="Div1" runat="server">
                    </div>
                </div>
            </div>
            <div class="container" id="dsDanhMuc" runat="server">
            </div>
            <div style="margin-bottom: 30px;"></div>
        </div>--%>
    </div>
    <script>
        $(document).ready(function () {
            $('#btnSearch').click(function () {
                var idDanhMuc = $('#maincontent_slDanhMuc').val();

                var idLinhVuc = $('#maincontent_slLinhVuc').val();
                var idTinhThanh = $('#maincontent_slTinhThanh').val();
                var idQuanHuyen = $('#maincontent_slQuanHuyen').val();
                var search = $('#maincontent_txtSearch').val();
                var page = $('#maincontent_pageNum').val();

                var searchParams = new URLSearchParams("");
                if (idLinhVuc || idDanhMuc == '0') {
                    searchParams.append("field", idLinhVuc);
                }
                if (idDanhMuc || idDanhMuc == '0') {
                    searchParams.append("cat", idDanhMuc);
                }
                if (idTinhThanh || idDanhMuc == '0') {
                    searchParams.append("city", idTinhThanh);
                }
                if (idQuanHuyen || idDanhMuc == '0') {
                    searchParams.append("dis", idQuanHuyen);
                }
                if (page) {
                    searchParams.append("page", page);
                }

                var url = location.origin + location.pathname + '?' + searchParams.toString();
                window.location.href = url;
            });
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
</asp:Content>
