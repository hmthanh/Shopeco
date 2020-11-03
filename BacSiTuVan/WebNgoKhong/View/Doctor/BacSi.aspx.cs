using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage {
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Constant.UserField] == null)
        {
            return;
        }
        string idUser = Session[Constant.UserField].ToString();
        Response.RedirectToRoute("detaildoctor", new { id = idUser });
        //if (!IsPostBack)
        //{
        //    LoadList();
        //}
    }
    private void LoadList()
    {
        string sql = "  select * from Doctor d, [User] u where d.UserID = u.ID";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();
            string col2 = data.Rows[i]["Fullname"].ToString();
            string col3 = data.Rows[i]["Specialist"].ToString();
            string col4 = data.Rows[i]["Phone"].ToString();
            string col5 = data.Rows[i]["Email"].ToString();

            string col6 = "<a href='" + GetRouteUrl("detaildoctor", new { id = data.Rows[i]["ID"].ToString() }) + "'><i class='fa fa-lg fa-eye'></i></a>";

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            html += "        <td>" + col5 + "</td>";
            html += "        <td style='text-align:center;'>" + col6 + "</td>";
            html += "</tr>";
        }


        tableContain.InnerHtml = html;
    }
}
