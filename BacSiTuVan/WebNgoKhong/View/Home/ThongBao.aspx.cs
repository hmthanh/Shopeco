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
            LoadList();
        }
    }
    private void LoadList()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string sql = "select * from [Page] where TypeID = 2";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = (i + 1).ToString();
            //string userID = data.Rows[i]["UserID"].ToString();
            //string col2 = Utils.getField("[User]", "Fullname", "ID", userID);
            string col3 = data.Rows[i]["Title" + lang].ToString();
            string col4 = Utils.DateFormat(data.Rows[i]["DateCreate"].ToString());
            //string col5 = Utils.DateFormat(data.Rows[i]["LastEdit"].ToString());
            string col6 = "<a href='" + GetRouteUrl("pagedetail", new { id = data.Rows[i]["ID"].ToString() }) + "'><i class='fa fa-lg fa-eye'></i></a>";

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            //html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            html += "        <td  style='text-align:center;' >" + col6 + "</td>";
            html += "</tr>";
        }


        tableContain.InnerHtml = html;
    }
}