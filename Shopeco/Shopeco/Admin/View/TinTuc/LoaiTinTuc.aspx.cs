using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_TinTuc_LoaiTinTuc : System.Web.UI.Page
{
    string sTenLoai = "";
    string sMoTa = "";

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
                if (Request.QueryString["TenLoai"].Trim() != "")
                {
                    sTenLoai = Request.QueryString["TenLoai"].Trim();
                    txtTenLoai.Value = sTenLoai;
                }
            }
            catch { }
            try
            {
                if (Request.QueryString["MoTa"].Trim() != "")
                {
                    sMoTa = Request.QueryString["MoTa"].Trim();
                    txtMoTa.Value = sMoTa;
                }
            }
            catch { }
            LoadLoaiTinTuc();
        }
    }
    private void LoadLoaiTinTuc()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idLoaiTinTuc desc
                  )AS RowNumber
	              ,*
                  FROM tb_LoaiTinTuc nd where 1 = 1";
        if (sTenLoai != "")
            sql += " and TenLoaiTinTuc like N'%" + sTenLoai + "%'";
        if (sMoTa != "")
            sql += " and MoTa like N'%" + sMoTa + "%'";
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
                                    Tên loại tin tức
                                </th>
                                <th class='th'>
                                    Mô tả
                                </th>
                                <th class='th'>
                                    Kích hoạt
                                </th>
                                <th class='th'>Sửa
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idLoaiTinTuc = table.Rows[i]["idLoaiTinTuc"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["TenLoaiTinTuc"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + MyStaticData.Cut(table.Rows[i]["MoTa"].ToString(),200) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["Active"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("adminCapNhatLoaiTinTuc", new { id = idLoaiTinTuc}) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteLoaiTinTuc(\"" + idLoaiTinTuc + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminLoaiTinTuc", new { }) + "?";
        if (sTenLoai != "")
            url += "TenLoai=" + sTenLoai + "&";
        if (sMoTa != "")
            url += "MoTa=" + sMoTa + "&";
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachLoaiTinTuc.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sTenLoai = txtTenLoai.Value.Trim();
        sMoTa = txtMoTa.Value.Trim();
        LoadLoaiTinTuc();
    }
    
    [WebMethod]
    public static string DeleteLoaiTinTuc(string idLoaiTinTuc)
    {
        string sql = @"delete [tb_LoaiTinTuc] WHERE idLoaiTinTuc = '" + idLoaiTinTuc.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    
}