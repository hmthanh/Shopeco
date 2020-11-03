using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangKy_Click(object sender, EventArgs e)
    {
        string Fullname = txtFullName.Value.Trim();
        string Email = txtEmail.Value.Trim();
        string Password = txtMatKhau.Value.Trim();
        string PhoneNum = txtPhoneNumber.Value.Trim();

        if (Fullname == "")
        {
            msgFullName.InnerText = "Không được để trống ô";
        }
        if (Email == "")
        {
            msgErrorEmail.InnerText = "Không được để trống ô";
            return;
        }
        else
        {
            msgErrorEmail.InnerText = "";
        }
        if (Password == "")
        {
            msgErrorPassword.InnerText = "Không được để trống mật khẩu";
            return;
        }
        else
        {
            msgErrorPassword.InnerText = "";
        }


        ////////////////////////////////////////////////////////////////
        string sql = "select * from tb_User u where u.Email = '" + StaticData.ValidParameter(Email) + "'";

        DataTable tbCheckEmail = Connect.GetTable(sql);

        if (tbCheckEmail.Rows.Count > 0)
        {
            msgErrorEmail.InnerHtml = "Email của bạn đã tồn tại";
            return;
        }

        sql = "select * from tb_User u where u.PhoneNumber = '" + StaticData.ValidParameter(PhoneNum) + "'";

        DataTable tbCheckPhone = Connect.GetTable(sql);

        if (tbCheckPhone.Rows.Count > 0)
        {
            msgPhoneNumber.InnerHtml = "Số điện thoại của bạn đã tồn tại";
            return;
        }

        sql = "insert into tb_User(PhoneNumber, Email, Password, FullName) values('" + StaticData.ValidParameter(PhoneNum) + "', '" + StaticData.ValidParameter(Email) + "', '" + StaticData.ValidParameter(Password) + "', N'" + StaticData.ValidParameter(Fullname) + "')";
        bool isSusscess = Connect.Exec(sql);

        if (isSusscess)
        {
            Response.Redirect("/gianhang/login");
        }
        else
        {
            msgFullName.InnerText = "Tài khoản của bạn chưa được tạo, vui lòng đăng ký lại";
            return;
        }
    }
}