using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_TinTuc : System.Web.UI.Page
{
    string sTieuDe = "";
    string sLoaiTinTuc = "";

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
                if (Request.QueryString["TieuDe"].Trim() != "")
                {
                    sTieuDe = Request.QueryString["TieuDe"].Trim();
                    txtTenLoai.Value = sTieuDe;
                }
            }
            catch { }
            try
            {
                if (Request.QueryString["LoaiTinTuc"].Trim() != "")
                {
                    sLoaiTinTuc = Request.QueryString["LoaiTinTuc"].Trim();
                    slLoaiTinTuc.Value = sLoaiTinTuc;
                }
            }
            catch { }
            LoadLoaiTinTuc();
            LoadTinTuc();
        }
    }
    private void LoadLoaiTinTuc()
    {
        string strSql = "SELECT * FROM [tb_LoaiTinTuc] ORDER BY TenLoaiTinTuc DESC";
        
        slLoaiTinTuc.DataSource = Connect.GetTable(strSql);
        slLoaiTinTuc.DataTextField = "TenLoaiTinTuc";
        slLoaiTinTuc.DataValueField = "idLoaiTinTuc";
        slLoaiTinTuc.DataBind();
        slLoaiTinTuc.Items.Add(new ListItem("Chọn loại tin tức", "0"));
        slLoaiTinTuc.Items.FindByValue("0").Selected = true;
    }
    private void LoadTinTuc()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idTinTuc desc
                  )AS RowNumber
	              ,*, 'Ten' = (select TenLoaiTinTuc from tb_LoaiTinTuc where idLoaiTinTuc = tt.idLoaiTinTuc)
                  FROM tb_TinTuc tt where 1 = 1";
        if (sTieuDe != "")
            sql += " and TieuDe like N'%" + sTieuDe + "%'";
        if (sLoaiTinTuc != "" && sLoaiTinTuc != "0")
            sql += " and idLoaiTinTuc = '" + sLoaiTinTuc + "'";
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
                                    Ảnh
                                </th>
                                <th class='th'>
                                    Ngày
                                </th>
                                <th class='th'>
                                    Tiêu đề
                                </th>
                                <th class='th'>
                                    Loại tin tức
                                </th>
                                <th class='th' style='white-space: nowrap;'>
                                    Trang chủ
                                </th>
                                <th class='th' style='white-space: nowrap;'>
                                    Tin HOT
                                </th>
                                <th class='th'>Sửa
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idTinTuc = table.Rows[i]["idTinTuc"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'><img style='width:70px' src='" + table.Rows[i]["AnhDaiDien"].ToString() + "'/></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.ConvertMMDDYYtoDDMMYY(table.Rows[i]["Ngay"].ToString()) + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + MyStaticData.Cut(table.Rows[i]["TieuDe"].ToString(),150) + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["Ten"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["SetHome"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["SetHot"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("adminCapNhatTinTuc", new { id = idTinTuc }) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteTinTuc(\"" + idTinTuc + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminTinTuc", new { }) + "?";
        if (sTieuDe != "")
            url += "TenLoai=" + sTieuDe + "&";
        if (sLoaiTinTuc != "")
            url += "MoTa=" + sLoaiTinTuc + "&";
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachLoaiTinTuc.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sTieuDe = txtTenLoai.Value.Trim();
        sLoaiTinTuc = slLoaiTinTuc.Value.Trim();
        LoadTinTuc();
    }

    [WebMethod]
    public static string DeleteTinTuc(string idTinTuc)
    {
        string sql = @"delete [tb_TinTuc] WHERE idTinTuc = '" + idTinTuc.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
}