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
            if (Session["CurrentUser"] == null)
            {
                return;
            }
            string id = Session["CurrentUser"].ToString();
            string sqluser = "select * from tb_User where ID = '" + id + "'";
            DataTable userData = Connect.GetTable(sqluser);

            string shopCode = userData.Rows[0]["ShopCode"].ToString();
            if (string.IsNullOrEmpty(shopCode))
            {
                Response.RedirectToRoute("usercreateshop", new { });
            }

            string sql = "select * from tb_GianHang where ShopCode = '" + shopCode + "'";
            DataTable data = Connect.GetTable(sql);

            if (data != null && data.Rows.Count > 0)
            {
                txtTenGianHang.InnerHtml = data.Rows[0]["TenGianHang"].ToString();
                txtDiaChi.InnerHtml = data.Rows[0]["DiaChi"].ToString();
                txtChuGianHang.InnerHtml = data.Rows[0]["ChuGianHang"].ToString();
                txtEmail.InnerHtml = data.Rows[0]["Email"].ToString();
                txtSoDienThoai.InnerHtml = data.Rows[0]["SoDienThoai"].ToString();
            }
        }
    }
}