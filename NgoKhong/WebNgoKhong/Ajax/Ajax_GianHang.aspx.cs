using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_View_SanPham_Ajax_SanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["action"].Trim();
        switch (action)
        {
            case "Duyet":
                LoadLoaiSP2(); break;
            case "CapNhatTrangThai":
                CapNhatTrangThai(); break;
        }
    }

    private void DsDonHangNguoiDung()
    {
//        string idOrder = Request.QueryString["idOrder"].Trim();
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
        
    }

    private void CapNhatTrangThai()
    {
        string idChiTiet = Request.QueryString["idChiTiet"].Trim();
        string idTrangThai = Request.QueryString["idTrangThai"].Trim();
        string sql = "update tb_CTDonHang set idTrangThai = '" + idTrangThai + "' where idChiTiet = '" + idChiTiet + "'";
        bool isUpdate = Connect.Exec(sql);
        Response.Write('1');
    }
    void LoadLoaiSP2()
    {
        string idLoaiSPCap1 = StaticData.ValidParameter(Request.QueryString["shopid"].Trim());
        string sql = "select * from tb_LoaiSanPham where idCapCha ='" + idLoaiSPCap1 + "'";
        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "<option value='" + table.Rows[0]["idLoaiSanPham"].ToString() + "'>" + table.Rows[0]["TenLoaiSanPham"].ToString() + "</option>";
        }
        html += "<option value=''>Chọn loại SP cấp 2</option>";
        Response.Write(html);
    }
}