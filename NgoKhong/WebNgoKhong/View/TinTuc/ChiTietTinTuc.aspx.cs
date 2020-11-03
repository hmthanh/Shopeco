using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_TinTuc_ChiTietTinTuc : System.Web.UI.Page
{
    string TenLoai = "";
    string idTinTuc = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        //Response.Write(nameEn + " / " + id);
        try
        {
            idTinTuc = RouteData.Values["id"].ToString();
            //idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        }
        catch { }
        if (!IsPostBack)
        {
            LoadSanPham();
            string sql = "select top 8 *,'Anh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = sp.idSanPham) from tb_SanPham sp where KichHoat = 1";
            DataTable data = Connect.GetTable(sql);
            dvSanPhamHot.InnerHtml = MyStaticData.htmlListProduct(data);
            dvTinTucKhac.InnerHtml = MyStaticData.htmlTinTucKhac(idTinTuc);
        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(TenLoai);
    }
    private void LoadSanPham()
    {
        string sql = @"select *,'TenLoai' = (select TenLoaiTinTuc from tb_LoaiTinTuc where idLoaiTinTuc = sp.idLoaiTinTuc) from tb_TinTuc sp where idTinTuc = '" + idTinTuc + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            TenLoai = table.Rows[0]["TenLoai"].ToString();
            hTieuDe.InnerHtml = table.Rows[0]["TieuDe"].ToString();
            dvAnh.InnerHtml = "<a href='" + table.Rows[0]["AnhDaiDien"].ToString() + "' class='image-popup'><img src='" + table.Rows[0]["AnhDaiDien"].ToString() + "' alt=''></a>";
            dvNoiDung.InnerHtml = table.Rows[0]["NoiDung"].ToString();
            
        }
    }
}