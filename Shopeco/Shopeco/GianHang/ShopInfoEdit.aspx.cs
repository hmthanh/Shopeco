using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_ShopInfoEdit : System.Web.UI.Page
{
    public string IDShop { get; set; }
    public string IDUser { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        IDUser = Session["CurrentUser"].ToString();

        string IDShop = StaticData.getField("tb_User", "IDGianHang", "ID", IDUser);
        string sql = "select *, 'matp' = (select matp from tb_quanhuyen where maqh = h.maqh) from tb_GianHang h where ID = '" + IDShop + "'";

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

            string huyen = row["maqh"].ToString();
            string sqlkt = @"select t.*,h.name as h  from tb_quanhuyen h,tb_tinhthanhpho t where h.matp=t.matp and maqh = '" + huyen + "'";
            DataTable tb = Connect.GetTable(sqlkt);
            LoadDsThanhPho();
            LoadDsQuanHuyen(row["matp"].ToString());
            cmbHuyen.Value = row["maqh"].ToString();
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
        cmbTinh.Items[0].Selected = true;
        cmbTinh.SelectedIndex = 1;
    }
    private void LoadDsQuanHuyen(string maTP)
    {
        string sql = "select * from tb_quanhuyen where matp='" + maTP + "' order by name";

        cmbHuyen.DataSource = Connect.GetTable(sql);
        cmbHuyen.DataTextField = "name";
        cmbHuyen.DataValueField = "maqh";
        cmbHuyen.DataBind();
        cmbTinh.Items[0].Selected = true;
        cmbTinh.SelectedIndex = 1;
    }
    protected void btnLuuThongTin_Click(object sender, EventArgs e)
    {
        //string ten = tenGianHang.Value;
        //string diaChi = diachiGianHang.Value;
        //string moTa = moTaGianHang.Value;
        //string maqh = cmbHuyen.Value;

        //string phone = Session["CurrentUser"].ToString();
        //string sql = "select * from tb_TaiKhoan_GianHang u where u.SoDienThoai = '" + phone + "'";

        //DataTable dataUser = Connect.GetTable(sql);
        //if (dataUser == null)
        //{

        //    return;
        //}

        //if (dataUser.Rows.Count > 0)
        //{
        //    string chuGianHang = dataUser.Rows[0]["HoTen"].ToString();
        //    string email = dataUser.Rows[0]["Email"].ToString();


        //    sql = "insert into tb_GianHang(TenGianHang, DiaChi, MoTa, ChuGianHang, Email, SoDienThoai, maqh) values(N'" + ten + "', N'" + diaChi + "', N'" + moTa + "', N'" + chuGianHang + "', '" + email + "', '" + phone + "', " + maqh + ")";

        //    bool isUpdate = Connect.Exec(sql);

        //    if (isUpdate)
        //    {
        //        string idGianHang = StaticData.getField("tb_GianHang", "Max(ID)", "1", "1");
        //        sql = "update tb_TaiKhoan_GianHang set IDGianHang = '" + idGianHang + "' where SoDienThoai = '" + phone + "'";
        //        isUpdate = Connect.Exec(sql);

        //        if (isUpdate)
        //        {
        //            Response.RedirectToRoute("gianhang_dashboard", new object { });
        //        }
        //    }
        //}
        string ten = tenGianHang.Value;
        string DiaChi = diachiGianHang.Value;
        string MoTa = moTaGianHang.Value;
        string chuGianHang = hotenChu.Value;
        string SoDienThoai = soDienThoai.Value;
        string huyen = cmbHuyen.Value;
        //string sqlkt = @"select * from tb_quanhuyen where name = N'" + Quan[1] + "'";
        //DataTable data = Connect.GetTable(sqlkt);

        //huyen = data.Rows[0]["maqh"].ToString();

        if (String.IsNullOrEmpty(ten) || String.IsNullOrEmpty(chuGianHang) || String.IsNullOrEmpty(SoDienThoai))
        {
            Response.Write(false);
            return;
        }

        ////////////////////////////////////////////////////////////////
        if (Session["CurrentUser"] == null)
        {
            Response.Write(false);
            return;
        }

        string sqlUpdate = "update tb_GianHang set TenGianHang = N'" + ten + "'";
        sqlUpdate += ",DiaChi = N'" + DiaChi + "'";
        sqlUpdate += ",MoTa = N'" + MoTa + "'";
        sqlUpdate += ",ChuGianHang = N'" + chuGianHang + "'";
        sqlUpdate += ",maqh = N'" + huyen + "'";
        sqlUpdate += ",SoDienThoai = '" + SoDienThoai + "'";
        sqlUpdate += " where ID = '" + IDShop + "'";

        bool isUpdate = Connect.Exec(sqlUpdate);

        if (isUpdate)
        {
            Response.RedirectToRoute("gianhang_shopinfo", new object { });
        }
    }
}