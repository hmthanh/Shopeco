using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_Product : System.Web.UI.Page
{
    public string IDUser { get; set; }
    public string IDShop { get; set; }
    string sTenSanPham = "";
    string sLoaiSanPham = "";
    int page = 0;
    int MaxPage = 0;
    int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            page = int.Parse(Request.QueryString["Page"].ToString());
        }
        catch
        {
            page = 1;
        }

        if (!IsPostBack)
        {
            //try
            //{
            //    if (Request.QueryString["TenSanPham"].Trim() != "")
            //    {
            //        sTenSanPham = Request.QueryString["TenSanPham"].Trim();
            //        txtTenLoai.Value = sTenSanPham;
            //    }
            //}
            //catch { }
            //LoadLoaiSanPham();
            //try
            //{
            //    if (Request.QueryString["LoaiSanPham"].Trim() != "")
            //    {
            //        sLoaiSanPham = Request.QueryString["LoaiSanPham"].Trim();
            //        slLoaiSanPham.Value = sLoaiSanPham;
            //    }
            //}
            //catch { }
            LoadTinTuc();
        }
    }
    //private void LoadLoaiSanPham()
    //{
    //    string strSql = "select  * from tb_LoaiSanPham";
    //    slLoaiSanPham.DataSource = Connect.GetTable(strSql);
    //    slLoaiSanPham.DataTextField = "TenLoaiSanPham";
    //    slLoaiSanPham.DataValueField = "idLoaiSanPham";
    //    slLoaiSanPham.DataBind();
    //    slLoaiSanPham.Items.Add(new ListItem("Chọn loại sản phẩm", "0"));
    //    slLoaiSanPham.Items.FindByValue("0").Selected = true;
    //}
    private void LoadTinTuc()
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        IDUser = Session["CurrentUser"].ToString();
        IDShop = StaticData.getField("tb_User", "IDGianHang", "ID", IDUser);
        

        string sql = @"select * from (
	            SELECT ROW_NUMBER() OVER (
                        ORDER BY idSanPham desc
                  )AS RowNumber
	              ,*, 'Ten' = (select TenLoaiSanPham from tb_LoaiSanPham where idLoaiSanPham = sp.idLoaiSanPham)
                  FROM tb_SanPham sp where IDGianHang = '" + IDShop + "' ";
        if (sTenSanPham != "")
            sql += " and TenSanPham like N'%" + sTenSanPham + "%'";
        if (sLoaiSanPham != "" && sLoaiSanPham != "0")
            sql += " and idLoaiSanPham = '" + sLoaiSanPham + "'";
        sql += ") as tb1 ";

        DataTable tbTong = Connect.GetTable(sql);
        int TotalRows = 0;
        if (tbTong != null)
        {
            TotalRows = tbTong.Rows.Count;
        }
        else
        {
            dvDanhSachLoaiTinTuc.InnerHtml = "<h2>Không có sản phẩm nào !</h2>";
            return;
        }

        sql += "WHERE RowNumber BETWEEN (" + page + " - 1) * " + PageSize + " + 1 AND (((" + page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";

        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idSanPham = table.Rows[i]["idSanPham"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["MaSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["TenSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(table.Rows[i]["GiaCu"].ToString()) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(table.Rows[i]["GiaMoi"].ToString()) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["Ten"].ToString() + "</td>";
            //html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["SetHome"].ToString() == "False" ? "square" : "check") + "'></td>";
            //html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["KichHoat"].ToString() == "False" ? "square" : "check") + "'></td>";
            if (table.Rows[i]["KichHoat"].ToString() == "True")
                html += "       <td style='text-align:center;vertical-align: inherit;'>Đã duyệt</td>";
            else
                html += "       <td style='text-align:center;vertical-align: inherit;background-color:yellow'>Chưa duyệt</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("gianhang_addproduct", new { id = idSanPham }) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteSanPham(\"" + idSanPham + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        //html += "  </table><table >   <tr>";
        //html += "       <td colspan='17' class='footertable'>";
        //string url = GetRouteUrl("gianhang_shopproduct", new { }) + "?";
        //if (sTenSanPham != "")
        //    url += "TenSanPham=" + sTenSanPham + "&";
        //if (sLoaiSanPham != "")
        //    url += "LoaiSanPham=" + sLoaiSanPham + "&";
        //url += "Page=";
        //html += StaticData.CreateHTMLPagingAdmin(page, url, StaticData.SetPage(page, TotalRows, PageSize));
        //html += "    </td></tr>";
        //html += "     </table></center>";
        dvDanhSachLoaiTinTuc.InnerHtml = html;
    }
    //protected void btTimKiem_Click(object sender, EventArgs e)
    //{
    //    sTenSanPham = txtTenLoai.Value.Trim();
    //    sLoaiSanPham = slLoaiSanPham.Value.Trim();
    //    LoadTinTuc();
    //}

    [WebMethod]
    public static string DeleteSanPham(string idSanPham)
    {
        Connect.Exec("delete tb_HinhAnhSanPham where idSanPham = '" + idSanPham.Trim() + "'");
        string sql = @"delete [tb_SanPham] WHERE idSanPham = '" + idSanPham.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }

    
}