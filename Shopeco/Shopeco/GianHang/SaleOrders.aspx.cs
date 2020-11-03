using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_SaleOrders : System.Web.UI.Page
{
    string sTenSanPham = "";
    int Page = 0;
    int MaxPage = 0;
    int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Page = int.Parse(Request.QueryString["Page"].ToString());
        }
        catch
        {
            Page = 1;
        }

        if (!IsPostBack)
        {
            //try
            //{
            //    if (Request.QueryString["TenSanPham"].Trim() != "")
            //    {
            //        sTenSanPham = Request.QueryString["TenSanPham"].Trim();
            //        txtTenSanPham.Value = sTenSanPham;
            //    }
            //}
            //catch { }
            //string sql = "SELECT * FROM [tb_Admin] where 1 = 1 ORDER BY idAdmin DESC";
            //StaticData.LoadCombobox(slLoaiSPCapCha,sql,"TenLoaiSanPham","idLoaiSanPham","Tìm kiếm loại sản phẩm con");
            if (Session["CurrentUser"] != null)
            {
                LoadDonHang();
            }
        }
    }
    private void LoadDonHang()
    {
        string idUser = Session["CurrentUser"].ToString().Trim();
        string IDShop = StaticData.getField("tb_User", "IDGianhang", "ID", idUser);
        string email = StaticData.getField("tb_User", "Email", "ID", idUser);
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY ctdh.idSanPham desc
                  )AS RowNumber
	              ,ctdh.*
                  FROM tb_CTDonHang ctdh inner join tb_DonHang dh on ctdh.idDonHang=dh.idDonHang
                  inner join tb_SanPham sp on ctdh.idSanPham = sp.idSanPham where ctdh.IDGianHang = '" + IDShop + "'";
        //string sql = @"select * from (SELECT ROW_NUMBER() OVER ( ORDER BY c.idDonHang desc )AS RowNumber ,d.* FROM tb_DonHang d where d.idDonHang in (select distinct c.idDonHang from tb_CTDonHang c where c.IDGianHang = '" + IDShop + "') ";
        if (sTenSanPham != "")
            sql += " and TenSanPham like N'%" + sTenSanPham + "%'";
        sql += ") as tb1 ";

        DataTable tbTong = Connect.GetTable(sql);
        if (tbTong == null || tbTong.Rows.Count <= 0)
        {
            dvDanhSachNguoiDung.InnerHtml = "<h2>Không có đơn hàng nào !</h2>";
            return;
        }
        int TotalRows = tbTong.Rows.Count;

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "   <tr>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["RowNumber"] + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.getField("tb_SanPham", "MaSanPham", "idSanPham", table.Rows[i]["idSanPham"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", table.Rows[i]["idSanPham"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.getField("tb_DonHang", "MaDonHang", "idDonHang", table.Rows[i]["idDonHang"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '>" + DateTime.Parse(StaticData.getField("tb_DonHang", "Ngay", "idDonHang", table.Rows[i]["idDonHang"].ToString())).ToString("dd/MM/yyyy") + "</td>";
            double SoLuong = double.Parse(table.Rows[i]["SoLuong"].ToString());
            double DonGia = double.Parse(table.Rows[i]["DonGia"].ToString());
            html += "       <td style='text-align:center; '>" + SoLuong.ToString() + "</td>";
            html += "       <td style='text-align:center; '>" + DonGia.ToString("#,##") + "</td>";
            html += "       <td style='text-align:center; '>" + (SoLuong * DonGia).ToString("#,##") + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.getField("tb_DonHang", "Status", "idDonHang", table.Rows[i]["idDonHang"].ToString()) + "</td>";
            html += "   </tr>";
        }
        //    "<table >   <tr>";
        //html += "       <td colspan='17' class='footertable'>";
        //string url = GetRouteUrl("gianhang_saleorder", new { }) + "?";
        //if (sTenSanPham != "")
        //    url += "TenSanPham=" + sTenSanPham + "&";
        //url += "Page=";
        //html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        //html += "    </td></tr>";
        //html += "     </table></center>";
        dvDanhSachNguoiDung.InnerHtml = html;
    }
    //protected void btTimKiem_Click(object sender, EventArgs e)
    //{
    //    sTenSanPham = txtTenSanPham.Value.Trim();
    //    LoadDonHang();
    //}
}