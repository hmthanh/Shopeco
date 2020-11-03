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
        msgUsername.Visible = false;
        msgPassword.Visible = false;
        msgPassword2.Visible = false;
        msgAddress.Visible = false;
        msgEmail.Visible = false;
        msgFullName.Visible = false;
        msgPhone.Visible = false;
        msgAdminType.Visible = false;
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
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //string id = Request.QueryString["id"].ToString();
        Response.RedirectToRoute("adminUser", new {});
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //string admin = slAdminType.Value;
        int[] s = slPermission.GetSelectedIndices();
        string strPermission = "";
        for (int i = 0; i < s.Length; i++)
        {
            strPermission += (s[i]+1) + " ";
        }

        string username = txtUsername.Value;
        string password = txtPassword1.Value;
        string password2 = txtPassword2.Value;
        string fullname = txtFullName.Value;
        string email = txtEmail.Value;
        string phone = txtPhone.Value;
        string address = txtAddress.Value;

        if (string.IsNullOrEmpty(username))
        {
            msgUsername.Visible = true;
            return;
        }
        if (string.IsNullOrEmpty(password))
        {
            msgPassword.Visible = true;
            return;
        }
        if (password2 != password)
        {
            msgPassword2.Visible = true;
            return;
        }

        string sql = "insert tb_Admin(TenDangNhap, MatKhau, HoTen, DiaChi, SoDienThoai, Quyen) values('" + username + "', '" + password + "', N'" + fullname + "', N'" + address + "', N'" + phone + "', '" + strPermission + "')";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.RedirectToRoute("adminUser", new { });
        }
    }
}