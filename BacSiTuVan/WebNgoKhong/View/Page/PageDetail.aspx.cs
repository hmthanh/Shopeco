using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_GioiThieu : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadPage();
    }
    private void LoadPage()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string pageID = Request.QueryString["id"].ToString();
        string sql = "select * from [Page] where ID = '" + pageID + "'";
        DataTable table = DataProvider.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            dvContent.InnerHtml = "<h1 style='text-align:center'>" + table.Rows[0]["Title" + lang].ToString() + "</h1>" + table.Rows[0]["Content" + lang].ToString();
        }
    }
}