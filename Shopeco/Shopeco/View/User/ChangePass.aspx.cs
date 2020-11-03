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
        if (Session["CurrentUser"] == null)
        {
            Response.RedirectToRoute("login");
            return;
        }
        if (!IsPostBack)
        {
            msgError.InnerHtml = "";
        }
    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("user_info", new object { });
    }
    protected void btnLuuThongTin_Click(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Response.RedirectToRoute("login");
            return;
        }
        string IDUser = Session["CurrentUser"].ToString();
        string password1 = txtMatkhau1.Value;
        string password2 = txtMatkhau2.Value;

        if (password2 != password1)
        {
            msgError.InnerHtml = " Hai mật khẩu phải giống nhau ! ";
            return;
        }

        string sql = "update tb_User set ";
        sql += " Password = '" + password1 + "' ";
        sql += " where ID = '" + IDUser + "' ";
        bool isUpdate = Connect.Exec(sql);

        if (isUpdate)
        {
            msgError.InnerHtml = " Đã đổi mật khẩu thành công !";
        }
        else
        {
            msgError.InnerHtml = " Đã xảy ra lỗi khi đổi mật khẩu !";
        }
    }
}