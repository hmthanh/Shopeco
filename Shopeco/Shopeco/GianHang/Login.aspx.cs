using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHangLogin_Login : System.Web.UI.Page
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
        string phone = txtEmail.Value.Trim();
        string Password = txtPassword.Value.Trim();
        if (phone == "")
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
        //string sql = "select * from tb_User u where (u.PhoneNumber = '" + StaticData.ValidParameter(phone) + "' )";

        //DataTable checkPhone = Connect.GetTable(sql);

        //if (checkPhone.Rows.Count <= 0)
        //{
        //    msgEmail.InnerHtml = "Số điện thoại không đúng";
        //    return;
        //}

        string sql = "select * from tb_User u where (u.PhoneNumber = '" + StaticData.ValidParameter(phone) + "' ) and u.Password = '" + StaticData.ValidParameter(Password) + "'";
        DataTable dataUser = Connect.GetTable(sql);
        if (dataUser == null)
        {
            msgPassword.InnerHtml = "Số điện thoại hoặc mật khẩu không đúng !";
            return;
        }
        else
        {
            if (dataUser.Rows.Count <= 0)
            {
                msgPassword.InnerHtml = "Số điện thoại hoặc mật khẩu không đúng !";
                return;
            }
        }

        //sql = "select * from tb_GianHang where SoDienThoai = " + phone;
        //DataTable data = Connect.GetTable(sql);
        //if (data == null)
        //{

        //}

        HttpCookie cookie = new HttpCookie("Web");
        string idUser = dataUser.Rows[0]["ID"].ToString();
        cookie["CurrentUser"] = idUser;
        Session["CurrentUser"] = idUser;
        Session.Timeout = 600;
        cookie.Expires = DateTime.Now.AddDays(100);
        Response.Cookies.Add(cookie);
        
        string IDGianHang = dataUser.Rows[0]["IDGianHang"].ToString();
        if (IDGianHang == "0" || string.IsNullOrEmpty(IDGianHang))
        {
            Response.RedirectToRoute("gianhang_alert");
            return;
        }


        
        object retUrl = Request.QueryString["retUrl"];
        if (retUrl != null)
        {
            Response.Redirect(retUrl.ToString());
            return;
        }
        Response.Redirect("/gianhang/dashboard");
    }
}