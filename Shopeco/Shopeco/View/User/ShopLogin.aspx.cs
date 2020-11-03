using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        string TenDangNhap = txtTenDangNhap.Value.Trim();
        string MatKhau = txtMatKhau.Value.Trim();
        if (TenDangNhap == "")
        {
            msgTenDangNhap.InnerText = "Không được để trống ô";
            return;
        }
        else
        {
            msgTenDangNhap.InnerText = "";
        }
        if (MatKhau == "")
        {
            msgMatKhau.InnerText = "Không được để trống mật khẩu";
            return;
        }
        else
        {
            msgMatKhau.InnerText = "";
        }

        ////////////////////////////////////////////////////////////////
        string sql = "select * from tb_User u where u.Email = '" + TenDangNhap + "'";
        
        DataTable tbCheckTDN = Connect.GetTable(sql);
        if (tbCheckTDN == null)
        {
            return;
        }

        if (tbCheckTDN.Rows.Count <= 0)
        {
            msgTenDangNhap.InnerHtml = "Tài khoản không hợp lệ";
            return;
        }

        sql = "select * from tb_GianHang u where u.TenDangNhap='" + TenDangNhap + "' and u.MatKhau = '" + StaticData.ValidParameter(MatKhau) + "'";
        DataTable tbCheckPassword = Connect.GetTable(sql);
        if (tbCheckPassword == null)
        {
            msgMatKhau.InnerHtml = "Tài khoản không hợp lệ!";
            return;
        }
        else
        {
            if (tbCheckPassword.Rows.Count <= 0)
            {
                msgMatKhau.InnerHtml = "Tài khoản không hợp lệ!";
                return;
            }
        }
        if (tbCheckPassword.Rows.Count > 0)
        {
            string idUser = tbCheckPassword.Rows[0]["ID"].ToString();
            HttpCookie cookie = new HttpCookie("Web");
            Session["CurrentUser"] = idUser;
            cookie["CurrentUser"] = idUser;
            cookie.Expires = DateTime.Now.AddDays(10);
            Response.Cookies.Add(cookie);

            string ret = Request.QueryString["retUrl"];
            if (ret != "" && ret != null)
            {
                Response.Redirect(ret);
            }
            else
            {
                Response.Redirect(GetRouteUrl("home", new { }));
            }
        }
    }
}