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
    string sChuoiTimKiem = "";

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
            try
            {
                if (Request.QueryString["ChuoiTimKiem"].Trim() != "")
                {
                    sChuoiTimKiem = Request.QueryString["ChuoiTimKiem"].Trim();
                    txtTimKiem.Value = sChuoiTimKiem;
                }
            }
            catch { } 
            //string sql = "SELECT * FROM [tb_Admin] where 1 = 1 ORDER BY idAdmin DESC";
            //StaticData.LoadCombobox(slLoaiSPCapCha,sql,"TenLoaiSanPham","idLoaiSanPham","Tìm kiếm loại sản phẩm con");
            LoadDonHang();
        }
    }
    private void LoadDonHang()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idDonHang desc
                  )AS RowNumber
	              ,*
                  FROM tb_DOnHang l where 1 = 1";
        if (sChuoiTimKiem != "")
            sql += " and ( TenKhachHang like N'%" + sChuoiTimKiem + "%' or SoDienThoai like N'%" + sChuoiTimKiem + "%') "; 
        sql += ") as tb1 ";

        DataTable tbTong = Connect.GetTable(sql);
        int TotalRows = tbTong.Rows.Count;

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";


        DataTable table = Connect.GetTable(sql);
        string html = @"<center><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Mã đơn hàng
                                </th>
                                <th class='th'>
                                    Tên khách hàng
                                </th>
                                <th class='th'>
                                    Số điện thoại
                                </th> 
                                <th class='th'>
                                    Email
                                </th> 
                                <th class='th'>
                                    Địa chỉ
                                </th> 
                                <th class='th'>
                                    Ngày tạo
                                </th> 
                                <th class='th'>
                                    Ghi chú
                                </th>  
                                <th class='th'>
                                    Tình trạng
                                </th>  
                                <th class='th'>Xem chi tiết
                                </th>
                                <th class='th'>Sửa
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < table.Rows.Count; i++)
        { 
            html += "   <tr>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["RowNumber"] + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["MaDonHang"] + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["TenKhachHang"] + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["SoDienTHoai"] + "</td>"; 
            html += "       <td style='text-align:center; '>" + table.Rows[i]["Email"] + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["DiaChi"] + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.ConvertMMDDYYtoDDMMYY(table.Rows[i]["Ngay"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["GhiChu"] + "</td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["Status"] + "</td>";
            html += "       <td style='text-align:center; '><a onclick='ShowDetail(\"" + table.Rows[i]["idDonHang"] + "\")' title='Chi tiết'><i class='fa fa-eye'></i></a></td>";
            html += "       <td style='text-align:center; '><a onclick='ShowPopup_EditOrder(\"" + table.Rows[i]["idDonHang"] + "\")' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center; '><a onclick='Delete_Order(\"" + table.Rows[i]["idDonHang"] + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminDonHang", new { }) + "?";
        if (sChuoiTimKiem != "")
            url += "ChuoiTimKiem=" + sChuoiTimKiem + "&"; 
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachNguoiDung.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sChuoiTimKiem = txtTimKiem.Value.Trim();
        LoadDonHang();
    }
     
    
}