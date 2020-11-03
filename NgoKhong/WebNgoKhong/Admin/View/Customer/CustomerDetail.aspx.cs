using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_SanPham_LoaiSanPham : System.Web.UI.Page
{
    string[] Status = { "Mới", "Đang xử lý", "Hoàn tất", "Hủy"};
    public string IDUser { get; set; }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            dvDanhSachNguoiDung.InnerHtml = "";
            return;
        }
        IDUser = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            LoadKhachhang();
            LoadGianHang();
            LoadRaoVat();
        }
    }

    private void LoadRaoVat()
    {
        string sqlAds = "select * from tb_RVUser u where u.UserID = '" + IDUser + "'";
        DataTable dataAds = Connect.GetTable(sqlAds);
        if (dataAds == null || dataAds.Rows.Count <= 0)
        {
            return;
        }

        //int TotalRows = dataShop.Rows.Count;

        rvTen.InnerHtml = dataAds.Rows[0]["FullName"].ToString();
        rvDiaChi.InnerHtml = dataAds.Rows[0]["Address"].ToString();
        rvEmail.InnerHtml = dataAds.Rows[0]["Email"].ToString();
        rvSoDienThoai.InnerHtml = dataAds.Rows[0]["Phone"].ToString();
        string adsCode = dataAds.Rows[0]["AdsCode"].ToString();
        rvMaRaoVat.InnerHtml = adsCode;
        rvDateCreate.InnerHtml = StaticData.DateFormat(dataAds.Rows[0]["DateCreate"].ToString());

        string sqlRV = "select count(*) as TongSoRaoVat from tb_RaoVat where AdsCode = '" + adsCode + "'";
        DataTable dataRV = Connect.GetTable(sqlRV);

        rvStatistic.InnerHtml = dataRV.Rows[0]["TongSoRaoVat"].ToString();
    }

    private void LoadGianHang()
    {
        string sqlUser = "select * from tb_User u where u.ID = '" + IDUser + "'";
        DataTable dataUser = Connect.GetTable(sqlUser);
        if (dataUser == null)
        {
            return;
        }

        string IDShop = dataUser.Rows[0]["IDGianHang"].ToString();
        string sqlShop = @"select * from tb_GianHang g where g.ID = '" + IDShop + "'";
        DataTable dataShop = Connect.GetTable(sqlShop);
        if (dataShop == null || dataShop.Rows.Count <= 0)
        {
            return;
        }
        string sqlProductSold = "select count(*) TongSoSanPham from tb_SanPham where IDGianhang = '" + IDShop + "'";
        DataTable productSold = Connect.GetTable(sqlProductSold);

        string sqlOrderSet = "select count(*) as TongSoDonHang from tb_DonHang d where d.idDonHang in (select idDonHang from tb_CTDonHang where idGianHang = '" + IDShop + "')";
        DataTable OrderSet = Connect.GetTable(sqlOrderSet);

        //int TotalRows = dataShop.Rows.Count;
        string strTongSoDonHang = (String.IsNullOrEmpty(OrderSet.Rows[0]["TongSoDonHang"].ToString()) ? "0" : OrderSet.Rows[0]["TongSoDonHang"].ToString());
        ghOrderSet.InnerHtml = strTongSoDonHang + " <a href='" + GetRouteUrl("adminChiTietDonHangCuaGianHang", new { id = IDShop }) + "'>&nbsp;  Đơn hàng đã được đặt  <i class='fa fa-search'></i></a>";

        string str = (String.IsNullOrEmpty(productSold.Rows[0]["TongSoSanPham"].ToString()) ? "0" : productSold.Rows[0]["TongSoSanPham"].ToString());
        ghProductSold.InnerHtml = str + " <a href='" + GetRouteUrl("adminChiTietGianHang", new { id = IDShop }) + "'>&nbsp;  Chi tiết gian hàng  <i class='fa fa-search'></i></a>";
        ghTen.InnerHtml = dataShop.Rows[0]["TenGianHang"].ToString();
        ghDiaChi.InnerHtml = dataShop.Rows[0]["DiaChi"].ToString();
        ghChuGianHang.InnerHtml = dataShop.Rows[0]["ChuGianHang"].ToString();
        ghEmail.InnerHtml = dataShop.Rows[0]["Email"].ToString();
        ghSoDienThoai.InnerHtml = dataShop.Rows[0]["SoDienThoai"].ToString();
        ghMoTa.InnerHtml = dataShop.Rows[0]["MoTas"].ToString();
        ghMaGianHang.InnerHtml = dataShop.Rows[0]["ShopCode"].ToString();
        ghDateCreate.InnerHtml = StaticData.DateFormat(dataShop.Rows[0]["DateCreate"].ToString());
    }
    
    private void LoadKhachhang()
    {
        string sql = @"select * from tb_user d where d.ID = '" + IDUser + "'";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }

        int TotalRows = table.Rows.Count;

        string idUser = table.Rows[0]["ID"].ToString();
        string sqlMoney = "select sum(SoLuong * DonGia) as TongTien from tb_CTDonHang c where c.idDonHang in (select idDonHang from tb_DonHang where idUser = '" + idUser + "')";
        DataTable totalMoney = Connect.GetTable(sqlMoney);

        usCustomerCode.InnerHtml = table.Rows[0]["UserCode"].ToString();
        usUserID.InnerHtml = table.Rows[0]["PhoneNumber"].ToString();
        dateUserCreate.InnerHtml = StaticData.DateFormat(table.Rows[0]["DateCreate"].ToString());
        usUsername.InnerHtml = table.Rows[0]["Username"].ToString();
        usTenNguoiDung.InnerHtml = table.Rows[0]["FullName"].ToString();
        usSoDienThoai.InnerHtml = table.Rows[0]["SoDienThoai"].ToString();
        usEmail.InnerHtml = table.Rows[0]["Email"].ToString();
        usDiaChi.InnerHtml = table.Rows[0]["Address"].ToString();
        
        usBought.InnerHtml = "<a href='" + GetRouteUrl("adminDonHangCuaKhachHang", new { id = idUser }) + "'>Chi tiết các đơn hàng</a>";

        string date = StaticData.DateFormat(table.Rows[0]["LastOnline"].ToString());
        datecreate.InnerHtml = date;

        //shopCode.InnerHtml = table.Rows[0]["ShopCode"].ToString();
        //adsCode.InnerHtml = table.Rows[0]["AdsCode"].ToString();

        usTotalMoney.InnerHtml = StaticData.ParseNumber(totalMoney.Rows[0]["TongTien"].ToString());
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminChinhSuaKhachHang", new { id = id });
    }
    protected void btnEditShop_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminEditShop", new { id = id });
    }
    protected void btnEditAds_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminEditAds", new { id = id });
    }
}