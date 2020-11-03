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
        string sql = "select * from [Page] where ID = '" + 1 + "'";
        DataTable table = DataProvider.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            dvContent.InnerHtml = table.Rows[0]["Content" + lang].ToString(); ;//"<h1 style='text-align:center'>" + table.Rows[0]["Title"].ToString() + "</h1>" + table.Rows[0]["Content"].ToString();
        }
    }
}