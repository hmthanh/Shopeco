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
        if (Session["CurrentUser"] == null)
        {
            return ;
        }
        string IDUser = Session["CurrentUser"].ToString();
        string IDGianHang = StaticData.getField("tb_User", "IDGianHang", "ID", IDUser);
        if (string.IsNullOrEmpty(IDGianHang) || IDGianHang == "0")
        {
            Response.RedirectToRoute("gianhang_alert", new { });
        }
        //if (Session["CurrentUser"] != null)
        //{
        //    string phone = Session["CurrentUser"].ToString();
        //    //string sql = "select * from tb_User u, tb_GianHang g where u.IDGianHang = g.ID and SoDienThoai = '" + phone + "'";
            
        //    //DataTable data = Connect.GetTable(sql);
        //    //if (data == null)
        //    //{
        //    //    Response.RedirectToRoute("gianhang_alert", new { });
        //    //    return;
        //    //}
        //    //if (data.Rows.Count <= 0)
        //    //{
        //    //    Response.RedirectToRoute("gianhang_alert", new { });
        //    //    return;
        //    //}
        //}
    }
}