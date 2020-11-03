<%@ Page Language="C#" MasterPageFile="~/Admin/Layout/MasterPage.master" validateRequest="false" AutoEventWireup="true" CodeFile="NewsCatEdit.aspx.cs" Inherits="Admin_View_TinTuc_LoaiTinTin_CapNhat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
    <div class="title">CẬP NHẬT LOẠI TIN TỨC</div>
    <div class="box">
        <div class="box-body">
            <form class="form-horizontal" runat="server">
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Tên loại tin tức (*): </b>
                            </div>
                            <div class="col-md-10">
                                <input id="txtTen" placeholder="Nhập tên loại tin tức..." class="form-control" runat="server" type="text" />
                                <span id="MessageMaKH" runat="server" class="validationMessage" style="display: none"></span>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Mô tả: </b>
                            </div>
                            <div class="col-md-10">
                                <textarea id="txtMoTa" class="ckeditor" runat="server"></textarea>
                            </div>
                        </div>
                <div class="col-md-12 form-group">
                            <div class="col-md-2">
                                <b>Kích hoạt: </b>
                            </div>
                            <div class="col-md-10">
                                <input id="ckKichHoat" runat="server" checked="checked" type="checkbox"/>
                            </div>
                        </div>
                <div class="box-footer">
                    <asp:Button ID="btLuu" runat="server" Text="LƯU" class="btn btn-primary btn-flat" OnClick="btLuu_Click" />
                    <asp:Button ID="btHuy" runat="server" Text="HỦY" class="btn btn-primary btn-flat" OnClick="btHuy_Click"/>
                </div>
               
            </form>
            
        </div>
    </div>
    </section>
    <!-- /.content -->
  </div>
</asp:Content>
