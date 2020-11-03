<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MainBoard.master" CodeFile="SaleOrders.aspx.cs" Inherits="GianHang_SaleOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
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

    <script>
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
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div id="ember6145" class="shop-setting-header ember-view">
                    <div class="shop-setting-header__content">
                        <div style="background: #49cbdd;" class="shop-setting-header__icon">
                            <svg viewBox="0 0 32 32">
                                <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                        </div>
                        <div class="shop-setting-header__caption ">
                            <div class="shop-setting-header__title">Quản lý đơn bán hàng</div>
                            <div class="shop-setting-header__subtitle">Danh sách đơn hàng</div>
                        </div>
                    </div>
                    <hr class="shop-setting-header__seperator">
                </div>
                
                <div>
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
        });
    </script>
</asp:Content>