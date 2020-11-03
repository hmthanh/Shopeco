using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_TinTuc_TinTuc : System.Web.UI.Page
{
    string id = "";
    string sort = "idSanPham desc";
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
            LoadSanPham();
        }
    }
    public string GetDuongDan()
    {
        string sql = "select * from tb_LoaiTinTuc where idLoaiTinTuc = " + id + " and Active = 1";
        DataTable tb = Connect.GetTable(sql);
        if (tb.Rows.Count > 0)
        {
            TenLoai = tb.Rows[0]["TenLoaiTinTuc"].ToString();
        }
        return MyStaticData.DuongDan(TenLoai);
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
                        ORDER BY idTinTuc desc
                  )AS RowNumber
	              ,*
				  from tb_TinTuc s where 1=1";
        if (id != "")
            sql += " and idLoaiTinTuc = " + id;
        sql += ") as tb1 WHERE RowNumber BETWEEN (" + PageNow + " - 1) * " + PageSize + " + 1 AND (((" + PageNow + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";
  
        DataTable table = Connect.GetTable(sql);
        //txtNoiDung.InnerHtml = table.Rows[0]["NoiDung"].ToString();
        SetPage();
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string Anh = table.Rows[i]["AnhDaiDien"].ToString() == "" ? "/Content/UI/image/catalog/demo/product/270/MacDinh.png" : table.Rows[i]["AnhDaiDien"].ToString();
            
            string link = GetRouteUrl("newdefault", new { nameEn = MyStaticData.GenerateURL(table.Rows[i]["TieuDe"].ToString()), id = table.Rows[i]["idTinTuc"].ToString() });

            html += @"<div class='blog-item col-lg-4 col-md-4 col-sm-6 col-xs-12'>
                            <div class='blog-item-inner clearfix'>
                                <div class='itemBlogImg clearfix'>
                                    <div class='article-image'>
                                        <div>
                                            <a class='popup-gallery' href='" + Anh + @"'>
                                                <img src='" + Anh + @"' alt='" + table.Rows[i]["TieuDe"].ToString() + @"' />
                                            </a>
                                        </div>
                                        <div class='article-date'>
                                            <div class='date'>  <span class='article-date'>
                                                <b>" + DateTime.Parse(table.Rows[i]["Ngay"].ToString()).ToString("dd") + @"</b> " + DateTime.Parse(table.Rows[i]["Ngay"].ToString()).ToString("MMM") + @"
                                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='itemBlogContent clearfix '>
                                    <div class='blog-content'>
                                        <div class='article-title font-title'>
                                            <h4><a href='" + link + "'>" + table.Rows[i]["TieuDe"].ToString() + @"</a></h4>
                                        </div>
                                        <p class='article-description'>" + StaticData.HtmlToPlainText(MyStaticData.Cut(table.Rows[i]["NoiDung"].ToString(),400)) + @"</p>
                                        <div class='readmore'>  <a class='btn-readmore font-title' href='" + link + @"'><i class='fa fa-caret-right'></i>Xem thêm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>";
            
        }
        dvTinTuc.InnerHtml = html;
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