using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
using System.IO;

public partial class Ajax : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["QuanLyGiaoNhan_Login"] != null && Session["QuanLyGiaoNhan_Login"].ToString() != "")
        //{
        //    sTenDangNhap = Session["QuanLyGiaoNhan_Login"].ToString();
        //    sidNguoiDung = StaticData.getField("tb_NguoiDung", "idNguoiDung", "TenDangNhap", sTenDangNhap);
        //    mQuyen = StaticData.getField("tb_NguoiDung", "MaQuyen", "TenDangNhap", sTenDangNhap);
        //}
        if(Request.QueryString["Action"] == null)
        {
            return;
        }

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
            case "ShowDetail":
                ShowDetail(); break;
        }
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
        if (Connect.Exec("delete tb_DonHang where idDonhang ='" + idOrder + "'"))
        {
            Result = "Deleted";
        }
        Response.Write(Result);
    }

    void ShowDetail()
    { 
        string idOrder = Request.QueryString["idOrder"].Trim();
        string sql_GetInfoDetail = " select * from tb_CTDonHang where idDonHang ='" + idOrder + "' ";
        DataTable table = Connect.GetTable(sql_GetInfoDetail);
        string html = "";
        if(table != null)
        {
            if (table.Rows.Count > 0) 
            {
                for (int i = 0; i < table.Rows.Count; i++)
                {
                html += @"<tr>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + (i + 1) + @"</td>
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_SanPham","TenSanPham","idSanPham",table.Rows[i]["idSanPham"].ToString()) + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" +  table.Rows[i]["SoLuong"]  + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_size","Size","idSize",table.Rows[i]["idSize"].ToString()) + @"</td> 
                                <td style='text-align:center;vertical-align: inherit;font-size:14px;'>" + StaticData.getField("tb_Mau","TenMau","idMau",table.Rows[i]["idMau"].ToString()) + @"</td> 
                            </tr>";
                }
            }
        }
        Response.Write(html);
    }
}