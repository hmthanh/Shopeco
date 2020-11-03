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

public partial class Admin_View_TinTuc_LoaiTinTuc : System.Web.UI.Page
{
    string sTenSanPham = "";
    string sLoaiSanPham = "";

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
                if (Request.QueryString["TenSanPham"].Trim() != "")
                {
                    sTenSanPham = Request.QueryString["TenSanPham"].Trim();
                    txtTenLoai.Value = sTenSanPham;
                }
            }
            catch { }
            LoadLoaiSanPham();
            try
            {
                if (Request.QueryString["LoaiSanPham"].Trim() != "")
                {
                    sLoaiSanPham = Request.QueryString["LoaiSanPham"].Trim();
                    slLoaiSanPham.Value = sLoaiSanPham;
                }
            }
            catch { }
            LoadTinTuc();
        }
    }
    private void LoadLoaiSanPham()
    {
        string strSql = "select  * from tb_LoaiSanPham";
        slLoaiSanPham.DataSource = Connect.GetTable(strSql);
        slLoaiSanPham.DataTextField = "TenLoaiSanPham";
        slLoaiSanPham.DataValueField = "idLoaiSanPham";
        slLoaiSanPham.DataBind();
        slLoaiSanPham.Items.Add(new ListItem("Chọn loại sản phẩm", "0"));
        slLoaiSanPham.Items.FindByValue("0").Selected = true;
    }
    private void LoadTinTuc()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idSanPham desc
                  )AS RowNumber
	              ,*, 'Ten' = (select TenLoaiSanPham from tb_LoaiSanPham where idLoaiSanPham = sp.idLoaiSanPham)
                  FROM tb_SanPham sp where 1 = 1";
        if (sTenSanPham != "")
            sql += " and TenSanPham like N'%" + sTenSanPham + "%'";
        if (sLoaiSanPham != "" && sLoaiSanPham != "0")
            sql += " and idLoaiSanPham = '" + sLoaiSanPham + "'";
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
                                    Trang chủ
                                </th>
                                <th class='th'>
                                    Hot
                                </th>
                                <th class='th'>
                                    Tình trạng
                                </th>
                                <th class='th'>Sửa
                                </th>
                                <th class='th'>Xóa
                                </th>
                            </tr>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idSanPham = table.Rows[i]["idSanPham"].ToString();
            html += "   <tr>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["RowNumber"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["MaSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:left;vertical-align: inherit;'>" + table.Rows[i]["TenSanPham"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(table.Rows[i]["GiaCu"].ToString()) + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.FormatDouble(table.Rows[i]["GiaMoi"].ToString()) + "</td>";

            string idCapCha1 = "";
            string idCapCha2 = "";
            string idCapCha3 = table.Rows[0]["idLoaiSanPham"].ToString();
            idCapCha2 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha3);
            idCapCha1 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha2);
            string LoaiSanPham = "";
            LoaiSanPham += StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idCapCha1);
            LoaiSanPham += " -> " + StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idCapCha2);
            LoaiSanPham += " -> " + StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idCapCha3);

            html += "       <td style='text-align:center;vertical-align: inherit;'>" + LoaiSanPham + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["SetHome"].ToString() == "False" ? "square" : "check") + "'></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><i class='fa fa-" + (table.Rows[i]["SetHot"].ToString() == "False" ? "square" : "check") + "'></td>";
            if (table.Rows[i]["KichHoat"].ToString() == "True")
                html += "       <td style='text-align:center;vertical-align: inherit;'>Đã duyệt</td>";
            else
                html += "       <td style='text-align:center;vertical-align: inherit;background-color:yellow'>Chưa duyệt</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("adminCapNhatSanPham", new { id = idSanPham }) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteSanPham(\"" + idSanPham + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        string url = GetRouteUrl("adminSanPham", new { }) + "?";
        if (sTenSanPham != "")
            url += "TenSanPham=" + sTenSanPham + "&";
        if (sLoaiSanPham != "")
            url += "LoaiSanPham=" + sLoaiSanPham + "&";
        url += "Page=";
        html += StaticData.CreateHTMLPagingAdmin(Page, url, StaticData.SetPage(Page, TotalRows, PageSize));
        html += "    </td></tr>";
        html += "     </table></center>";
        dvDanhSachLoaiTinTuc.InnerHtml = html;
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        sTenSanPham = txtTenLoai.Value.Trim();
        sLoaiSanPham = slLoaiSanPham.Value.Trim();
        LoadTinTuc();
    }

    [WebMethod]
    public static string DeleteSanPham(string idSanPham)
    {
        Connect.Exec("delete tb_HinhAnhSanPham where idSanPham = '" + idSanPham.Trim() + "'");
        string sql = @"delete [tb_SanPham] WHERE idSanPham = '" + idSanPham.Trim() + "'";
        bool ex = Connect.Exec(sql);
        return ex.ToString();
    }


    protected void btQuet_Click(object sender, EventArgs e)
    {
        HtmlWeb web = new HtmlWeb();
        var url = txtUrlQuet.Value.Trim();
        if (url == "")
            Response.Write("<script>alert('Bạn chưa nhập link quét.')</script>");
        else
        {
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

                HtmlDocument document = web.Load(url);
                /*var selector = "product-info__product-info___10ne- product__product-info___3onGQ";*/
                var selector = "jsx-426174879 product-info";
                var resultNode = document.DocumentNode.SelectSingleNode("//div[@class=\"" + selector + "\"]");
                if (resultNode == null)
                {
                    Response.Write("<script>alert('Link không đúng hoặc cấu trúc html đã thay đổi.')</script>");
                }
                var trs = resultNode.SelectNodes("h4");

                var TenSP = trs[1].InnerText;
                var divGia = resultNode.SelectNodes("div")[0].SelectNodes("span");
                var GiaCu = divGia[0].InnerText.Replace(",", "").Replace("₫", "");
                var GiaMoi = divGia[1].InnerText.Replace(",", "").Replace("₫", "");

                var Size = document.DocumentNode.SelectSingleNode("//div[@class=\"jsx-85280374 product-size\"]");

                string listSize = "";
                if (Size == null)
                    listSize = StaticData.getField("tb_Size", "idSize", "isDefault", "1");
                else
                {
                    var buttonSize = Size.SelectNodes("div").Skip(1);
                    foreach (var bt in buttonSize)
                    {
                        if (listSize != "")
                            listSize += "-";
                        string S = bt.InnerHtml.Split(new[] { "<div" }, StringSplitOptions.None)[0];
                        string sqlkt = "select * from tb_Size where Size = '" + S + "'";
                        DataTable tbkt = Connect.GetTable(sqlkt);
                        string idSize = "";
                        if (tbkt.Rows.Count > 0)
                        {
                            idSize = tbkt.Rows[0]["idSize"].ToString();
                        }
                        else
                        {
                            Connect.Exec("insert tb_Size(Size,KichHoat,isDefault) values('" + S + "','1',0)");
                            idSize = StaticData.getField("tb_Size", "MAX(idSize)", "1", "1");
                        }
                        listSize += idSize;
                    }
                }
                // size cũ
                //var Size = document.DocumentNode.SelectSingleNode("//div[@class=\"product__sizes___27zL9\"]");

                //string listSize = "";
                //if (Size == null)
                //    listSize = StaticData.getField("tb_Size", "idSize", "isDefault", "1");
                //else
                //{
                //    var buttonSize = Size.SelectNodes("button");
                //    foreach (var bt in buttonSize)
                //    {
                //        if (listSize != "")
                //            listSize += "-";
                //        string S = bt.InnerHtml.Split(new[] { "<div" }, StringSplitOptions.None)[0];
                //        string sqlkt = "select * from tb_Size where Size = '" + S + "'";
                //        DataTable tbkt = Connect.GetTable(sqlkt);
                //        string idSize = "";
                //        if (tbkt.Rows.Count > 0)
                //        {
                //            idSize = tbkt.Rows[0]["idSize"].ToString();
                //        }
                //        else
                //        {
                //            Connect.Exec("insert tb_Size(Size,KichHoat,isDefault) values('" + S + "','1',0)");
                //            idSize = StaticData.getField("tb_Size", "MAX(idSize)", "1", "1");
                //        }
                //        listSize += idSize;
                //    }
                //}
                //var Img = document.DocumentNode.SelectSingleNode("//ul[@id=\"images-container\"]");

                //string listImg = "";
                //var liImg = Img.SelectNodes("li");
                //foreach (var img in liImg)
                //{
                //    if (listImg != "")
                //        listImg += "|~|";
                //    listImg += img.SelectSingleNode("img").Attributes[2].Value.Replace("/w90/", "/w580/");
                //}
                var Img = document.DocumentNode.SelectSingleNode("//div[@class=\"jsx-843506535 jsx-796085701 content\"]").SelectSingleNode("img").Attributes["src"].Value.Split('/');
                string link = "";
                for (int i = 0; i < Img.Length - 1; i++)
                {
                    if (link != "")
                        link += "/";
                    link += Img[i];
                }
                string listImg = "";
                var liImg = Img[Img.Length - 1].Split(',');
                foreach (var img in liImg)
                {
                    if (listImg != "")
                        listImg += "|~|";
                    listImg += link + "/" + img;
                }
                var ThongTinSP = document.DocumentNode.SelectSingleNode("//div[@class=\"jsx-3971805357 product-description\"]").SelectNodes("div")[0].SelectNodes("div")[1].SelectSingleNode("//div[@class=\"jsx-3971805357\"]").InnerHtml;
                var MoTa = document.DocumentNode.SelectSingleNode("//div[@class=\"jsx-2088491857 brand-info undefined\"]").InnerHtml;

                string LoaiSanPham =  slLoaiSanPham.Value.Trim();
                if(LoaiSanPham == "0")
                    LoaiSanPham = "null";
                string sqlInserNguoiDung = "insert into tb_SanPham(TenSanPham,GiaCu,GiaMoi,Mau, Size,MoTa,ThongTinSP,idLoaiSanPham,SetHome,SetHot,KichHoat)";
                sqlInserNguoiDung += " values(N'" + TenSP + "',N'" + GiaCu + "',N'" + GiaMoi + "','" + StaticData.getField("tb_Mau", "idMau", "isDefault", "1") + "','" + listSize + "',N'" + MoTa.Replace("'","''") + "',N'" + ThongTinSP.Replace("'", "''") + "'," + LoaiSanPham + ",'1','1','1')";
                bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);
                if (ktInsertNguoiDung)
                {
                    string id = StaticData.getField("[tb_SanPham]", "Max(idSanPham)", "1", "1");
                    //them orderdetail
                    string[] arrHinhAnh = listImg.Split(new string[] { "|~|" }, StringSplitOptions.None);
                    for (int i = 0; i < arrHinhAnh.Length; i++)
                    {
                        if (arrHinhAnh[i].Trim() != "")
                        {
                            string sql = "insert into tb_HinhAnhSanPham(idSanPham,LinkHinh)";
                            sql += " Values (" + id + ",N'" + arrHinhAnh[i].Trim() + "')";
                            Connect.Exec(sql);
                        }
                    }
                    Response.Redirect(GetRouteUrl("adminSanPham", new { }));
                }
                else
                {
                    Response.Write("<script>alert('Lỗi !')</script>");
                }
            }
            catch(Exception r)
            {
                Response.Write("<script>alert('Link không đúng hoặc cấu trúc html đã thay đổi.')</script>");
            }
        }
    }
}