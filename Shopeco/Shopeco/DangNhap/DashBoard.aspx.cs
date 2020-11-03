using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_DashBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            string email = Session["CurrentUser"].ToString();

            string sql = "select * from tb_User where ID = '" + email + "'";
            DataTable data = Connect.GetTable(sql);

            if (data.Rows.Count > 0)
            {
                Response.RedirectToRoute("home", new object { });
            }
        }
    }
}