using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null && Session["CurrentUser"] != "")
        {
            string ret = Request.QueryString["retUrl"];
            if (ret != "" && ret != null)
            {
                Response.Redirect(ret);
            }
            else
            {
                Response.Redirect("/gianhang/dashboard");
            }
        }
    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        
        string Email = txtEmail.Value.Trim();
        string Password = txtPassword.Value.Trim();
        if (Email == "")
        {
            msgEmail.InnerText = "Không được để trống ô";
            return;
        }
        else
        {
            msgEmail.InnerText = "";
        }
        if (Password == "")
        {
            msgPassword.InnerText = "Không được để trống mật khẩu";
            return;
        }
        else
        {
            msgPassword.InnerText = "";
        }

        ////////////////////////////////////////////////////////////////
        string sql = "select * from tb_User u where (u.Email = '" + StaticData.ValidParameter(Email) + "' or u.PhoneNumber = '" + StaticData.ValidParameter(Email) + "' )";

        DataTable tbCheckEmail = Connect.GetTable(sql);

        if (tbCheckEmail.Rows.Count <= 0)
        {
            msgEmail.InnerHtml = "Email hoặc số điện thoại không đúng";
            return;
        }

        sql = "select * from tb_User u where (u.Email = '" + StaticData.ValidParameter(Email) + "' or u.PhoneNumber = '" + StaticData.ValidParameter(Email) + "' ) and u.Password = '" + StaticData.ValidParameter(Password) + "'";
        DataTable tbCheckPassword = Connect.GetTable(sql);
        if (tbCheckPassword == null)
        {
            msgPassword.InnerHtml = "Email hoặc mật khẩu không đúng !";
            return;
        }
        else
        {
            if (tbCheckPassword.Rows.Count <= 0)
            {
                msgPassword.InnerHtml = "Email hoặc mật khẩu không đúng !";
                return;
            }
        }

        HttpCookie cookie = new HttpCookie("Web");
        cookie["CurrentUser"] = Email;
        Session["CurrentUser"] = Email;
        Session.Timeout = 600;
        cookie.Expires = DateTime.Now.AddDays(100);
        Response.Cookies.Add(cookie);
        object retUrl = Request.QueryString["retUrl"];

        if (retUrl != null)
        {
            Response.Redirect(retUrl.ToString());
            return;
        }
        Response.Redirect("/gianhang/dashboard");
    }
}