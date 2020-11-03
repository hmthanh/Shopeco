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
    string[] Status = { "Mới tạo", "Đang xử lý", "Hoàn tất", "Hủy"};

    string sChuoiTimKiem = "";
    string sIDGianHang = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadRaoVat();
        }
    }
    
    string getImageSanPham(string id)
    {
        string sql = "select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string url = data.Rows[0]["LinkHinh"].ToString();

        return "<img src=" + url + " class='img-hinhanh'>";
    }
    
    private void LoadRaoVat()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        
        string sAdsCode = Request.QueryString["id"].ToString();
        if (sAdsCode == "RVGUEST")
        {
            dvDanhSachNguoiDung.InnerHtml = "Không có người dùng ";
            adsTitle.InnerHtml = "";
            tbDsMuaHang.InnerHtml = "";
            return;
        }

        string sqlUser = "select * from tb_RaoVat where AdsCode = '" + sAdsCode + "'";
        DataTable dataUser = Connect.GetTable(sqlUser);
        if (dataUser == null || dataUser.Rows.Count <= 0)
        {
            dvDanhSachNguoiDung.InnerHtml = "Không có người dùng ";
            adsTitle.InnerHtml = "";
            tbDsMuaHang.InnerHtml = "";
            return;
        }

        maDonHang.InnerHtml = dataUser.Rows[0]["SoDienThoai"].ToString();
        tenKhachHang.InnerHtml = dataUser.Rows[0]["Email"].ToString();
        soDienThoai.InnerHtml = dataUser.Rows[0]["HoTen"].ToString();
        diaChi.InnerHtml = dataUser.Rows[0]["DiaChi"].ToString();
        adsCode.InnerHtml = sAdsCode;

        string html = @"<tr>
                        <th class='th' style='font-size: 15px; color: white;'>STT</th>
                        <th class='th' style='font-size: 15px; color: white;'>Mã tin đăng</th>
                        <th class='th' style='font-size: 15px; color: white;'>Ngày đăng</th>
                        <th class='th' style='font-size: 15px; color: white;'>Ngày hết hạn</th>
                        <th class='th' style='font-size: 15px; color: white;'>Tiêu đề</th>
                        <th class='th' style='font-size: 15px; color: white;'>Giá</th>
                    </tr>";
        string sql = @"select * from (SELECT ROW_NUMBER() OVER( ORDER BY idRaoVat) AS RowNumber , *  from tb_RaoVat d where d.AdsCode = '" + sAdsCode + "' ) as tb1 ";
        DataTable dataAds = Connect.GetTable(sql);
        if (dataAds == null || dataAds.Rows.Count <= 0)
        {
            return;
        }
        for (int i = 0; i < dataAds.Rows.Count; i++)
        {
            string link = "#";
            
            html += "<tr>";
            html += "<td>" + dataAds.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "<td><a href='" + GetRouteUrl("chitiet", new { id = dataAds.Rows[i]["idRaoVat"].ToString() }) + "'>" + dataAds.Rows[i]["idRaoVat"].ToString() + "</a></td>";
            html += "<td>" + StaticData.DateFormat(dataAds.Rows[i]["NgayTao"].ToString()) + "</td>";
            html += "<td>" + StaticData.DateFormat(dataAds.Rows[i]["NgayHetHan"].ToString()) + "</td>";
            html += "<td>" + dataAds.Rows[i]["TieuDe"].ToString() + "</td>";
            string Gia = dataAds.Rows[i]["Gia"].ToString();// int.Parse();
            html += "<td>" + Gia +"</td>";
            html += "</tr>";
        }

        dsMuaHang.InnerHtml = html;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminChinhSuaKhachHang", new { id = id });
    }
}