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
    string[] Status = { "Mới", "Đang xử lý", "Hoàn tất", "Hủy" };

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
    int Page = 1;
    //int id = 0;
    int MaxPage = 0;
    int PageSize = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Page = int.Parse(Request.QueryString["Page"]);
        }
        catch
        {
            Page = 1;
        }
        if (!IsPostBack)
        {
            loadData();
        }
    }

    string getImageSanPham(string id)
    {
        string sql = "select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        DataTable data = Connect.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return "";
        }
        string url = data.Rows[0]["LinkHinh"].ToString();

        return "<img src=" + url + " class='img-hinhanh'>";
    }
    private void loadData()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        string idShop = Request.QueryString["id"].ToString();

        string sql = @"select * from tb_GianHang d where d.ID = '" + idShop + "'";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }

        tenGianHang.InnerHtml = table.Rows[0]["TenGianHang"].ToString();
        diaChi.InnerHtml = table.Rows[0]["DiaChi"].ToString();
        chuGianHang.InnerHtml = table.Rows[0]["ChuGianHang"].ToString();
        email.InnerHtml = table.Rows[0]["Email"].ToString();
        phone.InnerHtml = table.Rows[0]["SoDienThoai"].ToString();
        description.InnerHtml = table.Rows[0]["MoTas"].ToString();
        shopCode.InnerHtml = table.Rows[0]["ShopCode"].ToString();

        //sql = "select * from tb_CTDonHang c, tb_SanPham s where c.idSanPham = s.idSanPham and c.idDonHang = '" + id + "'";
        string html = "";
        //sql = @"select * from tb_SanPham where IDGianHang = '" + idShop + "'";

        sql = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY d.idSanPham desc )AS RowNumber , * from tb_SanPham d where d.IDGianHang = '" + idShop + "' ";
        string from = dateFrom.Value;
        string to = dateTo.Value;
        string status = slStatus.Value;
        if (!string.IsNullOrEmpty(from))
        {
            sql += " and convert(date, NgayTao, 103) >= convert(date, '" + from + "', 103) ";
        }
        if (!string.IsNullOrEmpty(to))
        {
            sql += " and convert(date, NgayTao, 103) < convert(date, '" + to + "', 103) ";
        }
        if (status != "-1")
        {
            sql += " and KichHoat = " + status;
        }
        sql += ") as tb1 ";
        DataTable tbDataSum = Connect.GetTable(sql);
        int TotalRows = tbDataSum.Rows.Count;

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable data = Connect.GetTable(sql);
        
        totalProduct.InnerHtml = data.Rows.Count.ToString();

        if (data == null)
        {
            return;
        }
        double sumMoney = 0;
        int countChecked = 0, countUnChecked = 0;
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string link = "/" + MyStaticData.GenerateURL(data.Rows[i]["TenSanPham"].ToString()) + "-" + data.Rows[i]["idSanPham"].ToString();
            int DonGia = int.Parse(data.Rows[i]["GiaMoi"].ToString());
            sumMoney += (double)(DonGia);
            string strDate = data.Rows[i]["NgayTao"].ToString();
            string idLoaiSanPham = data.Rows[i]["idLoaiSanPham"].ToString();

            html += "<tr>";
            html += "<td>" + data.Rows[i]["MaSanPham"].ToString() + "</td>";
            html += "<td>" + StaticData.DateFormat(strDate) + "</td>";
            html += "<td><a href='" + link + "'>" + data.Rows[i]["TenSanPham"].ToString() + "</a></td>";
            html += "<td>" + getImageSanPham(data.Rows[i]["idSanPham"].ToString()) + "</td>";
            html += "<td>" + StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idLoaiSanPham) + "</td>";
            html += "<td>" + DonGia.ToString("#,##") + "</td>";
            if (data.Rows[i]["KichHoat"].ToString() == "1" || data.Rows[i]["KichHoat"].ToString() == "True")
            {
                countChecked++;
                html += "<td><label class='btn btn-primary'>Đã duyệt</label></td>";
            }
            else
            {
                countUnChecked++;
                html += "<td><label class='btn btn-danger'>Chưa duyệt</label></td>";
            }

            html += "</tr>";
        }

        string url = GetRouteUrl("adminChiTietGianHang", new { id = idShop }) + "&";
        if (sChuoiTimKiem != "")
            url += "ChuoiTimKiem=" + sChuoiTimKiem + "&";
        url += "Page=";
        dvPaging.InnerHtml = StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));

        totalMoney.InnerHtml = sumMoney.ToString("#,##");
        totalChecked.InnerHtml = countChecked.ToString();
        totalUnCheck.InnerHtml = countUnChecked.ToString();
        dsMuaHang.InnerHtml = html;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        loadData();
        //string id = Request.QueryString["id"].ToString();
        //Response.RedirectToRoute("adminChinhSuaKhachHang", new { id = id });
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        loadData();
    }
}