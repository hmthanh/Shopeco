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

        string sql = "select *, 'matp' = (select matp from tb_tinhthanhpho where matp = h.MaTP) from tb_GianHang h where ID = '" + idGianHang + "'";

        DataTable data = Connect.GetTable(sql);

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string name = row["TenGianHang"].ToString();
            string diachi = row["DiaChi"].ToString();
            string mota = row["MoTas"].ToString();
            string chugianhang = row["ChuGianHang"].ToString();
            string sodienthoai = row["SoDienThoai"].ToString();

            string huyen = row["matp"].ToString();
            //string sqlkt = @"select t.*,h.name as h  from tb_quanhuyen h,tb_tinhthanhpho t where h.matp=t.matp and maqh = '" + huyen + "'";
            //DataTable tb = Connect.GetTable(sqlkt);
            LoadDsThanhPho();
            LoadDsQuanHuyen(row["matp"].ToString());
            cmbHuyen.SelectedIndex = 0;
            //cmbHuyen.Value = row["maqh"].ToString();
            cmbTinh.Value = row["matp"].ToString();
            tenGianHang.Value = name;
            diachiGianHang.Value = diachi;
            moTaGianHang.Value = mota;
            hotenChu.Value = chugianhang;
            soDienThoai.Value = sodienthoai;
        }
    }
    private void LoadDsThanhPho()
    {
        string sql = "select * from tb_tinhthanhpho order by name";
        
        cmbTinh.DataSource = Connect.GetTable(sql);
        cmbTinh.DataTextField = "name";
        cmbTinh.DataValueField = "matp";
        cmbTinh.DataBind();
    }
    private void LoadDsQuanHuyen(string maTP)
    {
        string sql = "select * from tb_quanhuyen where matp='" + maTP + "' order by name";

        cmbHuyen.DataSource = Connect.GetTable(sql);
        cmbHuyen.DataTextField = "name";
        cmbHuyen.DataValueField = "maqh";
        cmbHuyen.DataBind();
    }
}