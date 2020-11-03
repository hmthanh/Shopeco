using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    string TypeID = "3";
    public string ID { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = (Request.QueryString["id"] == null ? null : Request.QueryString["id"].ToString());
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(ID))
            {
                btnUpdate.Text = HttpContext.GetGlobalResourceObject("name.language", "btnAddNew").ToString();
            }
            else
            {
                LoadContent();
            }
        }
    }

    private void LoadContent()
    {
        string lang = Session["lang"].ToString() == "en" ? "" : "EN";
        string sql = "select * from [Page] where ID = '" + ID + "'";
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
        string title = txtTitle.Value;
        string content = areaContent.Value;
        string timeNow = Utils.GetDate();

        if (string.IsNullOrEmpty(ID))
        {
            string sqlUpdate = "insert into [Page](Title"+lang+", Content"+lang+", TypeID, DateCreate, LastEdit) values(N'" + title + "', N'" + content + "', '" + TypeID + "', '" + timeNow + "', '" + timeNow + "')";
            bool isUpdate = DataProvider.Exec(sqlUpdate);
            if (isUpdate)
            {
                Response.RedirectToRoute("listpagepromotion");
            }
        }
        else
        {
            string sqlUpdate = "update [Page] set Title"+lang+" = N'" + title + "', Content"+lang+" = N'" + content + "', TypeID = '" + TypeID + "', LastEdit = '" + timeNow + "' where ID = '" + ID + "'";
            bool isUpdate = DataProvider.Exec(sqlUpdate);
            if (isUpdate)
            {
                Response.RedirectToRoute("listpagepromotion");
            }
        }
    }
}