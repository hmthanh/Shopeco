using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_ShopInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string sql = "select * from tb_gianhang where ";
        object session = Session["CurrentUser"];
        HttpCookie cookies = Request.Cookies["GianHangUser"];
        
        if (session == null || cookies == null)
        {
            Response.RedirectToRoute("gianhang_login");
            return;
        }
        string email = "";
        if (session != null)
        {
            email = session.ToString();
        }

        string sql = "select * from tb_User where Email = '" + email + "'";

        DataTable data = Connect.GetTable(sql);

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string name = row["FullName"].ToString();
            string mail = row["Email"].ToString();
            string sodienthoai = row["PhoneNumber"].ToString();

            tenGianHang.InnerHtml = name;
            diaChiGianHang.InnerHtml = mail;
            //moTaGianHang.InnerHtml = mota;
            //chuGianHang.InnerHtml = chugianhang;
            soDienThoai.InnerHtml = sodienthoai;
        }
    }
}