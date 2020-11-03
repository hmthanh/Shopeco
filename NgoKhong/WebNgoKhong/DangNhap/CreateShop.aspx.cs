using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_ShopInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object session = Session["CurrentUser"];
        HttpCookie cookies = Request.Cookies["CurrentUser"];

        if (session == null && cookies == null)
        {
            Response.RedirectToRoute("gianhang_login");
            return;
        }
        string email = (cookies != null) ? cookies.Value : session.ToString();

        //Response.RedirectToRoute("gianhang_shopinfo", new { });
    }
    private void LoadDsThanhPho()
    {
        string sql = "select * from tb_tinhthanhpho";
        DataTable data = Connect.GetTable(sql);
        string html = "<select>";

        if (data != null)
        {
            for (int i = 0; i < data.Rows.Count; i++)
            {
                string name = data.Rows[i]["name"].ToString();
                string id = data.Rows[i]["matp"].ToString();
                html += "<option value='" + id + "'>" + name + "</option>";
            }
        }
        html += "</select>";
    }
}