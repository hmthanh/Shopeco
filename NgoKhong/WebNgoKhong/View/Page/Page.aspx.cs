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
        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(StaticData.getField("tb_Page","TenPage","idPage", idPage));
    }
}