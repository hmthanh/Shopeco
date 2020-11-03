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
    string dateFrom = "";
    string dateTo = "";

    int Page = 0;
    int id = 0;
    int MaxPage = 0;
    int PageSize = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        List<string> _Status = new List<string>();
        try
        {
            Page = int.Parse(Request.QueryString["Page"].ToString());
        }
        catch
        {
            Page = 1;
        }
        dateFrom = txtDateFrom.Value;
        dateTo = txtDateTo.Value;

        try
        {
            id = int.Parse(slStatus.Value);
        }
        catch
        {
            id = 1;
        }
        if (id > Status.Length)
        {
            id = Status.Length;
        }
        if (id == 0)
        {
            title_page.InnerHtml = "DANH SÁCH ĐƠN HÀNG";// + Status[id - 1].ToUpper();
        }
        else
        {
            title_page.InnerHtml = "DANH SÁCH ĐƠN HÀNG - " + Status[id - 1].ToUpper();
        }

        if (!IsPostBack)
        {
            try
            {
                if (Request.QueryString["ChuoiTimKiem"].Trim() != "")
                {
                    sChuoiTimKiem = Request.QueryString["ChuoiTimKiem"].Trim();
                    //txtTimKiem.Value = sChuoiTimKiem;
                }
            }
            catch { }

            LoadGianHang();
            LoadDonHang();
        }
    }
    
    private void LoadDonHang()
    {   
        string sql = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY d.idDonHang desc )AS RowNumber , *, 'TongTien' = (select isNull(Sum(SoLuong * DonGia),0) from tb_CTDonHang where idDonHang = d.idDonHang)  from tb_DonHang d where 1 = 1 ";
        if (id > 0)
        {
            string status = Status[id - 1].ToString();
            sql += " and d.Status = N'" + status + "'";
        }
        if (!String.IsNullOrEmpty(sIDGianHang) && sIDGianHang != "0")
        {
            sql += " and d.idDonHang in (select distinct idDonHang from tb_CTDonHang where idGianHang = '" + sIDGianHang + "') ";
        }
        if (!string.IsNullOrEmpty(dateFrom))
        {
            //sql += " and convert(date, Ngay, 103) = convert(date, '" + dateFrom + "' , 103)";
            sql += " and convert(date, Ngay, 103) >= convert(date, '" + dateFrom + "', 103) ";
        }
        if (!string.IsNullOrEmpty(dateTo))
        {
            //sql += " and convert(date, Ngay, 103) = convert(date, '" + dateFrom + "' , 103)";
            sql += " and convert(date, Ngay, 103) < convert(date, '" + dateTo + "', 103) ";
        }
        //if (sChuoiTimKiem != "")
        //{
        //    sql += " and ( TenKhachHang like N'%" + sChuoiTimKiem + "%' or SoDienThoai like N'%" + sChuoiTimKiem + "%') ";
        //}

        sql += ") as tb1 ";
        DataTable tbTong = Connect.GetTable(sql);

        int TotalRows = tbTong.Rows.Count;
        int countNew = 0, countProccessing = 0, countComplete = 0, countCancel = 0;
        for (int i = 0; i < tbTong.Rows.Count; i++)
        {
            int statusID = getStatusID(tbTong.Rows[i]["Status"].ToString());
            switch ((statusID + 1))
            {
                default:
                case 1:
                    countNew++;
                    break;
                case 2:
                    countProccessing++;
                    break;
                case 3:
                    countComplete++;
                    break;
                case 4:
                    countCancel++;
                    break;
            }
        }
        totalProduct.InnerHtml = TotalRows.ToString();
        totalProductNew.InnerHtml = countNew.ToString();
        totalProductProcessing.InnerHtml = countProccessing.ToString();
        totalProductComplete.InnerHtml = countComplete.ToString();
        totalProductCancel.InnerHtml = countCancel.ToString();

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);

        double sumMoney = 0;
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
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminChiTietDonHang", new { id = idDonHang }) + "' >" + table.Rows[i]["MaDonHang"] + "</a></td>";
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminSanPhamKhachHang", new { id = table.Rows[i]["idUser"].ToString() }) +"'>" + table.Rows[i]["UserCode"] + "</a></td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["TenKhachHang"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["SoDienTHoai"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["DiaChi"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["GhiChu"] + "</td
            //int statusID = getStatusID(table.Rows[i]["Status"].ToString());
            int statusID = getStatusID(table.Rows[i]["Status"].ToString());
            //switch ((statusID+1))
            //{
            //    default:
            //    case 1:
            //        countNew++;
            //        break;
            //    case 2:
            //        countProccessing++;
            //        break;
            //    case 3:
            //        countComplete++;
            //        break;
            //    case 4:
            //        countCancel++;
            //        break;
            //}
            //string statusColor = StatusColor[statusID];

            
            html += "       <td style='text-align:center; '><div class='" + StatusColor[statusID] + "'>" + table.Rows[i]["Status"] + "</div></td>";
            html += "       <td style='text-align:center; '>" + tongTien.ToString("#,##") + "</td>";
            //html += "       <td style='text-align:center; '><a onclick='ShowDetail(\"" + table.Rows[i]["idDonHang"] + "\")' title='Chi tiết'><i class='fa fa-eye'></i></a></td>";
            //html += "       <td style='text-align:center; '><a onclick='ShowPopup_EditOrder(\"" + table.Rows[i]["idDonHang"] + "\")' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center; '><a onclick='Delete_Order(\"" + table.Rows[i]["idDonHang"] + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }

        string url = GetRouteUrl("adminDonHang", new { id = id }) + "&";
        if (sChuoiTimKiem != "")
            url += "ChuoiTimKiem=" + sChuoiTimKiem + "&";
        url += "Page=";
        pagingData.InnerHtml = StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));

        dvDanhSachNguoiDung.InnerHtml = html;
    }

    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        //sChuoiTimKiem = txtTimKiem.Value.Trim();
        sIDGianHang = slGianHang.Value.Trim();
        
//        string sql = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY d.idDonHang desc )AS RowNumber ,
//[idChiTiet], c.idDonHang , [MaDonHang],[TenKhachHang], [SoDienThoai], [Email], [DiaChi], [Ngay], [GhiChu], [Status], s.IDGianHang  from tb_CTDonHang c, tb_DonHang d, tb_SanPham s where d.idDonHang = c.idDonHang and s.idSanPham = c.idSanPham ";
//        sIDGianHang = slGianHang.Value.Trim();
//        sql += " and s.IDGianhang = '" + sIDGianHang + "' ";
//        if (sChuoiTimKiem != "")
//        {
//            sql += " and ( TenKhachHang like N'%" + sChuoiTimKiem + "%' or SoDienThoai like N'%" + sChuoiTimKiem + "%') ";
//        }
//        sql += ") as tb1 ";

        LoadDonHang();
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
    private void LoadGianHang()
    {
        string strSql = "select * from tb_GianHang";
        slGianHang.DataSource = Connect.GetTable(strSql);
        slGianHang.DataTextField = "TenGianHang";
        slGianHang.DataValueField = "ID";
        slGianHang.DataBind();
        slGianHang.Items.Add(new ListItem("-- Tất cả --", "0"));
        slGianHang.Items.FindByValue("0").Selected = true;
    }
}