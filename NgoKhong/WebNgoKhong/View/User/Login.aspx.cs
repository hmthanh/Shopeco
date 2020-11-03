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
        if (!IsPostBack)
        {
            if (Request.QueryString["success"] != null)
            {
                msgRegister.Visible = true;
            }
            else
            {
                msgRegister.Visible = false;
            }
        }
    }
    protected void btDangNhap_Click(object sender, EventArgs e)
    {
        string phoneNum = txtPhone.Value.Trim();
        string password = txtMatKhau.Value.Trim();

        
        if (phoneNum == "")
        {
            msgPhone.InnerText = "Không được để trống ô";
            return;
        }
        else
        {
            msgPhone.InnerText = "";
        }
        if (password == "")
        {
            msgMatKhau.InnerText = "Không được để trống mật khẩu";
            return;
        }
        else
        {
            msgMatKhau.InnerText = "";
        }

        

        string sql = "select * from tb_User u where u.PhoneNumber='" + phoneNum + "' and u.Password = '" + StaticData.ValidParameter(password) + "'";
        DataTable userData = Connect.GetTable(sql);
        if (userData == null)
        {
            msgLogin.InnerHtml = "Số điện thoại hoặc mật khẩu không đúng";
            return;
        }
        else
        {
            if (userData.Rows.Count <= 0)
            {
                msgLogin.InnerHtml = "Số điện thoại hoặc mật khẩu không đúng";
                return;
            }
        }

        string idUser = userData.Rows[0]["ID"].ToString();
        string isBlock = StaticData.getField("tb_User", "IsBlock", "ID", idUser);
        if (isBlock == "True")
        {
            msgLogin.InnerHtml = "Tài khoản của bạn đã bị block !";
            return;
        }

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

        bool isNotUpdatePhone = string.IsNullOrEmpty(userData.Rows[0]["FullName"].ToString());

        if (isNotUpdatePhone)
        {
            Response.RedirectToRoute("usereditcustomer", new { });
        }
        else
        {

            Response.Redirect(GetRouteUrl("usercustomer", new { }));
        }
    }
}