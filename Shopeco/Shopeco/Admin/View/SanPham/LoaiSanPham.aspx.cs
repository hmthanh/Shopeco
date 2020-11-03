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
    string sIdCapCha1 = "";
    string sIdCapCha2 = "";
    
    string sTenLoai = "";
    string sLoaiSPCha = "";

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
            LoadLoaiSanPham1();
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
                if (Request.QueryString["LoaiSPCha"].Trim() != "")
                {
                    sLoaiSPCha = Request.QueryString["LoaiSPCha"].Trim();
                    ddlLoaiSP.SelectedValue = sLoaiSPCha;
                }
            }
            catch { }
            //string sql = "SELECT * FROM [tb_LoaiSanPham] where idCapCha = 0 ORDER BY TenLoaiSanPham DESC";
            //StaticData.LoadCombobox(slLoaiSPCapCha,sql,"TenLoaiSanPham","idLoaiSanPham","Tìm kiếm loại sản phẩm 1");
            LoadLoaiSanPham();
        }
    }
    private void LoadLoaiSanPham1()
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha=0 order by TenLoaiSanPham";
        DataTable table = Connect.GetTable(strSql);
        ddlLoaiSP.DataSource = table;
        ddlLoaiSP.DataTextField = "TenLoaiSanPham";
        ddlLoaiSP.DataValueField = "idLoaiSanPham";
        ddlLoaiSP.DataBind();
        ddlLoaiSP.Items.Add(new ListItem("--Chọn loại SP cấp 1--", ""));
        ddlLoaiSP.Items.FindByText("--Chọn loại SP cấp 1--").Selected = true;
    }
    private void LoadLoaiSanPham2(string idLoaiSanPham1)
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha='" + idLoaiSanPham1 + "'";
        strSql += " order by TenLoaiSanPham";
        slLoaiSPCap2.DataSource = Connect.GetTable(strSql);
        slLoaiSPCap2.DataTextField = "TenLoaiSanPham";
        slLoaiSPCap2.DataValueField = "idLoaiSanPham";
        slLoaiSPCap2.DataBind();
        slLoaiSPCap2.Items.Add(new ListItem("--Chọn loại SP cấp 2--", ""));
        slLoaiSPCap2.Items.FindByText("--Chọn loại SP cấp 2--").Selected = true;
    }
    private void LoadLoaiSanPham()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idLoaiSanPham desc
                  )AS RowNumber
	              ,*, 'Ten' = (select TenLoaiSanPham from tb_LoaiSanPham where idLoaiSanPham = l.idCapCha)
                  FROM tb_LoaiSanPham l where 1 = 1";
        if (sTenLoai != "")
            sql += " and TenLoaiSanPham like N'%" + sTenLoai + "%'";
        if (sIdCapCha2 != "")
            sql += " and idCapCha = '" + sIdCapCha2 + "'";
        else
        {
            if (sIdCapCha1 != "")
                sql += " and idCapCha = '" + sIdCapCha1 + "'";
        }
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
                                    Tên loại sản phẩm
                                </th>
                                <th class='th'>
                                    Thuộc DM cấp 1
                                </th> 
                                <th class='th'>
                                    Thuộc DM cấp 2
                                </th> 
                                <th class='th'>
                                    Mô tả
                                </th>
                                <th class='th'>
                                    Icon
                                </th>
                                <th class='th'>
                                    Banner
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
            string idLoaiSanPham = table.Rows[i]["idLoaiSanPham"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["TenLoaiSanPham"].ToString() + "</td>";
            string idCapCha = table.Rows[i]["idCapCha"].ToString().Trim();
            string idCap1="";
            string idCap2="";
            if (idCapCha != "0" && idCapCha != "")
            {
                string sqlLoaiSanPham1 = "select * from tb_LoaiSanPham where idLoaiSanPham='" + idCapCha + "'";
                DataTable tbLoaiSanPham1 = Connect.GetTable(sqlLoaiSanPham1);
                if(tbLoaiSanPham1.Rows.Count>0)
                {
                    if (tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim() != "0"
                        && tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim() != "")
                    {
                        idCap1 = tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim();
                        idCap2 = idCapCha;
                    }
                    else
                    {
                        idCap1 = idCapCha;
                    }
                }
                html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.getField("tb_LoaiSanPham","TenLoaiSanPham","idLoaiSanPham",idCap1) + "</td>";
                html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idCap2) + "</td>";
            }
            else
            {
                html += "       <td style='text-align:center;vertical-align: inherit;'></td>";
                html += "       <td style='text-align:center;vertical-align: inherit;'></td>";
            }
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + MyStaticData.Cut(table.Rows[i]["MoTa"].ToString(), 200) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><img style='max-width: 30px;' src='" + MyStaticData.LinkAnh(table.Rows[i]["Icon"].ToString()) + "' alt='icon'/></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><img style='max-width: 100px;' src='" + MyStaticData.LinkAnh(table.Rows[i]["Banner"].ToString()) + "' alt='icon'/></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["KichHoat"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("adminCapNhatLoaiSanPham", new { id = idLoaiSanPham}) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteLoaiSanPham(\"" + idLoaiSanPham + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminLoaiSanPham", new { }) + "?";
        if (sTenLoai != "")
            url += "TenLoai=" + sTenLoai + "&";
        if (sLoaiSPCha != "")
            url += "MoTa=" + sLoaiSPCha + "&";
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachLoaiSanPham.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sTenLoai = txtTenLoai.Value.Trim();
        if (ddlLoaiSP.SelectedValue.Trim() != "0" && ddlLoaiSP.SelectedValue.Trim() != "")
            sIdCapCha1 = ddlLoaiSP.SelectedValue.Trim();
        if (slLoaiSPCap2.Value.Trim() != "0" && slLoaiSPCap2.Value.Trim() != "")
            sIdCapCha1 = slLoaiSPCap2.Value.Trim();
        LoadLoaiSanPham();
    }
    
    [WebMethod]
    public static string DeleteLoaiSanPham(string idLoaiSanPham)
    {
        string sql = @"delete [tb_LoaiSanPham] WHERE idLoaiSanPham = '" + idLoaiSanPham.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }
    protected void ddlLoaiSP_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idLoaiSanPham1 = ddlLoaiSP.SelectedValue.Trim();
        if (idLoaiSanPham1 != "" && idLoaiSanPham1 != "0")
            LoadLoaiSanPham2(idLoaiSanPham1);
        else
            slLoaiSPCap2.Items.Clear();
    }
}