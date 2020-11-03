<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Content/UI/css/index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-container container">
        <div id="content">
            <div class="content-top-w">

                <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12 main-left">
                    <div class="module col1 hidden-sm hidden-xs"></div>
                </div>
                <div class="col-lg-10 col-md-12 col-sm-12 col-xs-12 main-right" style="margin-top: 10px;">
                    <div class="slider-container row">
                        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 col2">
                            <div class="module sohomepage-slider ">
                                <div class="yt-content-slider" id="dvBanner" runat="server" data-rtl="yes" data-autoplay="yes" data-autoheight="no" data-delay="2" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-pagination="yes" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">

                                    <div class="yt-content-slide">
                                        <a href="#">
                                            <img src="/Content/UI/image/catalog/slideshow/home1/slider-2.jpg" alt="slider2" class="img-responsive"></a>
                                    </div>
                                    <div class="yt-content-slide">
                                        <a href="#">
                                            <img src="/Content/UI/image/catalog/slideshow/home1/slider-3.jpg" alt="slider3" class="img-responsive"></a>
                                    </div>
                                </div>
                                <div class="loadeding"></div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 col3">
                            <div class="module product-simple extra-layout1">
                                <h3 class="modtitle">
                                    <span>Giảm giá</span>
                                </h3>
                                <div class="modcontent">
                                    <div id="so_extra_slider" class="so-extraslider">
                                        <!-- Begin extraslider-inner -->
                                        <div class="yt-content-slider extraslider-inner" id="ListHomeProduct" runat="server" data-rtl="yes" data-pagination="yes" data-autoplay="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-lazyload="yes" data-loop="no" data-buttonpage="top">
                                        </div>
                                        <!--End extraslider-inner -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row content-main-w">
                <div class="col-lg-2 col-md-3 col-sm-4 col-xs-12 main-left">
                    <%--<div class="module">
                    <div class="banners banners2">
                        <div class="banner">
                            <a href="#"><img src="/Content/UI/image/catalog/banners/banner1.jpg" alt="image"></a>
                        </div>
                    </div>
                </div>--%>

                    <div class="module product-simple extra-layout1" style="display: none">
                        <%-------------------------------------------------------------------------------------------------------------%>


                        <%-------------------------------------------------------------------------------------------------------------%>
                        <h3 class="modtitle">
                            <span>Sản phẩm HOT</span>
                        </h3>
                        <div class="modcontent">
                            <div id="so_extra_slider_1" class="so-extraslider">
                                <!-- Begin extraslider-inner -->
                                <div class="yt-content-slider extraslider-inner" id="dvSanPhamHot" runat="server" data-rtl="yes" data-pagination="yes" data-autoplay="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-lazyload="yes" data-loop="no" data-buttonpage="top">
                                </div>
                                <!--End extraslider-inner -->
                            </div>
                        </div>
                    </div>
                    <%-----------------------------------------------------------%>

                    <div class="panel_r resize_hidden hidden">
                        <div class="contac_qc">
                            <div class="panel_title_r active"><a href="/home/estore_package.php" target="_blank" rel="nofollow">CLICK ĐỂ MỞ GIAN HÀNG</a></div>
                            <div id="home_v5_mogianhang_190x110">
                                <div onmouseover="" onmouseout="" class="first " style="background: none; position: relative; font-size: 0; text-align: center; overflow: hidden;" id="myadBan_19192">
                                    <a title="" style="" target="_blank" href="http://ad.vatgia.com/a/b_click.php?data=eyJiYW5faWQiOiIxOTE5MiIsInBvc19pZCI6IjI0NSIsIndlYl9pZCI6MywiYmFuX2xpbmsiOiJodHRwczpcL1wvd3d3LnZhdGdpYS5jb21cL2Rhbmcta3ktbW8tZ2lhbi1oYW5nLmh0bWwiLCJjYXRfaWQiOjB9">
                                        <img style="width: 100%;" src="https://mediamyad.vatgia.vn/photo/users_b_upload/2018/10/yfx1538451397.jpg"></a>
                                </div>
                            </div>
                            <script>var myad_banner = myad_banner || []; myad_banner.push({ 'divIdShow': 'home_v5_mogianhang_190x110', 'id_postion': 245, 'maxBan': 1 });</script>
                        </div>
                        <div class="box_top_up_fast">
                            <div class="btuf_main">
                                <div class="btuf_tab">
                                    <ul>
                                        <li iddata="topup" class="active" onclick="changeTypeCard($(this), $('.btuf_charge'))"><a href="javascript:;" rel="nofollow"><i class="fa fa-mobile"></i>Nạp tiền</a></li>
                                        <li iddata="mobile_card" onclick="changeTypeCard($(this), $('.btuf_card'))"><a href="javascript:;" rel="nofollow"><i class="fa fa-mobile"></i>Thẻ cào</a></li>
                                    </ul>
                                </div>
                                <div class="btuf_content">
                                    <div class="btuf_charge btuf_content_show">
                                        <input type="text" name="btuf_phone" placeholder="Số điện thoại" value="" class="btuf_phone form_control"><select name="btuf_money" class="btuf_money form_control" onchange="changeMoney($(this));"><option value="0" disabled="" selected="" hidden="">Số tiền</option>
                                            <option value="10000">10.000đ</option>
                                            <option value="20000">20.000đ</option>
                                            <option value="50000">50.000đ</option>
                                            <option value="100000">100.000đ</option>
                                            <option value="200000">200.000đ</option>
                                            <option value="500000">500.000đ</option>
                                        </select><input type="text" name="btuf_email" placeholder="Email" value="" class="btuf_email form_control"><select name="pmt_method_payment" class="pmt_method_payment form_control"><option selected="" value="1">Thanh toán qua thẻ ATM</option>
                                            <option value="9">Thanh toán qua Bảo Kim</option>
                                        </select>
                                    </div>
                                    <div class="btuf_card btuf_content_show" style="display: none">
                                        <select name="btuf_type_card" class="btuf_type_card form_control">
                                            <option value="0" disabled="" selected="" hidden="">Loại thẻ</option>
                                            <option value="VTT">Viettel</option>
                                            <option value="VNP">Vinaphone</option>
                                            <option value="VMS">Mobiphone</option>
                                        </select><select name="btuf_denominated" class="btuf_denominated form_control" onchange="changeMoney($(this));"><option value="0" disabled="" selected="" hidden="">Mệnh giá thẻ</option>
                                            <option value="10000">10.000đ</option>
                                            <option value="20000">20.000đ</option>
                                            <option value="50000">50.000đ</option>
                                            <option value="100000">100.000đ</option>
                                            <option value="200000">200.000đ</option>
                                            <option value="500000">500.000đ</option>
                                        </select><input type="text" name="btuf_email_card" placeholder="Email" value="" class="btuf_email_card form_control"><select name="pmt_method_payment" class="pmt_method_payment_tc form_control"><option selected="" value="1">Thanh toán qua thẻ ATM</option>
                                            <option value="9">Thanh toán qua Bảo Kim</option>
                                        </select>
                                    </div>
                                    <div class="btn_checkout">
                                        <input type="button" id="btuf_checkout" name="btuf_checkout" onclick="getCovenient()" class="form_button" value="Thanh toán"><input type="hidden" name="typeCoven" class="typeCoven" value="mobile_card">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">function changeMoney(domEle) { var money = domEle.val(); var typeCoven = $(".typeCoven").val(); var btuf_type_card = $(".btuf_type_card").val(); $.post("/ajax_v4/get_money_card_home.php", { money: money, typeCoven: typeCoven, btuf_type_card: btuf_type_card }, function (data) { $("#btuf_checkout").val("Thanh toán: " + formatNumber(data) + "đ"); }, 'html'); } function changeTypeCard(domEleTab, domEle) { $(".btuf_tab").find("li").removeClass("active"); domEleTab.addClass("active"); $(".btuf_content").find(".btuf_content_show").hide(); domEle.fadeIn(); var type = $(domEleTab).attr("iddata"); $(".typeCoven").val(type); $("#btuf_checkout").val("Thanh toán"); }</script>
                    </div>
                    <%-----------------------------------------------------------%>
                    <%--<div class="module">
                        <div class="policy-w">
                            <a href="#">
                                <img src="/Content/UI/image/catalog/banners/call-us.jpg" alt="image"></a>
                            <ul class="block-infos">
                                <li class="info1">
                                    <div class="inner">
                                        <img src="/Content/UI/image/catalog/menu/cam-ket_2.png" />
                                        <div class="info-cont">
                                            <a href="#">Giao hàng toàn quốc</a>
                                            <p>63 Tỉnh thành</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="info2">
                                    <div class="inner">
                                        <img src="../../Content/UI/image/catalog/menu/cam-ket_3.png" />
                                        <div class="info-cont">
                                            <a href="#">Thanh toán tại nhà</a>
                                            <p>Nhận hàng - Trả tiền</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="info3">
                                    <div class="inner">
                                        <img src="../../Content/UI/image/catalog/menu/cam-ket_4.png" />
                                        <div class="info-cont">
                                            <a href="#">Đổi hàng linh hoạt</a>
                                            <p>Miễn phí đổi hàng</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>--%>

                    <div class="module product-simple blog-sidebar" style="display: none">
                        <h3 class="modtitle"><span>Tư vấn tiêu dùng</span></h3>
                        <div class="modcontent">
                            <div class="so-extraslider">
                                <!-- Begin extraslider-inner -->
                                <div class="yt-content-slider extraslider-inner" id="dvTuVanTieuDung" runat="server" data-rtl="yes" data-pagination="yes" data-autoplay="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-lazyload="yes" data-loop="no" data-buttonpage="top">
                                </div>
                                <!--End extraslider-inner -->
                            </div>
                        </div>
                    </div>

                    <div class="module product-simple blog-sidebar">

                        <h3 class="modtitle"><span>Tin tức</span></h3>
                        <div class="modcontent">
                            <div class="so-extraslider">
                                <!-- Begin extraslider-inner -->
                                <div class="yt-content-slider extraslider-inner" id="dvTinTucHot" runat="server" data-rtl="yes" data-pagination="yes" data-autoplay="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-lazyload="yes" data-loop="no" data-buttonpage="top">
                                </div>
                                <!--End extraslider-inner -->
                            </div>
                        </div>
                        <%--<div class="modcontent clearfix">

                        <div class="so-blog-external buttom-type1 button-type1">
                            <div class="blog-external-simple" id="dvTinTucHot" runat="server">
                          
                            </div>
                        </div>

                    </div>--%>
                    </div>

                    <%-- <div class="module testimonials">
                    <h3 class="modtitle"><span>Testimonials</span></h3>
                    <div class="slider-testimonials">
                        <div class="yt-content-slider contentslider" data-rtl="no" data-loop="yes" data-autoplay="no" data-autoheight="no" data-autowidth="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="1" data-items_column0="1" data-items_column1="1" data-items_column2="1" data-items_column3="1" data-items_column4="1" data-arrows="no" data-pagination="yes" data-lazyload="yes" data-hoverpause="yes">
                            <div class="item">
                                <div class="img"><img src="/Content/UI/image/catalog/demo/client/user-1.jpg" alt="Image"></div>
                                <div class="name">Johny Walker</div>
                                <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore”</p>          
                            </div>
                            <div class="item">
                                <div class="img"><img src="/Content/UI/image/catalog/demo/client/user-2.jpg" alt="Image"></div>
                                <div class="name">Jen Nguyen</div>
                                <p>“Ut enim ad minim veniam, lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incidi”</p>          
                            </div>
                            <div class="item">
                                <div class="img"><img src="/Content/UI/image/catalog/demo/client/user-3.jpg" alt="Image"></div>
                                <div class="name">Vin Jame</div>
                                <p>“sed do eiusmod tempor incididunt ut labore et dolore magna aliqua, lorem ipsum dolor sit amet, consectetur adip”</p>          
                            </div>
                        </div>
                    </div>
                </div>--%>


                    <%--<div class="module">
                    <div class="banners banners5">
                        <div class="banner">
                          <a href="#"><img src="/Content/UI/image/catalog/banners/banner2.jpg" alt="image"></a>
                        </div>
                    </div>
                </div>--%>
                </div>
                <div class="col-lg-10 col-md-9 col-sm-8 col-xs-12 main-right">


                    <div class="static-cates" style="display:none;">
                        <ul id="ulBanner5" runat="server">
                            <li>
                                <a href="#">
                                    <img src="/Content/UI/image/catalog/banners/cat1.jpg" alt="image"></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/Content/UI/image/catalog/banners/cat2.jpg" alt="image"></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/Content/UI/image/catalog/banners/cat3.jpg" alt="image"></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/Content/UI/image/catalog/banners/cat4.jpg" alt="image"></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="/Content/UI/image/catalog/banners/cat5.jpg" alt="image"></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Start Deals -->

                    <!-- End Deals -->

<%--                    <!-- Banners -->
                    <div class="banners3 banners" id="dvBanner3" runat="server">
                        <div class="item1">
                            <a href="#">
                                <img src="/Content/UI/image/catalog/banners/banner3.jpg" alt="image"></a>
                        </div>
                        <div class="item2">
                            <a href="#">
                                <img src="/Content/UI/image/catalog/banners/banner4.jpg" alt="image"></a>
                        </div>
                        <div class="item3">
                            <a href="#">
                                <img src="/Content/UI/image/catalog/banners/banner5.jpg" alt="image"></a>
                        </div>
                    </div>
                    <!-- end Banners -->--%>

                    <!-- Category Slider 1 -->
                    <%--   <div id="so_category_slider_1" class="so-category-slider container-slider module cateslider1">
                        <div class="modcontent">
                            <div class="page-top">
                                <div class="page-title-categoryslider">Sản phẩm HOT</div>
                                <%--<div class="item-sub-cat">
                                <ul>
                                    <li><a href="#" title="Smartphone" target="_self">Điện thoại</a></li>
                                    <li><a href="#" title="Tablets" target="_self">Máy tính bảng</a></li>
                                    <li><a href="#" title="Computer" target="_self">Máy tính</a></li>
                                </ul>
                            </div> 
                            </div>

                            <div class="categoryslider-content">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="dvSanPhamHot1" runat="server" data-rtl="yes" data-autoplay="no" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="wrapper">
                        <div id="menu_home_v5" class="fl">
                            <div class="menu_home_v5_main" id="menuHome" runat="server">
                                <ul>
                                    <%--<li><a href="/e/big-event.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_sale"></i></div>
                                        <div class="mhv_name">Khuyến mãi,<br>
                                            giảm giá</div>
                                    </a></li>--%>
                                    <%--<li><a href="/1300/dien-thoai-vien-thong.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_mobile"></i></div>
                                        <div class="mhv_name">
                                            Điện thoại,<br>
                                            viễn thông
                                        </div>
                                    </a></li>
                                    <li><a href="/392/may-tinh-linh-kien.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_laptop"></i></div>
                                        <div class="mhv_name">Máy tính,<br>
                                            linh kiện</div>
                                    </a></li>
                                    <li><a href="/331/dien-tu-dien-may.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_electric"></i></div>
                                        <div class="mhv_name">Điện tử,<br>
                                            điện máy</div>
                                    </a></li>
                                    <li><a href="/405/may-anh-may-quay.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_camera"></i></div>
                                        <div class="mhv_name">Máy ảnh,<br>
                                            máy quay</div>
                                    </a></li>
                                    <li><a href="/3544/o-to-xe-may-xe-dap.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_car"></i></div>
                                        <div class="mhv_name">Ô tô, xe máy,<br>
                                            xe đạp</div>
                                    </a></li>
                                    <li><a href="/640/thoi-trang-phu-kien.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_fashion"></i></div>
                                        <div class="mhv_name">Thời trang,<br>
                                            phụ kiện</div>
                                    </a></li>
                                    <li><a href="/586/me-be.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_mom"></i></div>
                                        <div class="mhv_name">Mẹ &amp; bé</div>
                                    </a></li>
                                    <li><a href="/2434/suc-khoe-sac-dep.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_healthy"></i></div>
                                        <div class="mhv_name">Sức khỏe,<br>
                                            sắc đẹp</div>
                                    </a></li>
                                    <li><a href="/912/do-dung-sinh-hoat.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_sh"></i></div>
                                        <div class="mhv_name">Đồ dùng<br>
                                            sinh hoạt</div>
                                    </a></li>
                                    <li><a href="/779/noi-that-ngoai-that.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_furniture"></i></div>
                                        <div class="mhv_name">Nội thất,<br>
                                            ngoại thất</div>
                                    </a></li>
                                    <li><a href="/923/sach-van-phong-qua-tang.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_book"></i></div>
                                        <div class="mhv_name">Sách, văn phòng, quà tặng</div>
                                    </a></li>
                                    <li><a href="/927/the-thao.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_sport"></i></div>
                                        <div class="mhv_name">Thể thao</div>
                                    </a></li>
                                    <li><a href="/768/cong-nghiep-xay-dung.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_industry"></i></div>
                                        <div class="mhv_name">Công nghiệp,<br>
                                            xây dựng</div>
                                    </a></li>
                                    <li><a href="/561/dich-vu-giai-tri-du-lich.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_game"></i></div>
                                        <div class="mhv_name">Dịch vụ, giải trí,<br>
                                            du lịch</div>
                                    </a></li>
                                    <li><a href="/913/thuc-pham-do-uong.html" target="_blank">
                                        <div class="mhv_img"><i class="icon_picture icon_picture_food"></i></div>
                                        <div class="mhv_name">Thực phẩm,<br>
                                            đồ uống</div>
                                    </a></li>--%>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="clear"></div>
                    </div>
                    <div id="so_category_slider_1" class="so-category-slider container-slider module cateslider1">
                        <div class="modcontent">
                            <div class="page-top">
                                <div class="page-title-categoryslider">Sản phẩm HOT</div>
                            </div>
                            <div class="categoryslider-content" id="hotProductWrap">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="ListProductHot" runat="server" data-rtl="yes" data-autoplay="no" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="no" data-hoverpause="yes">
                                </div>
                            </div>
							<div class="categoryslider-content">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="ListProductHot2" runat="server" data-rtl="yes" data-autoplay="no" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
							<div class="categoryslider-content">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="ListProductHot3" runat="server" data-rtl="yes" data-autoplay="no" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
							<div class="categoryslider-content">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="ListProductHot4" runat="server" data-rtl="yes" data-autoplay="no" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end Category Slider 1 -->

                    <!-- Category Slider 2 -->
                    <div id="so_category_slider_3" class="so-category-slider container-slider module cateslider1">
                        <div class="modcontent">
                            <div class="page-top">
                                <div class="page-title-categoryslider">Bán chạy nhất</div>
                                <%--<div class="item-sub-cat">
                                <ul>
                                    <li><a href="#" title="Smartphone" target="_self">Áo</a></li>
                                    <li><a href="#" title="Tablets" target="_self">Quần</a></li>
                                    <li><a href="#" title="Computer" target="_self">Váy</a></li>
                                    <li><a href="#" title="Accessories" target="_self">Giày dép</a></li>
                                    <li><a href="#" title="Hitech" target="_self">Túi xách</a></li>
                                </ul>
                            </div> --%>
                            </div>

                            <div class="categoryslider-content">
                                <%--<div class="item-cat-image" style="min-height: 351px;">
                                <a href="#" title="Fashion & Accessories" target="_self">
                                  <img class="categories-loadimage" alt="Fashion & Accessories" src="/Content/UI/image/catalog/demo/category/tab3.jpg">
                                </a>
                            </div>--%>
                                <div class="slider category-slider-inner products-list yt-content-slider" id="dvSanPhamBanChay" runat="server" data-rtl="yes" data-autoplay="yes" data-autoheight="no" data-delay="5" data-speed="0.6" data-margin="30" data-items_column00="5" data-items_column0="5" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end Category Slider 2 -->

                    <!-- Category Slider 3 -->
                    <div id="so_category_slider_2" class="so-category-slider container-slider module cateslider2">
                        <div class="modcontent">
                            <div class="page-top">
                                <div class="page-title-categoryslider">Sản phẩm khuyến mại</div>
                                <%-- <div class="item-sub-cat">
                                <ul>
                                    <li><a href="#" title="Smartphone" target="_self">Phòng khách</a></li>
                                    <li><a href="#" title="Tablets" target="_self">Phòng tắm</a></li>
                                    <li><a href="#" title="Computer" target="_self">Phòng ngủ</a></li>
                                    <li><a href="#" title="Accessories" target="_self">Phụ kiện</a></li>
                                    <li><a href="#" title="Hitech" target="_self">Trang trí</a></li>
                                </ul>
                            </div> --%>
                            </div>

                            <div class="categoryslider-content">
                                <div class="slider category-slider-inner products-list yt-content-slider" id="ListDiscountProduct" runat="server" data-rtl="yes" data-autoplay="yes" data-autoheight="no" data-delay="3" data-speed="0.6" data-margin="30" data-items_column00="4" data-items_column0="4" data-items_column1="2" data-items_column2="1" data-items_column3="2" data-items_column4="1" data-arrows="yes" data-pagination="no" data-lazyload="yes" data-loop="yes" data-hoverpause="yes">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end Category Slider 3 -->

                    <!-- Banners -->
                    <%--<div class="banners4 banners">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <a href="#"><img src="/Content/UI/image/catalog/banners/bn1.jpg" alt="image"></a>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <a href="#"><img src="/Content/UI/image/catalog/banners/bn2.jpg" alt="image"></a>
                        </div>
                    </div>
                </div>--%>
                    <!-- end Banners -->

                    <!-- Listing tabs -->
                    <%-- <div class="module listingtab-layout1">
                    
                    <div id="so_listing_tabs_1" class="so-listing-tabs first-load">
                        <div class="loadeding"></div>
                        <div class="ltabs-wrap">
                            <div class="ltabs-tabs-container" data-delay="300" data-duration="600" data-effect="starwars" data-ajaxurl="" data-type_source="0" data-lg="5" data-md="3" data-sm="2" data-xs="1" data-margin="30">
                                <!--Begin Tabs-->
                                <div class="ltabs-tabs-wrap"> 
                                <span class="ltabs-tab-selected">Bathroom</span> <span class="ltabs-tab-arrow">▼</span>
                                    <div class="item-sub-cat">
                                        <ul class="ltabs-tabs cf">
                                            <li class="ltabs-tab tab-sel" data-category-id="20" data-active-content=".items-category-20"> <span class="ltabs-tab-label">Best Seller</span> </li>
                                            <li class="ltabs-tab " data-category-id="18" data-active-content=".items-category-18"> <span class="ltabs-tab-label">New Arrivals</span> </li>
                                            <li class="ltabs-tab " data-category-id="25" data-active-content=".items-category-25"> <span class="ltabs-tab-label">Most Rating</span> </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Tabs-->
                            </div>
                        
                            <div class="ltabs-items-container products-list grid">
                                <!--Begin Items-->
                                <div class="ltabs-items ltabs-items-selected items-category-20" data-total="16">
                                    <div class="ltabs-items-inner ltabs-slider">
                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                        
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="Ullamco occaeca">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/h1.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/h7.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->

                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Ullamco occaeca </a></h4>
                                                            
                                                        </div>
                                                        <p class="price">
                                                          <span class="price-new">$45.00</span>
                                                          
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>      
                                        </div>
                                        
                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                        
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="Eiusmod tempor incid">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/e3.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/e8.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->

                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Eiusmod tempor incid</a></h4>
                                                            
                                                        </div>
                                                        <p class="price">
                                                          <span class="price-new">$76.00</span>
                              
                                                        </p>
                                                    </div>

                                                   
                                                </div>
                                            </div>      
                                        </div>

                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                        
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="Duis aute irure ">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/e4.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/e7.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->

                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Duis aute irure </a></h4>
                                                            
                                                        </div>
                                                        <p class="price">
                                                          <span class="price-new">$85.00</span>
                                  
                                                        </p>
                                                    </div>

                                                    
                                                </div>
                                            </div>      
                                        </div>

                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                        
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="Excepteur sint occ">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/fu5.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/fu6.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->

                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Excepteur sint occ</a></h4>
                                                            
                                                        </div>
                                                        <p class="price">
                                                          <span class="price-new">$90.00</span>
                                                
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>      
                                        </div>

                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                       
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="PCenison meatloa">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/f6.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/f2.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->

                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Cenison meatloa</a></h4>
                                                            
                                                        </div>
                                                        <p class="price">$42.00</p>
                                                    </div>
                                                   
                                                </div>
                                            </div>      
                                        </div>
                                        <div class="item">         
                                            <div class="item-inner product-layout transition product-grid">
                                                <div class="product-item-container">
                                                    <div class="left-block left-b">
                                                        <div class="box-label">
                                                            <span class="label-product label-sale">-10%</span>
                                                        </div>
                                                        <div class="product-image-container second_img">
                                                            <a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" target="_self" title="Quis nostrud exercita">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/f2.jpg" class="img-1 img-responsive" alt="image1">
                                                                <img src="/Content/UI/image/catalog/demo/product/270/f4.jpg" class="img-2 img-responsive" alt="image2">
                                                            </a>
                                                        </div>
                                                        <!--quickview--> 
                                                        <div class="so-quickview">
                                                          <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                        </div>                                                     
                                                        <!--end quickview-->
                                                        
                                                    </div>
                                                    <div class="right-block">
                                                        <div class="button-group so-quickview cartinfo--left">
                                                            <button type="button" class="addToCart" title="Add to cart" onclick="cart.add('60 ');">
                                                                <span>Add to cart </span>   
                                                            </button>
                                                            <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add('60');"><i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                            </button>
                                                            <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add('60');"><i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                            </button>
                                                            
                                                        </div>
                                                        <div class="caption hide-cont">
                                                            <div class="rating">    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            </div>
                                                            <h4><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>" title="Pastrami bacon" target="_self">Quis nostrud exercita</a></h4>
                                                            
                                                        </div>
                                                        <p class="price">
                                                          <span class="price-new">$50.00</span>
                                                          <span class="price-old">$59.00</span>
                                                        </p>
                                                    </div>

                                                    
                                                </div>
                                            </div>      
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="ltabs-items items-category-18 grid" data-total="16">
                                    <div class="ltabs-loading"></div>
                                    
                                </div>
                                <div class="ltabs-items  items-category-25 grid" data-total="16">
                                    <div class="ltabs-loading"></div>
                                </div>
                                <!--End Items-->
                            </div>
                            
                        </div>   
                    </div>
                </div>--%>
                    <!-- end Listing tabs -->

                    <div class="divThanhToan">
                        <b>Chấp nhận thanh toán </b>
                        <img src="../../images/HeThong/TRUCK.png" />
                        <img src="../../images/HeThong/123pay.png" style="width: 105px;" />
                        <img src="../../images/HeThong/ATM.png" />
                        <img src="../../images/HeThong/Visa.png" style="width: 105px;" />
                        <img src="../../images/HeThong/Mastercard.png" />
                    </div>
                </div>

            </div>

        </div>

    </div>




    <%--<div class="owl2-item active" style="width: 178.143px; margin-right: 0px;">
        <div class="item">
            <a href="#">
                <img src="/Content/UI/image/catalog/brands/b2.png" alt="brand">
            </a>
        </div>
    </div>--%>
    <!-- Slider Brands -->

    <div style="padding-top: 20px;">
        <div class="divOnBrands"><b>Thương hiệu </b><span><i class="fa fa-truck"></i>7 ngày miễn phí đổi trả</span><span><i class="fa fa-shopping-bag"></i>Hàng chính hãng 100%</span><span><i class="fa fa-truck"></i>Miễn phí vận chuyển</span></div>
        <div class="slider-brands col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div id="dvDanhSachThuongHieu" class="yt-content-slider contentslider" data-autoplay="no" data-delay="4" data-speed="0.6" data-margin="0" data-items_column00="7" data-items_column0="7" data-items_column1="5" data-items_column2="3" data-items_column3="2" data-items_column4="1" data-arrows="yes"
                data-pagination="no" data-lazyload="yes" data-loop="yes" runat="server">

                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b2.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b3.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b4.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b5.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b6.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b4.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b5.png" alt="brand">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/Content/UI/image/catalog/brands/b6.png" alt="brand">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Slider Brands -->
</asp:Content>