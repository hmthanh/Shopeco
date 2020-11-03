<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MainBoard.master" CodeFile="Categories.aspx.cs" Inherits="GianHang_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
    <script>
        $(document).ready(function () {
            $('#ember4560').addClass("active");
        });
    </script>
    <%--<div id="item-collection-list" class="abc">

        <div class="card-style item-collection--active">
            <div class="item-collection__header">
                <div class="item-collection__header-icon">
                    <svg viewBox="0 0 32 32">
                        <path d="M16 4.38A16.72 16.72 0 0 0 0 15.16a16.72 16.72 0 0 0 16 10.78 16.72 16.72 0 0 0 16-10.78A16.72 16.72 0 0 0 16 4.38zm0 17.85a7.07 7.07 0 1 1 7.07-7.07A7.07 7.07 0 0 1 16 22.23zm4.86-7.07A4.86 4.86 0 1 1 16 10.3a4.86 4.86 0 0 1 4.86 4.86z"></path></svg></div>
                <div class="item-collection__header-title">
                    <div>Danh mục sản phẩm</div>
                    <div>Kích hoạt những danh mục này để Người mua có thể xem chúng.</div>
                </div>
            </div>
            <div class="item-collection__list">

                <div class="item-collection__list-header">
                    <span class="svg customize">
                        <svg viewBox="0 0 6 6">
                            <path d="M2.51 2.51V0H0v2.51h2.51z"></path><path d="M6 2.51V0H3.49v2.51H6zM2.51 6V3.49H0V6h2.51zM6 6V3.49H3.49V6H6z"></path></svg></span>
                    Danh mục của tôi
                </div>
                <a id="btnThemDanhMuc" class="item-collection__add ember-view">
                    <svg viewBox="0 0 32 32">
                        <path d="M17.5 2.5h-3v12h-12v3h12v12h3v-12h12v-3h-12v-12z"></path></svg>Thêm Danh mục
                </a>
                <div id="ember4115" class="item-collection__list ember-view">
                    <!---->
                </div>


                <div id="ember4116" class="item-collection__list ember-view">
                    <div id="ember4125" class="product-listing-header item-collection-list-item ember-view">
                        <div class="item-collection-list-item__details">
                            <div class="item-collection-list-item__name">
                                Giảm giá
            <a style="margin-left: 12px;" class="item-collection-list-item__detail-button item-collection-list-item__detail-button--small" data-ember-action="" data-ember-action-4126="4126">Sửa tên</a>
                                <!---->
                            </div>
                            <div class="item-collection-list-item__source">
                                <span class="svg auto">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M16.2 13.1l-.7-.3c-1.2-.4-4.9-1.7-4.9-4.4 0-1.9 1.7-3.9 4.9-4.1 2.1.1 4.1.6 5.9 1.6 1.4.9 3.2-.1 3.2-1.7v-.1c-.1-.5-.4-.9-.7-1.1 0 0-2.8-2.4-8.5-2.4-6.6.2-8.7 5.1-8.9 7.7-.3 4.1 2.5 7 8.2 8.8l.6.2c4.7 1.5 6.9 3.5 6.7 6-.2 3.4-4.2 4-5.9 4.1-2.8-.2-5.2-1.1-7.3-2.6-.4-.4-.9-.6-1.4-.4-1.1 0-1.9.9-1.9 2 0 .7.3 1.2.8 1.6 2.8 2.2 6.2 3.4 9.7 3.5 1 0 9.4-.2 10.1-7.9.6-6.7-5.5-8.9-9.9-10.5z"></path></svg></span>
                                Danh mục tự động: Sản phẩm giảm giá
                            </div>
                            <!---->
                        </div>
                        <div class="item-collection-list-item__images" data-ember-action="" data-ember-action-4127="4127">
                            <span class="item-collection-list-item__image">
                                <svg viewBox="0 0 32 32">
                                    <path d="M29.5 12.4h-1.8v18H4.3v-18H2.5V7h7.8c-.4-.6-.6-1.2-.6-1.8 0-2 1.6-3.6 3.6-3.6 1.1 0 2.1.5 2.7 1.3.6-.8 1.6-1.3 2.7-1.3 2 0 3.6 1.6 3.6 3.6 0 .6-.2 1.3-.5 1.8h7.8v5.4zM16.9 28.6h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm-10.8 9h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm7.2-16.2c-1 0-1.8.8-1.8 1.8S12.3 7 13.3 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm5.4 0c-1 0-1.8.8-1.8 1.8S17.7 7 18.7 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm9 5.4H4.3v1.8h23.5V8.8z"></path></svg>
                                <span class="item-collection-list-item__images-amount">
                                    <div>0</div>
                                    Sản phẩm
                                </span>
                            </span>
                        </div>
                        <div class="item-collection-list-item__actions">
                            <div class="item-collection-list-item__detail-button" data-ember-action="" data-ember-action-4128="4128">Chi tiết</div>
                        </div>
                        <div class="item-collection-list-item__actions">
                            <!---->
                            <div id="ember4133" class="shopee-tooltip shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                                <div id="ember4142" class="shopee-checkbox-container ember-view">
                                    <div class="shopee-toggle  disabled">
                                        <div class="toggle-button"></div>
                                    </div>
                                </div>


                                <div class="placeholder" style="">Danh mục này không thể được kích hoạt vì không có sản phẩm nào.</div>

                                <div id="ember4145" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                                    <div style="width: 300px; height: auto; left: 0px; top: 12px; white-space: pre-line; word-break: break-word;" class="shopee-overlay__content">
                                        <!---->
                                    </div>
                                </div>
                            </div>
                            <div class="item-collection-list-item__sort-helpers--placeholder-only"></div>

                            <!---->
                            <div class="item-collection-list-item__delete-handler item-collection-list-item__delete-handler--placeholder-only"></div>
                        </div>
                    </div>
                    <div id="ember4146" class="product-listing-header item-collection-list-item ember-view">
                        <div class="item-collection-list-item__details">
                            <div class="item-collection-list-item__name">
                                Hàng mới về
            <a style="margin-left: 12px;" class="item-collection-list-item__detail-button item-collection-list-item__detail-button--small" data-ember-action="" data-ember-action-4147="4147">Sửa tên</a>
                                <!---->
                            </div>
                            <div class="item-collection-list-item__source">
                                <span class="svg auto">
                                    <svg viewBox="0 0 32 32">
                                        <path d="M16.2 13.1l-.7-.3c-1.2-.4-4.9-1.7-4.9-4.4 0-1.9 1.7-3.9 4.9-4.1 2.1.1 4.1.6 5.9 1.6 1.4.9 3.2-.1 3.2-1.7v-.1c-.1-.5-.4-.9-.7-1.1 0 0-2.8-2.4-8.5-2.4-6.6.2-8.7 5.1-8.9 7.7-.3 4.1 2.5 7 8.2 8.8l.6.2c4.7 1.5 6.9 3.5 6.7 6-.2 3.4-4.2 4-5.9 4.1-2.8-.2-5.2-1.1-7.3-2.6-.4-.4-.9-.6-1.4-.4-1.1 0-1.9.9-1.9 2 0 .7.3 1.2.8 1.6 2.8 2.2 6.2 3.4 9.7 3.5 1 0 9.4-.2 10.1-7.9.6-6.7-5.5-8.9-9.9-10.5z"></path></svg></span>
                                Danh mục tự động
            : Sản phẩm đã được thêm trong 6 ngày trước (24-10-2018  -  hôm nay)
                            </div>
                            <!---->
                        </div>
                        <div class="item-collection-list-item__images" data-ember-action="" data-ember-action-4148="4148">
                            <span class="item-collection-list-item__image">
                                <svg viewBox="0 0 32 32">
                                    <path d="M29.5 12.4h-1.8v18H4.3v-18H2.5V7h7.8c-.4-.6-.6-1.2-.6-1.8 0-2 1.6-3.6 3.6-3.6 1.1 0 2.1.5 2.7 1.3.6-.8 1.6-1.3 2.7-1.3 2 0 3.6 1.6 3.6 3.6 0 .6-.2 1.3-.5 1.8h7.8v5.4zM16.9 28.6h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm-10.8 9h9v-7.2h-9v7.2zm0-9h9v-7.2h-9v7.2zm7.2-16.2c-1 0-1.8.8-1.8 1.8S12.3 7 13.3 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm5.4 0c-1 0-1.8.8-1.8 1.8S17.7 7 18.7 7s1.8-.8 1.8-1.8-.8-1.8-1.8-1.8zm9 5.4H4.3v1.8h23.5V8.8z"></path></svg>
                                <span class="item-collection-list-item__images-amount">
                                    <div>0</div>
                                    Sản phẩm
                                </span>
                            </span>
                        </div>
                        <div class="item-collection-list-item__actions">
                            <div class="item-collection-list-item__detail-button" data-ember-action="" data-ember-action-4149="4149">Chi tiết</div>
                        </div>
                        <div class="item-collection-list-item__actions">
                            <!---->
                            <div id="ember4150" class="shopee-tooltip shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                                <div id="ember4151" class="shopee-checkbox-container ember-view">
                                    <div class="shopee-toggle  disabled">
                                        <div class="toggle-button"></div>
                                    </div>
                                </div>


                                <div class="placeholder" style="">Danh mục này không thể được kích hoạt vì không có sản phẩm nào.</div>

                                <div id="ember4152" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                                    <div style="width: 300px; height: auto; left: 0px; top: 12px; white-space: pre-line; word-break: break-word;" class="shopee-overlay__content">
                                        <!---->
                                    </div>
                                </div>
                            </div>
                            <div class="item-collection-list-item__sort-helpers--placeholder-only"></div>

                            <!---->
                            <div class="item-collection-list-item__delete-handler item-collection-list-item__delete-handler--placeholder-only"></div>
                        </div>
                    </div>
                    <!---->
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnThemDanhMuc').click(function () {
                $('#myLargeModal').modal('show');
            });

        });
    </script>
    <div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myLargeModalLabel">Thêm danh mục sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="ember9669" class="shopee-validation-manager ember-view">
                        <div class="lm-content">
                            <div id="ember9671" class="liquid-container ember-view" style="">
                                <div id="ember9674" class="liquid-child ember-view" style="top: 0px; left: 0px;">
                                    <div class="grid edit-row">
                                        <div class="edit-label col-4 text-r">Tên</div>
                                        <div class="edit-input col-12">
                                            <div id="ember9675" class="shopee-textbox ember-view">
                                                <!---->
                                                <!---->
                                                <div class="shopee-validation-toast  "></div>
                                                <div class="input">
                                                    <input type="text" placeholder="" maxlength="64" id="ember9676" class="ember-text-field ember-view"></div>
                                                <!---->
                                                <!---->
                                                <!---->
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                    <div class="grid edit-row">
                                        <div class="edit-label col-4 text-r">Số điện thoại</div>
                                        <div class="edit-input col-12">
                                            <div id="ember9677" class="shopee-textbox ember-view">
                                                <!---->
                                                <!---->
                                                <div class="shopee-validation-toast  "></div>
                                                <div class="input">
                                                    <input type="text" placeholder="" maxlength="64" id="ember9678" class="ember-text-field ember-view"></div>
                                                <!---->
                                                <!---->
                                                <!---->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid edit-row">
                                        <div class="edit-label col-4 text-r">Địa chỉ</div>
                                        <div class="edit-input col-12">
                                            <div class="grid">
                                                <div class="edit-row col-16">
                                                    <div tabindex="0" id="ember9679" class="shopee-dropdown multiple-level-selector ember-view">
                                                        <div class="scs-dropdown " data-ember-action="" data-ember-action-9680="9680">
                                                            <div class="scs-label multiple-level-label">
                                                                <div class="multiple-level-selector-placeholder">Tỉnh/Thành phố / Quận/Huyện / Phường/Xã</div>
                                                                <svg viewBox="0 0 32 32">
                                                                    <path d="M28.2 11.1l-10.9 12s0 .1-.1.2c-.2.2-.5.3-.7.3-.3 0-.5-.1-.7-.3 0 0 0-.1-.1-.2l-10.9-12c-.4-.4-.4-1 0-1.3.4-.4 1-.4 1.3 0l10.4 11.3L26.9 9.8c.4-.4 1-.4 1.3 0 .4.4.4 1 0 1.3z"></path></svg></div>
                                                            <div class="shopee-validation-toast "></div>
                                                        </div>
                                                        <div id="ember9682" class="lf-fade liquid-container ember-view">
                                                            <!---->
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <!---->
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="ember9695" class="shopee-button shopee-button--inactive shopee-button--medium shopee-button--primary ember-view">Lưu</button>
                    <button class="shopee-button shopee-button--medium" data-ember-action="" data-dismiss="modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>--%>

</asp:Content>
