<%@ Page Title="" Language="C#" MasterPageFile="~/RaoVat/Layout/RaoVat.master" AutoEventWireup="true" CodeFile="RaoVat.aspx.cs" Inherits="RaoVat_View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <%--<link href="../RaoVat/Content/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="../RaoVat/Content/css/bootstrap/bootstrap.min.js"></script>--%>
   

    <input type="hidden" value="" runat="server" id="pageNum" />
    <%--<link href="../RaoVat/Content/css/bootstrap.css" rel="stylesheet" />--%>
    <%--<link href="../RaoVat/Content/css/bootstrap.css" rel="stylesheet" />--%>
    <div class="container bgGrid">
        <div class="col-sm-3">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse" id="sideMenu" runat="server">
                    <ul class="nav in" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html" class="active">Morris.js Charts</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
        </div>
       <div class="col-sm-6" id="adsListHome">
           <ul class="">
               <li class="">

               </li>
           </ul>
           <%--<div id="card-items-header" class="card-header panel-body pnTinDang">
               Tất cả tin đăng
           </div>--%>
           <div class="resultFilter">
               <div class="form-group col-sm-4">
                    <select class="form-control filterbutton" runat="server" id="slLinhVuc">
                        <option value="0">Tất cả lĩnh vực</option>
                    </select>
                </div>
               <div class="form-group col-sm-4">
                   <select class="form-control filterbutton" runat="server" id="slTinhThanh">
                       <option value="0">Toàn Quốc</option>
                   </select>
               </div>
               <div class="form-group col-sm-4">
                   <select class="form-control filterbutton" runat="server" id="slGia">
                       <option value="0">Giá tăng</option>
                       <option value="1">Giá giảm</option>
                   </select>
               </div>
           </div>
           <div class="list-items" id="dsTinDang" runat="server">
           </div>
           <div style="text-align: center" id="divMain" runat="server">
               <a href="<%=GetRouteUrl("timkiem", new {}) %>" class="btn btn-primary">Xem thêm</a>
           </div>
           <div style="margin-bottom: 30px;"></div>
       </div>
        <div class="col-sm-3 vipAds" id="adsListHome2">
            <div id="card-items-header2" class="card-header panel-body pnTinDang">
                Tin đăng VIP
            </div>
            <nav id="idTinDangMoi" runat="server">
            </nav>
            <div class="list-items" id="dsTinDangMoi" runat="server">
            </div>
            <div style="text-align: center">
                <a href="<%=GetRouteUrl("timkiem", new {}) %>" class="btn btn-primary" style="margin-bottom: 10px;">Xem thêm</a>
            </div>
        </div>
    </div>
    <div class="container paddingcontent wrapper" id="frmSearch" style="display: none;">
        <div class="wrapper">
            <div class="panel panel-body title-search">Tìm kiếm danh sách tin rao vặt</div>
            <div class="">
                
                <div class="form-group col-sm-3">
                    <select class="form-control" runat="server" id="slDanhMuc">
                        <option value="0">Tất cả danh mục</option>
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
    
    <div class="container bgGrid">
        <div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
    </div>
    <div class="container bgGrid" style="display:none">
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

                searchParams.append("field", idLinhVuc);
                searchParams.append("cat", idDanhMuc);
                searchParams.append("city", idTinhThanh);
                searchParams.append("dis", idQuanHuyen);
                searchParams.append("page", page);
                searchParams.append("q", search);

                var url = location.origin + "/raovat/timkiem" + '?' + searchParams.toString();
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