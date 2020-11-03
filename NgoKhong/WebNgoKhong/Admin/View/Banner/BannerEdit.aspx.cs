using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_TinTuc_LoaiTinTin_CapNhat : System.Web.UI.Page
{
    string id = "";
    //string TenDangNhapGoc = "";

    string Page = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            id = RouteData.Values["id"].ToString();
            //idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        }
        catch { }
        try
        {
            Page = StaticData.ValidParameter(Request.QueryString["Page"].Trim());
        }
        catch { }
        if (!IsPostBack)
        {
            LoadThongTinLoaiTinTuc();
        }

    }

    private void LoadThongTinLoaiTinTuc()
    {
        if (id != "")
        {
            string sql = "select * from tb_Banner where idBanner ='" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                btLuu.Text = "SỬA";
                txtTieuDe.Value = table.Rows[0]["TieuDe"].ToString();
                txtSoThuTu.Value = table.Rows[0]["ThuTu"].ToString();
                txtUrl.Value = table.Rows[0]["Url"].ToString();
                ckKichHoat.Checked = bool.Parse(table.Rows[0]["Active"].ToString());

                if (table.Rows[0]["Link"].ToString() != "")
                {
                    imagePreviewContainer.InnerHtml = "<img id='imgUpLoad' width='65' height='50' src='" + table.Rows[0]["Link"].ToString() + "'/>";
                }
            }
        }
    }

    protected void btLuu_Click(object sender, EventArgs e)
    {
        string TieuDe = "";
        string ThuTu = "";
        string Url = "";
        string logo = "";
        string KichHoat = "";

        if ((imageUploadInput.PostedFile != null) && (imageUploadInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(imageUploadInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("/images/Banner/") + fn;
            try
            {
                imageUploadInput.PostedFile.SaveAs(SaveLocation);
                //Response.Write("The file has been uploaded.");
                logo = "/images/Banner/" + fn;
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        if (logo == "" && (id == "" || id == "0"))
        {
            Response.Write("<script>alert('Bạn chưa chọn ảnh!')</script>");
            return;
        }
        //Tên Người Dùng
        TieuDe = txtTieuDe.Value.Trim();
        //Số Điện Thoại
        ThuTu = txtSoThuTu.Value.Trim();
        Url = txtUrl.Value.Trim();
        KichHoat = ckKichHoat.Checked.ToString();

        if (id == "0" || id == "")
        {
            string sqlInserNguoiDung = "insert into tb_Banner(TieuDe,ThuTu, Url,Link,Active)";
            sqlInserNguoiDung += " values(N'" + TieuDe + "',N'" + ThuTu + "', '" + Url + "','" + logo + "','" + KichHoat + "')";
            bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

            if (ktInsertNguoiDung)
            {
                Response.Redirect(GetRouteUrl("adminbanner", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi !')</script>");
            }
        }
        else
        {

            string sqlUpdateNguoiDung = "";
            sqlUpdateNguoiDung += "update tb_Banner set";
            sqlUpdateNguoiDung += " TieuDe = N'" + TieuDe + "'";
            sqlUpdateNguoiDung += " ,ThuTu = N'" + ThuTu + "'";
            sqlUpdateNguoiDung += " ,Url = N'" + Url + "'";
            if(logo != "")
                sqlUpdateNguoiDung += " ,Link = '" + logo + "'";
            sqlUpdateNguoiDung += " ,Active = '" + KichHoat + "'";
            sqlUpdateNguoiDung += " where idBanner ='" + id + "'";
            bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
            if (ktUpdateNguoiDung)
            {
                if (Page != "")
                    Response.Redirect(GetRouteUrl("adminbanner", new { page = Page}));
                Response.Redirect(GetRouteUrl("adminbanner", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("adminbanner", new { }));
    }
}