<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MainBoard.master" CodeFile="ShopInfoEdit.aspx.cs" Inherits="GianHang_ShopInfoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainboard" runat="Server">
    <input type="hidden" id="_ispostback" value="<%=Page.IsPostBack.ToString()%>" />
    <input type="hidden" id="_isUpdate" class="specificUpdate" runat="server"/>
    <form runat="server">
        <script>
            $(document).ready(function () {
                $('#ember4556').addClass("active");
            });
        </script>
        <div class="">
            <div id="ember4669" class="shop-setting-header ember-view">
                <div class="shop-setting-header__content">
                    <div style="background: #49cbdd;" class="shop-setting-header__icon">
                        <svg viewBox="0 0 32 32">
                            <path d="M23.9 12.9l-1.6-1.6 6.2-6.2 1.6 1.6-6.2 6.2zM32 4.8l-1.6-1.6-1 1L31 5.8l1-1zM19.7 15.6l2.6-1.4-1.3-1.3-1.3 2.7zm8.6-4v16.3c0 .9-.7 1.6-1.6 1.6H1.6c-.9 0-1.6-.7-1.6-1.6V6.2c0-.9.7-1.6 1.6-1.6h24.2l-2 2H2v11.9l5.6-3.8 7.2 6.1 6.7-3 4.7 4.1v-8.4l2.1-1.9zm-2 15.9v-2.9l-5.1-4.4-6.7 3-7-6L2 21v6.5h24.3z"></path></svg>
                    </div>
                    <div class="shop-setting-header__caption ">
                        <div class="shop-setting-header__title">Tạo gian hàng</div>
                        <div class="shop-setting-header__subtitle">Tạo gian hàng của bạn</div>
                    </div>
                    <div class="shop-setting-header__buttons">
                    </div>
                </div>
                <hr class="shop-setting-header__seperator">
            </div>
            <div id="alertPanel" class="alert alert-success" role="alert">
                Đã cập nhật thông tin shop thành công !
            </div>

            <!---->
            <div class="grid with-gap setting-card--form">
                <div class="col-8">
                    <div class="seller-profile">
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                                Tên gian hàng
                            </div>
                            <div class="edit-input">
                                <div id="ember4813432" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input type="text" placeholder="Tên gian hàng" maxlength="80" id="tenGianHang" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M17.7 29.2H22c.6 0 1 .4 1 1s-.4 1-1 1H10c-.6 0-1-.4-1-1s.4-1 1-1h4.3C11.3 25.4 5 17.1 5 12.4 5 6.2 9.9 1.2 16 1.2s11 5 11 11.2c0 4.7-6.3 13-9.3 16.8zM16 3.2c-5 0-9 4.2-9 9.4s9 15.6 9 15.6 9-10.4 9-15.6c0-5.2-4-9.4-9-9.4zm-5 9c0-2.8 2.2-5 5-5s5 2.2 5 5-2.2 5-5 5-5-2.3-5-5zm8 0c0-1.7-1.3-3-3-3s-3 1.3-3 3 1.3 3 3 3 3-1.4 3-3z"></path></svg>
                                Địa chỉ gian hàng
                            </div>

                        </div>
                      <div class="edit-row" >
                            <div class="edit-input">
                                <div id="ember42212" class="shopee-textbox ember-view">
                                    <select id="cmbTinh" class="custom-select ember-text-field ember-view" runat="server">
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row" >
                            <div class="edit-input">
                                <div id="ember212" class="shopee-textbox ember-view">
                                    <select id="cmbHuyen" class="custom-select ember-text-field ember-view" runat="server"></select>
                                </div>
                            </div>
                        </div>
            <%--              <div class="edit-row" >
                            <div class="edit-input">
                                 <input id="idQuanHuyen"  runat="server"  >
                             <%--   <div id="ember2212" class="shopee-textbox ember-view">
                                    <select id="cmbXa" class="custom-select ember-text-field ember-view" runat="server">
                                    </select>
                                </div>
                            </div>
                        </div>--%>
                        <div class="edit-row">
                            <div class="edit-input">
                                <div id="ember4142" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                            
                                        <input type="text" placeholder="" maxlength="80" id="diachiGianHang" class="ember-text-field ember-view" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                    </div>
                </div>
                <div class="col-8">
                    <div class="seller-profile">
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28 16.9v12.8H4V16.6c-1-.9-1.7-2.6-1.7-4.1L5.7 2.2h20.6l3.4 10.3c.1 1.8-.4 3.5-1.7 4.4zM5.7 28h20.6v-3.4H5.7V28zm0-5.1h20.6v-5.2c-.3 0-.5.1-.9.1-1.3 0-2.7-.7-3.4-1.7-.7 1-1.6 1.7-3 1.7-1.2 0-2.3-.9-3-1.7-.7.9-1.8 1.7-3 1.7-1.4 0-2.3-.7-3-1.7-.8 1-2.2 1.7-3.5 1.7-.3 0-.5 0-.8-.1v5.2zM25.2 4H6.8l-2.3 6.9h22.9L25.2 4zM4 12.6C4.2 14 5.3 16 6.5 16s2.7 0 2.7-1.7h1.7s0 1.7 2.1 1.7 2.1-1.7 2.1-1.7h1.8S16.8 16 19 16c2.1 0 2.1-1.7 2.1-1.7H23s0 1.7 2.7 1.7c2.5 0 2.5-3.4 2.5-3.4H4z"></path></svg>
                                Chủ gian hàng
                            </div>
                            <div class="edit-input">
                                <div id="ember4812" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast"></div>
                                    <div class="input">
                                        <input runat="server" type="text" placeholder="Họ và tên" maxlength="80" id="hotenChu" class="ember-text-field ember-view">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M28.38 26.45a1.75 1.75 0 0 0-.66-1.45c-.45-.32-5.17-3.46-5.71-3.81a2.33 2.33 0 0 0-2.3.14c-.46.24-1.84 1-2.52 1.41A33.76 33.76 0 0 1 13 19.06a33.57 33.57 0 0 1-3.71-4.2c.39-.68 1.18-2.06 1.42-2.51a3 3 0 0 0 .36-1.35 1.71 1.71 0 0 0-.23-.9C10.48 9.49 7.32 4.75 7 4.32a2 2 0 0 0-2.84-.22S0 7.11 0 8.8c.16 4.84 4.86 10.51 8.77 14.41s9.6 8.59 14.44 8.74c1.72.06 4.69-4.11 4.72-4.15a2.46 2.46 0 0 0 .44-1.4z"></path></svg>
                                Số điện thoại
                            </div>
                            <div class="edit-input">
                                <div id="ember412" class="shopee-textbox ember-view">
                                    <div class="shopee-validation-toast  "></div>
                                    <div class="input">
                                        <input type="text" runat="server" placeholder="Số điện thoại liên hệ" maxlength="80" id="soDienThoai" class="ember-text-field ember-view">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="edit-row">
                            <div class="edit-label">
                            </div>
                        </div>--%>
                        <div class="edit-row">
                            <div class="edit-label">
                                <svg viewBox="0 0 32 32">
                                    <path d="M14 32v-2h18v2H14zm6.1-19.2l-9.8 17.1L2.2 32 0 23.9 9.8 6.8l1-1.7 3-5.1L24 5.9l-3.3 5.7-.6 1.2zM2.2 24.1l1.4 5.4L9 28l-6.8-3.9zm1-1.8l6.8 3.9 8.4-14.5-6.8-3.9-8.4 14.5zM14.5 2.7l-2 3.4 6.8 3.9 2-3.4-6.8-3.9z"></path></svg>Mô tả gian hàng
                            </div>
                            <div class="edit-input">
                                <div id="ember4681" class="ember-form-validate__validator shopee-textbox shopee-textarea ember-view" style="height: 100px;">
                                    <!---->
                                    <div class="input">
                                        <textarea id="moTaGianHang" runat="server" spellcheck="false" maxlength="500" class="ember-text-area ember-view" placeholder="Mô tả"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="edit-row btn-group">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                Launch demo modal
                            </button>
                        </div>--%>
                        <div class="edit-row btn-group">
                            <button id="btnLuuThongTin" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">Lưu</button>
                            <%--<asp:Button ID="btnLuuThongTin" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view" runat="server" OnClick="btnLuuThongTin_Click" Text="Lưu"></asp:Button>--%>
                            <button id="btnHuy" type="button" class="shopee-button shopee-button--inactive shopee-button--primary ember-view">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <link href="../Content/gianhang/css/shopinfo.css" rel="stylesheet" />
        <link href="../Content/gianhang/css/shopcustom.css" rel="stylesheet" />

    </form>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <%--<script src="../Content/gianhang/js/shopinfo.js"></script>--%>
    <script>
        $(document).ready(function () {
            //function editHamlet() {
            //    var xa = $('#maincontent_mainboard_cmbXa').children("option:selected").html();
            //    var address = $('#maincontent_mainboard_diachiGianHang').val().split(', ');

            //    var res = address[0] + ', ' + xa + ', ' + address[2] + ', ' + address[3];
            //    $('#maincontent_mainboard_diachiGianHang').val(res);
            //}
            //function editProvince() {
            //    var huyen = $('#maincontent_mainboard_cmbHuyen').children("option:selected").html();
            //    var address = $('#maincontent_mainboard_diachiGianHang').val().split(', ');

            //    var res = address[0] + ', ' + address[1] + ', ' + huyen + ', ' + address[3];
            //    $('#maincontent_mainboard_diachiGianHang').val(res);
            //}
            //function editCity() {
            //    var tinh = $('#maincontent_mainboard_cmbTinh').children("option:selected").html();
            //    var address = $('#maincontent_mainboard_diachiGianHang').val().split(', ');

            //    var res = address[0] + ', ' + address[1] + ', ' + address[2] + ', ' + tinh;
            //    $('#maincontent_mainboard_diachiGianHang').val(res);
            //}
            function updateAddress()
            {
                var address = $('#maincontent_mainboard_diachiGianHang').val().split(', ');
                var xa = $('#maincontent_mainboard_cmbXa').children("option:selected").html();
                xa = (xa == null) ? 'Phường' : xa;
                var huyen = $('#maincontent_mainboard_cmbHuyen').children("option:selected").html();
                huyen = (huyen == null) ? 'Quận' : huyen;
             
                var tinh = $('#maincontent_mainboard_cmbTinh').children("option:selected").html();
                tinh = (tinh == null) ? 'Thành phố' : tinh;
                var addr = address[0]  + ', ' + huyen + ', ' + tinh;
               // var addr = address[0] ;
                $('#maincontent_mainboard_diachiGianHang').val(addr);
            }
            var val = $('#maincontent_mainboard_diachiGianHang').val();
            if (val == '' || val == null)
            {
                updateAddress();
            }
            function changeCity() {
                var city = $('#maincontent_mainboard_cmbTinh').val();
                
                $.ajax({
                    type: "GET",
                    url: '../Ajax/LayDiaChi.aspx?a=district&city=' + city,
                    success: function (data) {
                        var obj = JSON.parse(data);
                        var cmbHuyen = $('#maincontent_mainboard_cmbHuyen');
                        var maqh = cmbHuyen.val();
                        cmbHuyen.find('option').remove();
                        jQuery.each(obj, function (i, item) {
                            if (i == 0) {

                                cmbHuyen.append($('<option selected="selected" value="' + item.maqh + '">' + item.name + '</option>'));
                                
                               
                            }
                            else {
                                cmbHuyen.append($('<option>', { value: item.maqh, text: item.name }));
                            }
                            //$("#maincontent_mainboard_idQuanHuyen").val(item.maqh);
                        });
                        //changeProvince();
                        cmbHuyen.val(maqh);

                        updateAddress();
                   
                    }
                });

            }
            function changeProvince() {
                var district = $('#maincontent_mainboard_cmbHuyen').val();
                
                $.ajax({
                    type: "GET",
                    url: '../Ajax/LayDiaChi.aspx?a=hamlet&district=' + district,
                    success: function (data) {
                        var obj = JSON.parse(data);
                        var cmbXa = $('#maincontent_mainboard_cmbXa');
                        cmbXa.find('option').remove();
                        jQuery.each(obj, function (i, item) {
                            if (i == 0) {
                                cmbXa.append($('<option selected="selected" value="' + item.xaid + '">' + item.name + '</option>'));
                            }
                            else {
                                cmbXa.append($('<option>', { value: item.xaid, text: item.name }));
                            }
                        });
                    }
                });
            }
            //$.ajax({
                
            //    type: "GET",
            //    url: '../Ajax/LayDiaChi.aspx?a=city',
            //    success: function (data) {
            //        var obj = JSON.parse(data);
            //        var cmbTinh = $('#maincontent_mainboard_cmbTinh');
            //        var matp = cmbTinh.val();
            //        cmbTinh.find('option').remove();
            //        jQuery.each(obj, function (i, item) {
            //            if (i == 0) {
            //                cmbTinh.append($('<option selected="selected" value="' + item.matp + '">' + item.name + '</option>'));
            //            }
            //            else {
            //                cmbTinh.append($('<option>', { value: item.matp, text: item.name }));
            //            }
            //        });
            //        if (matp != "")
            //            cmbTinh.val(matp);
            //        changeCity();
            //    }
            //});
            ////////////////////////////////////////////////////
            $('#maincontent_mainboard_cmbTinh').change(function () {
                changeCity();
                updateAddress();
            });
            $('#maincontent_mainboard_cmbHuyen').change(function () {
                updateAddress();
                //changeProvince();
            });
            //$('#maincontent_mainboard_cmbXa').change(function () {
            //    updateAddress();
            //});
        });
    </script>
    <script>
        var hide = function () {
            $('.alert-success').hide();
        }
        hide();
        var show = function () {
            $('.alert-success').show();
        }
        var redirect = function () {
            window.location.href = "/gianhang/info";
        }
        $('#btnHuy').click(function () {
            var isConfirm = confirm("Bạn có muốn hủy kết quả hay không ?");
            if (isConfirm)
            {
                redirect();
            }
        });
        $('#btnLuuThongTin').click(function () {
            var name = $("#maincontent_mainboard_tenGianHang").val();
            var address = $("#maincontent_mainboard_diachiGianHang").val();
          // alert(address)
            var Tinh = $("#maincontent_mainboard_diachiGianHang").val();
            var Huyen = $("#maincontent_mainboard_cmbHuyen").children("option:selected").val();
            var description = $("#maincontent_mainboard_moTaGianHang").val();
            var owner = $("#maincontent_mainboard_hotenChu").val();
            var phone = $("#maincontent_mainboard_soDienThoai").val();
            if (name == "" || owner == "" || phone == "")
            {
                confirm("Không được để trống !");
                return;
            }
            $.ajax({
                type: 'GET',
                url: '../Ajax/UpdateShopInfo.aspx',
                data: { name: name, address: address, maqh: Huyen, description: description, owner: owner, phone: phone },
                success: function (isSuccess) {
                    if (isSuccess === 'True')
                    {
                        show();
                        setInterval(hide, 3000);
                        setInterval(redirect, 1000);
                    }
                    else {
                        redirect();
                    }
                }
            });
        });
    </script>
</asp:Content>
