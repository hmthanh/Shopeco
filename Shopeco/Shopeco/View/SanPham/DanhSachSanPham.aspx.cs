using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanPham_DanhSachSanPham : System.Web.UI.Page
{
    string id = "";
    string sort = "idSanPham desc";
    string idLoaiSanPham = "";
    string TenLoai = "";

    string txtFistPage = "1";
    string txtPage1 = "";
    string txtPage2 = "";
    string txtPage3 = "";
    string txtPage4 = "";
    string txtPage5 = "";
    string txtLastPage = "";
    int PageNow = 0;
    int MaxPage = 0;
    int PageSize = 15;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string URL = ((System.Web.Routing.PageRouteHandler)Page.RouteData.RouteHandler).VirtualPath;
            try
            {
                if (URL != "")
                {
                    idLoaiSanPham = URL.Split('?')[1].Split('=')[1];
                }
            }
            catch { }
        }
        catch { }
        try
        {
            PageNow = int.Parse(Request.QueryString["Page"].ToString());
        }
        catch
        {
            PageNow = 1;
        }
        try
        {
            id = RouteData.Values["id"].ToString();
        }
        catch { }
        if (!IsPostBack)
        {
            TenLoaiSanPham();
            LoadSanPham();
        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(TenLoai);
    }
    private void TenLoaiSanPham()
    {
        string sql = "select * from tb_LoaiSanPham where idLoaiSanPham = " + id + " and KichHoat = 1";
        DataTable tb = Connect.GetTable(sql);
        if (tb.Rows.Count > 0)
        {
            imgBanner.Src = (tb.Rows[0]["Banner"].ToString() == "" ? "/Content/UI/image/catalog/demo/category/img-cate.jpg" : tb.Rows[0]["Banner"].ToString());
            TenLoai = tb.Rows[0]["TenLoaiSanPham"].ToString();
        }
        //hTenLoaiSP.InnerHtml = TenLoai;
    }
    #region paging
    private void SetPage()
    {
        string sql = @"select count(*) from tb_SanPham where 1 = 1";
        DataTable tbTotalRows = Connect.GetTable(sql);
        int TotalRows = int.Parse(tbTotalRows.Rows[0][0].ToString());
        if (TotalRows % PageSize == 0)
            MaxPage = TotalRows / PageSize;
        else
            MaxPage = TotalRows / PageSize + 1;
        txtLastPage = MaxPage.ToString();
        if (PageNow == 1)
        {
            for (int i = 1; i <= MaxPage; i++)
            {
                if (i <= 5)
                {
                    switch (i)
                    {
                        case 1: txtPage1 = i.ToString(); break;
                        case 2: txtPage2 = i.ToString(); break;
                        case 3: txtPage3 = i.ToString(); break;
                        case 4: txtPage4 = i.ToString(); break;
                        case 5: txtPage5 = i.ToString(); break;
                    }
                }
                else
                    return;
            }
        }
        else
        {
            if (PageNow == 2)
            {
                for (int i = 1; i <= MaxPage; i++)
                {
                    if (i == 1)
                        txtPage1 = "1";
                    if (i <= 5)
                    {
                        switch (i)
                        {
                            case 2: txtPage2 = i.ToString(); break;
                            case 3: txtPage3 = i.ToString(); break;
                            case 4: txtPage4 = i.ToString(); break;
                            case 5: txtPage5 = i.ToString(); break;
                        }
                    }
                    else
                        return;
                }
            }
            else
            {
                int Cout = 1;
                if (PageNow <= MaxPage)
                {
                    for (int i = PageNow; i <= MaxPage; i++)
                    {
                        if (i == PageNow)
                        {
                            txtPage1 = (PageNow - 2).ToString();
                            txtPage2 = (PageNow - 1).ToString();
                        }
                        if (Cout <= 3)
                        {
                            if (i == PageNow)
                                txtPage3 = i.ToString();
                            if (i == (PageNow + 1))
                                txtPage4 = i.ToString();
                            if (i == (PageNow + 2))
                                txtPage5 = i.ToString();
                            Cout++;
                        }
                        else
                            return;
                    }
                }
                else
                {
                    PageNow = MaxPage;
                    SetPage();
                }
            }
        }
    }
    #endregion
    private void LoadSanPham()
    {
        string sql = "";
        sql += @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY idSanPham desc
                  )AS RowNumber
	              ,*
				  from tb_SanPham s where 1 = 1";
        if (id != "")
            sql += " and idLoaiSanPham = " + id;
        sql += ") as tb1 WHERE RowNumber BETWEEN (" + PageNow + " - 1) * " + PageSize + " + 1 AND (((" + PageNow + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";
        sql += " order by " + sort;
        DataTable table = Connect.GetTable(sql);
        //txtNoiDung.InnerHtml = table.Rows[0]["NoiDung"].ToString();
        SetPage();
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string sqlha = "select * from tb_HinhAnhSanPham where idSanPham = " + table.Rows[i]["idSanPham"];
            DataTable tbha = Connect.GetTable(sqlha);
            string Anh1 = "";
            string Anh2 = "";
            if(tbha.Rows.Count > 0)
            {
                Anh1 = tbha.Rows[0]["LinkHinh"].ToString();
                if (tbha.Rows.Count > 1)
                    Anh2 = tbha.Rows[1]["LinkHinh"].ToString();
                else
                    Anh2 = Anh1;
            }
            string link = GetRouteUrl("product", new { nameEn = MyStaticData.GenerateURL(table.Rows[i]["TenSanPham"].ToString()), id = table.Rows[i]["idSanPham"].ToString() });
            html += "<div class='product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12'>";
            html += "   <div class='product-item-container'>";
            html += "       <div class='left-block left-b'>";
            html += @"           <div class='product-image-container second_img'>
                                    <a href='" + link + @"' target='_self' title='Lastrami bacon'>
                                        <img src='" + Anh1 + @"' class='img-1 img-responsive' alt='image1'>
                                        <img src='" + Anh2 + @"' class='img-2 img-responsive' alt='image2'>
                                    </a>
                                </div>";
            html += "       </div>";
            html += "       <div class='right-block'>";
            html += @"          <div class='button-group so-quickview cartinfo-left' style='top:10px'>
                                <button type='button' class='addToCart' title='Add to cart'>
                                    <span>Add to cart</span>   
                                </button>
                            </div>";
            html += @"          <div class='caption hide-cont'>
                                    <h4><a href='" + link + @"' title='Pastrami bacon' target='_self'>" + MyStaticData.Cut(table.Rows[i]["TenSanPham"].ToString(),44) + @"</a></h4>
                                </div>";
            html += @"          <p class='price'>
                                    <span class='price-new'>" + StaticData.FormatDouble(table.Rows[i]["GiaMoi"].ToString()) + @"</span>
                                </p>";
            html += @"          <div class='description item-desc'>
                                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
                                </div>";
            html += @"          <div class='list-block hidden'>
                                    <button class='addToCart btn-button' type='button' title='Add to Cart'><i class='fa fa-shopping-basket'></i>
                                    </button>
                                    <button class='wishlist btn-button' type='button' title='Add to Wish List'><i class='fa fa-heart'></i>
                                    </button>
                                    <button class='compare btn-button' type='button' title='Compare this Product'><i class='fa fa-refresh'></i>
                                    </button>
                                    <!--quickview-->                                                      
                                    <a class='iframe-link btn-button quickview quickview_handler visible-lg' href='quickview.html' title='Quick view' data-fancybox-type='iframe'><i class='fa fa-eye'></i></a>                                                        
                                    <!--end quickview-->
                                </div>";
            html += "       </div>";
            html += "   </div>";
            html += "</div>";
        }
        dvDSSanPham.InnerHtml = html;
        string htmlPhanTrang = "";
        string url = "/collections/";
        url += "?Page=";

    //Page 1
        if (txtPage1 != "")
        {
            if (PageNow.ToString() == txtPage1)
                htmlPhanTrang += "           <span class='page current'>" + txtPage1 + "</span>";
            else
                htmlPhanTrang += "           <span class='prev'><a href='" + url + txtFistPage + "' title=''>←</a></span><span class='page'><a href='" + url + txtPage1 + "' title=''>" + txtPage1 + "</a></span>";
        }
        else
        {
            //html += "           <a id='page_1' class='notepagingnone' href='" + url + txtPage1 + "' />" + txtPage1 + "</a>";
        }
        //Page 2
        if (txtPage2 != "")
        {
            if (PageNow.ToString() == txtPage2)
                htmlPhanTrang += "           <span class='page current'>" + txtPage2 + "</span>";
            else
                htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage2 + "' title=''>" + txtPage2 + "</a></span>";
        }
        else
        {
            //html += "           <a id='page_2' class='notepagingnone' href='" + url + txtPage2 + "' />" + txtPage2 + "</a>";
        }
        //Page 3
        if (txtPage3 != "")
        {
            if (PageNow.ToString() == txtPage3)
                htmlPhanTrang += "           <span class='page current'>" + txtPage3 + "</span>";
            else
                htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage3 + "' title=''>" + txtPage3 + "</a></span>";
        }
        else
        {
            //html += "           <a id='page_3' class='notepagingnone' href='" + url + txtPage3 + "' />" + txtPage3 + "</a>";
        }
        //Page 4
        if (txtPage4 != "")
        {
            if (PageNow.ToString() == txtPage4)
                htmlPhanTrang += "           <span class='page current'>" + txtPage4 + "</span>";
            else
                htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage4 + "' title=''>" + txtPage4 + "</a></span>";
        }
        else
        {
            //html += "           <a id='page_4' class='notepagingnone' href='" + url + txtPage4 + "' />" + txtPage4 + "</a>";
        }
        //Page 5
        if (txtPage5 != "")
        {
            if (PageNow.ToString() == txtPage5)
                htmlPhanTrang += "           <span class='page current'>" + txtPage5 + "</span>";
            else
                htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage5 + "' title=''>" + txtPage5 + "</a></span><span class='next'><a href='" + url + txtLastPage + "' title=''>→</a></span>";
        }
        else
        {
            //htmlPhanTrang += "           <span class='next'><a href='" + url + txtLastPage + "' title=''>→</a></span>";
        }
        //dvPhanTrang.InnerHtml = htmlPhanTrang;
        
    }
    protected void SortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        //sort = SortBy.SelectedValue;
        LoadSanPham();
    }
}