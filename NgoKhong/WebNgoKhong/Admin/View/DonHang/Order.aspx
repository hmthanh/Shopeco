<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Admin_View_SanPham_LoaiSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	

    <%--<link href="../../../Content/admin/bootstrap-table.css" rel="stylesheet" />--%>
	<%--<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.13.4/dist/bootstrap-table.min.css">--%>
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
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="title" id="title_page" runat="server">DANH SÁCH ĐƠN HÀNG</div>
                <div class="box">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        <select id="slGianHang" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;"></select>
                                    </div>
                                </div>
								<div class="col-lg-3">
                                    <input type="text" id="txtDateFrom" runat="server" class="form-control datepicker" placeholder="Lọc theo ngày bắt đầu" style="width: 200px; padding-left: 15px;"/>
									<input type="text" id="txtDateTo" runat="server" class="form-control datepicker" placeholder="Lọc theo ngày kết thúc" style="width: 200px; padding-left: 15px; margin-top: 15px;"/>
                                </div>
								<div class="col-lg-3">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
										<select id="slStatus" runat="server" class="form-control select2" data-placeholder="Select a State" style="width: 100%;">
											<option value="0" selected="selected">Tất cả</option>
											<option value="1">Mới</option>
											<option value="2">Đang xử lý</option>
											<option value="3">Hủy</option>
											<option value="4">Hoàn tất</option>
										</select>
									</div>
                                </div>
                                <div class="col-lg-2">
                                    <asp:LinkButton class="btn btn-primary" runat="server" OnClick="btTimKiem_Click"><i class="fa fa-search"></i><span> Tìm kiếm</span></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        
						<%--<table class='table table-bordered table-hover dataTable' data-toggle='table'>
                            <tr>
                                <th class='th'>
                                    Ngày mua
                                </th> 
                                <th class='th'>
                                    Mã đơn hàng
                                </th>
                                <th class='th'>
                                    Mã khách hàng
                                </th>
                                <th class='th'>
                                    Tên khách hàng
                                </th>
                                <th class='th'>
                                    Trạng thái
                                </th>
                                <th class='th'>
                                    Tổng tiền
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>--%>
	
						<div id="mainDataTable">
							<%--<div class="input-group" style="float:left;">
                                        <span class="input-group-addon"><i class="fa fa-connectdevelop"></i></span>
                                        
                                    </div>--%>
							
							<table id="table" data-search="true" data-show-columns="true" data-pagination="false" data-toggle="table">
								<thead>
									<tr>
										<th data-field="col1" data-sortable="true">Ngày mua</th>
										<th data-field="col2" data-sortable="true">Mã đơn hàng</th>
										<th data-field="col3" data-sortable="true" width="200">Mã khách hàng</th>
										<th data-field="col4" data-sortable="true">Tên khách hàng</th>
										<th data-field="col5" data-sortable="true">Trạng thái</th>
										<th data-field="col6" data-sortable="true">Tổng tiền</th>
										<th data-field="col7">Xóa</th>
									</tr>
								</thead>
								<tbody  id="dvDanhSachNguoiDung" runat="server">
								</tbody>
							</table>
							<div class="pnPaging">
							<table>
								<tbody id="pagingData" runat="server">
								</tbody>
							</table>
						</div>
							<div class="mt-10" style="margin-top: 20px;"></div>
							<table class="table table-bordered table-hover dataTable">
								<tbody>
									<tr>
										<td style="width: 300px;">Tổng số đơn hàng</td>
										<td id="totalProduct" runat="server"></td>
									</tr>
									<tr>
										<td style="width: 300px;">Sản phẩm mới tạo</td>
										<td id="totalProductNew" runat="server"></td>
									</tr>
									<tr>
										<td style="width: 300px;">Sản phẩm đang xử lý</td>
										<td id="totalProductProcessing" runat="server"></td>
									</tr>
									<tr>
										<td style="width: 300px;">Sản phẩm hoàn tất</td>
										<td id="totalProductComplete" runat="server"></td>
									</tr>
									<tr>
										<td style="width: 300px;">Sản phẩm hủy</td>
										<td id="totalProductCancel" runat="server"></td>
									</tr>
								</tbody>
							</table>
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
                                                <input type="text" id="txtDate_Popup" class="form-control " placeholder="Chọn ngày" />
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
                                                <select id="slStatus2" runat="server" class="form-control" >
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
                                        <table class='table table-bordered table-striped'  data-toggle="table" style='width: 100%; radius: 2px;'>
                                            <thead>
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
                                            </thead>
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
	<script src="../../../Content/UI/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(document).ready(function () {
			$('.datepicker').datepicker({
				autoclose: true,
				todayHighlight: true,
				format: 'dd/mm/yyyy'
			});
		});
	</script>
    <%--<script src="../../../Content/admin/bootstrap-table.js"></script>
    <script src="../../../Content/admin/bootstrap-table-locale-all.js"></script>--%>
	<%--<script src="https://unpkg.com/bootstrap-table@1.13.4/dist/bootstrap-table.min.js"></script>--%>
</asp:Content>