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
            LoadLoaiTinTuc();
        }
    }
    private void LoadLoaiTinTuc()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idMau desc
                  )AS RowNumber
	              ,*
                  FROM tb_Mau nd where 1 = 1";
        sql += ") as tb1 ";

        DataTable table = Connect.GetTable(sql);
        string html = @"<div class='col-md-6' style='padding-left:0'><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Tên màu
                                </th>
                                <th class='th'>
                                    Màu
                                </th>
                                <th class='th'>
                                    Kích hoạt
                                </th>
                                <th class='th'>
                                    Mặc định
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idMau = table.Rows[i]["idMau"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["TenMau"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><div style='background-color:" + table.Rows[i]["MaMau"].ToString() + "'>&nbsp;</div></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["KichHoat"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='MauMacDinh(\"" + idMau + "\")'><i class='fa fa-" + (table.Rows[i]["isDefault"].ToString() == "True" ? "check" : "square") + "'></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteMau(\"" + idMau + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table></div>";

        string sqlSize = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idSize desc
                  )AS RowNumber
	              ,*
                  FROM tb_Size nd where 1 = 1";
        sqlSize += ") as tb1 ";

        DataTable tableSize = Connect.GetTable(sqlSize);
        html += @"<div class='col-md-6' style='padding-right:0'><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    STT
                                </th>
                                <th class='th'>
                                    Size
                                </th>
                                <th class='th'>
                                    Kích hoạt
                                </th>
                                <th class='th'>
                                    Mặc định
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < tableSize.Rows.Count; i++)
        {
            string idSize = tableSize.Rows[i]["idSize"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + tableSize.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + tableSize.Rows[i]["Size"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (tableSize.Rows[i]["KichHoat"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='SizeMacDinh(\"" + idSize + "\")'><i class='fa fa-" + (tableSize.Rows[i]["isDefault"].ToString() == "True" ? "check" : "square") + "'></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteLoaiTinTuc(\"" + idSize + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table></div>";
        dvDanhSachLoaiTinTuc.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        LoadLoaiTinTuc();
    }
    
    [WebMethod]
    public static string DeleteMau(string id)
    {
        string sql = @"delete [tb_Mau] WHERE idMau = '" + id.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    [WebMethod]
    public static string LuuMau(string TenMau, string MaMau, string KichHoat)
    {
        string sql = @"insert [tb_Mau](TenMau,MaMau,KichHoat) values(N'" + TenMau.Trim() + "',N'" + MaMau + "','" + KichHoat + "')";
        
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    [WebMethod]
    public static string MauMacDinh(string id)
    {
        string sql1 = @"update [tb_Mau] set isDefault = 0";
        bool ex1 = Connect.Exec(sql1);
        string sql2 = @"update [tb_Mau] set isDefault = 1 WHERE idMau = '" + id.Trim() + "'";
        bool ex2 = Connect.Exec(sql2);
        return ex2.ToString();
    }

    [WebMethod]
    public static string DeleteSize(string id)
    {
        string sql = @"delete [tb_Size] WHERE idSize = '" + id.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    [WebMethod]
    public static string LuuSize(string Size, string KichHoat)
    {
        string sql = @"insert [tb_Size](Size,KichHoat) values(N'" + Size.Trim() + "','" + KichHoat + "')";

        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    [WebMethod]
    public static string SizeMacDinh(string id)
    {
        string sql1 = @"update [tb_Size] set isDefault = 0";
        bool ex1 = Connect.Exec(sql1);
        string sql2 = @"update [tb_Size] set isDefault = 1 WHERE idSize = '" + id.Trim() + "'";
        bool ex2 = Connect.Exec(sql2);
        return ex2.ToString();
    }
}