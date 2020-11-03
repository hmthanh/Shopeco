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
            //string sql = "SELECT * FROM [tb_Admin] where 1 = 1 ORDER BY idAdmin DESC";
            //StaticData.LoadCombobox(slLoaiSPCapCha,sql,"TenLoaiSanPham","idLoaiSanPham","Tìm kiếm loại sản phẩm con");
            LoadDonHang();
        }
    }
    private void LoadDonHang()
    {
        string html= "";
        int TotalRows = 0;
        string idGianHang = "";
        if ( Session["CurrentUser"] == null)
        {
            string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY ctdh.idSanPham desc
                  )AS RowNumber
	              ,ctdh.*
                  FROM tb_CTDonHang ctdh inner join tb_DonHang dh on ctdh.idDonHang=dh.idDonHang
                  inner join tb_SanPham sp on ctdh.idSanPham=sp.idSanPham where 1 = 1";
          //  sql += " and dh.idUser = '" + idGianHang + "'";
            if (sTenSanPham != "")
                sql += " and dh.MaDonHang ='" + sTenSanPham + "'";
            else
                sql += " and dh.MaDonHang ='1'";
            sql += ") as tb1 ";

            DataTable tbTong = Connect.GetTable(sql);
            TotalRows = tbTong.Rows.Count;

            sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

            DataTable table = Connect.GetTable(sql);
            html += @"<center><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Mã sản phẩm
                                </th>
                                <th class='th'>
                                    Tên sản phẩm
                                </th> 
                                <th class='th'>
                                    Mã đơn hàng
                                </th> 
                                <th class='th'>
                                    Ngày đặt hàng
                                </th> 
                                <th class='th'>
                                    Số lượng
                                </th> 
                                <th class='th'>
                                    Đơn giá
                                </th> 
                                <th class='th'>
                                    Thành tiền
                                </th>  
                                <th class='th'>
                                    Tình trạng
                                </th>
                            </tr>";
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
           // Response.RedirectToRoute("dangnhap_login", new object { });
           // return;
        }
        else
        {
            idGianHang = Session["CurrentUser"].ToString().Trim();
            string email = Session["CurrentUser"].ToString();
            string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY ctdh.idSanPham desc
                  )AS RowNumber
	              ,ctdh.*
                  FROM tb_CTDonHang ctdh inner join tb_DonHang dh on ctdh.idDonHang=dh.idDonHang
                  inner join tb_SanPham sp on ctdh.idSanPham=sp.idSanPham where 1 = 1";
            sql += " and dh.idUser = '" + idGianHang + "'";
            if (sTenSanPham != "")
                sql += " and TenSanPham like N'%" + sTenSanPham + "%'";
            sql += ") as tb1 ";

            DataTable tbTong = Connect.GetTable(sql);
           TotalRows = tbTong.Rows.Count;

            sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

            DataTable table = Connect.GetTable(sql);
            html += @"<center><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Mã sản phẩm
                                </th>
                                <th class='th'>
                                    Tên sản phẩm
                                </th> 
                                <th class='th'>
                                    Mã đơn hàng
                                </th> 
                                <th class='th'>
                                    Ngày đặt hàng
                                </th> 
                                <th class='th'>
                                    Số lượng
                                </th> 
                                <th class='th'>
                                    Đơn giá
                                </th> 
                                <th class='th'>
                                    Thành tiền
                                </th>  
                                <th class='th'>
                                    Tình trạng
                                </th>
                            </tr>";
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
        }
        
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url =  "?";
        if (sTenSanPham != "")
            url += "TenSanPham=" + sTenSanPham + "&";
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachNguoiDung.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sTenSanPham = txtTenSanPham.Value.Trim();
        LoadDonHang();
    }
}