using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_Login : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msgLogin.Visible = false;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = Utils.ValidParameter(txtUsername.Value.Trim());
        string password = Utils.ValidParameter(txtPassword.Value.Trim());

        bool isValid = true;

        if (string.IsNullOrEmpty(username))
        {
            isValid = false;
        }
        if (password == "")
        {
            isValid = false;
        }
        if (!isValid)
        {
            ShowError();
            return;
        }

        string sql = "select * from AdminUser u where u.Username = '" + username + "' and u.Password = '" + password + "'";
        DataTable userData = DataProvider.GetTable(sql);

        if (userData == null || userData.Rows.Count <= 0)
        {
            ShowError();
            return;
        }

        string idUser = userData.Rows[0]["ID"].ToString();
        
        HttpCookie cookie = new HttpCookie("Web");
        Session[Constant.AdminField] = idUser;
        cookie[Constant.AdminField] = idUser;
        cookie.Expires = DateTime.Now.AddDays(10);
        Response.Cookies.Add(cookie);

        string ret = Request.QueryString["retUrl"];
        if (ret != "" && ret != null)
        {
            Response.Redirect(ret);
        }

        Response.Redirect(GetRouteUrl("listpagenotify", new { }));
        //bool isNotUpdatePhone = string.IsNullOrEmpty(userData.Rows[0]["FullName"].ToString());

        //if (isNotUpdatePhone)
        //{
        //    Response.RedirectToRoute("home", new { });
        //}
        //else
        //{
            
        //}
    }
    void ShowError()
    {
        msgLogin.Visible = true;
        msgLogin.InnerHtml = "Tên đăng nhập hoặc mật khẩu không đúng !";
    }
    protected void btnChangeLang_Click(object sender, EventArgs e)
    {
        if (Session["lang"] == null)
        {
            Session["lang"] = "vi";
            return;
        }
        string lang = Session["lang"].ToString();
        if (lang == "en")
        {
            Session["lang"] = "vi";
        }
        else
        {
            Session["lang"] = "en";
        }
        Response.Redirect(Request.RawUrl);
    }
}