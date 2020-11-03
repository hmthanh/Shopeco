using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_GianHang : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            //string url = HttpContext.Current.Request.Url.AbsolutePath;
            //Response.RedirectToRoute("login", new { retUrl = url });
            //return;
            dDangKy.Visible = false;
            dDangNhap.Visible = false;
            string idUser = Session["CurrentUser"].ToString();
            //string sql = "select * from tb_User where ID = '"+idUser+"'";

            btnUser.Text = "" + StaticData.getField("tb_User", "Username", "ID", idUser) + "&nbsp;&nbsp;<i class='fa fa-user-circle-o fa-lg'></i>";
        }
        else
        {
            dDangKy.Visible = true;
            dDangNhap.Visible = true;
            dUsername.Visible = false;
        }
    }
    protected void dangNhap_Click(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        Response.RedirectToRoute("login", new { retUrl = url });
    }
    protected void btnUser_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("userinfo", new { });
    }
    protected void searchKeyword_Click(object sender, EventArgs e)
    {
        string keyword = txtSearch.Value;
        Response.RedirectToRoute("timkiem", new { q = keyword });
    }
}
