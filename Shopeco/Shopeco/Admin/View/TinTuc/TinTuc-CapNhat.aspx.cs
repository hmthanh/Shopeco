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
            LoadLoaiTinTuc();
            LoadThongTinLoaiTinTuc();
        }

    }


    private void LoadLoaiTinTuc()
    {
        string strSql = "select  * from tb_LoaiTinTuc where Active = 1";
        slLoaiTinTuc.DataSource = Connect.GetTable(strSql);
        slLoaiTinTuc.DataTextField = "TenLoaiTinTuc";
        slLoaiTinTuc.DataValueField = "idLoaiTinTuc";
        slLoaiTinTuc.DataBind();
        slLoaiTinTuc.Items.Add(new ListItem("Chọn loại tin tức", "0"));
        slLoaiTinTuc.Items.FindByValue("0").Selected = true;
    }

    private void LoadThongTinLoaiTinTuc()
    {
        if (id != "")
        {
            string sql = "select * from tb_TinTuc where idTinTuc ='" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                btLuu.Text = "SỬA";
                txtTieuDe.Value = table.Rows[0]["TieuDe"].ToString();
                slLoaiTinTuc.Value = table.Rows[0]["idLoaiTinTuc"].ToString();
                txtNoiDung.Value = table.Rows[0]["NoiDung"].ToString();

                ckTrangChu.Checked = bool.Parse(table.Rows[0]["SetHome"].ToString());
                ckTinHot.Checked = bool.Parse(table.Rows[0]["SetHot"].ToString());

                if (table.Rows[0]["AnhDaiDien"].ToString() != "")
                {
                    imagePreviewContainer.InnerHtml = "<img id='imgUpLoad' width='65' height='50' src='" + table.Rows[0]["AnhDaiDien"].ToString() + "'/>";
                }
            }
        }
    }

    protected void btLuu_Click(object sender, EventArgs e)
    {
        string TieuDe = "";
        string LoaiTinTuc = "";
        string NoiDung = "";
        string logo = "";
        string TrangChu = "";
        string TinHOT = "";

        if ((imageUploadInput.PostedFile != null) && (imageUploadInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(imageUploadInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("/images/TinTuc/") + fn;
            try
            {
                imageUploadInput.PostedFile.SaveAs(SaveLocation);
                //Response.Write("The file has been uploaded.");
                logo = "/images/TinTuc/" + fn;
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        //Tên Người Dùng
        if (txtTieuDe.Value.Trim() != "")
        {
            TieuDe = txtTieuDe.Value.Trim();
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa nhập tiêu đề!')</script>");
            return;
        }
        LoaiTinTuc = slLoaiTinTuc.Value.Trim();
        if(LoaiTinTuc == "0")
        {
            Response.Write("<script>alert('Bạn chưa chọn loại tin tức!')</script>");
            return;
        }
        //CMND
        NoiDung = txtNoiDung.Value.Trim();
        
        //Quyền
        TrangChu = ckTrangChu.Checked.ToString();
        TinHOT = ckTinHot.Checked.ToString();

        if (id == "0" || id == "")
        {
            string sqlInserNguoiDung = "insert into  tb_TinTuc(TieuDe,NoiDung,Ngay,AnhDaiDien,idLoaiTinTuc,SetHome,SetHot)";
            sqlInserNguoiDung += " values(N'" + TieuDe + "',N'" + NoiDung + "','" + DateTime.Now + "',N'" + logo + "','" + LoaiTinTuc + "','" + TrangChu + "','" + TinHOT + "')";
            bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

            if (ktInsertNguoiDung)
            {
                Response.Redirect(GetRouteUrl("adminTinTuc", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi !')</script>");
            }
        }
        else
        {

            string sqlUpdateNguoiDung = "";
            sqlUpdateNguoiDung += "update tb_TinTuc set";
            sqlUpdateNguoiDung += " TieuDe = N'" + TieuDe + "'";
            sqlUpdateNguoiDung += " ,idLoaiTinTuc = '" + LoaiTinTuc + "'"; 
            sqlUpdateNguoiDung += " ,NoiDung = N'" + NoiDung + "'";
            if(logo != "")
                sqlUpdateNguoiDung += " ,AnhDaiDien = N'" + logo + "'";
            sqlUpdateNguoiDung += " ,SetHome = '" + TrangChu + "'";
            sqlUpdateNguoiDung += " ,SetHot = '" + TinHOT + "'";
            sqlUpdateNguoiDung += " where idTinTuc ='" + id + "'";
            bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
            if (ktUpdateNguoiDung)
            {
                if (Page != "")
                    Response.Redirect(GetRouteUrl("adminTinTuc", new { page = Page}));
                Response.Redirect(GetRouteUrl("adminTinTuc", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("adminTinTuc", new { }));
    }
}