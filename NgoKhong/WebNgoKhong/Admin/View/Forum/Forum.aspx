<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
        });
        function hasUnicode(str) {
            for (var i = 0; i < str.length; i++) {
                if (str.charCodeAt(i) > 127) return true;
            }
            return false;
        }
        function Modify_User() {
            var UserName = $("#txtTenDangNhap_Popup").val().trim();
            var Password = $("#txtMatKhau_Popup").val().trim();
            var FullName = $("#txtHoTen_Popup").val().trim();
            var Address = $("#txtDiaChi_Popup").val().trim();
            var PhoneNumber = $("#txtSoDienThoai_Popup").val().trim();

            if (UserName == "") {
                alert("Hãy nhập tên đăng nhập !");
            }
            else if (Password == "") {
                alert("Hãy nhập mật khẩu !");
            }
            else if (hasUnicode(UserName)) {
                alert("Tên đăng nhập không chứa ký tự dấu tiếng việt");
            }
            else if (hasUnicode(Password)) {
                alert("Mật khẩu không chứa ký tự dấu tiếng việt");
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
                        if (xmlhttp.responseText == "Existential") {
                            alert("Tên đăng nhập trùng trong hệ thống");
                        }
                        else if (xmlhttp.responseText == "Modified") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=Modify_User&UserName=" + UserName + "&Password=" + Password + "&FullName=" + FullName + "&Address=" + Address + "&PhoneNumber=" + PhoneNumber, true);
                xmlhttp.send();
            }

        }
        function Edit_User() {
            var UserName = $("#txtTenDangNhap_Popup").val().trim();
            var Password = $("#txtMatKhau_Popup").val().trim();
            var FullName = $("#txtHoTen_Popup").val().trim();
            var Address = $("#txtDiaChi_Popup").val().trim();
            var PhoneNumber = $("#txtSoDienThoai_Popup").val().trim();

            if (UserName == "") {
                alert("Hãy nhập tên đăng nhập !");
            }
            else if (Password == "") {
                alert("Hãy nhập mật khẩu !");
            }
            else if (hasUnicode(UserName)) {
                alert("Tên đăng nhập không chứa ký tự dấu tiếng việt");
            }
            else if (hasUnicode(Password)) {
                alert("Mật khẩu không chứa ký tự dấu tiếng việt");
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
                        if (xmlhttp.responseText == "Existential") {
                            alert("Tên đăng nhập trùng trong hệ thống");
                        }
                        else if (xmlhttp.responseText == "Edited") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=Edit_User&UserName=" + UserName + "&Password=" + Password + "&FullName=" + FullName + "&Address=" + Address + "&PhoneNumber=" + PhoneNumber, true);
                xmlhttp.send();
            }
        }

        function ShowPopup_ModifyUser() {
            $("#txtTenDangNhap_Popup").val('');
            $("#txtMatKhau_Popup").val('');
            $("#txtHoTen_Popup").val('');
            $("#txtSoDienThoai_Popup").val('');
            $("#txtDiaChi_Popup").val('');

            $("#Popup_title").html("THÊM MỚI KHÁCH HÀNG");
            $("#btn_Action_Popup").html("<i class='glyphicon glyphicon-plus'></i>Thêm");
            $("#btn_Action_Popup").attr("onclick", "Modify_User()");
            document.getElementById("txtMatKhau_Popup").type = 'password';
            document.getElementById("txtTenDangNhap_Popup").disabled = false;
            MoXemQuyCach();
        }
        function ShowPopup_EditUser(idUser) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText != "") {
                        var array = xmlhttp.responseText.split("@_@");

                        $("#txtTenDangNhap_Popup").val(array[0]);
                        $("#txtMatKhau_Popup").val(array[1]);
                        $("#txtHoTen_Popup").val(array[2]);
                        $("#txtSoDienThoai_Popup").val(array[3]);
                        $("#txtDiaChi_Popup").val(array[4]);

                        document.getElementById("txtMatKhau_Popup").type = 'text';
                        document.getElementById("txtTenDangNhap_Popup").disabled = true;
                        $("#btn_Action_Popup").html("Cập nhật");
                        $("#Popup_title").html("CẬP NHẬT KHÁCH HÀNG");
                        $("#btn_Action_Popup").attr("onclick", "Edit_User()");
                        MoXemQuyCach();
                    }
                    else {
                        alert("Lỗi !")
                    }

                }
            }
            xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=GetCusomerUser&idUser=" + idUser, true);
            xmlhttp.send();
        }

        //function ShowPopup_EditUser(idUser) {
        //    var xmlhttp;
        //    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        //        xmlhttp = new XMLHttpRequest();
        //    }
        //    else {// code for IE6, IE5
        //        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        //    }
        //    xmlhttp.onreadystatechange = function () {
        //        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        //            if (xmlhttp.responseText != "") {
        //                var array = xmlhttp.responseText.split("@_@");

        //                $("#txtTenDangNhap_Popup").val(array[0]);
        //                $("#txtMatKhau_Popup").val(array[1]);
        //                $("#txtHoTen_Popup").val(array[2]);
        //                $("#txtSoDienThoai_Popup").val(array[3]);
        //                $("#txtDiaChi_Popup").val(array[4]);

        //                document.getElementById("txtMatKhau_Popup").type = 'text';
        //                document.getElementById("txtTenDangNhap_Popup").disabled = true;
        //                $("#btn_Action_Popup").html("Cập nhật");
        //                $("#Popup_title").html("CẬP NHẬT KHÁCH HÀNG");
        //                $("#btn_Action_Popup").attr("onclick", "Edit_User()");
        //                MoXemQuyCach();
        //            }
        //            else {
        //                alert("Lỗi !")
        //            }

        //        }
        //    }
        //    xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=GetCusomerUser&idUser=" + idUser, true);
        //    xmlhttp.send();
        //}

        function Delete_User(idUser) {
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
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=DeleteRaoVat&idUser=" + idUser, true);
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
            xmlhttp.open("GET", "../View/DonHang/DsDonHangNguoiDung.aspx?Action=DsDonHangNguoiDung&idOrder=" + idOrder, true);
            xmlhttp.send();
        }

        function HienThiDanhSach(idOrder) {
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
            xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=DsDonHangNguoiDung&idOrder=" + idOrder, true);
            xmlhttp.send();
            //$.ajax({
            //    type: "GET",
            //    url: "/Ajax/Ajax_GianHang.aspx",
            //    data: "{action: DsDonHangNguoiDung ,userID:'" + userID + "'}",
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function (data) {
            //        alert(data);
            //        //$("#tbody_DetailOrder").html(xmlhttp.responseText);
            //        //MoXemQuyCach2();
            //    }
            //});


            //var array = xmlhttp.responseText.split("@_@");

            //$("#txtTenDangNhap_Popup").val(array[0]);
            //$("#txtMatKhau_Popup").val(array[1]);
            //$("#txtHoTen_Popup").val(array[2]);
            //$("#txtSoDienThoai_Popup").val(array[3]);
            //$("#txtDiaChi_Popup").val(array[4]);

            //document.getElementById("txtMatKhau_Popup").type = 'text';
            //document.getElementById("txtTenDangNhap_Popup").disabled = true;
            //$("#btn_Action_Popup").html("Cập nhật");
            //$("#Popup_title").html("CẬP NHẬT KHÁCH HÀNG");
            //$("#btn_Action_Popup").attr("onclick", "Edit_User()");
            //MoXemQuyCach();
            //$.ajax({

            //});

            //var xmlhttp;
            //if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            //    xmlhttp = new XMLHttpRequest();
            //}
            //else {// code for IE6, IE5
            //    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            //}
            //xmlhttp.onreadystatechange = function () {
            //    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //        if (xmlhttp.responseText != "") {

            //        }
            //        else {
            //            alert("Lỗi !")
            //        }

            //    }
            //}
            //xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=GetCusomerUser&idUser=" + idUser, true);
            //xmlhttp.send();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title">DANH SÁCH RAO VẶT</div>
                <div class="box">
                    <div class="box-body">
                        <%--<div class="form-group">
                            <div class="row">
                                <div class="col-lg-6" style="visibility: hidden;">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <select id="slLoaiSPCapCha" runat="server" class="form-control select2"></select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    
                                </div>
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <input type="text" id="txtTimKiem" runat="server" class="form-control" placeholder="Tìm kiếm theo họ tên, tên đăng nhập" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div style="text-align: right;">
                                        <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                                        <a class="btn btn-primary" href="<%=GetRouteUrl("adminUser",new { }) %>"><i class="fa fa-refresh"></i></a>
                                        <a class="btn btn-primary" onclick="ShowPopup_ModifyUser()"><i class="glyphicon glyphicon-plus"></i>Thêm</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="dvDanhSachNguoiDung" runat="server">
                        </div>
                    </div>
                </div>
                <div id="lightXemQuyCach2" class="white_content" style="top: 10%; width: 70%; left: 15%; height: auto; border-color: #3c8dbc;">
                    <div class="box editHeight">
                        <div id="dvQuyCach2" class="box-body">
                            <div style="text-align: center; font-weight: bold; padding: 10px; font-size: 20px;" id="Popup_title2">CHI TIẾT ĐƠN HÀNG</div>
                            <div id="dvXemQuyCach2" style="padding: 10px; text-align: center;">
                                <div class="form-group">
                                    <div class="row"> 
                                        <table class='table table-bordered table-striped' style='width: 100%; radius: 2px;'>
                                            <%--<thead>
                                                <tr>
                                                    <th class='th' style='font-size: 15px; color: white;'>STT</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Tên hàng hoá</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Màu</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Size</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Số lượng</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Đơn giá</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Thành tiền</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Gian hàng</th>
                                                </tr>
                                            </thead>--%>
                                            <tbody id="tbody_DetailOrder">
                                            </tbody>
                                        </table> 
                                </div>
                                </div>
                                <div style="text-align: center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="fadeXemQuyCach2" onclick="DongXemQuyCach2()" class="black_overlay"></div>

                <%--<div id="lightXemDanhSach" class="white_content" style="top: 10%; width: 70%; left: 15%; height: auto; border-color: #3c8dbc;">
                    <div class="box">
                        <div id="dvDanhSach" class="box-body">
                            <div style="text-align: center; font-weight: bold; padding: 10px; font-size: 20px;" id="Popup_title">THÊM KHÁCH HÀNG</div>
                            <div id="dvXemDanhSach" style="padding: 10px; text-align: center;">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                                <input type="text" id="txtTenDangNhap_Popup" class="form-control" placeholder="Nhập tên đăng nhập" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                                <input type="password" id="txtMatKhau_Popup" class="form-control" placeholder="Nhập mật khẩu" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 50px;">
                                        <div class="col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                                <input type="text" id="txtHoTen_Popup" class="form-control" placeholder="Nhập họ tên" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                                <input type="text" id="txtSoDienThoai_Popup" class="form-control" placeholder="Nhập số điện thoại" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                <input type="text" id="txtDiaChi_Popup" class="form-control" placeholder="Nhập địa chỉ" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                        </div>
                                        <div class="col-lg-4">
                                            <a class="btn btn-primary" style="margin-top: 50px;" id="btn_Action_Popup"><i class="glyphicon glyphicon-plus"></i>Thêm</a>
                                        </div>
                                        <div class="col-lg-4">
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align: center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <div id="puListOrder" class="white_content" style="top: 10%; width: 70%; left: 15%; height: auto; border-color: #3c8dbc;">
                    <div class="box editHeight">
                        <div id="dvListOrder" class="box-body">
                            <div style="text-align: center; font-weight: bold; padding: 10px; font-size: 20px;" id="titleListOrder">DANH SÁCH KHÁCH HÀNG</div>
                            <div id="ctListOrder" style="padding: 10px; text-align: center;">
                                <div class="form-group"></div>
                                <div style="text-align: center"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="fadeXemQuyCach" onclick="showOrder()" class="black_overlay"></div>
                <div id="fadeXemDanhSach" onclick="hideOrder()" class="black_overlay"></div>
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

                function MoDanhSach() {
                    document.getElementById('lightXemDanhSach').style.display = 'block';
                    document.getElementById('fadeXemDanhSach').style.display = 'block';
                }
                function DongXemDanhSach() {
                    document.getElementById('lightXemDanhSach').style.display = 'none';
                    document.getElementById('fadeXemDanhSach').style.display = 'none';
                }
                /////////////////////////////////////////////////////
                function DongXemQuyCach2() {
                    document.getElementById('lightXemQuyCach2').style.display = 'none';
                    document.getElementById('fadeXemQuyCach2').style.display = 'none';
                }

                function MoXemQuyCach2() {
                    document.getElementById('lightXemQuyCach2').style.display = 'block';
                    document.getElementById('fadeXemQuyCach2').style.display = 'block';
                }
                /////////////////////////////////////////////////////
                function showOrder() {
                    document.getElementById('puListOrder').style.display = 'block';
                    document.getElementById('dvListOrder').style.display = 'block';
                }
                function hideOrder() {
                    document.getElementById('puListOrder').style.display = 'none';
                    document.getElementById('dvListOrder').style.display = 'none';
                }
            </script>
        </div>
</asp:Content>