<%@ Page Language="C#" ValidateRequest="false" EnableEventValidation="true" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="SaleOrders.aspx.cs" Inherits="GianHang_SaleOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
    <style>
        .btn {
            min-width: 50px;
        }

        .modal-title {
            text-align: center;
            font-weight: bold;
            padding: 10px;
            width: 100%;
            font-size: 20px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#ember4562').addClass("active");
        });
    </script>
    <%--<div class="portal-panel">
        <div class="tab-action">
            
            <div class="tabs">
                <a href="/portal/sale" id="ember1021" class="tabs__tab ember-view">Tất cả</a><a href="/portal/sale?type=unpaid" id="ember1022" class="tabs__tab ember-view"> Chờ xác nhận</a><a href="/portal/sale?type=toship" id="ember1023" class="tabs__tab ember-view"><div id="ember1032" class="shopee-tooltip shopee-tooltip--disabled shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                    Chờ lấy hàng<!---->

                    <div class="placeholder" style=""><em>0</em> đơn hàng chờ giao</div>

                    <div id="ember1041" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                        <div style="width: auto; height: auto; left: 0px; top: 12px; white-space: nowrap;" class="shopee-overlay__content">
                            <!---->
                        </div>
                    </div>
                </div>
                </a><a href="/portal/sale?type=shipping" id="ember1042" class="tabs__tab active active ember-view">
                    <div id="ember1043" class="shopee-tooltip shopee-tooltip--disabled shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                        Đang giao<!---->

                        <div class="placeholder" style=""><em>0</em> đơn hàng đang giao</div>

                        <div id="ember1044" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                            <div style="width: auto; height: auto; left: 0px; top: 12px; white-space: nowrap;" class="shopee-overlay__content">
                                <!---->
                            </div>
                        </div>
                    </div>
                </a><a href="/portal/sale?type=completed" id="ember1045" class="tabs__tab ember-view">Hoàn thành</a><a href="/portal/sale?type=cancelled" id="ember1046" class="tabs__tab ember-view"><div id="ember1047" class="shopee-tooltip shopee-tooltip--disabled shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                    Đã huỷ<!---->

                    <div class="placeholder" style=""><em>0</em> yêu cầu tạm hoãn</div>

                    <div id="ember1048" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                        <div style="width: auto; height: auto; left: 0px; top: 12px; white-space: nowrap;" class="shopee-overlay__content">
                            <!---->
                        </div>
                    </div>
                </div>
                </a><a href="/portal/sale?type=refund" id="ember1049" class="tabs__tab ember-view">
                    <div id="ember1050" class="shopee-tooltip shopee-tooltip--disabled shopee-tooltip--bottom shopee-tooltip--actionable shopee-tooltip--auto ember-view">
                        Trả hàng/Hoàn tiền<!---->

                        <div class="placeholder" style=""><em>0</em> yêu cầu tạm hoãn</div>

                        <div id="ember1051" class="shopee-overlay shopee-overlay--s closed shopee-overlay--anchored shopee-overlay--anchor-s ember-view">
                            <div style="width: auto; height: auto; left: 0px; top: 12px; white-space: nowrap;" class="shopee-overlay__content">
                                <!---->
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>












    <div class="wrapper portal-sale-wrapper">
        <!---->
        <div style="height: 40px; margin-bottom: 16px;" class="grid">
            <div class="col-8 grid">
                <div id="order-search-wrapper">
                    <div id="ember1062" class="shopee-textbox search ember-view">
                        <div class="icon">
                            <svg viewBox="0 0 32 32">
                                <path d="M31.7 31.7c-.4.4-1 .4-1.3 0l-8.9-8.9c-2.3 2-5.2 3.2-8.5 3.2-7.2 0-13-5.8-13-13S5.8 0 13 0s13 5.8 13 13c0 3.2-1.2 6.2-3.2 8.5l8.9 8.9c.4.3.4.9 0 1.3zM24 13c0-6.1-4.9-11-11-11S2 6.9 2 13s4.9 11 11 11 11-4.9 11-11z"></path></svg>
                        </div>
                        <!---->
                        <div class="shopee-validation-toast  "></div>
                        <div class="input">
                            <input type="text" placeholder="Tìm đơn hàng" maxlength="50" id="ember1071" class="ember-text-field ember-view">
                        </div>
                        <!---->
                        <!---->
                        <!---->
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="grid with-gap text-right order-export">
                    <span class="col">Ngày đặt hàng:</span><div id="ember1076" class="col grid shopee-date-range ember-view">
                        <div id="ember1085" class="shopee-date-range__from shopee-datepicker ember-view">
                            <div class="input shopee-datepicker__input">
                                <input type="text" id="ember1086" class="ember-text-field ember-view">
                            </div>
                            <div class="icon shopee-datepicker__icon">
                                <svg viewBox="0 0 32 32">
                                    <path d="M26 2h-2.5V1h-2v1h-11V1h-2v1H6a5 5 0 0 0-5 5v19a5 5 0 0 0 5 5h20a5 5 0 0 0 5-5V7a5 5 0 0 0-5-5zM3 7a3 3 0 0 1 3-3h2.5v2h2V4h11v2h2V4H26a3 3 0 0 1 3 3v1H3zm26 19a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V10h26zm-18-8H7v-4h4zm7 0h-4v-4h4zm-7 7H7v-4h4zm14 0h-4v-4h4zm0-7h-4v-4h4zm-7 7h-4v-4h4z"></path></svg>
                            </div>
                            <div class="shopee-validation-toast "></div>
                        </div>
                        <div class="shopee-date-range__dash"></div>
                        <div id="ember1087" class="shopee-date-range__to shopee-datepicker ember-view">
                            <div class="input shopee-datepicker__input">
                                <input type="text" id="ember1088" class="ember-text-field ember-view">
                            </div>
                            <div class="icon shopee-datepicker__icon">
                                <svg viewBox="0 0 32 32">
                                    <path d="M26 2h-2.5V1h-2v1h-11V1h-2v1H6a5 5 0 0 0-5 5v19a5 5 0 0 0 5 5h20a5 5 0 0 0 5-5V7a5 5 0 0 0-5-5zM3 7a3 3 0 0 1 3-3h2.5v2h2V4h11v2h2V4H26a3 3 0 0 1 3 3v1H3zm26 19a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V10h26zm-18-8H7v-4h4zm7 0h-4v-4h4zm-7 7H7v-4h4zm14 0h-4v-4h4zm0-7h-4v-4h4zm-7 7h-4v-4h4z"></path></svg>
                            </div>
                            <div class="shopee-validation-toast "></div>
                        </div>
                    </div>
                    <div class="col">
                        <div id="ember1093" class="shopee-button shopee-button--inactive ember-view">Xuất</div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <!---->
        <div class="order-list-header">
            <span class="order-list-header__products">Sản phẩm</span><span class="order-list-header__order-total text-center">Tổng Đơn hàng</span><span class="order-list-header__status">Tình trạng <span class="order-list-header__status-countdown ">Đếm ngược</span></span><span class="order-list-header__channel"><div tabindex="0" id="ember1100" class="order-list-header__channel-dropdown shopee-dropdown ember-view">
                <div class="scs-dropdown " data-ember-action="" data-ember-action-1101="1101">
                    <div id="ember1110" class="shopee-dropdown-item preview ember-view">
                        <!---->
                        Đơn vị vận chuyển
                    </div>
                    <svg viewBox="0 0 32 32">
                        <path d="M28.2 11.1l-10.9 12s0 .1-.1.2c-.2.2-.5.3-.7.3-.3 0-.5-.1-.7-.3 0 0 0-.1-.1-.2l-10.9-12c-.4-.4-.4-1 0-1.3.4-.4 1-.4 1.3 0l10.4 11.3L26.9 9.8c.4-.4 1-.4 1.3 0 .4.4.4 1 0 1.3z"></path></svg>
                </div>
                <div class="shopee-validation-toast "></div>
                <div id="ember1133" class="lf-fade liquid-container ember-view">
                    <!---->
                </div>
            </div>
            </span><span class="order-list-header__actions text-center">Thao tác</span>
        </div>
        <div class="order-items ">
            <div id="ember1337" class="no-result center ember-view">
                <span class="no-result__image ic-no-order"></span>
                <div class="center no-result__text">Không tìm thấy đơn hàng</div>
            </div>
        </div>
    </div>--%>
    <script>
        $(document).ready(function () {
        });
        function Modify_Order() {
            var NameOfCustomer = $("#txtNameOfCustomer_Popup").val().trim();
            var PhoneNumber = $("#txtPhoneNumber_Popup").val().trim();
            var Address = $("#txtAddress_Popup").val().trim();
            var Note = $("#txtNote_Popup").val().trim();
            var Date = $("#txtDate_Popup").val().trim();
            var Email = $("#txtEmail_Popup").val().trim();
            var Status = $("#maincontent_mainboard_slStatus").val().trim();

            if (NameOfCustomer == "") {
                alert("Hãy nhập tên khách hàng !");
            }
            else if (PhoneNumber == "") {
                alert("Hãy nhập số điện thoại !");
            }
            else if (Date == "") {
                alert("Hãy nhập ngày tạo đơn hàng !");
            }
            else if (Email == "") {
                alert("Hãy nhập email khách hàng !");
            }
            else {
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "Modified") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../Ajax/Ajax_DonHang.aspx?Action=Modify_Order&NameOfCustomer=" + NameOfCustomer + "&PhoneNumber=" + PhoneNumber + "&Address=" + Address + "&Note=" + Note + "&Date=" + Date + "&Email=" + Email + "&Status=" + Status, true);
                xmlhttp.send();
            }

        }
        function Edit_Order(idOrder) {
            var NameOfCustomer = $("#txtNameOfCustomer_Popup").val().trim();
            var PhoneNumber = $("#txtPhoneNumber_Popup").val().trim();
            var Address = $("#txtAddress_Popup").val().trim();
            var Note = $("#txtNote_Popup").val().trim();
            var Date = $("#txtDate_Popup").val().trim();
            var Email = $("#txtEmail_Popup").val().trim();
            var Status = $("#maincontent_mainboard_slStatus").val().trim();

            if (NameOfCustomer == "") {
                alert("Hãy nhập tên khách hàng !");
            }
            else if (PhoneNumber == "") {
                alert("Hãy nhập số điện thoại !");
            }
            else if (Date == "") {
                alert("Hãy nhập ngày tạo đơn hàng !");
            }
            else if (Email == "") {
                alert("Hãy nhập email khách hàng !");
            }
            else {
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "Edited") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../Ajax/Ajax_DonHang.aspx?Action=Edit_Order&NameOfCustomer=" + NameOfCustomer + "&PhoneNumber=" + PhoneNumber + "&Address=" + Address + "&Note=" + Note + "&Date=" + Date + "&Email=" + Email + "&idOrder=" + idOrder + "&Status=" + Status, true);
                xmlhttp.send();
            }
        }

        function ShowPopup_ModifyOrder() {
            $("#txtNameOfCustomer_Popup").val('');
            $("#txtPhoneNumber_Popup").val('');
            $("#txtAddress_Popup").val('');
            $("#txtNote_Popup").val('');
            $("#txtDate_Popup").val('');
            $("#txtEmail_Popup").val('');

            $("#Popup_title").html("THÊM MỚI ĐƠN HÀNG");
            $("#btn_Action_Popup").html("<i class='glyphicon glyphicon-plus'></i>Thêm");
            $("#btn_Action_Popup").attr("onclick", "Modify_Order()");
            MoXemQuyCach();
        }
        function ShowPopup_EditOrder(idOrder) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText != "") {
                        var array = xmlhttp.responseText.split("@_@");

                        $("#txtNameOfCustomer_Popup").val(array[0]);
                        $("#txtPhoneNumber_Popup").val(array[1]);
                        $("#txtAddress_Popup").val(array[2]);
                        $("#txtNote_Popup").val(array[3]);
                        $("#txtDate_Popup").val(array[4]);
                        $("#txtEmail_Popup").val(array[5]);
                        $("#maincontent_mainboard_slStatus").val(array[6]);

                        $("#btn_Action_Popup").html("Cập nhật");
                        $("#Popup_title").html("CẬP NHẬT ĐƠN HÀNG");
                        $("#btn_Action_Popup").attr("onclick", "Edit_Order(" + idOrder + ")");
                        MoXemQuyCach();
                    }
                    else {
                        alert("Lỗi !")
                    }

                }
            }
            xmlhttp.open("GET", "../Ajax/Ajax_DonHang.aspx?Action=Get_Info_Order&idOrder=" + idOrder, true);
            xmlhttp.send();
        }

        function Delete_Order(idOrder) {
            if (confirm("Bạn có chắc muốn xoá ?")) {
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "Deleted") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../Ajax/Ajax_DonHang.aspx?Action=Delete_Order&idOrder=" + idOrder, true);
                xmlhttp.send();
            }
        }

        function ShowDetail(idOrder) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    {
                        $("#tbody_DetailOrder").html(xmlhttp.responseText);
                        MoXemQuyCach2();
                    }

                }
            }
            xmlhttp.open("GET", "../Ajax/Ajax_DonHang.aspx?Action=ShowDetail&idOrder=" + idOrder, true);
            xmlhttp.send();
        }
    </script>
    <form runat="server">
        <div class="main-container container">
            <div class="row"><%=GetDuongDan() %></div>
            <%--<div class="row">
                <div id="content" class="col-sm-12">
                    <div class="about-us about-demo-4">
                        <div style="margin: 40px;" id="dvContent" runat="server">
                        </div>
                    </div>

                </div>
            </div>--%>
        </div>
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div id="ember6145" class="shop-setting-header ember-view">
                    <div class="shop-setting-header__content " style="padding-left: 20%">
                        <div style="background: #49cbdd;" class="shop-setting-header__icon">
                            <%--<svg viewBox="0 0 32 32" style=" height: 25px;width:25px">--%>
                            <%--<path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>--%>
                        </div>
                        <div class="shop-setting-header__caption ">
                            <%--       <div class="shop-setting-header__title">Quản lý đơn mua hàng</div>--%>
                            <%--<div class="shop-setting-header__subtitle">Danh sách đơn hàng</div>--%>
                        </div>
                    </div>
                    <hr class="shop-setting-header__seperator">
                </div>
                <div class="box">
                    <div class="box-body">
                        <%--<div class="form-group">
                            <div class="row" style="padding-left: 20%">
                                <div class="col-md"></div>
                                <div class="col-md">
                                    <div class="form-group">
                                        <input type="text" id="txtTenSanPham" runat="server" class="form-control" placeholder="Mã đơn hàng" style="width: 500px;" />

                                    </div>
                                </div>
                                <div class="col-sm">
                                    <div style="text-align: right; padding-right: 2%">
                                        <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span>Tìm kiếm</span></asp:LinkButton>
                                        <a class="btn btn-primary" href="<%=GetRouteUrl("dangnhap_saleorder",new { }) %>"><i class="fa fa-refresh"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="container">
                            <table id='datatableBootstrap' class='table table-striped table-bordered'>
                                <thead>
                                    <tr>
                                        <th class='th'>STT
                                        </th>
                                        <th class='th'>Mã sản phẩm
                                        </th>
                                        <th class='th'>Tên sản phẩm
                                        </th>
                                        <th class='th'>Mã đơn hàng
                                        </th>
                                        <th class='th'>Ngày đặt hàng
                                        </th>
                                        <th class='th'>Số lượng
                                        </th>
                                        <th class='th'>Đơn giá
                                        </th>
                                        <th class='th'>Thành tiền
                                        </th>
                                        <th class='th'>Tình trạng
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="dvDanhSachNguoiDung" runat="server">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style>
                    #datatableBootstrap_wrapper .row {
                        width: 100%;
                    }

                    table.table-bordered.dataTable tbody th, table.table-bordered.dataTable tbody td {
                        border-bottom-width: 0;
                        vertical-align: middle;
                    }

                    .table > caption + thead > tr:first-child > td, .table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > td, .table > thead:first-child > tr:first-child > th {
                        border-top: 0;
                        vertical-align: middle;
                        text-align: center;
                    }

                    div.dataTables_wrapper div.dataTables_length select {
                        margin: 0 10px;
                    }
                    select.input-sm {
                        line-height: 20px !important;
                    }
                </style>
                <%--......................................................................--%>
                
                <script>
                    $('#chiTietDonHang').on('show.bs.modal', function (event) {
                        var button = $(event.relatedTarget) // Button that triggered the modal
                        //var recipient = button.data('whatever') // Extract info from data-* attributes
                        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                        //var modal = $(this)
                        //modal.find('.modal-title').text('New message to ' + recipient)
                        //modal.find('.modal-body input').val(recipient)
                    })
                </script>
                <%--......................................................................--%>
                
                <script>
                    $('#chinhSuaDonHang').on('show.bs.modal', function (event) {
                        var button = $(event.relatedTarget) // Button that triggered the modal

                        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                        var modal = $(this)
                        //modal.find('.modal-title').text('New message to ' + recipient)
                        //modal.find('.modal-body input').val(recipient)
                    })
                </script>
                <%--......................................................................--%>
                <div id="fadeXemQuyCach" onclick="DongXemQuyCach()" class="black_overlay"></div>
                <div id="fadeXemQuyCach2" onclick="DongXemQuyCach2()" class="black_overlay"></div>
            </section>
            <!-- /.content -->
            <script>
                function DongXemQuyCach() {
                    document.getElementById('lightXemQuyCach').style.display = 'none';
                    document.getElementById('fadeXemQuyCach').style.display = 'none';
                }

                function MoXemQuyCach() {
                    document.getElementById('lightXemQuyCach').style.display = 'block';
                    document.getElementById('fadeXemQuyCach').style.display = 'block';
                }
                function DongXemQuyCach2() {
                    document.getElementById('lightXemQuyCach2').style.display = 'none';
                    document.getElementById('fadeXemQuyCach2').style.display = 'none';
                }

                function MoXemQuyCach2() {
                    document.getElementById('lightXemQuyCach2').style.display = 'block';
                    document.getElementById('fadeXemQuyCach2').style.display = 'block';
                }
            </script>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('#datatableBootstrap').DataTable();

            $("#page_kiemtrahang").addClass("active");
        });
    </script>
</asp:Content>
