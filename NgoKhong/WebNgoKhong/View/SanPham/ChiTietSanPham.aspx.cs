using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanPham_ChiTietSanPham : System.Web.UI.Page
{
    string TenLoai = "";
    string idSanPham = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Response.Write(nameEn + " / " + id);
        try
        {
            idSanPham = RouteData.Values["id"].ToString();
            txtidSanPham.Value = idSanPham;
            //idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        }
        catch { }
        if (!IsPostBack)
        {
            LoadSanPham();
            LoadHinhAnh();
            dvSPLienQuan.InnerHtml = MyStaticData.htmlSanPhamHome(idSanPham);
            //LoadImgColor();
            //LoadSizePrice();
            //LoadRelatedProducts();
        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan(TenLoai, StaticData.getField("tb_SanPham","TenSanPham","idSanPham",idSanPham));
    }
    private void LoadHinhAnh()
    {
        string html = "";
        string sql = @"select * from tb_HinhAnhSanPham sp where idSanPham = '" + idSanPham + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            html += @"<div class='large-image'>
								<img itemprop='image' class='product-image-zoom' src='" + StaticData.validImage(table.Rows[0]["LinkHinh"].ToString()) + @"'  title='' alt=''>
							</div>
<div id='thumb-slider' class='yt-content-slider full_slider owl-drag' data-rtl='yes' data-autoplay='no' data-autoheight='no' data-delay='4' data-speed='0.6' data-margin='10' data-items_column00='4' data-items_column0='4' data-items_column1='3' data-items_column2='4'  data-items_column3='1' data-items_column4='1' data-arrows='yes' data-pagination='no' data-lazyload='yes' data-loop='no' data-hoverpause='yes'>";
            for (int i = 0; i < table.Rows.Count; i++)
            {
                html += @"<a data-index='0' class='img thumbnail' data-image='" + table.Rows[i]["LinkHinh"] + @"' title=''>
									<img src='" + StaticData.validImage(table.Rows[i]["LinkHinh"].ToString()) + @"' title='' alt=''>
								</a>";
            }

            html += "</div>";
        }
        dvHinhAnh.InnerHtml = html;
    }
    private void LoadSanPham()
    {
        string sql = @"select *,'TenLoai' = (select TenLoaiSanPham from tb_LoaiSanPham where idLoaiSanPham = sp.idLoaiSanPham) from tb_SanPham sp where idSanPham = '" + idSanPham + "'";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            string idGianHang = table.Rows[0]["IDGianhang"].ToString();
            linkShop.HRef = GetRouteUrl("thongtingianhang",new { id = idGianHang });
            btnDangKy.HRef = GetRouteUrl("usershopinfo", new { id = idGianHang });
            string sqlLayGianHang = "select * from tb_GianHang where ID = '" + idGianHang + "'";
            DataTable data = Connect.GetTable(sqlLayGianHang);
            if (data.Rows.Count > 0)
            {
                shopName.InnerHtml = data.Rows[0]["TenGianHang"].ToString();
                emailShop.InnerHtml = data.Rows[0]["Email"].ToString();
                emailShop.HRef = "mailto:" + data.Rows[0]["Email"].ToString();
                shopAdress.InnerHtml = data.Rows[0]["DiaChi"].ToString();
                shopPhone.InnerHtml = data.Rows[0]["SoDienThoai"].ToString();
                //txtSoDienThoai.Value = data.Rows[0]["SoDienThoai"].ToString();
                shopPhone.HRef = "tel:" + data.Rows[0]["SoDienThoai"].ToString();
            }
            
            TenLoai = table.Rows[0]["TenLoai"].ToString();
            hTenSanPham.InnerHtml = table.Rows[0]["TenSanPham"].ToString();
            spanGiaCu.InnerHtml = StaticData.FormatDouble(table.Rows[0]["GiaCu"].ToString()) + " đ";
            spanGiaMoi.InnerHtml = StaticData.FormatDouble(table.Rows[0]["GiaMoi"].ToString()) + " đ";
            MaSP.InnerHtml = " " + table.Rows[0]["MaSanPham"].ToString();
            

            dvThongTinSanPham.InnerHtml = table.Rows[0]["ThongTinSP"].ToString();
            dvThongTinSP.InnerHtml = table.Rows[0]["MoTa"].ToString();
        }
    }
    protected void AddToCart_Click(object sender, EventArgs e)
    {
        //string handle = Handle.InnerHtml;
        //string idMau = hdMau.Value.Trim();
        //string idSize = hdSize.Value.Trim();
        //double SoLuong = (Quantity.Value.Trim() == "" ? 1 : double.Parse(Quantity.Value.Trim()));
        //double Gia = MyStaticData.GetGia(idSanPham, idSize);
        //string LinkHinh = MyStaticData.GetLinkHinh(idSanPham, idMau);

        //var cart = Session["CartSession"];
        //if (cart != null)
        //{
        //    var lst = (List<CartItem>)cart;
        //    if (lst.Exists(x => x.idSanPham == idSanPham && x.idMau == idMau && x.idSize == idSize))
        //    {
        //        foreach (var item in lst)
        //        {
        //            if (item.idSanPham == idSanPham && item.idMau == idMau && item.idSize == idSize)
        //            {
        //                item.SoLuong += SoLuong;
        //            }
        //        }
        //    }
        //    else
        //    {
        //        var item = new CartItem();
        //        item.idSanPham = idSanPham;
        //        item.idMau = idMau;
        //        item.LinkHinh = LinkHinh;
        //        item.idSize = idSize;
        //        item.SoLuong = SoLuong;
        //        item.Gia = Gia;
        //        item.Handle = handle;
        //        lst.Add(item);
        //    }
        //    Session["CartSession"] = lst;
        //}
        //else
        //{
        //    var item = new CartItem();
        //    item.idSanPham = idSanPham;
        //    item.idMau = idMau;
        //    item.LinkHinh = LinkHinh;
        //    item.idSize = idSize;
        //    item.SoLuong = SoLuong;
        //    item.Gia = Gia;
        //    item.Handle = handle;
        //    var lst = new List<CartItem>();
        //    lst.Add(item);
        //    Session["CartSession"] = lst;

        //}
        //Response.Redirect("/cart");
    }
    
}