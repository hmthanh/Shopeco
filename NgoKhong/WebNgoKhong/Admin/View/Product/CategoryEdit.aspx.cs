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
            
            //string sql = "select * from tb_LoaiSanPham where idCapCha=0 order by TenLoaiSanPham";
            //StaticData.LoadCombobox(slLoaiSP, sql, "TenLoaiSanPham", "idLoaiSanPham", "Chọn loại SP 1");
            LoadLoaiSanPham1();
            LoadThongTinLoaiSP();
        }

    }
    private void LoadLoaiSanPham1()
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha=0 order by TenLoaiSanPham";
        DataTable table = Connect.GetTable(strSql);
        ddlLoaiSP.DataSource = table;
        ddlLoaiSP.DataTextField = "TenLoaiSanPham";
        ddlLoaiSP.DataValueField = "idLoaiSanPham";
        ddlLoaiSP.DataBind();
        ddlLoaiSP.Items.Add(new ListItem("--Chọn loại SP cấp 1--", ""));
        ddlLoaiSP.Items.FindByText("--Chọn loại SP cấp 1--").Selected = true;
    }
    private void LoadLoaiSanPham2(string idLoaiSanPham1)
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha='" + idLoaiSanPham1 + "'";
        if (id != "0" && id != "")
            strSql += " and idLoaiSanPham!='" + id + "'";
        strSql += " order by TenLoaiSanPham";
        slLoaiSPCap2.DataSource = Connect.GetTable(strSql);
        slLoaiSPCap2.DataTextField = "TenLoaiSanPham";
        slLoaiSPCap2.DataValueField = "idLoaiSanPham";
        slLoaiSPCap2.DataBind();
        slLoaiSPCap2.Items.Add(new ListItem("--Chọn loại SP cấp 2--", ""));
        slLoaiSPCap2.Items.FindByText("--Chọn loại SP cấp 2--").Selected = true;
    }

    private void LoadThongTinLoaiSP()
    {
        if (id != "")
        {
            string sql = "select * from tb_LoaiSanPham where idLoaiSanPham ='" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                btLuu.Text = "SỬA";
                txtTen.Value = table.Rows[0]["TenLoaiSanPham"].ToString();
                ddlLoaiSP.SelectedValue = table.Rows[0]["idCapCha"].ToString();
                txtMoTa.Value = table.Rows[0]["MoTa"].ToString();

                string idCapCha = table.Rows[0]["idCapCha"].ToString().Trim();
                string idCap1 = "";
                string idCap2 = "";
                if (idCapCha != "0" && idCapCha != "")
                {
                    string sqlLoaiSanPham1 = "select * from tb_LoaiSanPham where idLoaiSanPham='" + idCapCha + "'";
                    DataTable tbLoaiSanPham1 = Connect.GetTable(sqlLoaiSanPham1);
                    if (tbLoaiSanPham1.Rows.Count > 0)
                    {
                        if (tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim() != "0"
                            && tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim() != "")
                        {
                            idCap1 = tbLoaiSanPham1.Rows[0]["idCapCha"].ToString().Trim();
                            idCap2 = idCapCha;
                            LoadLoaiSanPham2(idCap1);
                        }
                        else
                        {
                            idCap1 = idCapCha;
                            LoadLoaiSanPham2(idCap1);
                        }
                    }
                    ddlLoaiSP.SelectedValue = idCap1;
                    slLoaiSPCap2.Value = idCap2;
                }

                ckKichHoat.Checked = bool.Parse(table.Rows[0]["KichHoat"].ToString());
                if (table.Rows[0]["icon"].ToString() != "")
                {
                    imagePreviewContainer.InnerHtml = "<img id='imgUpLoad' src='" + table.Rows[0]["icon"].ToString() + "'/>";
                }
                if (table.Rows[0]["banner"].ToString() != "")
                {
                    bannerPreviewContainer.InnerHtml = "<img id='bannerUpLoad' width='200px' src='" + table.Rows[0]["banner"].ToString() + "'/>";
                }
            }
        }
    }

    protected void btLuu_Click(object sender, EventArgs e)
    {
        string TenLoaiTinTuc = "";
        string idCapCha = "";
        string MoTa = "";
        string KichHoat = "";
        string logo = "";
        string banner = "";

        if ((imageUploadInput.PostedFile != null) && (imageUploadInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(imageUploadInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("/images/Icon/") + fn;
            try
            {
                imageUploadInput.PostedFile.SaveAs(SaveLocation);
                //Response.Write("The file has been uploaded.");
                logo = "/images/Icon/" + fn;
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        if ((bannerUploadInput.PostedFile != null) && (bannerUploadInput.PostedFile.ContentLength > 0))
        {
            string fn = System.IO.Path.GetFileName(bannerUploadInput.PostedFile.FileName);
            string SaveLocation = Server.MapPath("/images/LoaiSanPham/") + fn;
            try
            {
                bannerUploadInput.PostedFile.SaveAs(SaveLocation); 
                banner = "/images/LoaiSanPham/" + fn;
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        //Tên Người Dùng
        if (txtTen.Value.Trim() != "")
        {
            TenLoaiTinTuc = txtTen.Value.Trim();
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa nhập Tên loại sản phẩm!')</script>");
            return;
        }
        //CMND
        MoTa = txtMoTa.Value.Trim();

        if (ddlLoaiSP.SelectedValue.Trim() == "")
            idCapCha = "0";
        else
        {
            if (slLoaiSPCap2.Value.Trim() == "")
                idCapCha = ddlLoaiSP.SelectedValue.Trim();
            else
                idCapCha = slLoaiSPCap2.Value.Trim();
        }
        
        //Quyền
        KichHoat = ckKichHoat.Checked.ToString();

        if (id == "0" || id == "")
        {
            string sqlInserNguoiDung = "insert into  tb_LoaiSanPham(TenLoaiSanPham,idCapCha,icon,MoTa,KichHoat,banner)";
            sqlInserNguoiDung += " values(N'" + TenLoaiTinTuc + "','" + idCapCha + "',N'" + logo + "',N'" + MoTa + "','" + KichHoat + "',N'" + banner + "')";
            bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

            if (ktInsertNguoiDung)
            {
                Response.Redirect(GetRouteUrl("adminLoaiSanPham", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi !')</script>");
            }
        }
        else
        {

            string sqlUpdateNguoiDung = "";
            sqlUpdateNguoiDung += "update tb_LoaiSanPham set";
            sqlUpdateNguoiDung += " TenLoaiSanPham = N'" + TenLoaiTinTuc + "'";
            sqlUpdateNguoiDung += " ,idCapCha = '" + idCapCha + "'";
            if (logo != "")
                sqlUpdateNguoiDung += " ,icon = N'" + logo + "'";
            if (banner != "")
                sqlUpdateNguoiDung += " ,banner = N'" + banner + "'";
            sqlUpdateNguoiDung += " ,MoTa = N'" + MoTa + "'";
            sqlUpdateNguoiDung += " ,KichHoat = '" + KichHoat + "'";
            sqlUpdateNguoiDung += " where idLoaiSanPham ='" + id + "'";
            bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
            if (ktUpdateNguoiDung)
            {
                if (Page != "")
                    Response.Redirect(GetRouteUrl("adminLoaiSanPham", new { page = Page}));
                Response.Redirect(GetRouteUrl("adminLoaiSanPham", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("adminLoaiSanPham", new { }));
    }
    protected void ddlLoaiSP_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idLoaiSanPham1 = ddlLoaiSP.SelectedValue.Trim();
        LoadLoaiSanPham2(idLoaiSanPham1);
    }
}