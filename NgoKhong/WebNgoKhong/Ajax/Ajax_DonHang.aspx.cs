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
        
        if (Request.QueryString["action"] == null)
        {
            return;
        }

        string action = Request.QueryString["action"].Trim();
        switch (action)
        {
            case "Duyet":
                DuyetGianHang(); break;
            case "CapNhatTrangThai":
                CapNhatTrangThai(); break;
            case "HuyDuyet":
                HuyDuyet(); break;
            case "Block":
                BlockGianHang(); break;
            case "HuyBlock":
                HuyBlock(); break;
            case "TrangThaiSanPham":
                TrangThaiSanPham(); break;
            default:
                break;
        }
    }

    private void TrangThaiSanPham()
    {
        string idSanPham = Request.QueryString["idSanPham"].ToString();
        int id = int.Parse(Request.QueryString["id"].ToString());

        string sql = "update tb_SanPham set KichHoat = '" + id + "' where idSanPham = '" + idSanPham + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.Write("1");
        }
    }
    private void CapNhatTrangThai()
    {
        string[] Status = { "Mới tạo", "Đang xử lý", "Hoàn tất", "Hủy" };

        string idDonHang = Request.QueryString["idDonHang"].ToString();
        int id = int.Parse(Request.QueryString["id"].ToString());

        string nameStatus = Status[id - 1];

        string sql = "update tb_DonHang set Status = N'" + nameStatus + "' where idDonHang = '" + idDonHang + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.Write("1");
        }
    }

    public void KichHoatSanPham(string id)
    {
        string sql = "update tb_SanPham set KichHoat = 1 where IDGianHang = " + id;
        bool isUpdate = Connect.Exec(sql);
    }
    public void HuyKichHoatSanPham(string id)
    {
        string sql = "update tb_SanPham set KichHoat = 0 where IDGianHang = " + id;
        bool isUpdate = Connect.Exec(sql);
    }
    private void DuyetGianHang()
    {
        string idShop = Request.QueryString["id"].Trim();
        string sql = "update tb_GianHang set DaDuyet = 'True' where ID = " + idShop;
        bool isUpdate = Connect.Exec(sql);
        KichHoatSanPham(idShop);

        Response.Write("1");
    }
    private void HuyDuyet()
    {
        string idShop = Request.QueryString["id"].Trim();
        string sql = "update tb_GianHang set DaDuyet = 'False' where ID = " + idShop;
        bool isUpdate = Connect.Exec(sql);
        HuyKichHoatSanPham(idShop);

        Response.Write("1");
    }
    private void BlockGianHang()
    {
        string idShop = Request.QueryString["id"].Trim();
        string sql = "update tb_GianHang set DaBlock = 'True' where ID = " + idShop;
        bool isUpdate = Connect.Exec(sql);
        HuyKichHoatSanPham(idShop);

        Response.Write("1");
    }
    private void HuyBlock()
    {
        string idShop = Request.QueryString["id"].Trim();
        string sql = "update tb_GianHang set DaBlock = 'False' where ID = " + idShop;
        bool isUpdate = Connect.Exec(sql);
        KichHoatSanPham(idShop);

        Response.Write("1");
    }
}