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
        msgOwner.Visible = false;
        msgEmail.Visible = false;
        msgPhone.Visible = false;
        msgDesc.Visible = false;

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
        dvDanhSachNguoiDung.InnerHtml = "Người dùng chưa tạo gian hàng !";
        btnUpdate.Visible = false;
        btnCancel.Text = "Quay lại";
    }
    
    private void LoadKhachhang()
    {
        string shopCode = StaticData.getField("tb_User", "ShopCode", "ID", idUser);
        if (string.IsNullOrEmpty(shopCode))
        {
            Error();
            return;
        }
        string sqlShop = @"select * from tb_GianHang where ShopCode = '" + shopCode + "'";
        DataTable dataShop = Connect.GetTable(sqlShop);
        if (dataShop == null)
        {
            Error();
            return;
        }

        
        txtShopName.Value = dataShop.Rows[0]["TenGianHang"].ToString();
        txtAddress.Value = dataShop.Rows[0]["DiaChi"].ToString();
        txtOwner.Value = dataShop.Rows[0]["ChuGianHang"].ToString();
        txtEmail.Value = dataShop.Rows[0]["Email"].ToString();
        txtPhone.Value = dataShop.Rows[0]["SoDienThoai"].ToString();
        txtDesc.Value = dataShop.Rows[0]["MoTas"].ToString();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];

        Response.RedirectToRoute("adminSanPhamKhachHang", new { id = id });
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string shopCode = StaticData.getField("tb_User", "ShopCode", "ID", idUser);
        string ShopName = txtShopName.Value;
        string Address = txtAddress.Value;
        string Owner = txtOwner.Value;
        string Email = txtEmail.Value;
        string Phone = txtPhone.Value;
        string Desc = txtDesc.Value;

        string sql = "update tb_GianHang set TenGianHang = N'" + ShopName + "', DiaChi = N'" + Address + "', ChuGianHang = N'" + Owner + "', Email = N'" + Email + "', SoDienThoai = '" + Phone + "', MoTas = N'" + Desc + "' where ShopCode = '" + shopCode + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.RedirectToRoute("adminSanPhamKhachHang", new { id = idUser });
        }
    }
}