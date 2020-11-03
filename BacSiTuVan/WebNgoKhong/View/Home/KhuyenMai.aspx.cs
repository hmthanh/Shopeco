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
        string sql = "select * from Promotion";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();

            string col2 = Utils.DateFormat(data.Rows[i]["DateCreate"].ToString());

            string col3 = data.Rows[i]["Title" + lang].ToString();

            string col4 = "<img src='" + data.Rows[i]["Image"].ToString() + "' />";

            //string dateStart = Utils.DateFormat(data.Rows[i]["DateStart"].ToString());
            //string dateOut = Utils.DateFormat(data.Rows[i]["DateOut"].ToString());
            //string col5 = dateStart + " - " + dateOut;

            //string col6 = data.Rows[i]["ShortDesc"].ToString();

            string col7 = "<a href='" + GetRouteUrl("pagedetail", new { id = data.Rows[i]["PageID"].ToString() }) + "'><i class='fa fa-lg fa-eye'></i></a>";


            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            //html += "        <td>" + col5 + "</td>";
            //html += "        <td>" + col6 + "</td>";
            html += "        <td>" + col7 + "</td>";
            html += "</tr>";
        }


        tableContain.InnerHtml = html;
    }
}