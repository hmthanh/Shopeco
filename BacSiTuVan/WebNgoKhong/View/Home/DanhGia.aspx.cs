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
            //if (Session[Constant.UserField] != null)
            //{
            //    LoadList();
            //}
        }
    }
    private void LoadList()
    {
        if (Session[Constant.UserField] == null)
        {
            return;
        }
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string idDoctor = Session[Constant.UserField].ToString();
        string sql = "select * from Rating where DoctorID = '" + idDoctor + "'";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();

            string patientID = data.Rows[i]["PatientID"].ToString();
            string col2 = Utils.getField("[User]", "Fullname", "ID", patientID);
            
            string col3 = Utils.DateFormat(data.Rows[i]["DateRating"].ToString());

            string col4 = data.Rows[i]["Content" + lang].ToString();
            int rate = int.Parse(data.Rows[i]["Rate"].ToString());
            string col5 = "<div class='rating'>";
            for (int j = 0; j < rate; j++)
            {
                col5 += "    <i class='fa fa-star'></i>";
            }
            for (int j = rate; j < 5; j++)
            {
                col5 += "    <i class='fa fa-star-o'></i>";
            }
            col5 += "</div>";

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            html += "        <td>" + col5 + "</td>";
            html += "</tr>";
        }


        tableContain.InnerHtml = html;
    }
}