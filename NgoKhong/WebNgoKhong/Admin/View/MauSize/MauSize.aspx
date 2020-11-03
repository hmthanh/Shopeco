<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="MauSize.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/Admin/Content/plugins/colorpicker/bootstrap-colorpicker-plus.css" rel="stylesheet" />
    <script src="/Admin/Content/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="/Admin/Content/plugins/colorpicker/bootstrap-colorpicker-plus.js"></script>
    <style type="text/css">
        .color-fill-icon{display:inline-block;width:25px;height:25px;border:1px solid #000;background-color:#fff;margin: 2px;}
        .dropdown-color-fill-icon{position:relative;float:left;margin-left:0;margin-right: 0}
		.well .markup{
			background: #fff;
			color: #777;
			position: relative;
			padding: 45px 15px 15px;
			margin: 15px 0 0 0;
			background-color: #fff;
			border-radius: 0 0 4px 4px;
			box-shadow: none;
		}

		.well .markup::after{
			content: "Example";
			position: absolute;
			top: 15px;
			left: 15px;
			font-size: 12px;
			font-weight: bold;
			color: #bbb;
			text-transform: uppercase;
			letter-spacing: 1px;
		}
    </style>
     <script>
         $(function () {
            var demo4 = $('.colorpickerplus-dropdown .colorpickerplus-container');
            demo4.colorpickerembed();
            demo4.on('changeColor', function (e, color) {
                //alert(color);

                var el = $('.color-fill-icon', $('#demo4'));
                if (color == null) {
                    //when select transparent color
                    el.addClass('colorpicker-color');
                } else {
                    el.removeClass('colorpicker-color');
                    //el.removeClass('colorpicker-element')
                    el.css('background-color', color);
                    //var d = el.css('background-color');
                    $('#ContentPlaceHolder1_txtCode').val(color)
                }
            });
        });
         $(document).ready(function () {
         });
         function ThemMau() {
             var TenMau = $("#txtTenMau").val();
             var MaMau = $("#ContentPlaceHolder1_txtCode").val();
             var KichHoat = $("#ckKichHoat").is(":checked");
             
             $.ajax({
                type: "POST",
                 url: "/Admin/View/MauSize/MauSize.aspx/LuuMau",
                 data: "{TenMau:'" + TenMau + "', MaMau:'" + MaMau + "', KichHoat:'" + KichHoat + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể thêm màu");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
            });
         }
         function DeleteMau(id) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/MauSize/MauSize.aspx/DeleteMau",
                data: "{id:'" + id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể xóa màu");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
            });
             }
         }
         function MauMacDinh(id) {
             if (confirm("Bạn có muốn chọn màu này làm mặc định không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/MauSize/MauSize.aspx/MauMacDinh",
                data: "{id:'" + id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể chọn");
                    }
                },
                error: function () { alert("Không thể chọn.Lỗi function")}
            });
             }
         }

         function ThemSize() {
             var Size = $("#txtSize").val();
             var KichHoat = $("#ckKichHoatSize").is(":checked");
             
             $.ajax({
                type: "POST",
                 url: "/Admin/View/MauSize/MauSize.aspx/LuuSize",
                 data: "{Size:'" + Size + "', KichHoat:'" + KichHoat + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể thêm size");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
            });
         }
         function DeleteMau(id) {
             if (confirm("Bạn có muốn xóa không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/MauSize/MauSize.aspx/DeleteMau",
                data: "{id:'" + id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể xóa màu");
                    }
                },
                error: function () { alert("Không thể xóa.Lỗi function")}
            });
             }
         }
         function SizeMacDinh(id) {
             if (confirm("Bạn có muốn chọn size này làm mặc định không ?")) {
                 //alert(idSlide);
                 $.ajax({
                type: "POST",
                url: "/Admin/View/MauSize/MauSize.aspx/SizeMacDinh",
                data: "{id:'" + id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datas) {
                    if (datas.d == "True")
                        location.reload();
                    else {
                        alert("Không thể chọn");
                    }
                },
                error: function () { alert("Không thể chọn.Lỗi function")}
            });
             }
         }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title">DANH SÁCH MÀU & SIZE</div>
    <div class="box">
        <div class="box-body">
            <div class="form-group">
                </div>
            
            <div class="form-group">
            <div class="row">
                <div class="col-sm-8">
                    <a class="btn btn-primary" data-toggle="modal" data-target="#modal-mau"><i class="glyphicon glyphicon-plus"></i> Thêm màu</a>
                </div>
                 <div class="col-sm-4">
                        <div style="text-align:right;">
                            <a class="btn btn-primary" data-toggle="modal" data-target="#modal-size"><i class="glyphicon glyphicon-plus"></i> Thêm size</a>
                        </div>
                    </div>
                </div>
                </div>
            <div id="dvDanhSachLoaiTinTuc" runat="server">

            </div>
        </div>
        </div>
    </section>
    <!-- /.content -->
    </div>
        <!--model Mau-->
    <div class="modal fade" id="modal-mau" style="display: none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Thêm Màu</h4>
              </div>
                <div class="modal-body">
                    <div class="col-md-12 form-group">
                        <div class="col-md-4">
                            <b>Tên màu: </b>
                        </div>
                        <div class="col-md-8">
                            <input id="txtTenMau" placeholder="Nhập tên màu..." class="form-control" type="text" />
                        </div>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="col-md-4">
                            <b>Mã màu: </b>
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group btn-group-sm colorpickerplus-dropdown" id="demo4">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span style="" class="color-fill-icon dropdown-color-fill-icon" id="demomau" runat="server"></span>&nbsp;<b class="caret"></b></button>
                                <ul class="dropdown-menu">
                                    <li class="disabled">
                                        <div class="colorpickerplus-container"></div>
                                    </li>
                                    <%--<li><a href="#">Other</a></li>
			                      <li><a href="#">More...</a></li>--%>
                                </ul>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <input class="form-control" data-val="true" id="txtCode" disabled="disabled" runat="server" type="text" value="" /></div>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="col-md-4">
                            <b>Kích hoạt: </b>
                        </div>
                        <div class="col-md-8">
                            <input id="ckKichHoat" checked="" type="checkbox" class="minimal"/>
                        </div>
                    </div>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="ThemMau()">Lưu</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!--model Mau-->
    <div class="modal fade" id="modal-size" style="display: none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Thêm Size</h4>
              </div>
                <div class="modal-body">
                    <div class="col-md-12 form-group">
                        <div class="col-md-4">
                            <b>Size: </b>
                        </div>
                        <div class="col-md-8">
                            <input id="txtSize" placeholder="Nhập size..." class="form-control" type="text" />
                        </div>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="col-md-4">
                            <b>Kích hoạt: </b>
                        </div>
                        <div class="col-md-8">
                            <input id="ckKichHoatSize" checked="" type="checkbox" class="minimal"/>
                        </div>
                    </div>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="ThemSize()">Lưu</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
    
</asp:Content>
