using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        LoadThongTinUser();
    }
    public void LoadThongTinUser()
    {
        string IDUser = Session["CurrentUser"].ToString();

        string sql = "select * from tb_User where ID = '" + IDUser + "'";

        DataTable data = Connect.GetTable(sql);
        if (data == null)
        {
            return;
        }

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string email = row["Email"].ToString();
            string addr = row["Address"].ToString();
            string name = row["Fullname"].ToString();

            tenNguoiDung.InnerHtml = name;
            diaChiEmail.InnerHtml = email;
            //soDienThoai.InnerHtml = phone;
            diachi.InnerHtml = addr;
            //email
        }
    }
}