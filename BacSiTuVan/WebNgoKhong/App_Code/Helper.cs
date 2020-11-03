using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Net.NetworkInformation;
using Microsoft.Win32;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

/// <summary>
/// Summary description for MyUtils
/// </summary>
public class Helper
{
    public static string TaoMaDonDatHang()
    {
        double ViTriDonDatHang = 1;
        string sqlDonDatHang = "select top 1 idDonHang from tb_DonHang order by idDonHang desc";
        DataTable tbDonDatHang = DataProvider.GetTable(sqlDonDatHang);
        if (tbDonDatHang.Rows.Count > 0)
            ViTriDonDatHang = (double.Parse(tbDonDatHang.Rows[0]["idDonHang"].ToString()) + 1);

        string MaDonHang = "";
        string Ngay = DateTime.Now.ToString("dd/MM/yyyy").Replace("/", "");
        if (ViTriDonDatHang.ToString().Length == 1)
            MaDonHang = "DH" + Ngay + "00" + ViTriDonDatHang.ToString();
        if (ViTriDonDatHang.ToString().Length == 2)
            MaDonHang = "DH" + Ngay + "0" + ViTriDonDatHang.ToString();
        if (ViTriDonDatHang.ToString().Length > 2)
            MaDonHang = "DH" + Ngay + ViTriDonDatHang.ToString();
        return MaDonHang;
    }
    public static string LinkAnh(string link)
    {
        //return link == "" ? "/Content/UI/image/catalog/demo/product/270/MacDinh.png" : link;
        return Utils.validImage(link);
    }
    public static string htmlTinTucKhac(string idTinTuc)
    {
        string sql = "select top 8 * from tb_TinTuc where 1 = 1 and idTinTuc != '" + idTinTuc + "'";
        DataTable tb = DataProvider.GetTable(sql);
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
            string link = "/" + GenerateURL(tb.Rows[i]["TieuDe"].ToString()) + "-cttt-" + tb.Rows[i]["idTinTuc"].ToString();
            html += @"
                    <div class='product-layout item-inner style1'>
                        <div class='item-image'>
                            <div class='item-img-info'>
                                <a href='" + link + @"' target='_self' title='Mandouille short'>
                                    <img src='" + LinkAnh(tb.Rows[i]["AnhDaiDien"].ToString()) + @"' alt='Mandouille short'>
                                    </a>
                            </div>
                        </div>
                        <div class='item-info'>
                            <div class='item-title'>
                                <a href='" + link + @"' target='_self' title='Mandouille short'>" + Cut(tb.Rows[i]["TieuDe"].ToString(), 30) + @"</a>
                            </div>
                            <div class=''>
                                                <span class='date'>
                                                    <i class='fa fa-clock-o'></i>
                                                    " + Utils.ConvertMMDDYYtoDDMMYY(tb.Rows[i]["Ngay"].ToString()) + @"
                                                </span>
                                            </div>
                        </div>
</div>
                        <!-- End item-info -->";
        }
        if (html != "")
            html += "</div>";

        return html;
    }
    public static string htmlSanPhamHome(string loai)
    {
        string sql = "select top 8 * from tb_SanPham where KichHoat = 1";
        if (loai == "home")
            sql += " and SetHome = 1";
        else
            sql += " and idSanPham != '" + loai + "'";

        DataTable tb = DataProvider.GetTable(sql);
        string html = htmlSP(tb);
        return html;
    }
    public static string htmlSP(DataTable tb)
    {
        string html = "";
        if (tb == null)
        {
            return "";
        }
        if (tb.Rows.Count <= 0)
        {
            return "";
        }
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            string link = "/" + GenerateURL(tb.Rows[i]["TenSanPham"].ToString()) + "-" + tb.Rows[i]["idSanPham"].ToString();
            string sqlAnh = "select top 2 * from tb_HinhAnhSanPham where idSanPham = " + tb.Rows[i]["idSanPham"].ToString();
            DataTable tbAnh = DataProvider.GetTable(sqlAnh);
            string Anh1 = "";
            string Anh2 = "";
            if (tbAnh.Rows.Count > 0)
            {
                Anh1 = tbAnh.Rows[0]["LinkHinh"].ToString();
                if (tbAnh.Rows.Count > 1)
                    Anh2 = tbAnh.Rows[1]["LinkHinh"].ToString();
                else
                    Anh2 = Anh1;
            }
            html += @"<div class='item'>         
                                        <div class='item-inner product-layout transition product-grid'>
                                            <div class='product-item-container'>
                                                <div class='left-block left-b'>
                                                    
                                                    <div class='product-image-container second_img'>
                                                        <a href='" + link + @"' target='_self' title='" + tb.Rows[i]["TenSanPham"].ToString() + @"'>
                                                            <img src='" + LinkAnh(Anh1) + @"' class='img-1 img-responsive' alt='" + tb.Rows[i]["TenSanPham"].ToString() + @"'>
                                                            <img src='" + LinkAnh(Anh2) + @"' class='img-2 img-responsive' alt='" + tb.Rows[i]["TenSanPham"].ToString() + @"'>
                                                        </a>
                                                    </div>
                                                    <!--quickview 
////                                                    <div class='so-quickview'>
////                                                      <a class='iframe-link btn-button quickview quickview_handler visible-lg' href='quickview.html' title='Quick view' data-fancybox-type='iframe'><i class='fa fa-eye'></i><span>Xem nhanh</span></a>
////                                                    </div>                                                     
                                                    end quickview-->

                                                    
                                                </div>
                                                <div class='right-block'>
                                                    <div class='button-group so-quickview cartinfo--left'>
                                                        <button type='button' class='addToCart' title='Thêm vào giỏ' onclick='ThemGioHangadd(" + tb.Rows[i]["idSanPham"].ToString() + "," + tb.Rows[i]["GiaMoi"].ToString() + @")'>
                                                            <span>Thêm vào giỏ </span>   
                                                        </button>
                                                    </div>
                                                    <div class='caption hide-cont'>
                                                        <h4><a href='" + link + @"' title='Pastrami bacon' target='_self'>" + tb.Rows[i]["TenSanPham"].ToString() + @"</a></h4>
                                                        
                                                    </div>
                                                    <p class='price'>
                                                      <span class='price-new'>" + Utils.FormatDouble(tb.Rows[i]["GiaMoi"].ToString()) + @"</span>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>      
                                    </div>";
        }
        return html;
    }
    public static string htmlListProduct(DataTable data)
    {
        string html = "";
        int tem = 0;
        for (int i = 0; i < data.Rows.Count; i++)
        {
            if (i == tem)
            {
                if (i != 0)
                    html += "</div>";
                html += "<div class='item '>";
                tem += 4;
            }
            string link = GenerateURL(data.Rows[i]["TenSanPham"].ToString()) + "-" + data.Rows[i]["idSanPham"].ToString();
            html += @"
                    <div class='product-layout item-inner style1'>
                        <div class='item-image'>
                            <div class='item-img-info'>
                                <a href='" + link + @"' target='_self' title='Mandouille short'>
                                    <img src='" + LinkAnh(data.Rows[i]["Anh"].ToString()) + @"' alt='Mandouille short'>
                                    </a>
                            </div>
                        </div>
                        <div class='item-info'>
                            <div class='item-title'>
                                <a href='" + link + @"' target='_self' title='" + data.Rows[i]["TenSanPham"].ToString() + "'>" + Cut(data.Rows[i]["TenSanPham"].ToString(), 28) + @"</a>
                            </div>
                            <div class='content_price price'>
                                <span class='price-new product-price'>" + Utils.FormatDouble(data.Rows[i]["GiaMoi"].ToString()) + @"</span>&nbsp;&nbsp;

                                <span class='price-old'>" + Utils.FormatDouble(data.Rows[i]["GiaCu"].ToString()) + @"</span>&nbsp;

                            </div>
                        </div>
</div>
                        <!-- End item-info -->";
        }
        if (html != "")
            html += "</div>";

        return html;
    }
    
    public static string htmlSanPhamHotKM1(string loai)
    {
        string sql = "select top 8 *,'Anh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = sp.idSanPham) from tb_SanPham sp where KichHoat = 1";
        //switch (loai)
        //{
        //    case "hot":
                sql += " and SetHot = 1"; 
        //break;
        //    case "km":
        //        sql += " and GiaMoi <  GiaCu and GiaCu is not NULL"; break;
        //}
        DataTable tb = DataProvider.GetTable(sql);
        string html = "";
        int tem = 0;
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            if (i == tem)
            {
                if (i != 0)
                    html += "</div>";
                html += "<div class='item '>";
                tem += 1;
            }
            string link = GenerateURL(tb.Rows[i]["TenSanPham"].ToString()) + "-" + tb.Rows[i]["idSanPham"].ToString();
            //            html += @"
            //                    <div class='product-layout item-inner style1'>
            //                        <div class='item-image'>
            //                            <div class='item-img-info'>
            //                                <a href='" + link + @"' target='_self' title='Mandouille short'>
            //                                    <img src='" + LinkAnh(tb.Rows[i]["Anh"].ToString()) + @"' alt='Mandouille short'>
            //                                    </a>
            //                            </div>
            //                        </div>
            //                        <div class='item-info'>
            //                            <div class='item-title'>
            //                                <a href='" + link + @"' target='_self' title='Mandouille short'>" + Cut(tb.Rows[i]["TenSanPham"].ToString(), 28) + @"</a>
            //                            </div>
            //                            <div class='content_price price'>
            //                                <span class='price-new product-price'>" + Utils.FormatDouble(tb.Rows[i]["GiaMoi"].ToString()) + @"</span>&nbsp;&nbsp;
            //
            //                                <span class='price-old'>" + Utils.FormatDouble(tb.Rows[i]["GiaCu"].ToString()) + @"</span>&nbsp;
            //
            //                            </div>
            //                        </div>
            //</div>
            //                        <!-- End item-info -->";
            html += @"<div class='item'>         
                                        <div class='item-inner product-layout transition product-grid'>
                                            <div class='product-item-container'>
                                                <div class='left-block left-b'>
                                                    
                                                    <div class='product-image-container second_img'>
                                                        <a href='" + link + @"' target='_self' title='Lastrami bacon'>
                                                            <img src='" + LinkAnh(tb.Rows[i]["Anh"].ToString()) + @"' class='img-1 img-responsive' alt='image1'>
                                                            <img src='" + LinkAnh(tb.Rows[i]["Anh"].ToString()) + @"' class='img-2 img-responsive' alt='image2'>
                                                        </a>
                                                    </div>
                                                    <!--quickview 
////                                                    <div class='so-quickview'>
////                                                      <a class='iframe-link btn-button quickview quickview_handler visible-lg' href='quickview.html' title='Quick view' data-fancybox-type='iframe'><i class='fa fa-eye'></i><span>Xem nhanh</span></a>
////                                                    </div>                                                     
                                                    end quickview-->

                                                    
                                                </div>
                                                <div class='right-block'>
                                                    <div class='button-group so-quickview cartinfo--left'>
                                                        <button type='button' class='addToCart' title='Thêm vào giỏ' onclick='ThemGioHangadd(" + tb.Rows[i]["idSanPham"].ToString() + "," + tb.Rows[i]["GiaMoi"].ToString() + @")'>
                                                            <span>Thêm vào giỏ </span>   
                                                        </button>
                                                    </div>
                                                    <div class='caption hide-cont'>
                                                        <h4><a href='" + link + @"' title='Pastrami bacon' target='_self'>" + tb.Rows[i]["TenSanPham"].ToString() + @"</a></h4>
                                                        
                                                    </div>
                                                    <p class='price'>
                                                      <span class='price-new'>" + Utils.FormatDouble(tb.Rows[i]["GiaMoi"].ToString()) + @"</span>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>      
                                    </div>";
        }
        if (html != "")
            html += "</div>";

        return html;
    }
    public static string DuongDan(string Ten, string Ten2 = "")
    {
        return @"
		<ul class='breadcrumb'>
			<li><a href='/'><i class='fa fa-home'></i></a></li>
			<li><a>" + Ten + @"</a></li>" + (Ten2 != "" ? "<li><a>" + Ten2 + @"</a></li>" : "") +
        "</ul>";
    }
    public static double GetGia(string idSanPham, string idSize)
    {
        double Gia = 0;
        string sql = "select Gia from tb_CTSP_Size where idSanPham = '" + idSanPham + "' and idSize = '" + idSize + "'";
        DataTable table = DataProvider.GetTable(sql);
        if (table.Rows.Count > 0)
            Gia = double.Parse(table.Rows[0][0].ToString());
        return Gia;
    }
    public static string GetLinkHinh(string idSanPham, string idMau)
    {
        string LinkHinh = "";
        string sql = "select LinkHinh from tb_CTSP_Mau where idSanPham = '" + idSanPham + "' and idMau = '" + idMau + "'";
        DataTable table = DataProvider.GetTable(sql);
        if (table.Rows.Count > 0)
            LinkHinh = table.Rows[0][0].ToString();
        return LinkHinh;
    }

    public static string GenerateURL(string Title)
    {
        if (string.IsNullOrEmpty(Title))
            return "";
        Title = ToAscii(Title.ToLower());
        string strTitle = Title.ToString();

        //#region Generate SEO Friendly URL based on Title

        strTitle = strTitle.Trim();
        strTitle = strTitle.Trim('-');

        strTitle = strTitle.ToLower();
        char[] chars = @"$%#@!*?;:~`+=()[]{}|\'<>,/^&"".".ToCharArray();
        strTitle = strTitle.Replace("c#", "C-Sharp");
        strTitle = strTitle.Replace("vb.net", "VB-Net");
        strTitle = strTitle.Replace("asp.net", "Asp-Net");
        strTitle = strTitle.Replace(".", "-");
        for (int i = 0; i < chars.Length; i++)
        {
            string strChar = chars.GetValue(i).ToString();
            if (strTitle.Contains(strChar))
            {
                strTitle = strTitle.Replace(strChar, string.Empty);
            }
        }
        strTitle = strTitle.Replace(" ", "-");

        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("-----", "-");
        strTitle = strTitle.Replace("----", "-");
        strTitle = strTitle.Replace("---", "-");
        strTitle = strTitle.Replace("--", "-");
        strTitle = strTitle.Trim();
        if (strTitle.Length > 80)
        {
            strTitle = strTitle.Substring(0, 80);
        }
        else
        {
            strTitle = strTitle;
        }
        return strTitle;
    }
    public static string ToAscii(string unicode)
    {
        unicode = Regex.Replace(unicode, "[áàảãạăắằẳẵặâấầẩẫậ]", "a");
        unicode = Regex.Replace(unicode, "[óòỏõọôồốổỗộơớờởỡợ]", "o");
        unicode = Regex.Replace(unicode, "[éèẻẽẹêếềểễệ]", "e");
        unicode = Regex.Replace(unicode, "[íìỉĩị]", "i");
        unicode = Regex.Replace(unicode, "[úùủũụưứừửữự]", "u");
        unicode = Regex.Replace(unicode, "[ýỳỷỹỵ]", "y");
        unicode = Regex.Replace(unicode, "[đ]", "d");
        //unicode = Regex.Replace(unicode, "[-\\s+/]+", "-");
        unicode = Regex.Replace(unicode, "\\W+", " "); //Nếu bạn muốn thay dấu khoảng trắng thành dấu "_" hoặc dấu cách " " thì thay kí tự bạn muốn vào đấu "-"
        return unicode;
    }
    public static string Cut(string str, int number)
    {
        string s = str;
        if (str.Length > number)
            s = str.Substring(0, number) + "...";
        return s;
    }

}