<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Cart - Old.aspx.cs" Inherits="DonHang_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function DeleteSanPham(idSanPham, idMau, idSize) {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "True")
                        window.location.reload();
                    else
                        alert("Lỗi !")
                }
            }
            xmlhttp.open("GET", "../Ajax.aspx?Action=DeleteSanPham&idSanPham=" + idSanPham + "&idMau=" + idMau + "&idSize=" + idSize, true);
            xmlhttp.send();
        }


        function DatHang() {
            var HoTen = $("#ContentPlaceHolder1_txtHoTen").val();
            var DienThoai = $("#ContentPlaceHolder1_txtSoDienThoai").val();
            var DiaChi = $("#ContentPlaceHolder1_txtDiaChi").val();
            var GhiChu = $("#ContentPlaceHolder1_txtGhiChu").val();
            var ID = $("#ContentPlaceHolder1_hdidUser").val();
            if (HoTen == "" || HoTen == null) {
                $("#ContentPlaceHolder1_txtHoTen").focus();
                alert("Vui lòng nhập họ tên!!!");
                return;
            }

            if (DienThoai == "" || DienThoai == null) {
                $("#ContentPlaceHolder1_txtSoDienThoai").focus();
                alert("Vui lòng nhập số điện thoại!!!"); return;
            }
            if (DiaChi == "" || DiaChi == null) {
                $("#ContentPlaceHolder1_txtDiaChi").focus();
                alert("Vui lòng nhập địa chỉ nhận hàng!!!"); return;
            }

            $.ajax({
                type: 'GET',
                url: "../Ajax.aspx?Action=DatHang&HoTen=" + HoTen + "&DienThoai=" + DienThoai + "&DiaChi=" + DiaChi + "&GhiChu=" + GhiChu + "&ID=" + ID,
                success: function (data) {
                    if (data == 'True') {
                        window.location.href = "/dangnhap/saleorder";
                    }
                    else if (data == 'Empty') {
                        alert("Không có sản phẩm trong giỏ hàng !");
                    }
                    else {
                        alert("Đặt hàng không thành công !");
                    }
                }
            });
            //var xmlhttp;
            //if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            //    xmlhttp = new XMLHttpRequest();
            //}
            //else {// code for IE6, IE5
            //    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            //}
            //xmlhttp.onreadystatechange = function () {
            //    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //        if (xmlhttp.responseText == "True") {
            //            window.location.href = "/dangnhap/saleorder";
            //        }

            //        else

            //            if (xmlhttp.responseText == "Rong") {
            //                alert("Không có sản phẩm trong giỏ hàng...!")
            //            }
            //            else
            //                alert("Lỗi !")
            //    }
            //}
            //xmlhttp.open("GET", "../Ajax.aspx?Action=DatHang&HoTen=" + HoTen + "&DienThoai=" + DienThoai + "&DiaChi=" + DiaChi + "&GhiChu=" + GhiChu + "&ID=" + ID, true);
            //xmlhttp.send();

        }

        function ThayDoiSoLuong(idLoaiHangHoa) {

            var SoLuong = $("#txtSoLuong" + idLoaiHangHoa).val();
            var DonGia = $("#txtDonGia" + idLoaiHangHoa).val();

            if (SoLuong.trim() == "")
                SoLuong = "0";

            if (DonGia.trim() == "")
                DonGia = "0";

            var ThanhTien = Number(SoLuong) * Number(DonGia);

            $("#txtThanhTien" + idLoaiHangHoa).val(ThanhTien);
            $("#spThanhTien" + idLoaiHangHoa).html(ThanhTien.toString().replace(/\./g, '').replace(/\,/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " đ");

            var TongTien = 0;
            $("input[type='text'][name='ThanhTien']").each(function () {

                TongTien += Number($(this).val());
            });

            $("#ContentPlaceHolder1_lblTongTien").html(TongTien.toString().replace(/\./g, '').replace(/\,/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " đ")

            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "True") {

                    }
                    else
                        alert("Lỗi !")
                }
            }
            xmlhttp.open("GET", "../Ajax.aspx?Action=ThayDoiSoLuong&idSanPham=" + idLoaiHangHoa + "&SoLuong=" + SoLuong, true);
            xmlhttp.send();

        }
        function TextBox_AddToIntValue(targetId, addToValue) {

            var input = document.getElementById(targetId);
            var textInt = parseInt(input.value);
            if (isNaN(textInt)) {
                textInt = 0;
            }
            var total_quantity = textInt + addToValue;
            //input.value=total_quantity;

            if (total_quantity <= 1) {
                input.value = 1;
            } else {
                input.value = total_quantity;
            }
            var arr = targetId.split('-');
            UpdateQuantity(arr[1], arr[2], arr[3]);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Main Container  -->
    <div class="main-container container">
        <div class="row"><%=GetDuongDan() %></div>
        <!--Middle Part Start-->
        <div class="row">
            <!--Middle Part Start-->
            <!--Middle Part End -->
            <div id="content" class="col-sm-12">
                <h2 class="title" style="margin-top: 0;">Giỏ Hàng</h2>
                <div id='cartform' runat="server" class="table-responsive form-group">
                    <%--<table class="table table-bordered">
                <thead>
                  <tr>
                    <td class="text-center">Ảnh</td>
                    <td class="text-left">Tên sản phẩm</td>
                    <td class="text-left">Mã</td>
                    <td class="text-center">Số lượng</td>
                    <td class="text-center">Giá</td>
                    <td class="text-center">Tổng tiền</td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center"><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>"><img width="70px" src="/Content/UI/image/catalog/demo/product/fashion/1.jpg" alt="Aspire Ultrabook Laptop" title="Aspire Ultrabook Laptop" class="img-thumbnail" /></a></td>
                    <td class="text-left" style="vertical-align:middle"><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>">Emasa rumas gacem</a><br />
                     </td>
                    <td class="text-left" style="vertical-align:middle">Pt 001</td>
                    <td class="text-center" style="vertical-align:middle" width="200px"><div class="input-group btn-block quantity">
                        <input type="text" name="quantity" value="1" size="1" class="form-control" />
                        <span class="input-group-btn">
                        <button type="submit" data-toggle="tooltip" title="Update" class="btn btn-primary"><i class="fa fa-clone"></i></button>
                        <button type="button" data-toggle="tooltip" title="Remove" class="btn btn-danger" onClick=""><i class="fa fa-times-circle"></i></button>
                        </span></div></td>
                    <td class="text-center"  style="vertical-align:middle">120,000 Đ</td>
                    <td class="text-center"  style="vertical-align:middle">120,000 Đ</td>
                  </tr>
                  <tr>
                    <td class="text-center"><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>"><img width="70px" src="/Content/UI/image/catalog/demo/product/fashion/2.jpg" alt="Xitefun Causal Wear Fancy Shoes" title="Xitefun Causal Wear Fancy Shoes" class="img-thumbnail" /></a></td>
                    <td class="text-left" style="vertical-align:middle"><a href="<%=GetRouteUrl("product", new {nameEn="san-pham", id="1" }) %>">Comas samer rumas</a></td>
                    <td class="text-left" style="vertical-align:middle">Pt 002</td>
                    <td class="text-center"  style="vertical-align:middle" width="200px"><div class="input-group btn-block quantity">
                        <input type="text" name="quantity" value="1" size="1" class="form-control" />
                        <span class="input-group-btn">
                        <button type="submit" data-toggle="tooltip" title="Update" class="btn btn-primary"><i class="fa fa-clone"</i></button>
                        <button type="button" data-toggle="tooltip" title="Remove" class="btn btn-danger" onClick=""><i class="fa fa-times-circle"></i></button>
                        </span></div></td>
                    <td class="text-center"  style="vertical-align:middle">150,000 Đ</td>
                    <td class="text-center"  style="vertical-align:middle">150,000 Đ</td>
                  </tr>
                    <tr style="text-align:center">
                        <td colspan="5"><h3 style="margin:0">Tổng :</h3></td>
                        <td><h3 style="margin:0">170.000 Đ</h3></td>
                    </tr>
                </tbody>
              </table>--%>
                </div>
                <div class="div-input col-sm-12" style="text-align: right">
                    <div class="div-right">

                        <%-- <label>Tổng Tiền <span style="color:red"></span></label>--%>
                        <label style="font-size: 20px; color: red">Tổng tiền:               <span style="color: red"></span></label>
                        <label style="font-size: 20px; color: red" id="lblTongTien" runat="server">0 đ</label>
                        <%-- <input disabled="disabled" id="lblTongTien" runat="server" name="tongtien" class="form-control" value="">
                                    <span class="field-validation-valid" data-valmsg-for="Name" data-valmsg-replace="true"></span>--%>
                    </div>
                </div>
                <h3 class="subtitle no-margin">Thông tin khách hàng</h3>
                <p></p>
                <div class="panel-group" id="accordion">
                    <div class="row container" style="margin: 0 auto;">

                        <span class="field-validation-valid" data-valmsg-for="Cart" data-valmsg-replace="true"></span>

                        <div class="div-input col-sm-6">
                            <div class="div-left">

                                <label>Tên khách hàng <span style="color: red">(*)</span></label>
                                <input id="txtHoTen" runat="server" name="shipName" placeholder="Tên khách hàng" class="form-control" value="">
                                <span class="field-validation-valid" data-valmsg-for="Name" data-valmsg-replace="true"></span>
                            </div>
                            <div class="div-right">

                                <input id="hdidUser" runat="server" hidden="hidden" style="display: none" />
                                <label>Số điện thoại  <span style="color: red">(*)</span></label>
                                <input id="txtSoDienThoai" runat="server" name="mobile" placeholder="Số điện thoại" class="form-control" value="">
                                <span class="field-validation-valid" data-valmsg-for="Phone" data-valmsg-replace="true"></span>
                            </div>
                        </div>
                        <div class="div-input col-sm-6">
                            <div class="div-left">
                                <label>Địa chỉ nhận hàng <span style="color: red">(*)</span></label>
                                <input id="txtDiaChi" runat="server" name="address" class="form-control" placeholder="Địa chỉ" value="">
                                <span class="field-validation-valid" data-valmsg-for="Adress" data-valmsg-replace="true"></span>
                            </div>
                            <div class="div-right">
                                <label>Email (Nếu có)</label>
                                <input id="txtGhiChu" runat="server" name="email" placeholder="Email" class="form-control">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="buttons" style="padding-bottom: 60px;">
                    <div class="pull-left"><a href="/" class="btn btn-primary">Xem thêm sản phẩm </a></div>
                    <div class="text-center"><a class="btn btn-primary" onclick="DatHang()">Đặt hàng</a></div>
                </div>
            </div>
        </div>

        <!--Middle Part End -->

    </div>
    <!-- //Main Container -->
</asp:Content>
