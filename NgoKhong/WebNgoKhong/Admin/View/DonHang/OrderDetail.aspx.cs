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

    string mTenDangNhap = "";
    string mQuyen = "";
    string midNguoiDung = "";

    string txtFistPage = "1";
    string txtPage1 = "";
    string txtPage2 = "";
    string txtPage3 = "";
    string txtPage4 = "";
    string txtPage5 = "";
    string txtLastPage = "";
    int Page = 0;
    //int id = 0;
    int MaxPage = 0;
    int PageSize = 10;
    public string idShop { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            idShop = Request.QueryString["shop"].ToString();
        }
        catch
        {
            idShop = "";
        }
        if (!IsPostBack)
        {
            LoadDonHang();
        }
    }
    string getStatus(string name)
    {
        name = name.Trim();
        string html = "<div class='btn-group btn-group-toggle' data-toggle='buttons'>";
        html += "   <label class='btn btn-default " + (name == "Mới tạo" ? "active" : "") + "'>";
        html += "   <input type='radio' name='options' id='option1' autocomplete='off' checked> Mới tạo";
        html += "   </label>";
        html += "   <label class='btn btn-warning " + (name == "Đang xử lý" ? "active" : "") + "'>";
        html += "   <input type='radio' name='options' id='option2' autocomplete='off'>Đang xử lý";
        html += "   </label>";
        //html += "   <label class='btn btn-primary " + (name == "Đang giao" ? "active" : "") + "'>";
        //html += "   <input type='radio' name='options' id='option3' autocomplete='off'>Đang giao";
        //html += "   </label>";
        html += "   <label class='btn btn-success " + (name == "Hoàn tất" ? "active" : "") + "'>";
        html += "       <input type='radio' name='options' id='option3' autocomplete='off'>Hoàn tất";
        html += "   </label>";
        html += "   <label class='btn btn-danger " + (name == "Hủy" ? "active" : "") + "'>";
        html += "       <input type='radio' name='options' id='option4' autocomplete='off'>Hủy";
        html += "   </label>";
        html += " </div>";
        return html;
    }
    string getImageSanPham(string id)
    {
        string sql = "select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string url = data.Rows[0]["LinkHinh"].ToString();

        return "<img src=" + url + " class='img-hinhanh'>";
    }
    private void LoadDonHang()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }

        string id = Request.QueryString["id"].ToString();
        idDonHang.Value = id;

        string sql = @"select * from tb_DonHang d where d.idDonHang = '" + id + "'";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }

        int TotalRows = table.Rows.Count;
        string date = StaticData.DateFormat(table.Rows[0]["Ngay"].ToString());
        datecreate.InnerHtml = date;
        maDonHang.InnerHtml = table.Rows[0]["MaDonHang"].ToString();
        tenKhachHang.InnerHtml = table.Rows[0]["TenKhachHang"].ToString();
        soDienThoai.InnerHtml = table.Rows[0]["SoDienThoai"].ToString();
        diaChi.InnerHtml = table.Rows[0]["DiaChi"].ToString();
        email.InnerHtml = table.Rows[0]["Email"].ToString();
        tinhTrang.InnerHtml = getStatus(table.Rows[0]["Status"].ToString());

        sql = "select * from tb_CTDonHang c, tb_SanPham s where c.idSanPham = s.idSanPham and c.idDonHang = '"+id +"'";
        string html = @"<tr>
                        <th class='th' style='font-size: 15px;'>Mã sản phẩm</th>
                        <th class='th' style='font-size: 15px;'>Mã gian hàng</th>
                        <th class='th' style='font-size: 15px;'>Tên gian hàng</th>
                        <th class='th' style='font-size: 15px;'>Tên sản phẩm</th>
                        <th class='th' style='font-size: 15px;'>Hình ảnh</th>
                        <th class='th' style='font-size: 15px;'>Số lượng</th>
                        <th class='th' style='font-size: 15px;'>Giá</th>
                        <th class='th' style='font-size: 15px;'>Thành tiền</th>
                    </tr>";
        sql = @"select * from tb_CTDonHang c, tb_DonHang d, tb_SanPham s, tb_GianHang g where d.idDonHang = c.idDonHang and s.idSanPham = c.idSanPham and g.ID = s.IDGianHang and d.idDonHang = '" + id + "' ";
        if (!string.IsNullOrEmpty(idShop))
        {
            sql += " and s.idGianHang = '" + idShop + "'";
        }
        DataTable data = Connect.GetTable(sql);
        if (data == null)
        {
            return;
        }
        int tongTien = 0;
        for (int i = 0; i < data.Rows.Count; i++)
        {
            int SoLuong = int.Parse(data.Rows[i]["SoLuong"].ToString());
            int DonGia = int.Parse(data.Rows[i]["DonGia"].ToString());
            string link = "/" + MyStaticData.GenerateURL(data.Rows[i]["TenSanPham"].ToString()) + "-" + data.Rows[i]["idSanPham"].ToString();
            tongTien += SoLuong * DonGia;
            
            html += "<tr>";
            html += "<td><a href='" + link + "'>" + data.Rows[i]["MaSanPham"].ToString() + "</a></td>";
            string idGianHang = data.Rows[i]["idGianHang"].ToString();
            string shopCode = StaticData.getField("tb_GianHang", "ShopCode", "ID", idGianHang);
            html += "<td><a href='" + GetRouteUrl("adminChiTietGianHang", new { id = idGianHang }) + "'>" + shopCode + "</td>";
            html += "<td>" + data.Rows[i]["TenGianHang"].ToString() + "</td>";
            html += "<td>" + data.Rows[i]["TenSanPham"].ToString() + "</td>";
            html += "<td>" + getImageSanPham(data.Rows[i]["idSanPham"].ToString()) + "</td>";
            html += "<td>" + SoLuong.ToString("#,##") + "</td>";
            html += "<td>" + DonGia.ToString("#,##") + "</td>";
            html += "<td>" + (SoLuong * DonGia).ToString("#,##") + "</td>";
            html += "</tr>";
        }
        spTotal.InnerHtml = tongTien.ToString("#,##");
        dsMuaHang.InnerHtml = html;
    }
}