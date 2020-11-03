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
            //id = RouteData.Values["id"].ToString();
            id = Request.QueryString["id"].ToString();
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
            loadDSLoaiTinTuc();
            LoadThongTin();
        }

    }

    private void LoadThongTin()
    {
        if (id != "")
        {
            string sql = "select * from tb_LoaiThongTin l, tb_ThongTin t where l.MaLoaiTT = t.MaLoaiTT and l.MaLoaiTT = '" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                Title.InnerHtml = table.Rows[0]["TenLoai"].ToString().ToUpper();
                txtMoTa.Value = table.Rows[0]["NoiDung"].ToString();
            }
        }
    }
    private void loadDSLoaiTinTuc()
    {
        string strSql = "select * from tb_LoaiThongTin";
        slLoaiThongTin.DataSource = Connect.GetTable(strSql);
        slLoaiThongTin.DataTextField = "TenLoai";
        slLoaiThongTin.DataValueField = "MaLoaiTT";
        slLoaiThongTin.DataBind();
        if (id != "")
        {
            slLoaiThongTin.Items.FindByValue(id).Selected = true;
        }
    }
    protected void btLuu_Click(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();
        string sql = "delete tb_ThongTin where MaLoaiTT = '" + id + "'";
        bool isDelete = Connect.Exec(sql);

        string NoiDung = txtMoTa.Value.Trim();

        string title = StaticData.getField("tb_LoaiThongTin", "TenLoai", "MaLoaiTT", id);

        if (id != "0" && id != "")
        {
            string sqlUpdate = "insert into tb_ThongTin(MaLoaiTT, TieuDe, NoiDung) values('" + id + "', N'" + title + "', N'" + NoiDung + "')";
            bool isUpdate = Connect.Exec(sqlUpdate);
            if (isUpdate)
            {
                Response.Redirect(GetRouteUrl("adminpages", new { name = MyStaticData.GenerateURL(StaticData.getField("tb_Pages", "TenPage", "idPages", id)), id = id }));
            }
            else
            {
                Response.Write("<script>Alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("adminpages", new { name = StaticData.getField("tb_Pages", "TenPage", "idPages", id), id = id }));
    }
}