<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="TienIch.aspx.cs" Inherits="View_User_Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        ._1mYQU {
            float: left;
            width: 60%;
            max-width: none;
            padding: 1.1rem .6rem;
        }

        ._1mYQU {
            padding: 11px 12px;
            max-width: 768px;
        }

        ._1lK5k {
            font-size: 14px;
        }

        section {
            display: block;
        }

        .nlEoI {
            /*border-radius: 3px;
            -webkit-box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
            box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);*/
            border-radius: 0;
            -webkit-box-shadow: 0;
            box-shadow: 0;
        }

        /*.panel {
            margin-bottom: 1.2rem;
            background-color: #fff;
            -webkit-box-shadow: 0 1px 3px 0 rgba(0,0,0,.2);
            box-shadow: 0 1px 3px 0 rgba(0,0,0,.2);
        }*/

        .panel-content {
            padding: 1.2rem;
        }

        ._3qmiA .zvb34:first-child {
            border-top: none;
        }

        ._3qmiA .zvb34 {
            border-top: 1px solid #e9e9e9;
            padding-top: 16px;
        }

        ._3qmiA ._3g-LU {
            line-height: 1.5rem;
            font-size: 1.1rem;
            font-weight: 400;
            font-style: normal;
            text-align: left;
            color: #828282;
            text-transform: uppercase;
        }

        ._-0SxP {
            white-space: nowrap;
            text-align: left;
            padding: 1.2rem 0;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -.4rem;
            margin-left: -.4rem;
        }

        ._2wE5B #senpayContainer a {
            color: #000 !important;
        }

        ._1lK5k ._1mYQU a {
            color: #51a2de;
            text-decoration: underline;
        }

        ._1tmGj.d0a4x {
            color:#404040;
            max-width: none;
            text-align: center;
        }

        ._1tmGj {
            display: inline-block;
            max-width: 9rem;
        }

        .col-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        ._35LNl {
            display: inline-block;
            font-size: inherit;
            text-align: center;
        }

        ._1grgP {
            margin-top: .6rem;
            font-size: 1.4rem;
        }

        ._3xVMY svg {
            width: 100%;
            height: 100%;
            max-width: 29px;
        }

        svg:not(:root) {
            overflow: hidden;
        }

        :not(input):not(textarea):not(button) {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }
    </style>
    <div class="wrapper" style="background: #fafafa; padding-top: 23px;">
        <div class="grid">
            <div class="route-settings__menu">
                <div id="ember4554" class="ember-view">
                    <div class="card-panel">
                        <div class="card-panel__section">
                            <div class="card-panel__title">Tiện ích</div>
                            <div id="ember4555" class="shop-setting-link ember-view">
                                <a href="<%=GetRouteUrl("tienich",new { }) %>" id="ember4556" class="shop-setting-link__link ember-view">
                                    <div style="background: #49cbdd;" class="shop-setting-link__icon">
                                        <svg style="fill: #49cbdd;" viewBox="0 0 32 32">
                                            <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                                    </div>
                                    <div class="shop-setting-link__caption">Thanh toán</div>
                                    <div style="background: #49cbdd;" class="shop-setting-link__active-bar"></div>
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="col route-settings__main">

                <script>
                    $(document).ready(function () {
                        $('#ember4555').addClass("active");
                    });
                </script>
                <div id="ember6145" class="shop-setting-header ember-view">
                    <div class="shop-setting-header__content">
                        <div style="background: #49cbdd;" class="shop-setting-header__icon">
                            <svg viewBox="0 0 32 32">
                                <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                        </div>
                        <div class="shop-setting-header__caption ">
                            <div class="shop-setting-header__title">Tiện ích</div>
                            <div class="shop-setting-header__subtitle">Thanh toán</div>
                        </div>
                    </div>
                    <hr class="shop-setting-header__seperator">
                </div>
                <div class="seller-profile" >
                    <section class="_3qmiA">
                        <div class="panel nlEoI ">
                            <div class="panel-content">
                                <section class="zvb34">
                                    <h4 class="_3g-LU">Tiện ích điện thoại</h4>
                                    <div class="_-0SxP row">
                                        <a class="_1tmGj d0a4x col-3" aria-current="false" href="#">
                                            <div class="_35LNl">
                                                <div class="_3xVMY ">
                                                    <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                        <title>SYSTEM ICONS/nap tien@1,5x</title>
                                                        <desc>Created with Sketch.</desc><defs></defs><g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="SYSTEM-ICONS/nap-tien" fill="#337ab7" fill-rule="nonzero"><g id="ic_phone_iphone_24px" transform="translate(6.000000, 1.000000)"><path d="M10.5,0 L2.5,0 C1.12,0 0,1.06909091 0,2.38636364 L0,19.6136364 C0,20.9309091 1.12,22 2.5,22 L10.5,22 C11.88,22 13,20.9309091 13,19.6136364 L13,2.38636364 C13,1.06909091 11.88,0 10.5,0 Z M6.5,21 C5.67,21 5,20.33 5,19.5 C5,18.67 5.67,18 6.5,18 C7.33,18 8,18.67 8,19.5 C8,20.33 7.33,21 6.5,21 Z M11,17 L2,17 L2,2 L11,2 L11,17 Z" id="Shape"></path>
                                                        </g>
                                                            <path d="M12.6915521,10.95 C11.5766208,10.655 11.2180747,10.35 11.2180747,9.875 C11.2180747,9.33 11.7141454,8.95 12.5442043,8.95 C13.4184676,8.95 13.7426326,9.375 13.7721022,10 L14.8575639,10 C14.8231827,9.14 14.3074656,8.35 13.280943,8.095 L13.280943,7 L11.8074656,7 L11.8074656,8.08 C10.8546169,8.29 10.0884086,8.92 10.0884086,9.885 C10.0884086,11.04 11.0265226,11.615 12.3968566,11.95 C13.6247544,12.25 13.870334,12.69 13.870334,13.155 C13.870334,13.5 13.629666,14.05 12.5442043,14.05 C11.5324165,14.05 11.1345776,13.59 11.0805501,13 L10,13 C10.0589391,14.095 10.8644401,14.71 11.8074656,14.915 L11.8074656,16 L13.280943,16 L13.280943,14.925 C14.2387033,14.74 15,14.175 15,13.15 C15,11.73 13.8064833,11.245 12.6915521,10.95 Z" id="Shape"></path>
                                                        </g>
                                                        </g></svg>
                                                </div>
                                                <div class="_1grgP">Nạp Tiền Trực Tiếp</div>
                                            </div>
                                        </a><a class="_1tmGj d0a4x col-3" aria-current="false" href="#">
                                            <div class="_35LNl">
                                                <div class="_3xVMY ">
                                                    <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                        <title>SYSTEM ICONS/nap card @1,5x</title>
                                                        <desc>Created with Sketch.</desc><defs></defs><g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="SYSTEM-ICONS/nap-card-" fill="#337ab7" fill-rule="nonzero"><g id="Group-27" transform="translate(4.000000, 1.000000)"><path d="M16,6 L8,6 C7.445,6 7.005,6.445 7.005,7 L7,13 C7,13.555 7.445,14 8,14 L16,14 C16.555,14 17,13.555 17,13 L17,7 C17,6.445 16.555,6 16,6 Z M16,13 L8,13 L8,10 L16,10 L16,13 Z M16,8 L8,8 L8,7 L16,7 L16,8 Z" id="Shape"></path>
                                                            <path d="M13,5 L11,5 L11,16 L13,16 L13,19.6136364 C13,20.9309091 11.88,22 10.5,22 L2.5,22 C1.12,22 0,20.9309091 0,19.6136364 L0,2.38636364 C0,1.06909091 1.12,0 2.5,0 L10.5,0 C11.88,0 13,1.06909091 13,2.38636364 L13,5 Z M11,17 L11,2 L2,2 L2,17 L11,17 Z M6.5,21 C7.33,21 8,20.33 8,19.5 C8,18.67 7.33,18 6.5,18 C5.67,18 5,18.67 5,19.5 C5,20.33 5.67,21 6.5,21 Z" id="Shape"></path>
                                                        </g>
                                                        </g>
                                                        </g></svg>
                                                </div>
                                                <div class="_1grgP">Mua Thẻ Cào</div>
                                            </div>
                                        </a><a class="_1tmGj d0a4x col-3" aria-current="false" href="#">
                                            <div class="_35LNl">
                                                <div class="_3xVMY ">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                        <g fill="none" fill-rule="evenodd">
                                                            <path fill="#337ab7" fill-rule="nonzero" d="M21 11H3c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h18c1.1 0 2-.9 2-2v-8c0-1.1-.9-2-2-2zm-10 7H8v3H6v-3H3v-2h3v-3h2v3h3v2zm4.5 2c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm4-3c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z"></path>
                                                            <path stroke="#337ab7" stroke-width="2" d="M12.537 2c-.716 2.07-.716 3.831 0 5.283.716 1.451.626 3.018-.269 4.7"></path>
                                                        </g></svg>
                                                </div>
                                                <div class="_1grgP">Mua Thẻ Game</div>
                                            </div>
                                        </a>
                                    </div>
                                </section>
                                <section class="zvb34">
                                    <h4 class="_3g-LU">Tiện ích hóa đơn</h4>
                                    <div class="_-0SxP row">
                                        <a class="_1tmGj d0a4x col-3" aria-current="false" href="#">
                                            <div class="_35LNl">
                                                <div class="_3xVMY _34TXV">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
                                                        <defs>
                                                            <path id="a" d="M0 0h20v16H0z"></path>
                                                        </defs><g fill="none" fill-rule="evenodd"><g transform="translate(3 1)"><mask id="b" fill="#fff"><use xlink:href="#a"></use>
                                                        </mask>
                                                            <path fill="#337ab7" d="M1.906 9.6h.246c3.352 0 6.705 0 10.058.002.974 0 1.818.752 1.951 1.835.084.678.036 1.378.047 2.068.002.113 0 .226 0 .341H16.1c.005-.1.012-.19.012-.279 0-1.307.005-2.615 0-3.922-.01-1.845-1.268-3.25-2.909-3.251-3.693-.002-7.386 0-11.079 0h-.218V9.6zM12.57 0c.304.152.569.343.658.74.176.779-.237 1.39-.953 1.395-.837.005-1.673 0-2.509 0h-.28v2.111c.097.006.19.015.283.016 1.176 0 2.353-.015 3.529.004 2.039.035 3.78 1.459 4.452 3.618.18.58.251 1.18.25 1.791-.002 1.366.004 2.731-.002 4.097-.005 1.194.252 2.216-.596 2.216-.488 0-2.08.004-2.568 0-.317-.003-1.543 0-1.86 0-.7 0-.649-1.086-.657-2.152a68.736 68.736 0 0 1 .003-1.823c.004-.215-.045-.287-.246-.286-3.618.006-7.236.005-10.854.005h-.067C.588 11.77.17 11.55 0 10.897V5.048c.208-.642.645-.798 1.209-.793 2.034.018 4.07.007 6.104.007.085 0 .17-.01.256-.015V2.135h-.28c-.836 0-1.672.005-2.508-.002-.72-.007-1.13-.613-.954-1.394C3.916.344 4.18.15 4.486 0h8.083z" mask="url(#b)"></path>
                                                        </g>
                                                            <path fill="#337ab7" d="M16.714 19.258A1.258 1.258 0 0 1 17.956 18a1.273 1.273 0 0 1 1.258 1.249 1.255 1.255 0 0 1-1.249 1.251 1.242 1.242 0 0 1-1.25-1.242zM15.885 23.5a1.254 1.254 0 0 1-1.266-1.263A1.271 1.271 0 0 1 15.86 21a1.254 1.254 0 0 1 1.26 1.239 1.244 1.244 0 0 1-1.234 1.26zM18.762 22.248A1.248 1.248 0 0 1 20.017 21c.69.003 1.246.565 1.245 1.258a1.234 1.234 0 0 1-1.254 1.242 1.239 1.239 0 0 1-1.246-1.252z"></path>
                                                        </g></svg>
                                                </div>
                                                <div class="_1grgP">Hoá Đơn Nước</div>
                                            </div>
                                        </a><a class="_1tmGj d0a4x col-3" aria-current="false" href="#">
                                            <div class="_35LNl">
                                                <div class="_3xVMY _34TXV">
                                                    <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                        <title>SYSTEM ICONS/Internet@1,5x</title>
                                                        <desc>Created with Sketch.</desc><defs></defs><g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="SYSTEM-ICONS/Internet"><g id="if_globe_103571" transform="translate(3.000000, 3.000000)"><g id="background"><rect id="Rectangle-path" x="0" y="0" width="19" height="19"></rect>
                                                        </g>
                                                            <g id="earth" fill="#337ab7" fill-rule="nonzero">
                                                                <path d="M9.49940625,0 C4.253625,0.0011875 0.0011875,4.253625 0,9.49940625 C0.0011875,14.7469688 4.253625,18.9994062 9.49940625,19 C14.7469688,18.9988125 18.9994062,14.7469688 19,9.49940625 C18.9994062,4.253625 14.7469688,0.0011875 9.49940625,0 Z M1.218375,10.0943437 L4.18,10.0943437 C4.22215625,11.198125 4.3735625,12.1885 4.6075,13.0625 L2.00271875,13.0625 C1.5686875,12.1516875 1.2955625,11.1524062 1.218375,10.0943437 Z M10.09375,4.7511875 L10.09375,1.313375 C10.6524687,1.73196875 11.8696562,2.79834375 12.7258437,4.75178125 L10.09375,4.75178125 L10.09375,4.7511875 Z M13.1628437,5.93809375 C13.4169687,6.7913125 13.5867812,7.7816875 13.634875,8.90684375 L10.09375,8.90684375 L10.09375,5.93809375 L13.1628437,5.93809375 Z M8.6366875,1.52296875 C8.74,1.43746875 8.827875,1.36978125 8.90625,1.31159375 L8.90625,4.7511875 L6.2711875,4.7511875 C6.5846875,4.03690625 6.94628125,3.4401875 7.30609375,2.95034375 C7.79296875,2.28890625 8.27865625,1.821625 8.6366875,1.52296875 Z M8.90625,5.93809375 L8.90625,8.90684375 L5.3675,8.90684375 C5.41559375,7.77634375 5.5895625,6.7913125 5.84546875,5.93809375 L8.90625,5.93809375 Z M4.18,8.90684375 L1.218375,8.90684375 C1.29496875,7.849375 1.5675,6.84890625 2.00153125,5.93809375 L4.6075,5.93809375 C4.3735625,6.8126875 4.22215625,7.80365625 4.18,8.90684375 Z M5.36453125,10.0943437 L8.90625,10.0943437 L8.90625,13.0625 L5.8365625,13.0625 C5.5824375,12.209875 5.412625,11.2195 5.36453125,10.0943437 Z M8.90625,14.2505937 L8.90625,17.6878125 C8.348125,17.2698125 7.13034375,16.2040312 6.27415625,14.2505937 L8.90625,14.2505937 Z M10.3627187,17.477625 C10.26,17.563125 10.1715312,17.6302187 10.09375,17.689 L10.09375,14.2511875 L12.7282187,14.2511875 C12.4153125,14.964875 12.053125,15.561 11.6933125,16.0508437 C11.2070312,16.7110937 10.72075,17.1795625 10.3627187,17.477625 Z M10.09375,13.0625 L10.09375,10.0943437 L13.6319062,10.0943437 C13.5838125,11.22425 13.4098437,12.2092813 13.1545312,13.0625 L10.09375,13.0625 Z M14.82,10.0943437 L17.7804375,10.0943437 C17.7038437,11.1518125 17.4307187,12.1516875 16.9966875,13.0625 L14.3925,13.0625 C14.6258437,12.1885 14.77725,11.198125 14.82,10.0943437 Z M14.82,8.90684375 C14.77725,7.8030625 14.6264375,6.8126875 14.3919062,5.93809375 L16.9972812,5.93809375 C17.4313125,6.84890625 17.7044375,7.849375 17.7804375,8.90684375 L14.82,8.90684375 Z M16.3120937,4.7511875 L14.003,4.7511875 C13.4799062,3.3974375 12.7935312,2.3690625 12.152875,1.63103125 C13.853375,2.2051875 15.3050937,3.3095625 16.3120937,4.7511875 Z M6.84653125,1.63103125 C6.20646875,2.36965625 5.5195,3.39803125 4.997,4.7511875 L2.68790625,4.7511875 C3.6955,3.3095625 5.14721875,2.2051875 6.84653125,1.63103125 Z M2.6896875,14.2505937 L4.99759375,14.2505937 C5.5195,15.6019687 6.20528125,16.62975 6.84534375,17.3677812 C5.14721875,16.7942187 3.6966875,15.6910312 2.6896875,14.2505937 Z M12.1540625,17.3677812 C12.794125,16.62975 13.4799062,15.6019687 14.0024062,14.2505937 L16.3103125,14.2505937 C15.3033125,15.6910312 13.8527812,16.7942187 12.1540625,17.3677812 Z" id="Shape"></path>
                                                            </g>
                                                        </g>
                                                        </g>
                                                        </g></svg>
                                                </div>
                                                <div class="_1grgP">Hóa Đơn Internet</div>
                                            </div>
                                        </a>
                                    </div>
                                </section>
                                <!-- react-empty: 88 -->
                            </div>
                        </div>
                    </section>
                </div>

                <link href="../Content/gianhang/css/shopinfo.css" rel="stylesheet" />
                <style>
                    .btn-group, .btn-group, .btn-group {
                        margin-top: 0 !important;
                    }
                </style>
                <link href="../Content/gianhang/css/shopcustom.css" rel="stylesheet" />

            </div>
        </div>
    </div>
</asp:Content>