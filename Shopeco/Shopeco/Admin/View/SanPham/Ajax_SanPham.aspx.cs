using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_View_SanPham_Ajax_SanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["Action"].Trim();
        switch (action)
        {
            case "LoadLoaiSP2":
                LoadLoaiSP2(); break;
        }
    }
    void LoadLoaiSP2()
    {
        string idLoaiSPCap1 = StaticData.ValidParameter(Request.QueryString["idLoaiSPCap1"].Trim());
        string sql = "select * from tb_LoaiSanPham where idCapCha ='" + idLoaiSPCap1 + "'";
        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count;i++)
        {
            html += "<option value='" + table.Rows[0]["idLoaiSanPham"].ToString() + "'>" + table.Rows[0]["TenLoaiSanPham"].ToString() + "</option>";
        }
        html += "<option value=''>Chọn loại SP cấp 2</option>";
        Response.Write(html);
    }
}