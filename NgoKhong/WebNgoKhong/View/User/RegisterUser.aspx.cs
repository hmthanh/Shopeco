using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangKy_Click(object sender, EventArgs e)
    {
       // string TenGianHang = StaticData.ValidParameter(txtTenGianHang.Value.Trim());
        string HoTen = StaticData.ValidParameter(txtNguoiDaiDien.Value.Trim());
        string SoDienThoai = StaticData.ValidParameter(txtSoDienThoai.Value.Trim().Replace(" ",""));
        string Email = StaticData.ValidParameter(txtEmail.Value.Trim());
        string DiaChi = StaticData.ValidParameter(txtTenDangNhap.Value.Trim());
        string MatKhau = StaticData.ValidParameter(txtMatKhau.Value.Trim());

        //if (TenGianHang == "")
        //{
        //    msgTenGianHang.InnerText = "Không được để trống";
        //    return;
        //}
        if (HoTen == "")
        {
            msgNguoiDaiDien.InnerText = "Không được để trống";
            return;
        }
        if (SoDienThoai == "")
        {
            msgSoDienThoai.InnerText = "Không được để trống";
            return;
        }
        if (Email == "")
        {
            msgEmail.InnerText = "Không được để trống";
            return;
        }
        if (DiaChi == "")
        {
            msgTenDangNhap.InnerText = "Không được để trống";
            return;
        }
        if (MatKhau == "")
        {
            msgMatKhau.InnerText = "Không được để trống";
            return;
        }

        ////////////////////////////////////////////////////////////////
        string sql = "select * from tb_User u where u.PhoneNumber = '" + StaticData.ValidParameter(SoDienThoai) + "'";

        DataTable tbCheckEmail = Connect.GetTable(sql);

        if (tbCheckEmail.Rows.Count > 0)
        {
            msgSoDienThoai.InnerText = "Số điện thoại của bạn đã tồn tại";
            return;
        }

        //sql = "select * from tb_GianHang u where u.SoDienThoai = '" + StaticData.ValidParameter(SoDienThoai) + "'";

        //DataTable tbCheckPhone = Connect.GetTable(sql);

        //if (tbCheckPhone.Rows.Count > 0)
        //{
        //    msgSoDienThoai.InnerHtml = "Số điện thoại của bạn đã tồn tại";
        //    return;
        //}

        sql = "insert into tb_User(PhoneNumber,Email, Password, FullName,Address) values(N'" + SoDienThoai + "',N'" + Email + "', '" + MatKhau + "', N'" + HoTen +  "', N'"  + DiaChi + "')";
        bool isSusscess = Connect.Exec(sql);

        if (isSusscess)
        {
            Response.Redirect("/dangnhap/login");
        }
        else
        {
            msgTenGianHang.InnerText = "Tài khoản của bạn chưa được tạo, vui lòng đăng ký lại";
            return;
        }
    }
}