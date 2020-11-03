﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSlide();
            LoadSPKhuyenMai();
            LoadTinTuc();
            LoadBanner();
            LoadBrands();
            LoadMenuHome();
        }
    }

    private void LoadMenuHome()
    {
        string sql = "select * from tb_LoaiSanPham where idCapCha = 0";
        DataTable table = Connect.GetTable(sql);
        if (table == null || table.Rows.Count <= 0)
        {
            return;
        }
        string html = "<ul>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string idLoaiSanPham = table.Rows[i]["idLoaiSanPham"].ToString();
            html += "<li><a href='" + GetRouteUrl("searchs", new { cat = idLoaiSanPham}) + "' target='_blank'>";
            html += "     <div class='mhv_img'><i class='icon_picture " + table.Rows[i]["HomeIcon"].ToString() + "'></i></div>";
            html += "     <div class='mhv_name'>";
            html += table.Rows[i]["TenLoaiSanPham"].ToString();
            html += "     </div>";
            html += " </a></li>";
               
        }
        html += "</ul>";
        menuHome.InnerHtml = html;
    }

    private void LoadSlide()
    {
        string sql = "select * from tb_Banner where isBanner = 0 and Active = 1 order by ThuTu";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }
        string html = "";
        for(int i = 0; i < table.Rows.Count; i++)
        {
            html += "<div class='" + (i == 0 ? " active" : "") + " item' align='center'>";
            html += "   <a href='http://" + table.Rows[i]["Url"] + "' class='slider_link'>";
            html += "       <img class='nav-bar desktop_nav' src='" + table.Rows[i]["Link"] + "' />";
            html += "   </a>";
            html += "</div>";
        }
        dvBanner.InnerHtml = html;
    }
    private void LoadBanner()
    {
        string sql = "select * from tb_Banner where isBanner = 1 and Active = 1 order by ThuTu";
        DataTable table = Connect.GetTable(sql);
        string html3 = "";
        string html5 = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            if (i < 5)
            {
                html5 += @"<li>
                            <a href='http://" + table.Rows[i]["Url"] + "'><img src='" + table.Rows[i]["Link"] + @"' alt='image'></a>
                        </li>";
            }
            else
            {
                html3 += "<div class='item" + (i - 4) + "'>";
                html3 += "   <a href='#'>";
                html3 += "       <img src='" + table.Rows[i]["Link"] + "' alt='image'/>";
                html3 += "   </a>";
                html3 += "</div>";
            }
        }
        ulBanner5.InnerHtml = html5;
        //dvBanner3.InnerHtml = html3;
    }
    private void LoadProduct()
    {
        string sql = "select top 16 * from tb_SanPham where Active = 1 order by idSanPham desc";
        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += @"<div class='item large--one-quarter'>
            <div class='h_pod'>
                <a href='/products/" + MyStaticData.GenerateURL(table.Rows[i]["Handle"].ToString()) + "-" + table.Rows[i]["idSanPham"].ToString() + @"'>
                    <img src='" + StaticData.validImage(StaticData.getField("tb_CTSP_Mau","top 1 LinkHinh","idSanPham",table.Rows[i]["idSanPham"].ToString())) + @"' alt='" + table.Rows[i]["Handle"].ToString() + @"' class='image'>
                </a>
            </div>
            <div class='home_prod_info'>
                <h5 class='nav-bar desktop_nav title'>
                    <a href='/products/" + MyStaticData.GenerateURL(table.Rows[i]["Handle"].ToString()) + "-" + table.Rows[i]["idSanPham"].ToString() + @"'>
                        " + table.Rows[i]["Handle"].ToString() + @"
                    </a>
                </h5>
                <h5 class='nav-bar mobile_nav title'>
                    <a href='/products/" + MyStaticData.GenerateURL(table.Rows[i]["Handle"].ToString()) + "-" + table.Rows[i]["idSanPham"].ToString() + @"'>
                        " + table.Rows[i]["Handle"].ToString() + @"
                    </a>
                </h5>
                <p class='sale'>$" + StaticData.getField("tb_CTSP_Size", "top 1 Gia", "idSanPham", table.Rows[i]["idSanPham"].ToString()) + @"</p>
                <span class='sale_blank'></span>
            </div>
        </div>";
        }
        //container.InnerHtml = html;
    }
    private void LoadSPKhuyenMai()
    {
        string sql = "select top 8 *,'Anh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = sp.idSanPham) from tb_SanPham sp where KichHoat = 1";

        string sqlGetHot = "select top 20 *,'Anh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = sp.idSanPham) from tb_SanPham sp where KichHoat = 1 and SetHot = 1";
        DataTable dataHot = Connect.GetTable(sqlGetHot);
        ListProductHot.InnerHtml = MyStaticData.htmlSP(dataHot);

        //DataTable dataDiscount = Connect.GetTable(sql + "and GiaMoi <  GiaCu and GiaCu is not NULL");
        DataTable dataDiscount = Connect.GetTable(sql + "and GiaCu is not NULL");
        ListDiscountProduct.InnerHtml = MyStaticData.htmlSP(dataDiscount); 

        DataTable dataHome = Connect.GetTable(sql + " and SetHome = 1");
        ListHomeProduct.InnerHtml = MyStaticData.htmlListProduct(dataHome);

         sql = @" select * from (select top 8 *, 'dem' = (select count(*) from tb_CTDonHang where idSanPham = sp.idSanPham) from tb_SanPham sp where KichHoat = 1 
) as t where dem > 0
order by dem desc";
        DataTable tb3 = Connect.GetTable(sql);
        dvSanPhamBanChay.InnerHtml = MyStaticData.htmlSP(tb3);
    }
    private void LoadTinTuc()
    {
        string sql = "select top 4 * from tb_TinTuc where SetHome = 1";
        DataTable tb = Connect.GetTable(sql);
        string html = "";
        int tem = 0;
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            if (i == tem)
            {
                if (i != 0)
                    html += "</div>";
                html += "<div class='item '>";
                tem += 4;
            }
            string link = GetRouteUrl("newdefault", new { nameEn = MyStaticData.GenerateURL(tb.Rows[i]["TieuDe"].ToString()), id = tb.Rows[i]["idTinTuc"].ToString() });
            //html += @"<div class='cat-wrap'>
            //                        <div class='media'>

            //                            <div class='item item-1'>
            //                                <div class='media-left'>
            //                                    <a href='" + link + @"' target='_self'>
            //                                    <img src='" + MyStaticData.LinkAnh(tb.Rows[i]["AnhDaiDien"].ToString()) + @"' alt='' class='media-object'>
            //                                    </a>
            //                                </div>
            //                                <div class='media-body'>
            //                                    <h4 class='media-heading'>
            //                                    <a href='" + link + @"' title='" + tb.Rows[i]["TieuDe"].ToString() + @"' target='_self'>" + tb.Rows[i]["TieuDe"].ToString() + @"</a>
            //                                    </h4>
            //                                    <div class='media-content'>
            //                                        <div class='media-date-added'><i class='fa fa-calendar'></i> " + StaticData.ConvertMMDDYYtoDDMMYY(tb.Rows[i]["Ngay"].ToString()) + @"</div>         
            //                                        <div class='media-subcontent'>
            //                                        </div>
            //                                    </div>
            //                                </div>
            //                            </div>

            //                        </div>
            //                    </div>";
            html += @"
                    <div class='product-layout item-inner style1'>
                        <div class='item-image'>
                            <div class='item-img-info'>
                                <a href='" + link + @"' target='_self' title='Mandouille short'>
                                    <img src='" + MyStaticData.LinkAnh(tb.Rows[i]["AnhDaiDien"].ToString()) + @"' alt='Mandouille short'>
                                    </a>
                            </div>
                        </div>
                        <div class='item-info'>
                            <div class='item-title'>
                                <a href='" + link + @"' target='_self' title='Mandouille short'>" + MyStaticData.Cut(tb.Rows[i]["TieuDe"].ToString(), 100) + @"</a>
                            </div>
                        </div>
</div>
                        <!-- End item-info -->";
        }
        if (html != "")
            html += "</div>";
        dvTinTucHot.InnerHtml = html;
        dvTuVanTieuDung.InnerHtml = html;
    }
    private void LoadBrands()
    {
        string sql = "select * from tb_Brands where Active = 1 and TenThuongHieu != N'Khác' order by ThuTu";
        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "<div class='item'>";
            html += "        <a href='#'>";
            html += "       <img src='" + table.Rows[i]["Link"] + "' alt='image'/>";
            html += "        </a>";
            html += "    </div>";
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "<div class='item'>";
            html += "        <a href='#'>";
            html += "       <img src='" + table.Rows[i]["Link"] + "' alt='image'/>";
            html += "        </a>";
            html += "    </div>";
        }
        dvDanhSachThuongHieu.InnerHtml = html;
    }

}