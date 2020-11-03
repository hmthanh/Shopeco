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
        
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        
        string idUser = Session["CurrentUser"].ToString();
        string idShop = StaticData.getField("tb_User", "IDGianHang", "ID", idUser);

        string sql = "select * from tb_GianHang where ID = '" + idShop + "'";

        DataTable data = Connect.GetTable(sql);
        if (data == null)
        {
            return;
        }

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string name = row["TenGianHang"].ToString();
            string diachi = row["DiaChi"].ToString();
            string mota = row["MoTa"].ToString();
            string chugianhang = row["ChuGianHang"].ToString();
            string sodienthoai = row["SoDienThoai"].ToString();

            tenGianHang.InnerHtml = name;

            string maqh = row["maqh"].ToString();
            string TenQuanHuyen = StaticData.getField("tb_QuanHuyen", "name", "maqh", maqh);
            string matp = StaticData.getField("tb_QuanHuyen", "matp", "maqh", maqh);
            string TenTinhThanh = StaticData.getField("tb_TinhThanhPho", "name", "matp", matp);

            diaChiGianHang.InnerHtml = diachi;// +" - "; +TenQuanHuyen + " - " + TenTinhThanh;
            moTaGianHang.InnerHtml = mota;
            chuGianHang.InnerHtml = chugianhang;
            soDienThoai.InnerHtml = sodienthoai;
        }
    }
}