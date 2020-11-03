using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            if (Session["CurrentUser"] != null)
            {
                string idUser = Session["CurrentUser"].ToString();
                string adsCode = StaticData.getField("tb_User", "AdsCode", "ID", idUser);
                if (string.IsNullOrEmpty(adsCode))
                {
                    Response.RedirectToRoute("usercreateads", new { });
                    return;
                }
                string sql = "select * from tb_RVUser where UserID = '" + idUser + "'";

                DataTable data = Connect.GetTable(sql);
                if (data == null || data.Rows.Count <= 0)
                {
                    Response.RedirectToRoute("usercreateads", new { });
                    return;
                }
                txtTen.InnerHtml = data.Rows[0]["FullName"].ToString();
                txtPhone.InnerHtml = data.Rows[0]["Phone"].ToString();
                txtEmail.InnerHtml = data.Rows[0]["Email"].ToString();
                txtDiaChi.InnerHtml = data.Rows[0]["Address"].ToString();
            }
        }
    }
}