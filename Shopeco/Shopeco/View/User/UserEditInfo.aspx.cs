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
        if(!IsPostBack)
        {
            LoadThongTinUser();
        }
    }
    public void LoadThongTinUser()
    {
        string IDUser = Session["CurrentUser"].ToString();

        string sql = "select * from tb_User where ID = '" + IDUser+ "'";

        DataTable data = Connect.GetTable(sql);
        if (data == null)
        {
            return;
        }

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string email = row["Email"].ToString();
            string diachi = row["Address"].ToString();
            string name = row["Fullname"].ToString();

            txtTen.Value = name;
            txtEmail.Value = email;
            txtDiaChi.Value = diachi;
            //txtPhone.Value = phone;
            //email
        }
    }
    protected void btnLuuThongTin_Click(object sender, EventArgs e)
    {
        string IDUser = Session["CurrentUser"].ToString();
        string email = txtEmail.Value;
        string diachi = txtDiaChi.Value;
        string ten = txtTen.Value;
        //string phone = txtPhone.Value;

        string sqlUpdate = "";
        sqlUpdate += "update tb_User set";
        //sqlUpdate += " PhoneNumber = N'" + phone + "'";
        sqlUpdate += " Email = N'" + email + "'";
        sqlUpdate += " , Fullname = N'" + ten + "'";
        sqlUpdate += " , Address = N'" + diachi + "'";
        sqlUpdate += " where ID ='" + IDUser + "'";
        bool isUpdate = Connect.Exec(sqlUpdate);
        if (isUpdate)
        {
            //Session["CurrentUser"] = phone;
            Response.RedirectToRoute("user_info", new { });
        }
        else
        {
            Response.Write("<script>alert('Lỗi 2 !')</script>");
        }
    }
    protected void btnHuy_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("user_info");
    }
}