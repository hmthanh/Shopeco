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
        
        string soDienThoai = txtTenDangNhap.Value.Trim();
        string MatKhau = txtMatKhau.Value.Trim();
        if (soDienThoai == "")
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
        string sql = "select * from tb_User u where u.PhoneNumber = '" + soDienThoai + "'";

        DataTable tbCheckTDN = Connect.GetTable(sql);

        if (tbCheckTDN.Rows.Count <= 0)
        {
            msgTenDangNhap.InnerHtml = "Tài khoản không hợp lệ";
            return;
        }

        sql = "select * from tb_User u where u.PhoneNumber = '" + soDienThoai + "' and u.Password = '" + MatKhau + "'";
        DataTable dataUser = Connect.GetTable(sql);
        if (dataUser == null)
        {
            msgMatKhau.InnerHtml = "Tài khoản không hợp lệ!";
            return;
        }
        else
        {
            if (dataUser.Rows.Count <= 0)
            {
                msgMatKhau.InnerHtml = "Tài khoản không hợp lệ!";
                return;
            }
        }
        if (dataUser.Rows.Count > 0)
        {
            string idUser = dataUser.Rows[0]["ID"].ToString();
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
                //Response.Redirect(GetRouteUrl("home", new { }));
                Response.RedirectToRoute("home");
            }
        }
    }
}