using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    public string idDoctor { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadList();
            Load();
        }
    }
    void Load()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string IDTinh = slDoctor.SelectedValue;
        string sql = "select * from Doctor";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null)
        {
            return;
        }
        slDoctor.DataSource = data;
        slDoctor.DataTextField = "Name" + lang;
        slDoctor.DataValueField = "UserID";
        slDoctor.DataBind();
        if (lang == "en")
        {
            slDoctor.Items.Add(new ListItem("Tất cả", "0"));
        }
        else
        {
            slDoctor.Items.Add(new ListItem("All", "0"));
        }

        slDoctor.Items.FindByValue("0").Selected = true;
    }
    private void LoadList()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string docID = slDoctor.SelectedValue;
        string sql = "select * from [Question] where 1 = 1 ";
        if (!string.IsNullOrEmpty(docID) && docID != "0")
        {
            sql += " and DoctorID = '" + docID + "' ";
        }
        string from = dayFrom.Value;
        string to = dayTo.Value;

        if (!string.IsNullOrEmpty(from))
        {
            sql += " and convert(date, DateCreate, 103) >= convert(date, '" + from + "', 103) ";
        }
        if (!string.IsNullOrEmpty(to))
        {
            sql += " and convert(date, DateCreate, 103) < convert(date, '" + to + "', 103) ";
        }
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            tableContain.InnerHtml = "";
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();

            string col2 = Utils.DateFormat(data.Rows[i]["DateCreate"].ToString());

            string patientID = data.Rows[i]["PatientID"].ToString();
            string col3 = Utils.getField("[User]", "Fullname" + lang, "ID", patientID);

            string col4 = "<a href='" + GetRouteUrl("question", new { id = col1 }) + "' >" + data.Rows[i]["Title" + lang].ToString() + "</a>";

            string doctorID = data.Rows[i]["doctorID"].ToString();
            string col5 = Utils.getField("[User]", "Fullname" + lang, "ID", doctorID);

            string statusID = data.Rows[i]["StatusID"].ToString();
            string statusClass = Utils.getField("[Status]", "Class", "ID", statusID);
            string statusName = Utils.getField("[Status]", "Name" + lang, "ID", statusID);
            string col6 = "<a class='" + statusClass + "'>" + statusName + "</a>";

            string price = data.Rows[i]["Price"].ToString();
            string col7 = int.Parse(price).ToString("#,##");

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            html += "        <td>" + col5 + "</td>";
            html += "        <td>" + col6 + "</td>";
            html += "        <td>" + col7 + "</td>";
            html += "</tr>";
        }

        tableContain.InnerHtml = html;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadList();
    }
    protected void slDoctor_Load(object sender, EventArgs e)
    {
        
    }
}