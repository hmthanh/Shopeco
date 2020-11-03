<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="ThongTinGianHang.aspx.cs" Inherits="View_GianHang_ThongTinGianHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Content/UI/css/thongtingianhang.css" rel="stylesheet" />
    <link href="../../Content/gianhang/css/shopcustom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Main Container  -->
    <div class="main-container container">
        <div id="ember4669" class="shop-setting-header ember-view">
            <div class="shop-setting-header__content">
                <div style="background: #49cbdd;" class="shop-setting-header__icon">
                    <svg viewBox="0 0 32 32">
                        <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                </div>
                <div class="shop-setting-header__caption ">
                    <div class="shop-setting-header__title" id="tenGianHang" runat="server">Tên gian hàng</div>
                    <div class="shop-setting-header__subtitle" runat="server" id="chuGianHang">Hoang Minh Thanh</div>
                </div>
                <div class="grid with-gap setting-card--form">
                    <div class="col-8">
                        <div class="seller-profile">
                            <div class="edit-row">
                                <div class="edit-label">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                                    Địa chỉ gian hàng
                                </div>
                                <div id="diaChiGianHang" runat="server" class="info-item">Địa chỉ</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="seller-profile">
                            <div class="edit-row">
                                <div class="edit-label">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M28.38 26.45a1.75 1.75 0 0 0-.66-1.45c-.45-.32-5.17-3.46-5.71-3.81a2.33 2.33 0 0 0-2.3.14c-.46.24-1.84 1-2.52 1.41A33.76 33.76 0 0 1 13 19.06a33.57 33.57 0 0 1-3.71-4.2c.39-.68 1.18-2.06 1.42-2.51a3 3 0 0 0 .36-1.35 1.71 1.71 0 0 0-.23-.9C10.48 9.49 7.32 4.75 7 4.32a2 2 0 0 0-2.84-.22S0 7.11 0 8.8c.16 4.84 4.86 10.51 8.77 14.41s9.6 8.59 14.44 8.74c1.72.06 4.69-4.11 4.72-4.15a2.46 2.46 0 0 0 .44-1.4z"></path></svg>
                                    Số điện thoại
                            <span id="soDienThoai" runat="server" class="info-item">0234234</span>
                                </div>
                            </div>
                            <div class="edit-row">
                                <div class="edit-label">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>Mô tả gian hàng
                             <span id="moTaGianHang" runat="server" class="info-item">Mô</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="shop-setting-header__seperator">
        </div>
        <div class="main-menu-w">
            <div class="product-filter filters-panel" style="margin-bottom: 0px">
                <div class="row">
                    <div class="Shopee-sort-bar">
                        <div class="Shopee-sort-by-options">
                            <div data-option="newest" class="Shopee-sort-by-options__option" id="Newest" runat="server">Mới nhất</div>
                            <div data-option="seller" class="Shopee-sort-by-options__option" id="BestSeller" runat="server">Bán chạy</div>
                            <div data-option="greate" class="Shopee-sort-by-options__option" id="gtSelect" runat="server">Giá cao</div>
                            <div data-option="lowerp" class="Shopee-sort-by-options__option" id="ltSelect" runat="server">Giá thấp</div>
                        </div>
                        <div class="Shopee-mini-page-controller">
                            <div class="Shopee-mini-page-controller__state">
                                <span id="curentPage" class="Shopee-mini-page-controller__current" runat="server">1</span>/<span class="Shopee-mini-page-controller__total" id="pageNumbers" runat="server">4</span>
                            </div>
                            <button type="button" id="btnBack" class="Shopee-button-outline Shopee-mini-page-controller__prev-btn">
                                <svg class="Shopee-svg-icon icon-arrow-left-small" viewBox="0 0 7 11">
                                    <path d="M4.694078 9.8185598L.2870824 5.4331785c-.1957415-.1947815-.1965198-.511363-.0017382-.7071046a.50867033.50867033 0 0 1 .000868-.0008702L4.7381375.2732784 4.73885.273991c.1411545-.127878.3284279-.205779.5338961-.205779.4393237 0 .7954659.3561422.7954659.7954659 0 .2054682-.077901.3927416-.205779.5338961l.0006632.0006632-.0226101.0226101a.80174653.80174653 0 0 1-.0105706.0105706L2.4680138 4.7933195c-.1562097.1562097-.1562097.4094757 0 .5656855a.45579485.45579485 0 0 0 .0006962.0006944l3.3930018 3.3763607-.0009482.0009529c.128869.1413647.2074484.3293723.2074484.5357331 0 .4393237-.3561422.7954659-.7954659.7954659-.2049545 0-.391805-.077512-.5328365-.2048207l-.0003877.0003896-.0097205-.0096728a.80042023.80042023 0 0 1-.0357234-.0355483z" fill-rule="nonzero"></path></svg></button>
                            <button type="button" id="btnNext" class="Shopee-button-outline Shopee-mini-page-controller__next-btn">
                                <svg class="Shopee-svg-icon icon-arrow-right-small" viewBox="0 0 7 11">
                                    <path d="M2.305922 9.81856l4.4069956-4.385381c.1957415-.194782.1965198-.511364.0017382-.707105a.26384055.26384055 0 0 0-.000868-.00087L2.2618625.273278 2.26115.273991C2.1199955.146113 1.9327221.068212 1.7272539.068212c-.4393237 0-.7954659.356142-.7954659.795466 0 .205468.077901.392741.205779.533896l-.0006632.000663.0226101.02261c.0034906.003557.0070143.00708.0105706.010571L4.5319862 4.79332c.1562097.156209.1562097.409475 0 .565685-.0002318.000232-.0004639.000463-.0006962.000694L1.1382882 8.73606l.0009482.000953c-.128869.141365-.2074484.329372-.2074484.535733 0 .439324.3561422.795466.7954659.795466.2049545 0 .391805-.077512.5328365-.204821l.0003877.00039.0097205-.009673c.012278-.011471.0241922-.023327.0357234-.035548z" fill-rule="nonzero"></path></svg></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //end Filters -->

            <!--changed listings-->
            <div class="row">
                <div class="products-list row nopadding-xs so-filter-gird grid" id="dvDSSanPham" runat="server">
                </div>
            </div>
        </div>
    </div>
    <script>
        var total = parseInt($('.Shopee-mini-page-controller__total').html());
        var Params = new URLSearchParams(window.location.search.toString());
        if (Params.has("page")) {
            var page = parseInt(Params.get("page"));
            $("#btnNext").attr("data-page", Params.get("page"));
            if (page > 1) {
                $("#btnBack").removeAttr("disabled");
                $("#btnBack").removeClass("Shopee-button-outline--disabled");
            }
            else {
                $("#btnBack").attr("disabled", "disabled");
                $("#btnBack").addClass("Shopee-button-outline--disabled");
            }
        }
        else {
            $("#btnBack").attr("disabled", "disabled");
            $("#btnBack").addClass("Shopee-button-outline--disabled");
        }
        $("#btnNext").click(function () {
            Params = new URLSearchParams(window.location.search.toString());
            var page;

            if (Params.has("page")) {
                page = Params.get("page");
            }
            else {
                page = 1;
            }
            var p = parseInt(page);
            if (p < total)
            {
                p++;
            }
            Params.set("page", p);

            var res_url = window.location.origin + window.location.pathname + '?' + Params.toString();
            window.location.href = res_url;
        });

        $("#btnBack").click(function () {
            Params = new URLSearchParams(window.location.search.toString());
            var page;
            if (Params.has("page")) {
                page = Params.get("page");
            }
            else {
                page = 2;
            }
            var p = parseInt(page);
            p--;
            Params.set("page", p);

            var res_url = window.location.origin + window.location.pathname + '?' + Params.toString();
            window.location.href = res_url;
        });
        function chooseOneOption(_option) {
            var params = new URLSearchParams(window.location.search.toString()); //window.location.search.toString();
            var hasName = params.has(_option);

            if (hasName) {
                params.delete(_option);
                return "?" + params.toString();
            }
            switch (_option) {
                case "popula":
                    params.delete("greate");
                    params.delete("lowerp");
                    params.delete("newest");
                    params.delete("seller");
                    break;
                case "newest":
                    params.delete("greate");
                    params.delete("lowerp");
                    params.delete("popula");
                    params.delete("seller");
                    break;
                case "seller":
                    params.delete("greate");
                    params.delete("lowerp");
                    params.delete("popula");
                    params.delete("newest");
                    break;
                case "greate":
                    params.delete("lowerp");
                    params.delete("seller");
                    params.delete("popula");
                    params.delete("newest");
                    break;
                case "lowerp":
                    params.delete("greate");
                    params.delete("seller");
                    params.delete("popula");
                    params.delete("newest");
                    break;
                default:
                    break;
            }
            params.set(_option, "1");
            return "?" + params.toString();
        };

        $(".Shopee-sort-by-options__option").click(function () {
            var option = this.dataset.option;
            if (option == null || option == "") {
                return;
            }
            var search = window.location.search.toString();

            search = chooseOneOption(option);
            var new_url = window.location.origin + window.location.pathname + search;
            window.location.href = new_url;

        });
    </script>
</asp:Content>