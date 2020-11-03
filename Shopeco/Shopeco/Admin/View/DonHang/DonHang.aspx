<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="DonHang.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
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
            var Status = $("#ContentPlaceHolder1_slStatus").val().trim();

            if (NameOfCustomer == "") {
                alert("Hãy nhập tên khách hàng !");
            }
            else if (PhoneNumber == "") {
                alert("Hãy nhập số điện thoại !");
            }
            else if (Date == "") {
                alert("Hãy nhập ngày tạo đơn hàng !");
            }
            //else if (Email == "") {
            //    alert("Hãy nhập email khách hàng !");
            //}
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
                xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=Modify_Order&NameOfCustomer=" + NameOfCustomer + "&PhoneNumber=" + PhoneNumber + "&Address=" + Address + "&Note=" + Note + "&Date=" + Date + "&Email=" + Email + "&Status=" + Status, true);
                xmlhttp.send();
            }

        }
        function Edit_Order(idOrder)
        {
            var NameOfCustomer = $("#txtNameOfCustomer_Popup").val().trim();
            var PhoneNumber = $("#txtPhoneNumber_Popup").val().trim();
            var Address = $("#txtAddress_Popup").val().trim();
            var Note = $("#txtNote_Popup").val().trim();
            var Date = $("#txtDate_Popup").val().trim();
            var Email = $("#txtEmail_Popup").val().trim(); 
            var Status = $("#ContentPlaceHolder1_slStatus").val().trim();

            if (NameOfCustomer == "") {
                alert("Hãy nhập tên khách hàng !");
            }
            else if (PhoneNumber == "") {
                alert("Hãy nhập số điện thoại !");
            }
            else if (Date == "")
            {
                alert("Hãy nhập ngày tạo đơn hàng !");
            }
            //else if (Email == "") {
            //    alert("Hãy nhập email khách hàng !");
            //}
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
                        if (xmlhttp.responseText == "Edited")
                        {
                            window.location.reload();
                        }
                        else {
                            alert("Lỗi !")
                        }

                    }
                }
                xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=Edit_Order&NameOfCustomer=" + NameOfCustomer + "&PhoneNumber=" + PhoneNumber + "&Address=" + Address + "&Note=" + Note + "&Date=" + Date + "&Email=" + Email + "&idOrder=" + idOrder + "&Status=" + Status, true);
                xmlhttp.send();
            }
        }

        function ShowPopup_ModifyOrder()
        {
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
                        $("#ContentPlaceHolder1_slStatus").val(array[6]);

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
            xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=Get_Info_Order&idOrder=" + idOrder, true);
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
                xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=Delete_Order&idOrder=" + idOrder, true);
                xmlhttp.send();
            }
        }

        function ShowDetail(idOrder)
        {
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
            xmlhttp.open("GET", "../View/DonHang/Ajax_DonHang.aspx?Action=ShowDetail&idOrder=" + idOrder, true);
            xmlhttp.send();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title">DANH SÁCH ĐƠN HÀNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-6" style="visibility: hidden;">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <select id="slLoaiSPCapCha" runat="server" class="form-control select2"></select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <input type="text" id="txtTimKiem" runat="server" class="form-control" placeholder="Tìm kiếm theo tên khách hàng, số điện thoại" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-9">
                                </div>
                                <div class="col-sm-3">
                                    <div style="text-align: right;">
                                        <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                                        <a class="btn btn-primary" href="<%=GetRouteUrl("adminDonHang",new { }) %>"><i class="fa fa-refresh"></i></a>
                                        <a class="btn btn-primary" onclick="ShowPopup_ModifyOrder()" style="display:none;"><i class="glyphicon glyphicon-plus"></i>Thêm</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="dvDanhSachNguoiDung" runat="server">
                        </div>
                    </div>
                </div>
                <div id="lightXemQuyCach" class="white_content" style="top: 10%; width: 70%; left: 15%; height: auto; border-color: #3c8dbc;">
                    <div class="box">
                        <div id="dvQuyCach" class="box-body">
                            <div style="text-align: center; font-weight: bold; padding: 10px; font-size: 20px;" id="Popup_title">THÊM NGƯỜI DÙNG</div>
                            <div id="dvXemQuyCach" style="padding: 10px; text-align: center;">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;">
                                                <label><i class="fa fa-user"></i> Tên khách hàng</label>
                                                <input type="text" id="txtNameOfCustomer_Popup" class="form-control" placeholder="Nhập tên khách hàng" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-phone"></i> Số điện thoại</label>
                                                <input type="text" id="txtPhoneNumber_Popup" class="form-control" placeholder="Nhập số điện thoại" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-calendar"></i> Ngày nhập</label>
                                                <input type="text" id="txtDate_Popup" class="form-control" placeholder="Chọn ngày" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px;">
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-connectdevelop"></i> Địa chỉ</label>
                                                <input type="text" id="txtAddress_Popup" class="form-control" placeholder="Nhập địa chỉ" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-at"></i> Email khách hàng</label>
                                                <input type="text" id="txtEmail_Popup" class="form-control" placeholder="Nhập email khách hàng" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-sticky-note-o"></i> Tình trạng</label>
                                                <select id="slStatus" runat="server"   class="form-control" >
                                                    <option value="Mới">Mới</option>
                                                    <option value="Đang xử lý">Đang xử lý</option>
                                                    <option value="Hủy">Hủy</option>
                                                    <option value="Hoàn tất">Hoàn tất</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px;">
                                         
                                        <div class="col-lg-12">
                                            <div class="input-group" style="text-align: left;width: 100%;"> 
                                                <label><i class="fa fa-sticky-note-o"></i> Ghi chú</label>
                                                <input type="text" id="txtNote_Popup" class="form-control" placeholder="Nhập ghi chú" />
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
                </div>
                <div id="fadeXemQuyCach" onclick="DongXemQuyCach()" class="black_overlay"></div>




                 <div id="lightXemQuyCach2" class="white_content" style="top: 10%; width: 70%; left: 15%; height: auto; border-color: #3c8dbc;">
                    <div class="box">
                        <div id="dvQuyCach2" class="box-body">
                            <div style="text-align: center; font-weight: bold; padding: 10px; font-size: 20px;" id="Popup_title2">CHI TIẾT ĐƠN HÀNG</div>
                            <div id="dvXemQuyCach2" style="padding: 10px; text-align: center;">
                                <div class="form-group">
                                    <div class="row"> 
                                        <table class='table table-bordered table-striped' style='width: 100%; radius: 2px;'>
                                            <thead>
                                                <tr>
                                                    <th class='th' style='font-size: 15px; color: white;'>STT</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Tên hàng hoá</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Màu</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Size</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Số lượng</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Đơn giá</th>
                                                    <th class='th' style='font-size: 15px; color: white;'>Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tbody_DetailOrder">
                                                <%--<tr>
                                                <td style="text-align: center;">1</td> 
                                                    <td style="text-align: center;">Công trình 1</td>
                                                     <td style="text-align: center;">TPHCM</td>
                                                      <td style="text-align: center;">10/08/2018</td>
                                                     <td style="text-align: center;">12/12/2018</td>
                                                </tr>--%>
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
</asp:Content>
