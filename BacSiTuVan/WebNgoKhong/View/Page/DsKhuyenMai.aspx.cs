using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadInfo();
        }
    }

    private void LoadInfo()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string sql = "select * from [Page] where TypeID = 3";
        DataTable data = DataProvider.GetTable(sql);

        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }
        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();
            string col2 = data.Rows[i]["Title" + lang].ToString();
            string typeID = data.Rows[i]["TypeID"].ToString();

            string col3 = Utils.getField("PageType", ("Name" + lang), "ID", typeID);

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td><a href='" + GetRouteUrl("editpromotion", new { id = data.Rows[i]["ID"].ToString() }) + "'>" + col2 + "</a></td>";
            html += "        <td>" + col3 + "</td>";
            html += "</tr>";
        }
        

        tableContain.InnerHtml = html;
    }
}