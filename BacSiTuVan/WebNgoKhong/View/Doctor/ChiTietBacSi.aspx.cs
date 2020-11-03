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
            LoadDetail();
        }
    }
    private void LoadDetail()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string ID = Request.QueryString["id"].ToString();
        string sql = "  select * from Doctor d, [User] u where d.UserID = u.ID and d.ID = '" + ID + "'";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        docName.InnerText = data.Rows[0]["Name" + lang].ToString();
        docSpecialist.InnerText = data.Rows[0]["Specialist" + lang].ToString();
        docWork.InnerText = data.Rows[0]["Working" + lang].ToString();
        docPhone.InnerText = data.Rows[0]["Phone"].ToString();
        docEmail.InnerText = data.Rows[0]["Email"].ToString();

        regency.InnerText = data.Rows[0]["Regency" + lang].ToString();
        sumary.InnerText = data.Rows[0]["Sumary" + lang].ToString();
        experience.InnerText = data.Rows[0]["Experience" + lang].ToString();
        education.InnerText = data.Rows[0]["Education" + lang].ToString();
        string imgId = data.Rows[0]["ImageID"].ToString();
        

        docImg.InnerHtml = "<img class='img-circle img-responsive' alt='' src='" + Utils.getField("Image", "Url", "ID", imgId) + "'>";
    }
}