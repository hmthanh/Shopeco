using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;

public partial class Ajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["Action"].Trim();
        switch (action)
        {
            case "Modify_Order":
                Modify_Order(); break;
            case "Edit_Order":
                Edit_Order(); break;
            case "Get_Info_Order":
                Get_Info_Order(); break;
            case "Delete_Order":
                Delete_Order(); break;
            case "DsDonHangNguoiDung":
                DsDonHangNguoiDung(); break;
            case "ShowDetail":
                ShowDetail(); break;
        }
    }

    private void CapNhatTrangThai()
    {
        Response.Write(true);
    }

    private void DsDonHangNguoiDung()
    {
//        string idOrder = Request.QueryString["idOrder"].Trim();
//        //string sql_GetInfoDetail = " select * from tb_CTDonHang c, tb_DonHang d where c.idDonHang = d.idDonHang and c.idDonHang = '" + idOrder + "' ";
//        string sql_GetInfoDetail = "select * from tb_CTDonHang c, tb_DonHang d where c.idDonHang = d.idDonHang and d.idUser = '" + idOrder + "' ";
//        DataTable table = Connect.GetTable(sql_GetInfoDetail);
//        string html = "";
//        if (table != null)
//        {
//            if (table.Rows.Count > 0)
//            {
//                for (int i = 0; i < table.Rows.Count; i++)
//                {
//                    double SoLuong = double.Parse(table.Rows[i]["SoLuong"].ToString());
//                    double DonGia = double.Parse(table.Rows[i]["DonGia"].ToString());
//                    string tenGianHang = StaticData.getField("tb_Gianhang", "TenGianHang", "ID", table.Rows[i]["idGianHang"].ToString());


//                    html += @"<tr>
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (i + 1) + @"</td>
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", table.Rows[i]["idSanPham"].ToString()) + @"</td> 
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_size", "Size", "idSize", table.Rows[i]["idSize"].ToString()) + @"</td> 
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_Mau", "TenMau", "idMau", table.Rows[i]["idMau"].ToString()) + @"</td> 
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + SoLuong.ToString() + @"</td>
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + DonGia.ToString("#,##") + @"</td>
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (SoLuong * DonGia).ToString("#,##") + @"</td>
//                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (tenGianHang) + @"</td>
        //                            </tr>";
        //                }
        //            }
        //        }
        //        Response.Write(html);
        string idOrder = Request.QueryString["idOrder"].Trim();
        //string sql = "SELECT ROW_NUMBER() OVER ( ORDER BY d.idDonHang desc ) AS RowNumber ,* from tb_CTDonHang c, tb_DonHang d where c.idDonHang = d.idDonHang and d.idUser = '" + idOrder + "' ";
        string sql = "SELECT ROW_NUMBER() OVER ( ORDER BY s.idSanPham desc )AS RowNumber, s.idSanPham, g.TenGianHang, d.Ngay, s.MaSanPham, s.TenSanPham, s.GiaCu, s.GiaMoi, s.idLoaiSanPham from tb_CTDonHang c, tb_DonHang d, tb_SanPham s, tb_GianHang g where c.idDonHang = d.idDonHang and s.idSanPham = c.idSanPham and g.ID = s.IDGianHang and d.idUser = '" + idOrder + "'";
        DataTable tbTong = Connect.GetTable(sql);
        if (tbTong == null)
        {
            return;
        }
        int TotalRows = tbTong.Rows.Count;

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
                                    Gian hàng
                                </th>
                                <th class='th'>
                                    Ngày mua
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
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + table.Rows[i]["TenGianHang"].ToString() + "</td>";
            html += "       <td style='text-align:center;vertical-align: inherit;'>" + StaticData.DateFormat(table.Rows[i]["Ngay"].ToString()) + "</td>";

            html += "   </tr>";
        }
        html += "  </table><table >   <tr>";
        html += "       <td colspan='17' class='footertable'>";
        html += "    </td></tr>";
        html += "     </table></center>";
        Response.Write(html);
    }
    void Modify_Order()
    {
        string Result = "";

        string NameOfCustomer = Request.QueryString["NameOfCustomer"].Trim();
        string PhoneNumber = Request.QueryString["PhoneNumber"].Trim();
        string Address = Request.QueryString["Address"].Trim();
        string Note = Request.QueryString["Note"].Trim();
        string Date = Request.QueryString["Date"].Trim();
        string Email = Request.QueryString["Email"].Trim();


        string sql_modify = string.Format(@"insert into tb_DonHang(TenKhachHang,SoDienThoai,DiaChi,GhiChu,Email,Ngay) 
                                                values('{0}','{1}','{2}','{3}','{4}','{5}')", NameOfCustomer, PhoneNumber, Address, Note, Email, Date);
        if (Connect.Exec(sql_modify))
            Result = "Modified";
        Response.Write(Result);
    }
    void Edit_Order()
    {
        string Result = "";

        string NameOfCustomer = Request.QueryString["NameOfCustomer"].Trim();
        string PhoneNumber = Request.QueryString["PhoneNumber"].Trim();
        string Address = Request.QueryString["Address"].Trim();
        string Note = Request.QueryString["Note"].Trim();
        string Date = StaticData.ConvertDDMMtoMMDD(Request.QueryString["Date"].Trim());
        string Email = Request.QueryString["Email"].Trim();
        string Status = Request.QueryString["Status"].Trim();

        string idOrder = Request.QueryString["idOrder"].Trim();


        string sql_modify = string.Format("update tb_DonHang set TenKhachHang=N'{0}',SoDienThoai='{1}',DiaChi=N'{2}',GhiChu=N'{3}',Email='{4}',Ngay='{5}',Status=N'{6}' where idDonhang='{7}'", NameOfCustomer, PhoneNumber, Address, Note, Email, Date,Status, idOrder);
        if (Connect.Exec(sql_modify))
            Result = "Edited";
        Response.Write(Result);
    }
    void Get_Info_Order()
    {
        string chuoi = "";
        string idOrder = Request.QueryString["idOrder"].Trim();
        string sql_get_info = "select * from tb_DonHang where idDonhang = '" + idOrder + "'";
        DataTable table = Connect.GetTable(sql_get_info);
        if (table.Rows.Count > 0)
        {
            chuoi = table.Rows[0]["TenKhachHang"] + "@_@" + table.Rows[0]["SoDienThoai"] + "@_@" + table.Rows[0]["DiaChi"] + "@_@" + table.Rows[0]["GhiChu"] + "@_@" + StaticData.ConvertMMDDYYtoDDMMYY(table.Rows[0]["Ngay"].ToString()) + "@_@" + table.Rows[0]["Email"] + "@_@" + table.Rows[0]["Status"];
        }
        Response.Write(chuoi);
    }
    void Delete_Order()
    {
        string Result = "";
        string idOrder = Request.QueryString["idOrder"].Trim();

        string sqlDeleteCTDH = "delete from tb_CTDonHang where idDonHang='" + idOrder + "'";
        bool ktDeleteCTDH = Connect.Exec(sqlDeleteCTDH);
        if (ktDeleteCTDH)
        {
            if (Connect.Exec("delete tb_DonHang where idDonhang ='" + idOrder + "'"))
            {
                Result = "Deleted";
            }
        }
        Response.Write(Result);
    }

    void ShowDetail()
    { 
        string idOrder = Request.QueryString["idOrder"].Trim();
        string sql_GetInfoDetail = " select * from tb_CTDonHang c, tb_DonHang d where c.idDonHang = d.idDonHang and c.idDonHang = '" + idOrder + "' ";
        DataTable table = Connect.GetTable(sql_GetInfoDetail);
        string html = "";
        if(table != null)
        {
            if (table.Rows.Count > 0) 
            {
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    
                    double SoLuong = double.Parse(table.Rows[i]["SoLuong"].ToString());
                    double DonGia = double.Parse(table.Rows[i]["DonGia"].ToString());
                    string tenGianHang = StaticData.getField("tb_Gianhang", "TenGianHang", "ID", table.Rows[i]["idGianHang"].ToString());


                html += @"<tr>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (i + 1) + @"</td>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_SanPham","TenSanPham","idSanPham",table.Rows[i]["idSanPham"].ToString()) + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_size","Size","idSize",table.Rows[i]["idSize"].ToString()) + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_Mau","TenMau","idMau",table.Rows[i]["idMau"].ToString()) + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + SoLuong.ToString() + @"</td>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + DonGia.ToString("#,##") + @"</td>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (SoLuong * DonGia).ToString("#,##") + @"</td>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (tenGianHang) + @"</td>
                            </tr>";
                }
            }
        }
        Response.Write(html);
    }
}