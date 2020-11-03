<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/DangNhap.master" AutoEventWireup="true" CodeFile="ShopCreate.aspx.cs" Inherits="GianHang_ShopCreate" %>
<%--<asp:Content ID="Head" ContentPlaceHolderID="header" runat="server">

</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
    <form id="ember4471" class="shopee-validation-manager ember-view">
        <div class="lm-content">
            <div id="ember4475" class="liquid-container ember-view" style="">
                <div id="ember4478" class="liquid-child ember-view" style="top: 0px; left: 0px;">
                    <div class="grid edit-row">
                        <div class="edit-label col-4 text-r">Tên</div>
                        <div class="edit-input col-12">
                            <div id="ember4479" class="shopee-textbox ember-view">
                                <!---->
                                <!---->
                                <div class="shopee-validation-toast  "></div>
                                <div class="input">
                                    <input type="text" placeholder="" maxlength="64" id="ember4480" class="ember-text-field ember-view"></div>
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
                            <div id="ember4481" class="shopee-textbox ember-view">
                                <!---->
                                <!---->
                                <div class="shopee-validation-toast  "></div>
                                <div class="input">
                                    <input type="text" placeholder="" maxlength="64" id="ember4482" class="ember-text-field ember-view"></div>
                            </div>
                        </div>
                    </div>
                    <div class="grid edit-row">
                        <div class="edit-label col-4 text-r">Địa chỉ</div>
                        <div class="edit-input col-12">
                            <div class="grid">
                                <div class="edit-row col-16">
                                    <div tabindex="0" id="ember4493" class="shopee-dropdown multiple-level-selector ember-view">
                                        <div class="scs-dropdown " data-ember-action="" data-ember-action-4494="4494">
                                            <div class="scs-label multiple-level-label">
                                                <div title="Lâm Đồng / Huyện Đạ Huoai / Xã Hà Lâm" class="multiple-level-selector-label">Lâm Đồng / Huyện Đạ Huoai / Xã Hà Lâm</div>
                                                <svg viewBox="0 0 32 32">
                                                    <path d="M28.2 11.1l-10.9 12s0 .1-.1.2c-.2.2-.5.3-.7.3-.3 0-.5-.1-.7-.3 0 0 0-.1-.1-.2l-10.9-12c-.4-.4-.4-1 0-1.3.4-.4 1-.4 1.3 0l10.4 11.3L26.9 9.8c.4-.4 1-.4 1.3 0 .4.4.4 1 0 1.3z"></path></svg></div>
                                            <div class="shopee-validation-toast "></div>
                                        </div>
                                        <div id="ember4496" class="lf-fade liquid-container ember-view">
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                                <div class="edit-row col-16">
                                    <div id="ember4499" class="shopee-textbox ember-view">
                                        <!---->
                                        <!---->
                                        <div class="shopee-validation-toast  "></div>
                                        <div class="input">
                                            <input type="text" placeholder="Số nhà, tên đường.v.v.." maxlength="128" id="ember4500" class="ember-text-field ember-view"></div>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <!---->
                                <div class="edit-row col-16">
                                    <!---->
                                    <!---->
                                    <!---->
                                    <!---->
                                    <!---->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="lm-actions ">
            <div id="ember4502" class="liquid-container ember-view" style="">
                <div id="ember4505" class="liquid-child ember-view" style="top: 0px; left: 0px;">
                    <div id="ember4510" class="shopee-button shopee-button--inactive shopee-button--medium shopee-button--primary ember-view">Lưu</div>
                    <div class="shopee-button shopee-button--medium" data-ember-action="" data-ember-action-4511="4511">Hủy</div>
                    <!---->
                </div>
            </div>
        </div>
    </form>
</asp:Content>