<%@ Page Title="" Language="C#" MasterPageFile="~/RaoVat/Layout/RaoVat.master" AutoEventWireup="true" CodeFile="ChiTiet.aspx.cs" Inherits="RaoVat_View_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <script src="../Content/UI/js/jquery-2.2.4.min.js"></script>
    <%--<link href="/Content/UI/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="/Content/UI/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link href="/Content/UI/js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="/Content/UI/js/jquery-ui/jquery-ui.min.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/lib.css" rel="stylesheet">
    <link href="/Content/UI/js/minicolors/miniColors.css" rel="stylesheet">

    <!-- Theme CSS
    ============================================ -->
    <link href="/Content/UI/css/lazada.css" rel="stylesheet" />
    <link href="/Content/UI/css/themecss/so_searchpro.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/so_megamenu.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/so-categories.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/so-listing-tabs.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/so-category-slider.css" rel="stylesheet">
    <link href="/Content/UI/css/themecss/so-newletter-popup.css" rel="stylesheet">

    <link href="/Content/UI/css/footer/footer1.css" rel="stylesheet">


    <link href="/Content/UI/css/Style.css" rel="stylesheet" />

    <link href="/Content/UI/css/cssShopee.css" rel="stylesheet" />
    <link href="../Content/UI/css/cssSendo.css" rel="stylesheet" />


    <link href="../Content/UI/css/header/header1.css" rel="stylesheet" />
    <link href="/Content/UI/css/responsive.css" rel="stylesheet">
    <link href="../HeaderStyle.css" rel="stylesheet">



    <link href="../RaoVat/Content/css/theme.css" rel="stylesheet" />
    <link href="../RaoVat/Content/css/home3.css" rel="stylesheet" />
    <link href="../RaoVat/Content/owl-carousel/owl.carousel.css" rel="stylesheet" />

    <%--<div>
            <ol class="breadcrumb" style="font-size: 19px; margin-top: 20px; content: ''">
                <li><a class="item-menu" href="<%=GetRouteUrl("raovat", new {}) %>">Tin rao vặt</a></li>
                <li><a class="item-menu" href="<%=GetRouteUrl("dangtin", new {}) %>">Đăng tin</a></li>
                <li><a class="item-menu active">Chi tiết tin đăng</a></li>
            </ol>
        </div>--%>
    <div class="container paddingcontent wrapper" id="frmSearch" style="display: none;">
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
        <%--<hr class="hidden-sm hidden-xs">--%>
    </div>
    <div class="container bgGrid product-view">
        
        <div class="row">
            <div class="col-sm-9">
                <div>
                    <h1 id="headerTitle" runat="server"></h1>
                </div>
                <div class="col-sm-8 left-content-product" id="imgRaoVat" runat="server">
                    <div class="content-product-left class-honizol" id="dvHinhAnh" runat="server">
                    </div>
                </div>
                <div class="col-sm-4 left-content-product">
                    <div class="main-content" style="margin-left: 15px;">
                        <div class="">
                            <h3 class="my-3">Thông tin rao hàng</h3>

                        </div>
                        <p>Giá : <span id="price" runat="server" class="text-danger"></span></p>
                        <p>Ngày đăng : <span id="date" runat="server">03/12/2018</span></p>
                        <p>Ngày hết hạn : <span id="dateOuts" runat="server">03/12/2018</span></p>
                        <h3 class="my-3">Thông tin liên hệ</h3>
                        <p>Họ tên: <span id="name" runat="server" class="text-info">Hoang Minh Thanh</span></p>
                        <p>Số điện thoại : <a href="tel:0989999999" id="phone" runat="server" class="text-primary">0913472506</a></p>
                        <p>Email : <a href="mailto:sieusaochemgio@gmail.com" id="email" runat="server">sieusaochemgio@gmail.com</a></p>
                        <p>Địa chỉ : <span id="adrs" runat="server">227, Nguyễn Văn Cừ</span></p>
                    </div>
                </div>
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
        <div class=" bgGrid">
            <div id="productTab" class="producttab ">
                <ul class="navTabs_zWyr nav nav-tabs">
                    <li class="nav-item active"><a data-toggle="tab" href="#tab-thongtin" class="nav-link">THÔNG TIN</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-thongtin" class="tab-pane active">
                        <div class="productDescription_3263">
                            <div class="editor_m9Ff">
                                <div style="font-family: SFUIText, arial;" id="dvMoTa" runat="server">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div id="tab-danhgia" class="tab-pane">
                        <div class="ratingEmpty_3k2P">
                            <div class="content-empty small">
                                <%--<div class="ratingImage_1UfE" id="imgRaoVat" runat="server">
                                    
                                </div>--%>
                                <strong class="title small">Sản phẩm chưa có đánh giá.</strong>
                            </div>
                        </div>
                    </div>
                    <div id="tab-binhluan" class="tab-pane">
                        <div class="sectionProductComment_1MIy">
                            <div>
                                <div class="commentEmpty_kkJA">
                                    <div class="content-empty small">
                                        <div class="ratingImage_E9zN">
                                            <img class="img" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMzU2IiBoZWlnaHQ9IjM1NiIgdmlld0JveD0iMCAwIDM1NiAzNTYiPgogICAgPGRlZnM+CiAgICAgICAgPHBhdGggaWQ9ImEiIGQ9Ik0wIDBoMzU2djM1NkgweiIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8bWFzayBpZD0iYiIgZmlsbD0iI2ZmZiI+CiAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI2EiLz4KICAgICAgICA8L21hc2s+CiAgICAgICAgPHVzZSBmaWxsPSIjRkZGIiBmaWxsLW9wYWNpdHk9IjAiIHhsaW5rOmhyZWY9IiNhIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjI0NiIgaGVpZ2h0PSIzOCIgeD0iNzUiIHk9IjcxIiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTI2LjIzIDE5OCA5MCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMjQ2IiBoZWlnaHQ9IjM4IiB4PSIzNCIgeT0iMTM0IiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTI2LjIzIDE1NyAxNTMpIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjI0NiIgaGVpZ2h0PSIzOCIgeD0iOTEiIHk9IjE0NyIgZmlsbD0iI0VFRjhGRiIgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIiByeD0iMTkiIHRyYW5zZm9ybT0icm90YXRlKC0zMy41OSAyMTQgMTY2KSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIyMTIiIGhlaWdodD0iMzgiIHg9IjgzIiB5PSIyMDUiIGZpbGw9IiNFRUY4RkYiIGZpbGwtcnVsZT0ibm9uemVybyIgbWFzaz0idXJsKCNiKSIgcng9IjE5IiB0cmFuc2Zvcm09InJvdGF0ZSgtMzMuNTkgMTg5IDIyNCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMTc2IiBoZWlnaHQ9IjM4IiB4PSI5MSIgeT0iMjUzIiBmaWxsPSIjRUVGOEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iIG1hc2s9InVybCgjYikiIHJ4PSIxOSIgdHJhbnNmb3JtPSJyb3RhdGUoLTMzLjU5IDE3OSAyNzIpIi8+CiAgICAgICAgPGcgZmlsbC1ydWxlPSJub256ZXJvIiBtYXNrPSJ1cmwoI2IpIj4KICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNzYgMTI3KSI+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjRjQ3Rjg1IiBkPSJNMTc5LjY5IDBINzAuNTk5QzU5LjQxNS4wNCA0OS42ODkgNy42NjYgNDcgMTguNTA0aDk5Ljg3YzEzLjQxLjA0IDI0LjI3MSAxMC44ODMgMjQuMzEgMjQuMjcydjUwLjQ1N2EyNC4wNiAyNC4wNiAwIDAgMS0uNzA1IDUuNzY3aDkuMjE1YzEzLjQxLS4wMzkgMjQuMjcxLTEwLjg4MyAyNC4zMS0yNC4yNzJWMjQuMjcyQzIwMy45NjEgMTAuODgyIDE5My4xLjAzOSAxNzkuNjkgMHoiLz4KICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNFNTZDNzciIGQ9Ik0xNzEgNDIuNDI0QzE3MC45NjEgMjguOTUgMTYwLjA5IDE4LjAzOSAxNDYuNjY4IDE4SDQ2LjcwNUEyNC4zMzQgMjQuMzM0IDAgMCAwIDQ2IDIzLjgwM3Y1MC43NzNDNDYuMDM5IDg4LjA1IDU2LjkxIDk4Ljk2MSA3MC4zMzIgOTloOTkuOTYzYy40NjctMS44OTkuNzA0LTMuODQ3LjcwNS01LjgwM1Y0Mi40MjR6Ii8+CiAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjN0VENEZCIiBkPSJNMTMyLjggMTI2LjE2M0g5My40MDFsLTMzLjU2MyAzMS40MDVhOS4wODcgOS4wODcgMCAwIDEtOC4yMDMgMi4yMDUgOS4xMjggOS4xMjggMCAwIDEtNi40NTMtNS41NDRsLTEwLjg3LTI4LjAzOEgyNC4yMDFDMTAuODUgMTI2LjE1Mi4wMzkgMTE1LjI5IDAgMTAxLjg3OVY1MS4zMTJDLjAzOSAzNy45IDEwLjg1MSAyNy4wMzkgMjQuMiAyN2gxMDguNmMxMy4zNDkuMDM5IDI0LjE2MSAxMC45IDI0LjIgMjQuMzEydjUwLjUzOWMtLjAzOSAxMy40MS0xMC44NTEgMjQuMjczLTI0LjIgMjQuMzEyeiIvPgogICAgICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjEwOCIgaGVpZ2h0PSIxMyIgeD0iMjUiIHk9IjUyIiBmaWxsPSIjRkZGIiByeD0iNi41Ii8+CiAgICAgICAgICAgICAgICA8cmVjdCB3aWR0aD0iMTA4IiBoZWlnaHQ9IjEzIiB4PSIyNSIgeT0iNzAiIGZpbGw9IiNGRkYiIHJ4PSI2LjUiLz4KICAgICAgICAgICAgICAgIDxyZWN0IHdpZHRoPSI2OCIgaGVpZ2h0PSIxMyIgeD0iMjUiIHk9Ijg5IiBmaWxsPSIjRkZGIiByeD0iNi41Ii8+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" alt="Sản phẩm hiện chưa có hỏi đáp">
                                        </div>
                                        <strong class="title small">Sản phẩm hiện chưa có hỏi đáp.</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="commentInputWrapper_1fw5">
                                <div class="commentInput_Tzz6">
                                    <div class="inner_2DTV">
                                        <input class="input_SASb" type="text" aria-label="Question for this product" placeholder="Bạn có câu hỏi cho sản phẩm này? Đặt câu hỏi cho Shop." value="">
                                        <button class="btnSend_1s13" aria-label="Send">
                                            <span>Gửi</span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M4,42,46,24,4,6,4,20l30,4L4,28Z"></path>
                                                <path d="M0,0H48V48H0Z" fill="none"></path>
                                            </g>
                                            </g></svg></button>
                                    </div>
                                    <p class="message_17z1"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container paddingcontent">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-header panel-body pnTinDang" id="relateAds" runat="server">
                                Tin đăng tương tự
                            </div>
                            <nav id="idPaging" runat="server">
                            </nav>
                            <div class="list-items" id="dsTinDang" runat="server">
                            </div>
                        </div>
                        <div style="text-align: center">
                            <asp:LinkButton runat="server" OnClick="Unnamed_Click" CssClass="btn btn-primary" Style="margin-bottom: 10px;">Xem thêm</asp:LinkButton>
                        </div>
                    </div>
                </div>

                <%--<div class="container paddingcontent">
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
                </div>--%>
                <div style="margin-bottom: 30px;"></div>
            </div>
        </div>
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
                if (idLinhVuc) {
                    searchParams.append("field", idLinhVuc);
                }
                if (idDanhMuc) {
                    searchParams.append("cat", idDanhMuc);
                }
                if (idTinhThanh) {
                    searchParams.append("city", idTinhThanh);
                }
                if (idQuanHuyen) {
                    searchParams.append("dis", idQuanHuyen);
                }
                if (page) {
                    searchParams.append("page", page);
                }

                searchParams.append("q", search);
                var url = location.origin + '/raovat/timkiem' + '?' + searchParams.toString();
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

    <script type="text/javascript" src="/Content/UI/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="/Content/UI/js/slick-slider/slick.js"></script>
    <script type="text/javascript" src="/Content/UI/js/themejs/libs.js"></script>
    <script type="text/javascript" src="/Content/UI/js/unveil/jquery.unveil.js"></script>
    <script type="text/javascript" src="/Content/UI/js/countdown/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/dcjqaccordion/jquery.dcjqaccordion.2.8.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/datetimepicker/moment.js"></script>
    <script type="text/javascript" src="/Content/UI/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/modernizr/modernizr-2.6.2.min.js"></script>
    <script type="text/javascript" src="/Content/UI/js/minicolors/jquery.miniColors.min.js"></script>

    <!-- Theme files
============================================ -->

    <script type="text/javascript" src="/Content/UI/js/themejs/application.js"></script>
    <script type="text/javascript" src="/Content/UI/js/themejs/homepage.js"></script>
    <script type="text/javascript" src="/Content/UI/js/themejs/toppanel.js"></script>
    <script type="text/javascript" src="/Content/UI/js/themejs/so_megamenu.js"></script>
    <script type="text/javascript" src="/Content/UI/js/themejs/addtocart.js"></script>


    <%--<script type="text/javascript" src="/Content/UI/js/jquery-ui/jquery-ui.min.js"></script>
    <script src="../RaoVat/Content/js/homepage.js"></script>
    <script src="../RaoVat/Content/owl-carousel/owl.carousel.js"></script>--%>
</asp:Content>
