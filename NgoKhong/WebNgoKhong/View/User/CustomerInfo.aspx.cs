using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CurrentUser"] != null)
            {
                string id = Session["CurrentUser"].ToString();
                string sql = "select * from tb_User where ID = '" + id + "'";

                DataTable data = Connect.GetTable(sql);
                if (data == null || data.Rows.Count <= 0)
                {
                    return;
                }
                txtPhone.InnerHtml = data.Rows[0]["SoDienThoai"].ToString();
                txtEmail.InnerHtml = data.Rows[0]["Email"].ToString();
                txtTen.InnerHtml = data.Rows[0]["FullName"].ToString();
                txtDiaChi.InnerHtml = data.Rows[0]["Address"].ToString();
            }
        }
    }
}