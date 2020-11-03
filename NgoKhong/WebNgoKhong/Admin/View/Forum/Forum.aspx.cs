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

            LoadNguoiDung();
        }
    }
    private void LoadNguoiDung()
    {
        string id = (Request.QueryString["id"] == null ? "" : Request.QueryString["id"].ToString());
        string sql = @"select * from (SELECT ROW_NUMBER() OVER( ORDER BY idRaoVat) AS RowNumber , * FROM tb_RaoVat l where 1 = 1 ";
        if (id != "")
        {
            sql += " and MaRaoVat = '" + id + "'";
        }
        if (sChuoiTimKiem != "")
            sql += " and ( TieuDe like N'%" + sChuoiTimKiem + "%' or MoTa like N'%" + sChuoiTimKiem + "%') ";
        sql += ") as tb1 ";

        DataTable tbTong = Connect.GetTable(sql);
        if (tbTong == null)
        {
            return;
        }
        int TotalRows = tbTong.Rows.Count;

        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);
        string html = @"<center><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Ngày đăng
                                </th>
                                <th class='th'>
                                    Ngày hết hạn
                                </th>
                                <th class='th'>
                                    Mã tin đăng
                                </th>
                                <th class='th'>
                                    Mã rao vặt
                                </th>
                                <th class='th'>
                                    Tiêu đề
                                </th>
                                <th class='th'>
                                    Giá
                                </th>

                                <th class='th'>Xóa
                                </th>
                            </tr>";

                                //        <th class='th'>
                                //    Họ và tên
                                //</th>
                                //<th class='th'>
                                //    Số điện thoại
                                //</th>
                                //<th class='th'>
                                //    Địa chỉ
                                //</th>
        for (int i = 0; i < table.Rows.Count; i++)
        { 
            string idRaoVat = table.Rows[i]["idRaoVat"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;'>" + table.Rows[i]["RowNumber"] + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.DateFormat(table.Rows[i]["NgayTao"].ToString()) + "</td>";
            html += "       <td style='text-align:center; '>" + StaticData.DateFormat(table.Rows[i]["NgayHetHan"].ToString()) + "</td>";
            string str_url = GetRouteUrl("chitiet", new { id = table.Rows[i]["idRaoVat"].ToString() });
            html += "       <td style='text-align:center;'><a href='" + str_url + "'>" + table.Rows[i]["idRaoVat"].ToString() + "</a></td>";
            string str_url2 = GetRouteUrl("adminChiTietRaoVat", new { id = table.Rows[i]["AdsCode"].ToString() });
            html += "       <td style='text-align:center;'><a href='" + str_url2 + "'>" + table.Rows[i]["AdsCode"] + "</a></td>";
            html += "       <td style='text-align:center;'>" + table.Rows[i]["TieuDe"] + "</td>";
            float gia = float.Parse(table.Rows[i]["Gia"].ToString());
            html += "       <td style='text-align:center; '>" + gia.ToString("#,##") + "</td>";
            string idUser = table.Rows[i]["MaRaoVat"].ToString();
            
            html += "       <td style='text-align:center; '><a onclick='Delete_User(\"" + table.Rows[i]["idRaoVat"].ToString() + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminRaoVat", new {  }) + "?";
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
        LoadNguoiDung();
    }
}