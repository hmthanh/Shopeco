using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RaoVat_View_Default : System.Web.UI.Page
{
    string timKiem = "";
    string idTinhThanh = "";
    string idQuanHuyen = "";
    string idDanhMuc = "0";
    string idLinhVuc = "0";
    int page = 1;
    int pageSize = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            timKiem = Request.QueryString["q"].ToString();
        }
        catch { }
        try
        {
            idTinhThanh = Request.QueryString["city"].ToString();
        }
        catch { idTinhThanh = "0"; }
        try
        {
            idQuanHuyen = Request.QueryString["dis"].ToString();
        }
        catch { idQuanHuyen = "0"; }
        try
        {
            idLinhVuc = Request.QueryString["field"].ToString();
        }
        catch
        {
            idLinhVuc = "0";
        }
        try
        {
            idDanhMuc = Request.QueryString["cat"].ToString();
        }
        catch { idDanhMuc = "0"; }
        try
        {
            page = int.Parse(Request.QueryString["page"].ToString());
        }
        catch
        {
            page = 1;
        }
        if (!IsPostBack)
        {
            pageNum.Value = page.ToString();
            LoadLinhVuc();
            LoadTinhThanh();
        }
        LoadMenu();
        LoadDanhSachTinDang();
        //  LoadDsDanhMuc();
    }

    private void LoadMenu()
    {
        string html = "<ul class='nav in' id='side-menu'>";
        string sql = "select * from tb_RVLinhVuc";
        DataTable linhVuc = Connect.GetTable(sql);
        for (int i = 0; i < linhVuc.Rows.Count; i++)
        {
            html += "<li class='sub-menu-item'>";

            string idLinhVuc = linhVuc.Rows[i]["idLinhVuc"].ToString();

            html += "       <a href='#' class='sub-link'><i class='fa " + linhVuc.Rows[i]["Icon"].ToString() + " fa-fw'></i><span class='item-sub-title'>" + linhVuc.Rows[i]["LinhVuc"].ToString() + "</span><span class='fa arrow'></span></a>";
            html += "       <ul class='nav nav-second-level collapse'>";
            string sqlDanhMuc = "select * from tb_RVDanhMuc where Cap = '" + idLinhVuc + "'";
            DataTable danhMuc = Connect.GetTable(sqlDanhMuc);

            for (int j = 0; j < danhMuc.Rows.Count; j++)
            {
                string idDanhMuc = danhMuc.Rows[j]["idDanhMuc"].ToString();
                string urlDanhMuc = GetRouteUrl("timkiem", new { cat = idDanhMuc });
                html += "           <li>";
                html += "               <a href='" + urlDanhMuc + "'>" + danhMuc.Rows[j]["TenDanhMuc"] + "</a>";
                html += "           </li>";
            }
            html += "       </ul>";
            html += "   </li>";
        }
        //html += "           <li>";
        //html += "               <a href='morris.html' class='active'>Morris.js Charts</a>";
        //html += "           </li>";
        html += "   </ul>";
        sideMenu.InnerHtml = html;
    }
    void LoadDsDanhMuc()
    {
        string sql = "select * from tb_RVLinhVuc";
        DataTable linhVuc = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < linhVuc.Rows.Count; i++)
        {
            if ((i+1) % 3 == 0)
            {
                html += "<div class='row'>";
            }

            string idLinhVuc = linhVuc.Rows[i]["idLinhVuc"].ToString();
            html += "<div class='col-sm-4'>";
            html += "    <div class='titlemain'>+ <a href='" + GetRouteUrl("timkiem", new { field = idLinhVuc }) + "'>" + linhVuc.Rows[i]["LinhVuc"] + "</a></div>";

            string sqlDanhMuc = "select * from tb_RVDanhMuc where Cap = '" + idLinhVuc + "'";
            DataTable danhMuc = Connect.GetTable(sqlDanhMuc);

            for (int j = 0; j < danhMuc.Rows.Count; j++)
            {
                string idDanhMuc = danhMuc.Rows[j]["idDanhMuc"].ToString();

                html += "    <div class='amain'><a href='" + GetRouteUrl("timkiem", new { cat = idDanhMuc }) + "'>- " + danhMuc.Rows[j]["TenDanhMuc"] + "</a></div>";
                html += "    <a href=''></a>";

            }
            html += "</div>";
            if ((i + 1) % 3 == 0)
            {
                html += "</div>";
            }
        }
        //html += "    <div class='amain'><a href='#'></a><a href='#'>- Thuê ô tô</a></div>";
        //html += "    <a href=''></a>";
        //html += "    <div class='amain'><a href='#'></a><a href='#'>- Thuê xe ba gác</a></div>";
        //html += "    <a href=''></a>";
        //html += "    <div class='amain'><a href='#'></a><a href='#'>- Thuê xe du lịch</a></div>";
        //html += "    <a href=''></a>";
        //html += "    <div class='amain'><a href='#'></a><a href='#'>- Thuê xe đạp</a></div>";
        //html += "    <a href=''></a>";
        //html += "    <div class='amain'><a href=''></a><a href='#'>- Thuê xe cơ giới</a></div>";
        //html += "    <a href='#'></a>";
        //html += "    <div class='amain'><a href=''></a><a href='#'>- Thuê xe khác</a></div>";

        dsDanhMuc.InnerHtml = html;
    }
    private void LoadDanhSachTinDang()
    {
        string sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idRaoVat desc
                  )AS RowNumber
	              ,*
                  FROM tb_RaoVat l where 1 = 1 ";

        if (!String.IsNullOrEmpty(timKiem))
            sql += " and ( TieuDe like N'%" + timKiem + "%') ";
        if (idDanhMuc != "0" && !String.IsNullOrEmpty(idDanhMuc))
            sql += " and ( idDanhMuc = '" + idDanhMuc + "') ";
        if (idLinhVuc != "0" && !String.IsNullOrEmpty(idLinhVuc))
            sql += " and ( idLinhVuc = '" + idLinhVuc + "') ";
        if (idTinhThanh != "0" && !String.IsNullOrEmpty(idTinhThanh))
            sql += " and ( idTinhThanh = '" + idTinhThanh + "') ";
        if (idQuanHuyen != "0" && !String.IsNullOrEmpty(idQuanHuyen))
            sql += " and ( idQuanHuyen = '" + idQuanHuyen + "') ";
        sql += ") as tb1 ";
        sql += "WHERE RowNumber BETWEEN (" + page + " - 1) * " + pageSize + " + 1 AND (((" + page + " - 1) * " + pageSize + " + 1) + " + pageSize + ") - 1";
        DataTable data = Connect.GetTable(sql);

        LoadDanhSach(data);
        pageSize = 6;
        sql = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY NgayTao asc
                  )AS RowNumber
	              ,*
                  FROM tb_RaoVat l where 1 = 1 ";
        sql += ") as tb1 ";
        sql += "WHERE RowNumber BETWEEN (" + page + " - 1) * " + pageSize + " + 1 AND (((" + page + " - 1) * " + pageSize + " + 1) + " + pageSize + ") - 1";
        data = Connect.GetTable(sql);

        LoadDanhSach2(data);
    }
    private void LoadDanhSach(DataTable data)
    {
        if (data == null)
        {
            dsTinDang.InnerHtml = "";
            return;
        }

        string html = "";
        string htmlPaging = "<ul class='pagination'>";
        if (page > 1)
        {
            htmlPaging += "<li class='page-item'><a class='page-link' href='" + GetRouteUrl("raovat", new { page = (page - 1) }) + "'><i class='fa fa-angle-double-left'></i></a></li>";
        }
        else
        {
            htmlPaging += "<li class='page-item disabled'><a class='page-link' ><i class='fa fa-angle-double-left'></i></a></li>";
        }

        if (data.Rows.Count > 0)
        {
            int numbs = data.Rows.Count;
            int pageNumb = numbs / pageSize + 1;
            for (int i = 0; i < pageNumb; i++)
            {
                if ((i + 1) == page)
                {
                    htmlPaging += "<li class='page-item active'><a class='page-link ' href=" + GetRouteUrl("raovat", new { page = (i + 1) }) + "> Trang " + (i + 1).ToString() + "</a></li>";
                }
                else
                {
                    htmlPaging += "<li class='page-item'><a class='page-link' href=" + GetRouteUrl("raovat", new { page = (i + 1) }) + "> Trang " + (i + 1).ToString() + "</a></li>";
                }
            }

            foreach (DataRow row in data.Rows)
            {
                string id = row["idRaoVat"].ToString();
                string tieude = row["TieuDe"].ToString();
                
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
                string gia = double.Parse(row["Gia"].ToString()).ToString("#,###", cul.NumberFormat);
                string ngayTao = StaticData.DateFormat(row["NgayTao"].ToString());

                html += "<a class='card card-items item-ads' href='" + GetRouteUrl("chitiet", new { id = id }) + "'>";
                html += "          <div class='col-sm-3'>";
                html += "              <img class='card-img' src='" + getUrlImageByID(id) + "' alt='" + tieude + "' />";
                html += "          </div>";
                html += "          <div class='col-sm-9'>";
                html += "              <div class='card-body'>";
                html += "                  <h5 class='card-title'>" + tieude + "</h5>";
                html += "                  <p class='card-text'>Giá : <span class='price'>" + gia + " đ</span></p>";
                html += "           <p>Ngày : " + ngayTao + "</p>";
                html += "       </div>";
                html += "   </div><div style='clear:both;'></div>";
                html += "</a>";
            }
            if ((page) < pageNumb)
            {
                htmlPaging += "<li class='page-item'><a class='page-link' href='" + GetRouteUrl("raovat", new { page = (page + 1) }) + "'><i class='fa fa-angle-double-right'></i></a></li>";
            }
            else
            {
                htmlPaging += "<li class='page-item disabled'><a class='page-link'><i class='fa fa-angle-double-right'></i></a></li>";
            }
            htmlPaging += "</ul>";
        }
        
        dsTinDang.InnerHtml = html;
    }
    private void LoadDanhSach2(DataTable data)
    {
        if (data == null)
        {
            dsTinDang.InnerHtml = "";
            return;
        }

        string html = "";
        string htmlPaging = "<ul class='pagination'>";
        if (page > 1)
        {
            htmlPaging += "<li class='page-item'><a class='page-link' href='" + GetRouteUrl("raovat", new { page = (page - 1) }) + "'><i class='fa fa-angle-double-left'></i></a></li>";
        }
        else
        {
            htmlPaging += "<li class='page-item disabled'><a class='page-link' ><i class='fa fa-angle-double-left'></i></a></li>";
        }

        if (data.Rows.Count > 0)
        {
            foreach (DataRow row in data.Rows)
            {
                string id = row["idRaoVat"].ToString();
                string tieude = row["TieuDe"].ToString();
                if (tieude.Length > 40)
                {
                    tieude = tieude.Substring(0, 40) + "...";
                }
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
                string gia = double.Parse(row["Gia"].ToString()).ToString("#,###", cul.NumberFormat);
                string ngayTao = StaticData.DateFormat(row["NgayTao"].ToString());

                html += "<a class='card card-items sm-item-ads' href='" + GetRouteUrl("chitiet", new { id = id }) + "'>";
                html += "          <div class='col-sm-3'>";
                html += "              <img class='card-sm-img' src='" + getUrlImageByID(id) + "' alt='" + tieude + "' />";
                html += "          </div>";
                html += "          <div class='col-sm-9'>";
                html += "              <div class='card-body'>";
                html += "                  <div >" + tieude + "</div>";
                html += "                  <p >Giá : <span class='price'>" + gia + " đ</span></p>";
                html += "       </div>";
                html += "   </div><div style='clear:both;'></div>";
                html += "</a>";
            }
            
            htmlPaging += "</ul>";
        }

        dsTinDangMoi.InnerHtml = html;
    }
    private string getUrlImageByID(string id)
    {
        return StaticData.validImage(StaticData.getField("tb_HinhAnhRaoVat", "LinkHinh", "idSanPham", id));
    }
    public void LoadLinhVuc()
    {
        string sql = "select * from tb_RVLinhVuc";
        slLinhVuc.DataSource = Connect.GetTable(sql);
        slLinhVuc.DataTextField = "LinhVuc";
        slLinhVuc.DataValueField = "idLinhVuc";
        slLinhVuc.DataBind();
        slLinhVuc.Items.Add(new ListItem("Tất cả lĩnh vực", "0"));

        slLinhVuc.Items.FindByValue(idLinhVuc).Selected = true;


        sql = "select * from tb_RVDanhMuc where 1 = 1 ";
        if (string.IsNullOrEmpty(idLinhVuc))
        {
            sql += " and Cap = '" + idLinhVuc + "'";
        }

        slDanhMuc.DataSource = Connect.GetTable(sql);
        slDanhMuc.DataTextField = "TenDanhMuc";
        slDanhMuc.DataValueField = "idDanhMuc";
        slDanhMuc.DataBind();
        slDanhMuc.Items.Add(new ListItem("Tất cả danh mục", "0"));

        if (idDanhMuc != "")
        {
            ListItem list = slDanhMuc.Items.FindByValue(idDanhMuc);
            if (list != null)
            {
                slDanhMuc.Items.FindByValue(idDanhMuc).Selected = true;
            }
        }
    }
    public void LoadTinhThanh()
    {
        string sql = "select * from tb_tinhthanhpho order by name";
        slTinhThanh.DataSource = Connect.GetTable(sql);
        slTinhThanh.DataTextField = "name";
        slTinhThanh.DataValueField = "matp";
        slTinhThanh.DataBind();
        slTinhThanh.Items.Add(new ListItem("Toàn quốc", "0"));
        slTinhThanh.Items.FindByValue(idTinhThanh).Selected = true;

        sql = "select * from tb_quanhuyen order by name where matp = '" + idTinhThanh + "'";
        slQuanHuyen.DataSource = Connect.GetTable(sql);
        slQuanHuyen.DataTextField = "name";
        slQuanHuyen.DataValueField = "maqh";
        slQuanHuyen.DataBind();

        if (idQuanHuyen != "")
        {
            ListItem list = slQuanHuyen.Items.FindByValue(idQuanHuyen);
            if (list != null)
            {
                slQuanHuyen.Items.FindByValue(idQuanHuyen).Selected = true;
                slQuanHuyen.Items.Add(new ListItem("Tất cả quận huyện", "0"));
            }
        }
    }
    string getHtmlRouter()
    {
        string html = "";
        return html;
    }
    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    //string idDanhMuc = slDanhMuc.Value;
    //    //string idLinhVuc = slLinhVuc.Value;
    //    //string idTinhThanh = slTinhThanh.Value;
    //    //string idQuanHuyen = slQuanHuyen.Value;
    //    //string search = txtSearch.Value;

    //    //Response.RedirectToRoute("raovat", new { q = search, field = idLinhVuc, cat = idDanhMuc, city = idTinhThanh, dis = idQuanHuyen });

    //    //string sql = "select * from tb_RaoVat where 1 = 1 ";
    //    //if (idDanhMuc != "0" && !String.IsNullOrEmpty(idDanhMuc))
    //    //{
    //    //    sql += " and idDanhMuc = '" + idDanhMuc + "'";
    //    //}
    //    //if (idLinhVuc != "0" && !String.IsNullOrEmpty(idLinhVuc))
    //    //{
    //    //    sql += " and idLinhVuc = '" + idLinhVuc + "'";
    //    //}
    //    //if (idTinhThanh != "0" && !String.IsNullOrEmpty(idTinhThanh))
    //    //{
    //    //    sql += " and idTinhThanh = '" + idTinhThanh + "'";
    //    //}
    //    //if (idQuanHuyen != "0" && !String.IsNullOrEmpty(idQuanHuyen))
    //    //{
    //    //    sql += " and idQuanHuyen = '" + idQuanHuyen + "'";
    //    //}
    //    //if (!String.IsNullOrEmpty(search))
    //    //{
    //    //    sql += " and TieuDe like '%" + search + "%'";
    //    //}

    //    //DataTable data = Connect.GetTable(sql);

    //    //LoadDanhSach(data);
    //}
}