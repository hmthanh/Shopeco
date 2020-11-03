using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    public string ID { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = (Request.QueryString["id"] == null ? null : Request.QueryString["id"].ToString());
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(ID))
            {
                btnUpdate.Text = HttpContext.GetGlobalResourceObject("name.language", "btnAddNew").ToString();
                LoadType("");
            }
            {
                LoadContent();
            }
        }
    }

    private void LoadType(string id)
    {
        string sql = "select * from PageType";

        slType.DataSource = DataProvider.GetTable(sql);
        slType.DataTextField = "Name";
        slType.DataValueField = "ID";
        slType.DataBind();
        if (!string.IsNullOrEmpty(id))
        {
            slType.Items.FindByValue(id).Selected = true;
        }
    }
    
    private void LoadContent()
    {
        string sql = "select * from [Page] where ID = '" + ID + "'";
        DataTable data = DataProvider.GetTable(sql);

        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }
        string type = data.Rows[0]["TypeID"].ToString();
        LoadType(type);
        txtTitle.Value = data.Rows[0]["Title"].ToString();
        areaContent.InnerHtml = data.Rows[0]["Content"].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Value;
        string content = areaContent.Value;
        string typeID = slType.SelectedValue;
        string timeNow = Utils.GetDate();

        if (string.IsNullOrEmpty(ID))
        {
            string sqlUpdate = "insert into [Page](Title, Content, TypeID, DateCreate, LastEdit) values(N'" + title + "', N'" + content + "', '" + typeID + "', '" + timeNow + "', '" + timeNow + "')";
            bool isUpdate = DataProvider.Exec(sqlUpdate);
            if (isUpdate)
            {
                Response.RedirectToRoute("listpage");
            }
            else
            {
                
            }
        }
        else
        {
            string sqlUpdate = "update [Page] set Title = N'" + title + "', Content = N'" + content + "', TypeID = '" + typeID + "' where ID = '" + ID + "', LastEdit = '" + timeNow + "'";
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
}