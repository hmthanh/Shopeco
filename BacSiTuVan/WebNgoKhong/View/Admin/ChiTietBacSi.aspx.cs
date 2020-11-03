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
        string ID = Request.QueryString["id"].ToString();
        string sql = "  select * from Doctor d, [User] u where d.UserID = u.ID and d.ID = '" + ID + "'";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        docName.InnerText = data.Rows[0]["Name"].ToString();
        docSpecialist.InnerText = data.Rows[0]["Specialist"].ToString();
        docWork.InnerText = data.Rows[0]["Working"].ToString();
        docPhone.InnerText = data.Rows[0]["Phone"].ToString();
        docEmail.InnerText = data.Rows[0]["Email"].ToString();

        regency.InnerText = data.Rows[0]["Regency"].ToString();
        sumary.InnerText = data.Rows[0]["Sumary"].ToString();
        experience.InnerText = data.Rows[0]["Experience"].ToString();
        education.InnerText = data.Rows[0]["Education"].ToString();
        string imgId = data.Rows[0]["ImageID"].ToString();
        

        docImg.InnerHtml = "<img class='img-circle img-responsive' alt='' src='" + Utils.getField("Image", "Url", "ID", imgId) + "'>";
    }
}