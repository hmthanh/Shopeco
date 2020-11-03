using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Ajax_UpdateShopInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["name"] == null)
        {
            Response.Write(false);
            return ;
        }
        string ten = Request["name"].ToString();
        string DiaChi = Request["address"].ToString();
        string MoTa = Request["description"].ToString();
        string chuGianHang = Request["owner"].ToString();
        string soDienThoaiGianHang = Request["phone"].ToString();
        string huyen = Request["maqh"].ToString(); ;
        //string sqlkt = @"select * from tb_quanhuyen where name = N'" + Quan[1] + "'";
        //DataTable data = Connect.GetTable(sqlkt);

        //huyen = data.Rows[0]["maqh"].ToString();

        if (String.IsNullOrEmpty(ten) || String.IsNullOrEmpty(chuGianHang) || String.IsNullOrEmpty(soDienThoaiGianHang))
        {
            Response.Write(false);
            return;
        }

        ////////////////////////////////////////////////////////////////
        object idGianHang = Session["CurrentUser"];

        if (idGianHang == null)
        {
            Response.Write(false);
            return;
        }

        string sqlUpdate = "update tb_GianHang set TenGianHang = N'" + ten + "'";
        sqlUpdate += ",DiaChi = N'" + DiaChi + "'";
        sqlUpdate += ",MoTa = N'" + MoTa + "'";
        sqlUpdate += ",ChuGianHang = N'" + chuGianHang + "'";
        sqlUpdate += ",maqh = N'" + huyen + "'";
        sqlUpdate += ",SoDienThoai = '" + soDienThoaiGianHang + "'";
        sqlUpdate += " where SoDienThoai = '" + soDienThoaiGianHang + "'";

        bool isSuccess = Connect.Exec(sqlUpdate);
        Response.Write(isSuccess);
    }
}