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
        if (Session["AdminUser"] != null)
        {
            string idAdmin = Session["AdminUser"].ToString();
            string quyen = StaticData.getField("tb_Admin", "Quyen", "idAdmin", idAdmin);
            ResponseToPermission(quyen);
        }
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
                    cookie["AdminUser"] = tbCheckPassword.Rows[0]["idAdmin"].ToString();
                    Session["AdminUser"] = tbCheckPassword.Rows[0]["idAdmin"].ToString();
                    cookie.Expires = DateTime.Now.AddDays(10);
                    Response.Cookies.Add(cookie);

                    string ret = Request.QueryString["retUrl"];
                    if (ret != "" && ret != null)
                    {
                        Response.Redirect(ret);
                        return;
                    }
                    //Response.RedirectToRoute("adminGianHang", new { });
                    string quyen = tbCheckPassword.Rows[0]["Quyen"].ToString();
                    ResponseToPermission(quyen);
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

    private void ResponseToPermission(string quyen)
    {
        if (quyen.Contains("4"))
        {
            Response.RedirectToRoute("adminDonHang", new { });
            return;
        }
        if (quyen.Contains("1"))
        {
            Response.RedirectToRoute("adminMauSize", new { });
            return;
        }

        if (quyen.Contains("2"))
        {
            Response.RedirectToRoute("adminCustomer", new { });
            return;
        }

        if (quyen.Contains("3"))
        {
            Response.RedirectToRoute("adminSanPham", new { });
            return;
        }

        if (quyen.Contains("5"))
        {
            Response.RedirectToRoute("adminRaoVat", new { });
            return;
        }
        if (quyen.Contains("6"))
        {
            Response.RedirectToRoute("adminUser", new { });
            return;
        }
    }
}