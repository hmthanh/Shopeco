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
    string[] Status = { "Mới", "Đang xử lý", "Hoàn tất", "Hủy"};

    public string idUser { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        msgShopName.Visible = false;
        msgAddress.Visible = false;
        msgEmail.Visible = false;
        msgPhone.Visible = false;

        if (Request.QueryString["id"] == null)
        {
            Error();
            return;
        }

        idUser = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            LoadKhachhang();
        }
    }
    public void Error()
    {
        dvDanhSachNguoiDung.InnerHtml = "Người dùng chưa tạo kênh rao vặt!";
        btnUpdate.Visible = false;
        btnCancel.Text = "Quay lại";
    }
    
    private void LoadKhachhang()
    {
        string adsCode = StaticData.getField("tb_User", "AdsCode", "ID", idUser);
        if (string.IsNullOrEmpty(adsCode))
        {
            Error();
            return;
        }
        string sqlShop = @"select * from tb_RVUser where AdsCode = '" + adsCode + "'";
        DataTable dataShop = Connect.GetTable(sqlShop);
        if (dataShop == null)
        {
            Error();
            return;
        }

        
        txtShopName.Value = dataShop.Rows[0]["FullName"].ToString();
        txtAddress.Value = dataShop.Rows[0]["Address"].ToString();
        txtEmail.Value = dataShop.Rows[0]["Email"].ToString();
        txtPhone.Value = dataShop.Rows[0]["Phone"].ToString();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];

        Response.RedirectToRoute("adminSanPhamKhachHang", new { id = id });
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string adsCode = StaticData.getField("tb_User", "AdsCode", "ID", idUser);
        if (String.IsNullOrEmpty(adsCode))
        {
            Error();
            return;
        }

        string ShopName = txtShopName.Value;
        string Address = txtAddress.Value;
        string Email = txtEmail.Value;
        string Phone = txtPhone.Value;

        string sql = "update tb_RVUser set FullName = N'" + ShopName + "', Address = N'" + Address + "', Email = N'" + Email + "', Phone = '" + Phone + "' where AdsCode = '" + adsCode + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.RedirectToRoute("adminSanPhamKhachHang", new { id = idUser });
        }
    }
}