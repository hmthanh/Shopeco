<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btnEditPassword{
            cursor: pointer;
        }
    </style>
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
                            alert("Tài khoản này liên quan đến sản phẩm khác, không thể xóa tài khoản !")
                        }

                    }
                }
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=Delete_User&idUser=" + idUser, true);
                xmlhttp.send();
            }
        }
        function DeleteUser(idUser) {
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
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=DeleteUser&idUser=" + idUser, true);
                xmlhttp.send();
            }
        }

        function BlockUser(idUser) {
            if (confirm("Bạn có chắc muốn block ?")) {
                var xmlhttp;
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }
                else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        if (xmlhttp.responseText == "Blocked") {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=BlockUser&idUser=" + idUser, true);
                xmlhttp.send();
            }
        }
        function ActiveUser(idUser) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "Actived") {
                        window.location.reload();
                    }
                    else {
                        alert("Lỗi !")
                    }

                }
            }
            xmlhttp.open("GET", "../View/NguoiDung/Ajax_NguoiDung.aspx?Action=ActiveUser&idUser=" + idUser, true);
            xmlhttp.send();
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
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title">DANH SÁCH KHÁCH HÀNG</div>
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
                        <div>
							<table id="table" data-search="true" data-sort="true" data-show-columns="true" data-pagination="false" data-toggle="table" class="table table-bordered table-hover dataTable" style="text-align: center;">
								<thead>
									<tr>
										<th class='th' data-sortable="true">STT
										</th>
										<th class='th' data-sortable="true">Tài khoản
										</th>
										<th class='th' data-sortable="true">Mã khách hàng
										</th>
										<th class='th' data-sortable="true">Username
										</th>
										<th class='th' data-sortable="true">Mật khẩu
										</th>
										<th class='th' data-sortable="true">Mã gian hàng
										</th>
										<th class='th' data-sortable="true">Mã Rao Vặt
										</th>
										<th class='th'>Xóa
										</th>
										<th class='th'>Block
										</th>
									</tr>
								</thead>
								<tbody id="dvDanhSachNguoiDung" runat="server"></tbody>
							</table>
                        </div>
						<div style="padding: 10px 0;display:flex;justify-content:center;">
							<table>
								<tbody id="pagingFooter" runat="server">
								</tbody>
							</table>
						</div>
					</div>
					<div class="mt-10" style="margin-top: 20px;"></div>
					<table class="table table-bordered table-hover dataTable">
						<tbody>
							<tr>
								<td style="width: 300px;">Tổng số khách hàng</td>
								<td id="totalCol1" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng số gian hàng</td>
								<td id="totalCol2" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Tổng số kênh rao vặt</td>
								<td id="totalCol3" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Số khách hàng hoạt động</td>
								<td id="totalCol4" runat="server"></td>
							</tr>
							<tr>
								<td style="width: 300px;">Số khách hàng block</td>
								<td id="totalCol5" runat="server"></td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
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
    <script>
        $(document).ready(function () {
            $('.btnEditPassword').click(function () {

                var pass = $(this).data('password');
                var id = $(this).data('id');
                var name = '#pw' + id;
                var valPassword = $(name).html();
                if (valPassword == "******") {
                    $(name).html(pass);
                }
                else {
                    $(name).html("******");
                }
            });
        });
    </script>
</asp:Content>