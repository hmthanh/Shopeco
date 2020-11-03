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
        if (Session[Constant.UserField] == null)
        {
            return;
        }

        string idDoctor = Session[Constant.UserField].ToString();
        string sql = "select * from [Question] where DoctorID = '" + idDoctor + "'";
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

            string patientID = data.Rows[i]["PatientID"].ToString();
            string col3 = Utils.getField("[User]", "Fullname", "ID", patientID);

            string col4 = "<a href='" + GetRouteUrl("question", new { id = col1 }) + "' >" + data.Rows[i]["Title" + lang].ToString() + "</a>";

            string doctorID = data.Rows[i]["doctorID"].ToString();
            //string col5 = Utils.getField("[User]", "Fullname", "ID", doctorID);
                
            string statusID = data.Rows[i]["StatusID"].ToString();
            string statusClass = Utils.getField("[Status]", "Class", "ID", statusID);
            string statusName = Utils.getField("[Status]", "Name", "ID", statusID);
            string col6 = "<a class='" + statusClass + "'>" + statusName + "</a>";

            string price = data.Rows[i]["Price"].ToString();
            string col7 = int.Parse(price).ToString("#,##");

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            //html += "        <td>" + col5 + "</td>";
            html += "        <td>" + col6 + "</td>";
            html += "        <td>" + col7 + "</td>";
            html += "</tr>";
        }

        tableContain.InnerHtml = html;
    }
}