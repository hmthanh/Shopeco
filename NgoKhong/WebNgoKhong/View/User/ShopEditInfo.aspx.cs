using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CurrentUser"] != null)
            {
                string id = Session["CurrentUser"].ToString();
                string sql = "select * from tb_User where ID = '" + id + "'";

                DataTable data = Connect.GetTable(sql);
                string shopCode = data.Rows[0]["ShopCode"].ToString();

                string sqlShop = "select * from tb_GianHang where ShopCode = '" + shopCode + "'";
                DataTable shopData = Connect.GetTable(sqlShop);

                txtTenGianHang.Value = shopData.Rows[0]["TenGianHang"].ToString();
                txtDiaChi.Value = shopData.Rows[0]["DiaChi"].ToString();
                txtChuGianHang.Value = shopData.Rows[0]["ChuGianHang"].ToString();
                txtEmail.Value = shopData.Rows[0]["Email"].ToString();
                txtPhone.Value = shopData.Rows[0]["SoDienThoai"].ToString();


            }
        }
        msgError.Visible = false;
    }

    //private void LoadDsThanhPho()
    //{
    //    string sql = "select * from tb_tinhthanhpho order by name";

    //    cmbTinh.DataSource = Connect.GetTable(sql);
    //    cmbTinh.DataTextField = "name";
    //    cmbTinh.DataValueField = "matp";
    //    cmbTinh.DataBind();
    //}
    //private void LoadDsQuanHuyen(string maTP)
    //{
    //    string sql = "select * from tb_quanhuyen where matp='" + maTP + "' order by name";

    //    cmbHuyen.DataSource = Connect.GetTable(sql);
    //    cmbHuyen.DataTextField = "name";
    //    cmbHuyen.DataValueField = "maqh";
    //    cmbHuyen.DataBind();
    //}
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string tenGianHang = txtTenGianHang.Value;
        string diaChi = txtDiaChi.Value;
        string chuGianHang = txtChuGianHang.Value;
        string email = txtEmail.Value;
        string phone = txtPhone.Value;

        if (string.IsNullOrEmpty(phone))
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Số điện thoại không được để trống";
            return;
        }
        if (string.IsNullOrEmpty(tenGianHang))
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Tên không được để trống";
            return;
        }
        string id = Session["CurrentUser"].ToString();
        string shopCode = StaticData.getField("tb_User", "ShopCode", "ID", id);
        string sql = "update tb_GianHang set TenGianHang = N'" + tenGianHang + "', DiaChi = N'" + diaChi + "', ChuGianHang = N'" + chuGianHang + "', Email = '" + email + "', SoDienThoai = '" + phone + "' where ShopCode = '" + shopCode + "'";
        bool isUpdate = Connect.Exec(sql);

        if (isUpdate)
        {
            Response.RedirectToRoute("usershopinfo", new { });
        }else
        {
            msgError.InnerHtml = "Cập nhật không thành công !";
            msgError.Visible = true;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("usershopinfo", new { });
    }
}