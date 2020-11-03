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
    int Page = 0;
    int MaxPage = 0;
    int PageSize = 20;
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
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY ID desc
                  )AS RowNumber
	              ,*
                  FROM tb_User l where 1 = 1";
        if (sChuoiTimKiem != "")
            sql += " and ( HoTen like N'%" + sChuoiTimKiem + "%' or TenDangNhap like N'%" + sChuoiTimKiem + "%') ";
        sql += ") as tb1 ";

        DataTable tbTong = Connect.GetTable(sql);
        if (tbTong == null)
        {
            return;
        }
        int TotalRows = tbTong.Rows.Count;
        int count1 = 0, count2 = 0, count3 = 0, count4 = 0;
        int totalElm = tbTong.Rows.Count;

        for (int i = 0; i < tbTong.Rows.Count; i++)
        {
            string maGianHang = tbTong.Rows[i]["ShopCode"].ToString();
            if (!string.IsNullOrEmpty(maGianHang))
            {
                count1++;
            }
            string maRaoVat = tbTong.Rows[i]["AdsCode"].ToString();
            if (!string.IsNullOrEmpty(maRaoVat))
            {
                count2++;
            }
            bool isBlock = tbTong.Rows[i]["IsBlock"].ToString() == "True";
            if (isBlock)
            {
                count4++;
            }
            else
            {
                count3++;
            }
        }

        totalCol1.InnerHtml = totalElm.ToString();
        totalCol2.InnerHtml = count1.ToString();
        totalCol3.InnerHtml = count2.ToString();
        totalCol4.InnerHtml = count3.ToString();
        totalCol5.InnerHtml = count4.ToString();
        
        sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);

        string html = @"";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idNguoiDung = table.Rows[i]["ID"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["RowNumber"] + "</td>";
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminSanPhamKhachHang", new { id = idNguoiDung }) + "'>" + table.Rows[i]["PhoneNumber"] + "</a></td>";
            //string customerCode = StaticData.getField("tb_UserCustomer", "CustomerCode", "UserID", idNguoiDung);
            html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminDonHangCuaKhachHang", new { id = idNguoiDung }) + "'>" + table.Rows[i]["UserCode"] + "</a></td>";
            html += "       <td style='text-align:center; '>" + table.Rows[i]["Username"] + "</td>";

            //html += "       <td style='text-align:center; '><div  style='padding: 0 15px;'><div id='pw" + idNguoiDung + "' style='float:left;' class='form-group'><input type='text' /></div><a  data-password='" + table.Rows[i]["Password"] + "' class='btnEditPassword' style='float:right'><i class='fa fa-check'></i></a></div></td>";
            html += "       <td style='text-align:center; '><div  style='padding: 0 15px;'><div id='pw" + idNguoiDung + "' style='float:left;'>******</div><a data-id='" + idNguoiDung + "'  data-password='" + table.Rows[i]["Password"] + "' class='btnEditPassword' style='float:right'><i class='fa fa-eye'></i></a></div></td>";
            string idGianhang = table.Rows[i]["ShopCode"].ToString();
            string maGianHang = table.Rows[i]["IDGianHang"].ToString();
            string str = GetRouteUrl("adminChiTietGianHang", new { id = maGianHang });

            html += "       <td style='text-align:center; '><a href='" + str + "'>" + idGianhang + "</a></td>";
            string str_url = GetRouteUrl("adminRaoVat", new { id = table.Rows[i]["MaRaoVat"].ToString() });

            html += "       <td style='text-align:center;'><a href='" + str_url + "'>" + table.Rows[i]["AdsCode"].ToString() + "</a></td>";
            //html += "       <td style='text-align:center; '><a href='" + GetRouteUrl("adminSanPhamKhachHang", new { id = idNguoiDung }) + "'>" + table.Rows[i]["FullName"].ToString() + "</a></td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["Email"] + "</td>";
            //html += "       <td style='text-align:center; '>" + table.Rows[i]["Address"] + "</td>";
            html += "       <td style='text-align:center; '><a onclick='DeleteUser(\"" + table.Rows[i]["ID"] + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            bool isBlock = table.Rows[i]["IsBlock"].ToString() == "True";
            if (isBlock)
            {
                html += "       <td style='text-align:center; '><a class='btn btn-danger'  onclick='ActiveUser(\"" + idNguoiDung + "\")' style='cursor:pointer' title='Block'> Đã Block</a></td>";
            }
            else
            {
                html += "       <td style='text-align:center; '><a class='btn btn-success'  onclick='BlockUser(\"" + idNguoiDung + "\")' style='cursor:pointer' title='Block'>Hoạt động</a></td>";
            }

            html += "   </tr>";
        }
        dvDanhSachNguoiDung.InnerHtml = html;
        
        string htmlPaging = "<tr>";
        htmlPaging += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminCustomer", new { }) + "?";
        if (sChuoiTimKiem != "")
            url += "ChuoiTimKiem=" + sChuoiTimKiem + "&";
        url += "Page=";
        htmlPaging += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        htmlPaging += "    </td></tr>";
        pagingFooter.InnerHtml = htmlPaging;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sChuoiTimKiem = txtTimKiem.Value.Trim();
        LoadNguoiDung();
    }
}