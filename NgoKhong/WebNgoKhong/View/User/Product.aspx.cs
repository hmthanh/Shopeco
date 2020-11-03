using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CurrentUser"] == null)
            {
                return;
            }
            string id = Session["CurrentUser"].ToString();
            string shopCode = StaticData.getField("tb_User", "ShopCode", "ID", id);
            if (string.IsNullOrEmpty(shopCode))
            {
                Response.RedirectToRoute("usercreateshop", new { });
            }
            string sqluser = "select * from tb_User where ID = '" + id + "'";
            DataTable userData = Connect.GetTable(sqluser);

            //string shopCode = userData.Rows[0]["ShopCode"].ToString();
            if (string.IsNullOrEmpty(shopCode))
            {
                Response.RedirectToRoute("usercreateshop", new { });
            }

            LoadProductShop(shopCode);
        }
    }

    private void LoadProductShop(string shopCode)
    {
        string sql = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY idSanPham desc )AS RowNumber
	              ,*, 'Ten' = (select TenLoaiSanPham from tb_LoaiSanPham where idLoaiSanPham = sp.idLoaiSanPham)
                  FROM tb_SanPham sp where ShopCode = '" + shopCode + "'";
        if (sTenSanPham != "")
            sql += " and TenSanPham like N'%" + sTenSanPham + "%'";
        if (sLoaiSanPham != "" && sLoaiSanPham != "0")
            sql += " and idLoaiSanPham = '" + sLoaiSanPham + "'";
        sql += ") as tb1 ";

        DataTable data = Connect.GetTable(sql);
        string html = @"<center><table class='table table-bordered table-hover dataTable'>
                            <tr>
                                <th class='th'>
                                    Mã sản phẩm
                                </th>
                                <th class='th'>
                                    Tên sản phẩm
                                </th>
                                <th class='th'>
                                    Giá cũ
                                </th>
                                <th class='th'>
                                    Giá mới
                                </th>
                                <th class='th'>
                                    Loại sản phẩm
                                </th>
                                <th class='th'>
                                    Đã duyệt
                                </th>
                                <th class='th'>Sửa
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string idSanPham = data.Rows[i]["idSanPham"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + data.Rows[i]["MaSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + data.Rows[i]["TenSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(data.Rows[i]["GiaCu"].ToString()) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(data.Rows[i]["GiaMoi"].ToString()) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + data.Rows[i]["Ten"].ToString() + "</td>";

            if (data.Rows[i]["KichHoat"].ToString() == "True")
                html += "       <td style='text-align:center;vertical-align: inherit;'>Đã duyệt</td>";
            else
                html += "       <td style='text-align:center;vertical-align: inherit;background-color:yellow'>Chưa duyệt</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("gianhang_addproduct", new { id = idSanPham }) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteSanPham(\"" + idSanPham + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("gianhang_shopproduct", new { }) + "?";
        if (sTenSanPham != "")
            url += "TenSanPham=" + sTenSanPham + "&";
        if (sLoaiSanPham != "")
            url += "LoaiSanPham=" + sLoaiSanPham + "&";
        url += "Page=";
        //html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        //dvDanhSachLoaiTinTuc.InnerHtml = html;
    }

    private void LoadLoaiSanPham()
    {
        
    }

    public string sLoaiSanPham { get; set; }

    public string sTenSanPham { get; set; }
}