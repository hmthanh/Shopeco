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

    string sChuoiTimKiem = "";
    string sIDGianHang = "";

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
    //int id = 0;
    int MaxPage = 0;
    int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        msgAddress.Visible = false;
        msgEmail.Visible = false;
        msgFullName.Visible = false;
        msgPhone.Visible = false;
        //msgAdsCode.Visible = false;
        //msgShopCode.Visible = false;

        if (!IsPostBack)
        {
            LoadKhachhang();
        }
    }
    
    
    private void LoadKhachhang()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        string id = Request.QueryString["id"].ToString();

        string sql = @"select * from tb_user d where d.ID = '" + id + "'";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }

        int TotalRows = table.Rows.Count;
        string date = StaticData.DateFormat(table.Rows[0]["LastOnline"].ToString());
        txtFullName.Value = table.Rows[0]["FullName"].ToString();
        txtEmail.Value = table.Rows[0]["Email"].ToString();
        txtPhone.Value = table.Rows[0]["PhoneNumber"].ToString();
        txtAddress.Value = table.Rows[0]["Address"].ToString();
        //txtShopCode.Value = table.Rows[0]["ShopCode"].ToString();
        //txtAdsCode.Value = table.Rows[0]["AdsCode"].ToString();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminSanPhamKhachHang", new { id = id });
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string fullname = txtFullName.Value;
        string email = txtEmail.Value;
        string phone = txtPhone.Value;
        string address = txtAddress.Value;
        //string shopCode = txtShopCode.Value;
        //string adsCode = txtAdsCode.Value;

        string id = Request.QueryString["id"].ToString();
        string sql = "update tb_User set Fullname = N'" + fullname + "', Email = '" + email + "', PhoneNumber = '" + phone + "', Address = N'" + address +"' where ID = '" + id + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.RedirectToRoute("adminSanPhamKhachHang", new { id = id });
        }
    }
}