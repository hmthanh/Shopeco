using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page_Page : System.Web.UI.Page
{
    string idPage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    string URL = ((System.Web.Routing.PageRouteHandler)Page.RouteData.RouteHandler).VirtualPath;
        //    try
        //    {
        //        if (URL != "")
        //        {
        //            idPage = URL.Split('?')[1].Split('=')[1];
        //        }
        //    }
        //    catch { }
        //}
        //catch { }
        idPage = Request.QueryString["id"].ToString();
        
        if (!IsPostBack)
        {
            LoadPage();
        }
    }

    private void LoadPage()
    {
        string sql = "select * from tb_ThongTin where MaLoaiTT = '" + idPage + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            dvContent.InnerHtml = "<h1 style='text-align:center'>" + table.Rows[0]["TieuDe"].ToString() + "</h1>" + table.Rows[0]["NoiDung"].ToString();
            //Price.InnerHtml = "<span class='price' id='ProductPrice'>$" + StaticData.getField("tb_CTSP_Size", "top 1 Gia", "idSanPham", table.Rows[0]["idSanPham"].ToString()) + "</span>";
            //spanLink.InnerHtml = table.Rows[0]["Handle"].ToString();


            //dvBody.InnerHtml = table.Rows[0]["Body"].ToString() + type;
        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(StaticData.getField("tb_LoaiThongTin", "TenLoai", "MaLoaiTT", idPage));
    }
}