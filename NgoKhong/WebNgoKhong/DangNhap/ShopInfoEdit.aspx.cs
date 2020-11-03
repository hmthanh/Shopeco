using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_ShopInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string sql = "select * from tb_gianhang where ";
        object session = Session["CurrentUser"];

        if (session == null)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            Response.RedirectToRoute("gianhang_login", new { retUrl = url });
            return;
        }
        string idGianHang = session.ToString();

        string sql = "select * from tb_GianHang where ID = '" + idGianHang + "'";

        DataTable data = Connect.GetTable(sql);

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string name = row["TenGianHang"].ToString();
            string diachi = row["DiaChi"].ToString();
            string mota = row["MoTa"].ToString();
            string chugianhang = row["ChuGianHang"].ToString();
            string sodienthoai = row["SoDienThoai"].ToString();

            tenGianHang.Value = name;
            diachiGianHang.Value = diachi;
            moTaGianHang.Value = mota;
            hotenChu.Value = chugianhang;
            soDienThoai.Value = sodienthoai;
        }
    }
    private void LoadDsThanhPho()
    {
        string sql = "select * from tb_tinhthanhpho";
        DataTable data = Connect.GetTable(sql);
        string html = "<select>";

        if (data != null)
        {
            for (int i = 0; i < data.Rows.Count; i++)
            {
                string name = data.Rows[i]["name"].ToString();
                string id = data.Rows[i]["matp"].ToString();
                html += "<option value='" + id + "'>" + name + "</option>";
            }
        }
        html += "</select>";
    }
}