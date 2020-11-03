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
    string[] Status = { "Mới tạo", "Đang xử lý", "Hoàn tất", "Hủy" };
    string[] StatusColor = { "btn btn-default ", "btn btn-warning", "btn btn-success", "btn btn-danger " };

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
    //void LoadInfo()
    //{
    //    slStatus.Items.Add(new ListItem("","0"))
    //    < option value = "-1" > --Chọn tình trạng --</ option >

    //                                    < option value = "0" > Đã duyệt </ option >

    //                                         < option value = "0" > Chưa duyệt </ option >
    //}
    private void LoadDonHang()
    {
        //if (Request.QueryString["id"] == null)
        //{
        //    return;
        //}

        //string id = Request.QueryString["id"].ToString();

        //string sql = @"select * from tb_DonHang d where d.idDonHang = '" + id + "'";
        //DataTable table = Connect.GetTable(sql);
        //if (table == null)
        //{
        //    return;
        //}

        //int TotalRows = table.Rows.Count;
        //string date = StaticData.DateFormat(table.Rows[0]["Ngay"].ToString());
        //datecreate.InnerHtml = date;
        ////maDonHang.InnerHtml = table.Rows[0]["MaDonHang"].ToString();
        //tenKhachHang.InnerHtml = table.Rows[0]["TenKhachHang"].ToString();
        //soDienThoai.InnerHtml = table.Rows[0]["SoDienThoai"].ToString();
        //diaChi.InnerHtml = table.Rows[0]["DiaChi"].ToString();
        //email.InnerHtml = table.Rows[0]["Email"].ToString();
    }
    private void loadData()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        string idShop = Request.QueryString["id"].ToString();

        string sql = @"select * from tb_GianHang d where d.ID = '" + idShop + "'";
        DataTable shopInfo = Connect.GetTable(sql);
        if (shopInfo == null)
        {
            return;
        }


        tenGianHang.InnerHtml = shopInfo.Rows[0]["TenGianHang"].ToString();
        diaChi.InnerHtml = shopInfo.Rows[0]["DiaChi"].ToString();
        chuGianHang.InnerHtml = shopInfo.Rows[0]["ChuGianHang"].ToString();
        email.InnerHtml = shopInfo.Rows[0]["Email"].ToString();
        phone.InnerHtml = shopInfo.Rows[0]["SoDienThoai"].ToString();
        description.InnerHtml = shopInfo.Rows[0]["MoTas"].ToString();
        shopCode.InnerHtml = shopInfo.Rows[0]["ShopCode"].ToString();

        

        sql = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY d.idDonHang desc )AS RowNumber , *, 'TongTien' = (select isNull(Sum(SoLuong * DonGia),0) from tb_CTDonHang where idDonHang = d.idDonHang and idGianHang = '" + sIDGianHang + "')  from tb_DonHang d where  d.idDonHang in (select c.idDonHang from tb_CTDonHang c where c.idGianHang = '" + idShop+"')";
        if (!String.IsNullOrEmpty(sIDGianHang) && sIDGianHang != "0")
        {
            sql += " and d.idDonHang in (select distinct idDonHang from tb_CTDonHang where idGianHang = '" + sIDGianHang + "') ";
        }

        string from = dateFrom.Value;
        string to = dateTo.Value;
        int status = int.Parse(slStatus.Value.ToString());
        if (!string.IsNullOrEmpty(from))
        {
            sql += " and convert(date, Ngay, 103) >= convert(date, '" + from + "', 103) ";
        }
        if (!string.IsNullOrEmpty(to))
        {
            sql += " and convert(date, Ngay, 103) < convert(date, '" + to + "', 103) ";
        }
        if (status != -1)
        {
            sql += " and Status = N'" + Status[status] + "'";
        }

        sql += ") as tb1 ";
        DataTable tbTong = Connect.GetTable(sql);
        int TotalRows = tbTong.Rows.Count;

        int countNew = 0, countProccessing = 0, countComplete = 0, countCancel = 0;
        double sumMoney = 0;

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idDonHang = table.Rows[i]["idDonHang"].ToString();
            //sql = "select sum(c.DonGia * c.SoLuong) as TongTien from tb_CTDonHang c, tb_DonHang d where c.idDonHang = d.idDonHang and d.idDonHang = '" + idDonHang + "' group by c.idDonHang";
            //DataTable data = Connect.GetTable(sql);
            int tongTien = int.Parse(table.Rows[i]["TongTien"].ToString());
            sumMoney += tongTien;

            html += "   <tr>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["RowNumber"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["TenGianHang"] + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.DateFormat(table.Rows[i]["Ngay"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminChiTietDonHang", new { id = idDonHang, shop = idShop }) + "' >" + table.Rows[i]["MaDonHang"] + "</a></td>";
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminSanPhamKhachHang", new { id = table.Rows[i]["idUser"].ToString() }) + "'>" + table.Rows[i]["UserCode"] + "</a></td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["TenKhachHang"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["SoDienTHoai"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["DiaChi"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["GhiChu"] + "</td>";
            int statusID = getStatusID(table.Rows[i]["Status"].ToString());
            switch (statusID)
            {
                default:
                case 0:
                    countNew++;
                    break;
                case 1:
                    countProccessing++;
                    break;
                case 2:
                    countComplete++;
                    break;
                case 3:
                    countCancel++;
                    break;
            }
            string statusColor = StatusColor[statusID];
            //StatusColor
            html += "       <td style='text-align:center; '><div class='" + statusColor + "'>" + table.Rows[i]["Status"] + "</div></td>";
            html += "       <td style='text-align:center; '>" + tongTien.ToString("#,##") + "</td>";
            //html += "       <td style='text-align:center; '><a onclick='ShowDetail(\"" + table.Rows[i]["idDonHang"] + "\")' title='Chi tiết'><i class='fa fa-eye'></i></a></td>";
            //html += "       <td style='text-align:center; '><a onclick='ShowPopup_EditOrder(\"" + table.Rows[i]["idDonHang"] + "\")' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center; '><a onclick='Delete_Order(\"" + table.Rows[i]["idDonHang"] + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }

        string url = GetRouteUrl("adminChiTietDonHangCuaGianHang", new { id = idShop }) + "&";
        if (sChuoiTimKiem != "")
            url += "ChuoiTimKiem=" + sChuoiTimKiem + "&";
        url += "Page=";
        dvPaging.InnerHtml = StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        totalProduct.InnerHtml = TotalRows.ToString();
        totalProductNew.InnerHtml = countNew.ToString();
        totalProductProcessing.InnerHtml = countProccessing.ToString();
        totalProductComplete.InnerHtml = countComplete.ToString();
        totalProductCancel.InnerHtml = countCancel.ToString();
        dvDanhSachNguoiDung.InnerHtml = html;


        ////sql = "select * from tb_CTDonHang c, tb_SanPham s where c.idSanPham = s.idSanPham and c.idDonHang = '" + id + "'";
        ////string html = "";

        //string sql = @"select * from tb_DonHang where idUser = '" + idUser + "'";

        //string from = dateFrom.Value;
        //string to = dateTo.Value;
        //string status = slStatus.Value;
        //if (!string.IsNullOrEmpty(from))
        //{
        //    sql += " and convert(date, Ngay, 103) >= convert(date, '" + from + "', 103) ";
        //}
        //if (!string.IsNullOrEmpty(to))
        //{
        //    sql += " and convert(date, Ngay, 103) < convert(date, '" + to + "', 103) ";
        //}
        //if (status != "-1")
        //{
        //    sql += " and KichHoat = " + status;
        //}

        

        //if (data == null)
        //{
        //    return;
        //}
        //for (int i = 0; i < data.Rows.Count; i++)
        //{
        //    string link = "/" + MyStaticData.GenerateURL(data.Rows[i]["TenSanPham"].ToString()) + "-" + data.Rows[i]["idSanPham"].ToString();
        //    int DonGia = int.Parse(data.Rows[i]["GiaMoi"].ToString());
        //    string strDate = data.Rows[i]["NgayTao"].ToString();
        //    string idLoaiSanPham = data.Rows[i]["idLoaiSanPham"].ToString();

        //    html += "<tr>";
        //    html += "<td>" + data.Rows[i]["MaSanPham"].ToString() + "</td>";
        //    html += "<td>" + StaticData.DateFormat(strDate) + "</td>";
        //    html += "<td><a href='" + link + "'>" + data.Rows[i]["TenSanPham"].ToString() + "</a></td>";
        //    html += "<td>" + getImageSanPham(data.Rows[i]["idSanPham"].ToString()) + "</td>";
        //    html += "<td>" + StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idLoaiSanPham) + "</td>";
        //    html += "<td>" + DonGia.ToString("#,##") + "</td>";
        //    if (data.Rows[i]["KichHoat"].ToString() == "1" || data.Rows[i]["KichHoat"].ToString() == "True")
        //    {
        //        html += "<td><label class='btn btn-primary'>Đã duyệt</label></td>";
        //    }
        //    else
        //    {
        //        html += "<td><label class='btn btn-danger'>Chưa duyệt</label></td>";
        //    }

        //    html += "</tr>";
        //}

        //dsMuaHang.InnerHtml = html;
    }

    private int getStatusID(string status)
    {
        for (int i = 0; i < Status.Length; ++i)
        {
            if (Status[i] == status)
            {
                return i;
            }
        }

        return 1;
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