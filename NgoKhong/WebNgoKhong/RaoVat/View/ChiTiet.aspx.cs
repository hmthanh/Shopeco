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
    string TenLoai = "";
    string idLinhVuc = "0";
    string idDanhMuc = "0";
    public string timKiem { get; set; }
    public string idTinhThanh { get; set; }
    public string idQuanHuyen { get; set; }
    int page = 1;
    int pageSize = 4;
    string idRaoVat = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.RedirectToRoute("raovat", new { });
        }
        try
        {
            //idRaoVat = RouteData.Values["id"].ToString();
        }
        catch { }
        if (!IsPostBack)
        {
            LoadChiTiet();
            LoadHinhAnh();
            LoadLinhVuc();
            LoadTinhThanh();
            LoadDsDanhMuc();
            LoadDanhSachTinDang();
            LoadDsTinVIP();
        }
    }
    private void LoadDsTinVIP()
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
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(TenLoai, StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", idRaoVat));
    }
    //private void LoadHinhAnh()
    //{
    //    string sql = @"select * from tb_HinhAnhRaoVat sp where idSanPham = '" + idRaoVat + "'";
    //    DataTable table = Connect.GetTable(sql);
    //    if (table.Rows.Count > 0)
    //    {
    //        string url = table.Rows[0]["LinkHinh"].ToString();

    //        //imgRaoVat.InnerHtml = "<img id='img' src='" + url + "' class='img-detail' alt='Sản phẩm' />";
    //    }
    //}
    private void LoadHinhAnh()
    {
        string html = "";
        string sql = @"select * from tb_HinhAnhRaoVat sp where idSanPham = '" + idRaoVat + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            html += @"<div class='large-image'>
								<img itemprop='image' class='product-image-zoom' src='" + table.Rows[0]["LinkHinh"] + @"'  title='' alt=''>
							</div>
<div id='thumb-slider' class='yt-content-slider full_slider owl-drag' data-rtl='yes' data-autoplay='no' data-autoheight='no' data-delay='4' data-speed='0.6' data-margin='10' data-items_column00='4' data-items_column0='4' data-items_column1='3' data-items_column2='4'  data-items_column3='1' data-items_column4='1' data-arrows='yes' data-pagination='no' data-lazyload='yes' data-loop='no' data-hoverpause='yes'>";
            for (int i = 0; i < table.Rows.Count; i++)
            {
                html += @"<a data-index='0' class='img thumbnail' data-image='" + StaticData.validImage(table.Rows[i]["LinkHinh"].ToString()) + @"' title=''>
									<img src='" + table.Rows[i]["LinkHinh"] + @"' title='' alt=''>
								</a>";
            }

            html += "</div>";
        }
        else
        {
            html += @"<div class='large-image'>
								<img itemprop='image' class='product-image-zoom' src='" + StaticData.validImage("") + @"'  title='' alt=''>
							</div>
<div id='thumb-slider' class='yt-content-slider full_slider owl-drag' data-rtl='yes' data-autoplay='no' data-autoheight='no' data-delay='4' data-speed='0.6' data-margin='10' data-items_column00='4' data-items_column0='4' data-items_column1='3' data-items_column2='4'  data-items_column3='1' data-items_column4='1' data-arrows='yes' data-pagination='no' data-lazyload='yes' data-loop='no' data-hoverpause='yes'>";
            html += @"<a data-index='0' class='img thumbnail' data-image='" + StaticData.validImage("") + @"' title=''>
									<img src='" + StaticData.validImage("") + @"' title='' alt=''>
								</a>";

            html += "</div>";
        }
        dvHinhAnh.InnerHtml = html;
    }
    private void LoadChiTiet()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        idRaoVat = Request.QueryString["id"].ToString();
        //string sql = "select * from tb_RaoVat r, tb_RVDanhMuc d, tb_RVLinhVuc l where r.idDanhMuc = d.idDanhMuc and r.idLinhVuc = l.idLinhVuc and r.idRaoVat = '" + idRaoVat + "'";
        string sql = " select * from tb_RaoVat r  where r.idRaoVat = '" + idRaoVat + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            
            headerTitle.InnerHtml = table.Rows[0]["TieuDe"].ToString();
            idDanhMuc = table.Rows[0]["idDanhMuc"].ToString();
            idLinhVuc = table.Rows[0]["idLinhVuc"].ToString();
            string catName = StaticData.getField("tb_RVDanhMuc", "TenDanhMuc", "idDanhMuc", idDanhMuc);
            if (!string.IsNullOrEmpty(catName))
            {
                relateAds.InnerHtml = "Tin đăng " + catName;
            }
            //string idRaoVat = table.Rows[0]["idRaoVat"].ToString();
            price.InnerHtml = StaticData.FormatDouble(table.Rows[0]["Gia"].ToString()) + " đ";
            date.InnerHtml = Convert.ToDateTime(table.Rows[0]["NgayTao"].ToString()).ToString("dd/MM/yyyy");
            dateOuts.InnerHtml = Convert.ToDateTime(table.Rows[0]["NgayHetHan"].ToString()).ToString("dd/MM/yyyy");
            DateTime now = DateTime.Now;
            DateTime dateOut = DateTime.Parse(table.Rows[0]["NgayHetHan"].ToString());
            TimeSpan distance = now - dateOut;
            //headerTitle.InnerHtml = distance.TotalDays.ToString() + "____" + distance.ToString();
            //
            if (distance.TotalDays >= 0)
            {
                headerTitle.InnerHtml += "<span class='badge badge-secondary' id='msgOutDate'>Tin đăng đã hết hạn</span>";
            }

            name.InnerHtml = table.Rows[0]["HoTen"].ToString();
            phone.InnerHtml = table.Rows[0]["SoDienThoai"].ToString();
            email.InnerHtml = table.Rows[0]["Email"].ToString();
            adrs.InnerHtml = table.Rows[0]["DiaChi"].ToString();
            dvMoTa.InnerHtml = table.Rows[0]["MoTa"].ToString();
        }
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


        //sql = "select * from tb_RVDanhMuc where 1 = 1 ";
        //if (string.IsNullOrEmpty(idLinhVuc))
        //{
        //    sql += " and Cap = '" + idLinhVuc + "'";
        //}

        //slDanhMuc.DataSource = Connect.GetTable(sql);
        //slDanhMuc.DataTextField = "TenDanhMuc";
        //slDanhMuc.DataValueField = "idDanhMuc";
        //slDanhMuc.DataBind();
        //slDanhMuc.Items.Add(new ListItem("Tất cả danh mục", "0"));

        //if (idDanhMuc != "")
        //{
        //    ListItem list = slDanhMuc.Items.FindByValue(idDanhMuc);
        //    if (list != null)
        //    {
        //        slDanhMuc.Items.FindByValue(idDanhMuc).Selected = true;
        //    }
        //}
    }

    public void LoadTinhThanh()
    {
        string sql = "select * from tb_tinhthanhpho order by name";
        slTinhThanh.DataSource = Connect.GetTable(sql);
        slTinhThanh.DataTextField = "name";
        slTinhThanh.DataValueField = "matp";
        slTinhThanh.DataBind();
        slTinhThanh.Items.Add(new ListItem("Toàn quốc", "0"));
        //slTinhThanh.Items.FindByValue(idTinhThanh).Selected = true;

        //sql = "select * from tb_quanhuyen order by name where matp = '" + idTinhThanh + "'";
        //slQuanHuyen.DataSource = Connect.GetTable(sql);
        //slQuanHuyen.DataTextField = "name";
        //slQuanHuyen.DataValueField = "maqh";
        //slQuanHuyen.DataBind();

        //if (idQuanHuyen != "")
        //{
        //    ListItem list = slQuanHuyen.Items.FindByValue(idQuanHuyen);
        //    if (list != null)
        //    {
        //        slQuanHuyen.Items.FindByValue(idQuanHuyen).Selected = true;
        //        slQuanHuyen.Items.Add(new ListItem("Tất cả quận huyện", "0"));
        //    }
        //}
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
                  FROM tb_RaoVat l where (idDanhMuc = '" + idDanhMuc + "' or idLinhVuc = '" + idLinhVuc + "') ";
        sql += ") as tb1 ";
        page = 1;
        pageSize = 8;
        sql += "WHERE RowNumber BETWEEN (" + page + " - 1) * " + pageSize + " + 1 AND (((" + page + " - 1) * " + pageSize + " + 1) + " + pageSize + ") - 1";
        DataTable data = Connect.GetTable(sql);
        if (data != null && data.Rows.Count > 0)
        {
            LoadDanhSach(data);
        }
    }
    
    private void LoadDanhSach(DataTable data)
    {
        if (data == null)
        {
            dsTinDang.InnerHtml = "";
            return;
        }

        string html = "";
        //string htmlPaging = "<ul class='pagination'>";
        //if (page > 1)
        //{
        //    htmlPaging += "<li class='page-item'><a class='page-link' href='" + GetRouteUrl("raovat", new { page = (page - 1) }) + "'>Trang trước</a></li>";
        //}
        //else
        //{
        //    htmlPaging += "<li class='page-item disabled'><a class='page-link' >Trang trước</a></li>";
        //}

        if (data.Rows.Count > 0)
        {
            int numbs = data.Rows.Count;
            int pageNumb = numbs / pageSize + 1;
            //for (int i = 0; i < pageNumb; i++)
            //{
            //    if ((i + 1) == page)
            //    {
            //        htmlPaging += "<li class='page-item active'><a class='page-link ' href=" + GetRouteUrl("raovat", new { page = (i + 1) }) + "> Trang " + (i + 1).ToString() + "</a></li>";
            //    }
            //    else
            //    {
            //        htmlPaging += "<li class='page-item'><a class='page-link' href=" + GetRouteUrl("raovat", new { page = (i + 1) }) + "> Trang " + (i + 1).ToString() + "</a></li>";
            //    }
            //}

            foreach (DataRow row in data.Rows)
            {
                string id = row["idRaoVat"].ToString();
                string tieude = row["TieuDe"].ToString();
                CultureInfo cul = CultureInfo.GetCultureInfo("vi-VN");
                string gia = double.Parse(row["Gia"].ToString()).ToString("#,###", cul.NumberFormat);
                string ngayTao = StaticData.DateFormat(row["NgayTao"].ToString());
                string ngayHetHan = StaticData.DateFormat(row["NgayHetHan"].ToString());
                

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
            //if ((page) < pageNumb)
            //{
            //    htmlPaging += "<li class='page-item'><a class='page-link' href='" + GetRouteUrl("raovat", new { page = (page + 1) }) + "'>Trang sau</a></li>";
            //}
            //else
            //{
            //    htmlPaging += "<li class='page-item disabled'><a class='page-link'>Trang sau</a></li>";
            //}
            //htmlPaging += "</ul>";
        }
        dsTinDang.InnerHtml = html;
    }
    private string getUrlImageByID(string id)
    {
        return StaticData.validImage(StaticData.getField("tb_HinhAnhRaoVat", "LinkHinh", "idSanPham", id));
    }
    void LoadDsDanhMuc()
    {
        string sql = "select * from tb_RVLinhVuc";
        DataTable linhVuc = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < linhVuc.Rows.Count; i++)
        {
            if ((i + 1) % 3 == 0)
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
        //dsDanhMuc.InnerHtml = html;
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("timkiem", new { });
    }
}