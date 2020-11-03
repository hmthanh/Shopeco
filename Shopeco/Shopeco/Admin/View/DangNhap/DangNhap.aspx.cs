using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        string Username = txtTenDangNhap.Value.Trim();
        string Password = txtMatKhau.Value.Trim();
        int flag = 0;
        if (Username == "")
        {
            ThongBaoTenDangNhap.Attributes.Add("class", "help-block");
            flag = 1;
        }
        else
        {
            ThongBaoTenDangNhap.Attributes.Add("class", "help-block hidden");
        }
        if (Password == "")
        {
            ThongBaoMatKhau.Attributes.Add("class", "help-block");
            flag = 1;
        }
        else
        {
            ThongBaoMatKhau.Attributes.Add("class", "help-block hidden");
        }
        if (flag == 0)
        {
            DataTable tbCheckUsername = Connect.GetTable("select top 1 * from tb_Admin where TenDangNhap='" + StaticData.ValidParameter(Username) + "'");
            if (tbCheckUsername.Rows.Count > 0)
            {
                DataTable tbCheckPassword = Connect.GetTable("select top 1 * from tb_Admin where TenDangNhap='" + StaticData.ValidParameter(Username) + "' and MatKhau='" + StaticData.ValidParameter(Password) + "'");
                if (tbCheckPassword.Rows.Count > 0)
                {
                    HttpCookie cookie = new HttpCookie("WebAAu_Login");
                    cookie["UserName"] = Username;
                    Session["AdminUser"] = Username;
                    cookie.Expires = DateTime.Now.AddDays(10);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("/admin/product/list");
                }
                else
                {
                    ThongBaoMatKhau.InnerHtml = "Mật khẩu không đúng";
                    ThongBaoMatKhau.Attributes.Add("class", "help-block");
                    return;
                }
            }
            else
            {
                ThongBaoTenDangNhap.InnerHtml = "Tên đăng nhập không đúng";
                ThongBaoTenDangNhap.Attributes.Add("class", "help-block");
            }
        }
    }
}