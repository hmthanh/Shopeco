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
            if (string.IsNullOrEmpty(ID))
            {
                btnUpdate.Text = HttpContext.GetGlobalResourceObject("name.language", "btnAddNew").ToString();
            }
            {
                LoadContent();
            }
        }
    }
    
    private void LoadContent()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string sql = "select * from [Page] where ID = '1'";
        DataTable data = DataProvider.GetTable(sql);

        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }
        txtTitle.Value = data.Rows[0]["Title" + lang].ToString();
        areaContent.InnerHtml = data.Rows[0]["Content" + lang].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string typeID = "1";
        string title = txtTitle.Value;
        string content = areaContent.Value;
        string timeNow = Utils.GetDate();

        string sqlUpdate = "update [Page] set Title" + lang + " = N'" + title + "', Content" + lang + " = N'" + content + "', TypeID = '" + typeID + "' , LastEdit = '" + timeNow + "' where ID = '1'";
        bool isUpdate = DataProvider.Exec(sqlUpdate);
        if (isUpdate)
        {
            Response.RedirectToRoute("listpage");
        }
        else
        {

        }
    }
}