<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="DanhSachSanPham.aspx.cs" Inherits="SanPham_DanhSachSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .item {
            padding: 0 13px !important;
        }
    </style>
    <link href="/Content/UI/css/cssSendo.css" rel="stylesheet" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(function () {
            $(".panelTitle_X1ky").click(function () {
                var c = $(this).parent().children(".collapse").attr("class");
                var c1 = "filterPanel_hbnp";
                if (c == "collapse show") {
                    c = "collapse";
                }
                else {
                    c = "collapse show";
                    c1 += " active_OeLL";
                    $(this).children().eq(1).attr("class", "collapseCtrl_2zkd");
                }
                $(this).parent().attr("class", c1);
                $(this).parent().children(".collapse").attr("class", c);
            });

            $(".input-cb-custom").click(function () {
                var c = "checkbox-custom filterCheckbox_1-Ku";
                if (this.checked) {
                    c += " checked_3LVu";
                }
                $(this).parent().attr("class", c);
            });
        });
        function Check(v) {
            var c = "checkbox-custom filterCheckbox_1-Ku";
            if (v.checked) {
                c += " checked_3LVu";
            }
            $(v).parent().attr("class", c);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <!-- Main Container  -->
        <div class="main-container container">
            <%--<div class="row"><%=GetDuongDan() %></div>--%>

            <div class="row">
                <!--Left Part Start -->

                <!--Left Part End -->

                <!--Middle Part Start-->
                <div id="content" class="col-md-12 col-sm-11">
                    <div class="products-category typeheader-1">
                        <%--<h3 class="title-category" id="hTenLoaiSP" runat="server"></h3>
        			<div class="category-desc">
        				<div class="row">
        					<div class="col-sm-12">
        						
        					
        					</div>
        				</div>
        			</div>--%>
                        <!-- Filters  // phan này chỉnh giao diên thêm cột kẻ dọc chia tách làm 2 phần-->
                        <div class="row">
                            <div class="bottom1 col-lg-3 col-md-3 col-sm-4 col-xs-12">
                                <div class="filterPanel_CQtH category-style">
                                    <div class="leftFilters_35oG">

                                        <div id="cat_accordion" class="list-group">
                                            <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Thời trang nam</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show" style="">
                                                    <div>
                                                        <div class="groupOptions_ARZN">
                                                            <div class="chbOptions_28PQ">
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">

                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Áo thun</span></label>
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Áo sơ mi</span></label>
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Áo khoác &amp; Áo vét</span></label>
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Áo nỉ &amp; Áo len</span></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Theo khoảng giá</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show">
                                                            <div class="inputGroupPrice_2OmV">
                                                                <input class="inputPriceGT_3cyw" placeholder="Thấp nhất" type="text" min="0" value=""><span class="text_DP59"></span><input class="inputPriceLT_3BdP" placeholder="Cao nhất" type="text" min="0" value="">
                                                                <button type="submit"></button>
                                                            </div>
                                                            <div class="undefined row">
                                                                <div class="col-md-6"><span class="chooseLabel_1hY5">Dưới 85k</span></div>
                                                                <div class="col-md-6"><span class="chooseLabel_1hY5">85k ~ 100k</span></div>
                                                                <div class="col-md-6"><span class="chooseLabel_1hY5">100k ~ 150k</span></div>
                                                                <div class="col-md-6"><span class="chooseLabel_1hY5">150k ~ 200k</span></div>
                                                                <div class="col-md-6"><span class="chooseLabel_1hY5">Trên 200k</span></div>
                                                            </div>
                                                </div>
                                            </div>
                                           <%-- <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Màu sắc</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show">
                                                    <div>
                                                        <div class="groupOptions_ARZN">
                                                            <div class="colorGroupOptions_1WV2">
                                                                <div class="colorCheckBox_kdUh"><span title="Trắng" class="choose-label-circle" style="background: rgb(255, 255, 255);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Đen" class="choose-label-circle" style="background: rgb(0, 0, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xám" class="choose-label-circle" style="background: rgb(153, 153, 153);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xanh đen" class="choose-label-circle" style="background: rgb(17, 44, 78);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Đỏ" class="choose-label-circle" style="background: rgb(255, 0, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xanh nước biển" class="choose-label-circle" style="background: rgb(0, 128, 255);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Bạc" class="choose-label-circle" style="background: rgb(204, 204, 204);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Nâu" class="choose-label-circle" style="background: rgb(128, 64, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xanh rêu" class="choose-label-circle" style="background: rgb(0, 112, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Vàng" class="choose-label-circle" style="background: rgb(255, 255, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xanh ngọc" class="choose-label-circle" style="background: rgb(0, 255, 255);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Tím" class="choose-label-circle" style="background: rgb(128, 0, 128);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Kem" class="choose-label-circle" style="background: rgb(254, 241, 206);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Cam" class="choose-label-circle" style="background: rgb(255, 128, 64);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Khác" class="choose-label-circle" style="background: url(&quot;https://media3.scdn.vn/img/2014/3_6/khac_2ikqk5jehmtts_simg_2df889_740x613_max.gif&quot;);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Xanh lá" class="choose-label-circle" style="background: rgb(0, 255, 0);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Hồng" class="choose-label-circle" style="background: rgb(255, 0, 255);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Họa tiết" class="choose-label-circle" style="background: url(&quot;https://media3.scdn.vn/img/2014/3_6/hoa_tiet_2ikqk5hs9c204_simg_edf1ce_120x160_max.gif&quot;);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Sọc" class="choose-label-circle" style="background: url(&quot;https://media3.scdn.vn/img/2014/3_6/soc_2ikqk5krgab35_simg_2df889_740x613_max.gif&quot;);"></span></div>
                                                                <div class="colorCheckBox_kdUh"><span title="Hồng phấn" class="choose-label-circle" style="background: rgb(255, 192, 203);"></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Nhà sản xuất</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show">
                                                    <div>
                                                        <div class="groupOptions_ARZN">
                                                            <div class="chbOptions_28PQ">
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Tiki.vn (1)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">SC (1)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">WOW (2)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Không (2)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Biti's (3)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Đang cập nhật (1499)</span></label><div class="collapse">
                                                                        <div>
                                                                            <div class="chbOptions_28PQ">
                                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Cotton pha</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Cotton 2 chiều</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Thun da cá</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Cotton trơn</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Bố thun</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Thun cá sấu</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Lưới</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Kaki</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Len</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Kate</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Bố</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Cotton Spandex</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Ren mi</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Vải PE</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Thun xốp</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Tơ nhung</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Chiffon</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Jean</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                                    </g>
                                                                                    </g></svg></span><span class="text_eu8q">Ren</span></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                            <div class="textClickable_2cQf"><strong>Xem thêm</strong></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Thương hiệu</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show">
                                                    <div>
                                                        <div class="groupOptions_ARZN">
                                                            <div class="chbOptions_28PQ">
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Everest (1200)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Áo hạnh phúc (210)</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Tin tan (198)</span></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="filterPanel_hbnp active_OeLL">
                                                <div class="panelTitle_X1ky"><span class="title_26ia">Nơi bán</span><span class="collapseCtrl_2zkd"></span></div>
                                                <div class="collapse show">
                                                    <div>
                                                        <div class="groupOptions_ARZN">
                                                            <div class="chbOptions_28PQ">
                                                                <label class="checkbox-custom filterCheckbox_1-Ku">
                                                                    <input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Hồ Chí Minh</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Hà Nội</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Cần Thơ</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Đà Nẵng</span></label><label class="checkbox-custom filterCheckbox_1-Ku"><input type="checkbox" class="input-cb-custom"><span class="box-check_1KOw"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" class="icon-check_mVLE"><g data-name="Layer 2"><g data-name="Layer 1"><path d="M0,0H48V48H0Z" fill="none"></path>
                                                                        <polygon points="40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46"></polygon>
                                                                    </g>
                                                                    </g></svg></span><span class="text_eu8q">Đồng Nai</span></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                </div>
                                </div>
                            </div>

                            <div class="main-menu-w col-lg-9 col-md-9 col-sm-8 col-xs-12">
                                <div class="product-filter filters-panel">
                                    <div class="row">
                                        <div class="Shopee-sort-bar">
                                            <%--<span class="Shopee-sort-bar__label">Sắp xếp theo</span>--%><div class="Shopee-sort-by-options">
                                                <div class="Shopee-sort-by-options__option Shopee-sort-by-options__option--selected">Phổ biến</div>
                                                <div class="Shopee-sort-by-options__option">Mới nhất</div>
                                                <div class="Shopee-sort-by-options__option">Bán chạy</div>
                                                <div>
                                                    <div class="select-with-status">
                                                        <div class="select-with-status__holder">
                                                            <span class="select-with-status__placeholder">Giá</span><svg class="Shopee-svg-icon icon-arrow-down-small" viewBox="0 0 10 6"><path d="M9.7503478 1.37413402L5.3649665 5.78112957c-.1947815.19574157-.511363.19651982-.7071046.00173827a.50153763.50153763 0 0 1-.0008702-.00086807L.2050664 1.33007451l.0007126-.00071253C.077901 1.18820749 0 1.0009341 0 .79546595 0 .35614224.3561422 0 .7954659 0c.2054682 0 .3927416.07790103.5338961.20577896l.0006632-.00066318.0226101.02261012a.80128317.80128317 0 0 1 .0105706.0105706l3.3619016 3.36190165c.1562097.15620972.4094757.15620972.5656855 0a.42598723.42598723 0 0 0 .0006944-.00069616L8.6678481.20650022l.0009529.0009482C8.8101657.07857935 8.9981733 0 9.2045341 0 9.6438578 0 10 .35614224 10 .79546595c0 .20495443-.077512.39180497-.2048207.53283641l.0003896.00038772-.0096728.00972053a.80044712.80044712 0 0 1-.0355483.03572341z" fill-rule="nonzero"></path></svg><div></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="Shopee-mini-page-controller">
                                                <div class="Shopee-mini-page-controller__state"><span class="Shopee-mini-page-controller__current">1</span>/<span class="Shopee-mini-page-controller__total">4</span></div>
                                                <button class="Shopee-button-outline Shopee-mini-page-controller__prev-btn Shopee-button-outline--disabled" disabled="">
                                                    <svg class="Shopee-svg-icon icon-arrow-left-small" viewBox="0 0 7 11">
                                                        <path d="M4.694078 9.8185598L.2870824 5.4331785c-.1957415-.1947815-.1965198-.511363-.0017382-.7071046a.50867033.50867033 0 0 1 .000868-.0008702L4.7381375.2732784 4.73885.273991c.1411545-.127878.3284279-.205779.5338961-.205779.4393237 0 .7954659.3561422.7954659.7954659 0 .2054682-.077901.3927416-.205779.5338961l.0006632.0006632-.0226101.0226101a.80174653.80174653 0 0 1-.0105706.0105706L2.4680138 4.7933195c-.1562097.1562097-.1562097.4094757 0 .5656855a.45579485.45579485 0 0 0 .0006962.0006944l3.3930018 3.3763607-.0009482.0009529c.128869.1413647.2074484.3293723.2074484.5357331 0 .4393237-.3561422.7954659-.7954659.7954659-.2049545 0-.391805-.077512-.5328365-.2048207l-.0003877.0003896-.0097205-.0096728a.80042023.80042023 0 0 1-.0357234-.0355483z" fill-rule="nonzero"></path></svg></button>
                                                <button class="Shopee-button-outline Shopee-mini-page-controller__next-btn">
                                                    <svg class="Shopee-svg-icon icon-arrow-right-small" viewBox="0 0 7 11">
                                                        <path d="M2.305922 9.81856l4.4069956-4.385381c.1957415-.194782.1965198-.511364.0017382-.707105a.26384055.26384055 0 0 0-.000868-.00087L2.2618625.273278 2.26115.273991C2.1199955.146113 1.9327221.068212 1.7272539.068212c-.4393237 0-.7954659.356142-.7954659.795466 0 .205468.077901.392741.205779.533896l-.0006632.000663.0226101.02261c.0034906.003557.0070143.00708.0105706.010571L4.5319862 4.79332c.1562097.156209.1562097.409475 0 .565685-.0002318.000232-.0004639.000463-.0006962.000694L1.1382882 8.73606l.0009482.000953c-.128869.141365-.2074484.329372-.2074484.535733 0 .439324.3561422.795466.7954659.795466.2049545 0 .391805-.077512.5328365-.204821l.0003877.00039.0097205-.009673c.012278-.011471.0241922-.023327.0357234-.035548z" fill-rule="nonzero"></path></svg></button>
                                            </div>
                                        </div>
                                        <div class="banners">
                                            <div>
                                                <a href="#">
                                                    <img id="imgBanner" runat="server" src="/Content/UI/image/catalog/demo/category/img-cate.jpg" alt="img cate" /><br>
                                                </a>
                                            </div>
                                        </div>
                                        <%-- <div class="col-md-5 col-sm-3 col-xs-12 view-mode">
                                
                                    <div class="list-view">
                                        <a class="btn btn-default grid active" data-view="grid" data-toggle="tooltip" data-original-title="Grid"><i class="fa fa-th"></i></a>
                                        <a class="btn btn-default list" data-view="list" data-toggle="tooltip" data-original-title="List"><i class="fa fa-th-list"></i></a>
                                    </div>
                        
                            </div>
                            <div class="short-by-show form-inline text-right col-md-7 col-sm-9 col-xs-12">
                                <div class="form-group short-by">
                                    <label class="control-label" for="input-price">Price</label>
                                    <select id="input-price" class="form-control">
                                        <option value="" selected="selected">Default</option>
                                        <option value="">From 0$ to 10$</option>
                                        <option value="">From 10$ to 20$</option>
                                        <option value="">From 20$ to 50$</option>
                                    </select>


                                    <label class="control-label" for="input-sort">Sort By:</label>
                                    <select id="input-sort" class="form-control" onchange="location=this.value;">
                                        <option value="" selected="selected">Default</option>
                                        <option value="">Name (A - Z)</option>
                                        <option value="">Name (Z - A)</option>
                                        <option value="">Price (Low &gt; High)</option>
                                        <option value="">Price (High &gt; Low)</option>
                                        <option value="">Rating (Highest)</option>
                                        <option value="">Rating (Lowest)</option>
                                        <option value="">Model (A - Z)</option>
                                        <option value="">Model (Z - A)</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="input-limit">Show:</label>
                                    <select id="input-limit" class="form-control" onchange="location = this.value;">
                                        <option value="" selected="selected">15</option>
                                        <option value="">25</option>
                                        <option value="">50</option>
                                        <option value="">75</option>
                                        <option value="">100</option>
                                    </select>
                                </div>
                            </div>--%>
                                        <!-- <div class="box-pagination col-md-3 col-sm-4 col-xs-12 text-right">
                                <ul class="pagination">
                                    <li class="active"><span>1</span></li>
                                    <li><a href="">2</a></li><li><a href="">&gt;</a></li>
                                    <li><a href="">&gt;|</a></li>
                                </ul>
                            </div> -->
                                    </div>
                                </div>
                                <!-- //end Filters -->

                                <!--changed listings-->
                                <div class="row">
                                <div class="products-list row nopadding-xs so-filter-gird grid" id="dvDSSanPham" runat="server">

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Lastrami bacon">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e1.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e10.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Lastrami bacon</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$80.00</span>

                                                </p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">
                                                <div class="box-label">
                                                    <span class="label-product label-sale">-15%</span>
                                                </div>
                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Exceeur sint occaecat">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e2.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e9.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->

                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Exceeur sint occaecat</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$50.00</span>
                                                    <span class="price-old">$59.00</span>
                                                </p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Mapicola incidid">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e3.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e8.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Mapicola incidid</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$60.00</span>
                                                </p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">
                                                <div class="box-label">
                                                    <span class="label-product label-new">New</span>
                                                </div>
                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Duis aute irure ">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e4.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e7.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Duis aute irure </a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$48.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Excepteur sint occ">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e5.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e6.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Excepteur sint occ</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$90.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="PCenison meatloa">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e6.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/e2.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Cenison meatloa</a></h4>

                                                </div>
                                                <p class="price">$42.00</p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">
                                                <div class="box-label">
                                                    <span class="label-product label-new">New</span>
                                                </div>
                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Sunt inculpa qui">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu1.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu10.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Sunt inculpa qui</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$60.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Chicken swinesha">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu2.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu9.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->

                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Chicken swinesha</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$55.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">
                                                <div class="box-label">
                                                    <span class="label-product label-sale">-10%</span>
                                                </div>
                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Mapicola incidid">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu3.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu8.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Mapicola incidid</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$90.00</span>
                                                    <span class="price-old">$100.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Dormd dea irure">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu4.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu7.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Dormd dea irure </a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$48.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Mecepteur sint rew">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu5.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu6.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Mecepteur sint rew</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$90.00</span>
                                                </p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Sed ut perspicia">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu6.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/fu2.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Sed ut perspicia</a></h4>

                                                </div>
                                                <p class="price">$42.00</p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Dormd dea irure">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f4.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f7.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <div class="ratings">
                                                        <div class="rating-box">
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                        </div>
                                                        <span class="rating-num">( 2 )</span>
                                                    </div>
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Dormd dea irure </a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$48.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Mecepteur sint rew">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f5.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f6.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <div class="ratings">
                                                        <div class="rating-box">
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                        </div>
                                                        <span class="rating-num">( 2 )</span>
                                                    </div>
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Mecepteur sint rew</a></h4>

                                                </div>
                                                <p class="price">
                                                    <span class="price-new">$90.00</span>
                                                </p>

                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-item-container">
                                            <div class="left-block left-b">

                                                <div class="product-image-container second_img">
                                                    <a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" target="_self" title="Sed ut perspicia">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f6.jpg" class="img-1 img-responsive" alt="image1">
                                                        <img src="/Content/UI/image/catalog/demo/product/270/f2.jpg" class="img-2 img-responsive" alt="image2">
                                                    </a>
                                                </div>
                                                <!--quickview-->
                                                <div class="so-quickview">
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i><span>Quick view</span></a>
                                                </div>
                                                <!--end quickview-->


                                            </div>
                                            <div class="right-block">
                                                <div class="button-group so-quickview cartinfo--left">
                                                    <button type="button" class="addToCart" title="Add to cart" onclick="cart.add(&#39;60 &#39;);">
                                                        <span>Add to cart </span>
                                                    </button>
                                                    <button type="button" class="wishlist btn-button" title="Add to Wish List" onclick="wishlist.add(&#39;60&#39;);">
                                                        <i class="fa fa-heart-o"></i><span>Add to Wish List</span>
                                                    </button>
                                                    <button type="button" class="compare btn-button" title="Compare this Product " onclick="compare.add(&#39;60&#39;);">
                                                        <i class="fa fa-retweet"></i><span>Compare this Product</span>
                                                    </button>

                                                </div>
                                                <div class="caption hide-cont">
                                                    <div class="ratings">
                                                        <div class="rating-box">
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                                        </div>
                                                        <span class="rating-num">( 1 )</span>
                                                    </div>
                                                    <h4><a href="http://demo.smartaddons.com/templates/html/supermarket/product.html" title="Pastrami bacon" target="_self">Sed ut perspicia</a></h4>

                                                </div>
                                                <p class="price">$42.00</p>
                                                <div class="description item-desc hidden">
                                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                                </div>
                                                <div class="list-block hidden">
                                                    <button class="addToCart btn-button" type="button" title="Add to Cart" onclick="cart.add(&#39;101&#39;, &#39;1&#39;);">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </button>
                                                    <button class="wishlist btn-button" type="button" title="Add to Wish List" onclick="wishlist.add(&#39;101&#39;);">
                                                        <i class="fa fa-heart"></i>
                                                    </button>
                                                    <button class="compare btn-button" type="button" title="Compare this Product" onclick="compare.add(&#39;101&#39;);">
                                                        <i class="fa fa-refresh"></i>
                                                    </button>
                                                    <!--quickview-->
                                                    <a class="iframe-link btn-button quickview quickview_handler visible-lg" href="http://demo.smartaddons.com/templates/html/supermarket/quickview.html" title="Quick view" data-fancybox-type="iframe"><i class="fa fa-eye"></i></a>
                                                    <!--end quickview-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                </div>
                                    <!--// End Changed listings-->
                                <!-- Filters -->
                                <%--<div class="product-filter product-filter-bottom filters-panel">
                        <div class="row">
                            <div class="col-sm-6 text-left"></div>
                            <div class="col-sm-6 text-right">Showing 1 to 15 of 15 (1 Pages)</div>
                        </div>
                    </div>--%>
                                <!-- //end Filters -->
                            </div>
                        </div>
                    </div>

                </div>


                <!--Middle Part End-->
            </div>
        </div>
        <!-- //Main Container -->
    </form>
</asp:Content>
