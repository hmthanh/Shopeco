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
								<img itemprop='image' class='product-image-zoom' src='" + table.Rows[0]["LinkHinh"] + @"'  title='' alt=''>
							</div>
<div id='thumb-slider' class='yt-content-slider full_slider owl-drag' data-rtl='yes' data-autoplay='no' data-autoheight='no' data-delay='4' data-speed='0.6' data-margin='10' data-items_column00='4' data-items_column0='4' data-items_column1='3' data-items_column2='4'  data-items_column3='1' data-items_column4='1' data-arrows='yes' data-pagination='no' data-lazyload='yes' data-loop='no' data-hoverpause='yes'>";
            for (int i = 0; i < table.Rows.Count; i++)
            {
                html += @"<a data-index='0' class='img thumbnail' data-image='" + table.Rows[i]["LinkHinh"] + @"' title=''>
									<img src='" + table.Rows[i]["LinkHinh"] + @"' title='' alt=''>
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
            linkShop.HRef = GetRouteUrl("thongtingianhang", new { id = idGianHang });

            string sqlLayGianHang = "select * from tb_GianHang where ID = '" + table.Rows[0]["IDGianhang"] + "'";
            DataTable data = Connect.GetTable(sqlLayGianHang);
            if (data.Rows.Count > 0)
            {
                shopName.InnerHtml = data.Rows[0]["TenGianHang"].ToString();
                emailShop.InnerHtml = data.Rows[0]["Email"].ToString();
                emailShop.HRef = "mailto:" + data.Rows[0]["Email"].ToString();
                shopAdress.InnerHtml = data.Rows[0]["DiaChi"].ToString();
                shopPhone.InnerHtml = data.Rows[0]["SoDienThoai"].ToString();
                shopPhone.HRef = "tel:" + data.Rows[0]["SoDienThoai"].ToString();
            }
            
            TenLoai = table.Rows[0]["TenLoai"].ToString();
            hTenSanPham.InnerHtml = table.Rows[0]["TenSanPham"].ToString();
            spanGiaCu.InnerHtml = StaticData.FormatDouble(table.Rows[0]["GiaCu"].ToString()) + " đ";
            spanGiaMoi.InnerHtml = StaticData.FormatDouble(table.Rows[0]["GiaMoi"].ToString()) + " đ";
            MaSP.InnerHtml = "<span>Mã sản phẩm:</span>  " + table.Rows[0]["MaSanPham"].ToString();

            string htmlMau = "";
            if (table.Rows[0]["Mau"].ToString().Trim() != "")
            {
                string[] arrMau = table.Rows[0]["Mau"].ToString().Split('-');
                for(int i = 0; i < arrMau.Length; i++)
                {
                    htmlMau += @"<li class='radio'>
											<label>
												<input class='image_radio' type='radio' name='option[231]' value='" + arrMau[i] + @"'> 
												<div class='img-thumbnail icon icon-color' style='background: " + StaticData.getField("tb_Mau","MaMau","idMau",arrMau[i]) + @";'></div><i class='fa fa-check'></i>
												<label> </label>
											</label>
										</li>";
                }
                ulMau.InnerHtml = htmlMau;
            }
            else
            {
                dvConMau.Style.Add("display", "none");
            }

            
            if (table.Rows[0]["Size"].ToString().Trim() != "")
            {
                string htmlSize = "<div class='checkbox'>";
                string[] arrSize = table.Rows[0]["Size"].ToString().Split('-');
                for (int i = 0; i < arrSize.Length; i++)
                {
                    htmlSize += @"<li class='radio' style='padding-right:20px'>
											<label>
												<input onchange='ChonSize(this.value,this.checked)' class='image_radio' type='radio' name='option[231]' value='" + arrSize[i] + @"'>
												<div class='img-thumbnail icon icon-color'></div><i class='fa fa-check' style='color:red;'></i>
												<label style='top:0'>" + StaticData.getField("tb_Size", "Size", "idSize", arrSize[i]) + @"</label>
											</label>
										</li>";
                    //htmlSize += "<label for='checkbox_1'><input onchange='ChonSize(this.value,this.checked)' type='radio' name='size' value='" + arrSize[i] + @"' >" + StaticData.getField("tb_Size","Size","idSize",arrSize[i]) + @"</label>";
                }
                htmlSize += "</div>";
                dvSize.InnerHtml = htmlSize;
            }
            else
            {
                dvConSize.Style.Add("display", "none");
            }

            if (table.Rows[0]["Mau"].ToString().Trim() == "" && table.Rows[0]["Size"].ToString().Trim() == "")
            {
                dvConMauSize.Style.Add("display", "none");
            }

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