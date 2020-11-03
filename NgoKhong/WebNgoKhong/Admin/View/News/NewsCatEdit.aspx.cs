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
    

    //private void LoadQuanHuyen(string idTinh)
    //{
    //    string strSql = "select  * from tb_QuanHuyen where idTinhTP = " + idTinh;
    //    slQuanHuyen.DataSource = Connect.GetTable(strSql);
    //    slQuanHuyen.DataTextField = "Ten";
    //    slQuanHuyen.DataValueField = "id";
    //    slQuanHuyen.DataBind();
    //    slQuanHuyen.Items.Add(new ListItem("-- Chọn --", "0"));
    //    slQuanHuyen.Items.FindByText("-- Chọn --").Selected = true;
    //}

    private void LoadThongTinLoaiTinTuc()
    {
        if (id != "")
        {
            string sql = "select * from tb_LoaiTinTuc where idLoaiTinTuc ='" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                btLuu.Text = "SỬA";
                txtTen.Value = table.Rows[0]["TenLoaiTinTuc"].ToString();
                txtMoTa.Value = table.Rows[0]["MoTa"].ToString();

                ckKichHoat.Checked = bool.Parse(table.Rows[0]["Active"].ToString());

            }
        }
    }

    protected void btLuu_Click(object sender, EventArgs e)
    {
        string TenLoaiTinTuc = "";
        string MoTa = "";
        string KichHoat = "";

        //QuanHuyen = slQuanHuyen.Value;
        //Response.Write(QuanHuyen);
        //Tên Người Dùng
        if (txtTen.Value.Trim() != "")
        {
            TenLoaiTinTuc = txtTen.Value.Trim();
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa nhập Tên loại tin tức!')</script>");
            return;
        }
        //CMND
        MoTa = txtMoTa.Value.Trim();
        
        //Quyền
        KichHoat = ckKichHoat.Checked.ToString();

        if (id == "0" || id == "")
        {
            string sqlInserNguoiDung = "insert into  tb_LoaiTinTuc(TenLoaiTinTuc,MoTa,Active)";
            sqlInserNguoiDung += " values(N'" + TenLoaiTinTuc + "',N'" + MoTa + "','" + KichHoat + "')";
            bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

            if (ktInsertNguoiDung)
            {
                Response.Redirect(GetRouteUrl("adminLoaiTinTuc", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi !')</script>");
            }
        }
        else
        {

            string sqlUpdateNguoiDung = "";
            sqlUpdateNguoiDung += "update tb_LoaiTinTuc set";
            sqlUpdateNguoiDung += " TenLoaiTinTuc = N'" + TenLoaiTinTuc + "'";
            sqlUpdateNguoiDung += " ,MoTa = '" + MoTa + "'";
            sqlUpdateNguoiDung += " ,Active = '" + KichHoat + "'";
            sqlUpdateNguoiDung += " where idLoaiTinTuc ='" + id + "'";
            bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
            if (ktUpdateNguoiDung)
            {
                if (Page != "")
                    Response.Redirect(GetRouteUrl("adminLoaiTinTuc", new { page = Page}));
                Response.Redirect(GetRouteUrl("adminLoaiTinTuc", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("adminLoaiTinTuc", new { }));
    }
}