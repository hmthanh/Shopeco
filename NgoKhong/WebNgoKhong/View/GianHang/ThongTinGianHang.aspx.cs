using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_GianHang_ThongTinGianHang : System.Web.UI.Page
{
    public bool isNewest { get; set; }
    public bool isBestSeller { get; set; }
    public int isPriceOrder { get; set; }
    public string shopID { get; set; }
    public int PageSize = 20;
    public int pageNum = 1;
    #region Load san pham
    public string sqlPrefix { get; set; }
    public string sqlSubfix { get; set; }
    public string sqlCommand { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        isNewest = true;
        foreach (String key in Request.QueryString.AllKeys)
        {
            string[] values = Request.QueryString.GetValues(key);
            switch (key)
            {
                case "id":
                    shopID = values.First();
                    break;
                case "greate":
                    isPriceOrder = 1;
                    isNewest = false;
                    break;
                case "lowerp":
                    isPriceOrder = 2;
                    isNewest = false;
                    break;
                case "newest":
                    isNewest = true;
                    break;
                case "seller":
                    isNewest = false;
                    isBestSeller = true;
                    break;
                case "page":
                    try
                    {
                        pageNum = int.Parse(values.First());
                    }
                    catch (Exception)
                    {
                        pageNum = 1;
                    }
                    break;
                default:

                    break;
            }
        }

        string sql = "select * from tb_GianHang where ID = '" + shopID + "'";

        DataTable data = Connect.GetTable(sql);

        if (data.Rows.Count > 0)
        {
            DataRow row = data.Rows[0];

            string name = row["TenGianHang"].ToString();
            string diachi = row["DiaChi"].ToString();
            string mota = row["MoTas"].ToString();
            string chugianhang = row["ChuGianHang"].ToString();
            string sodienthoai = row["SoDienThoai"].ToString();

            tenGianHang.InnerHtml = name;

            string maqh = row["maqh"].ToString();
            string TenQuanHuyen = StaticData.getField("tb_QuanHuyen", "name", "maqh", maqh);
            string matp = StaticData.getField("tb_QuanHuyen", "matp", "maqh", maqh);
            string TenTinhThanh = StaticData.getField("tb_TinhThanhPho", "name", "matp", matp);

            diaChiGianHang.InnerHtml = diachi + " - " + TenQuanHuyen + " - " + TenTinhThanh;
            moTaGianHang.InnerHtml = mota;
            chuGianHang.InnerHtml = chugianhang;
            soDienThoai.InnerHtml = sodienthoai;

            LoadSanPham();
            LoadSortBy();
        }
    }
    private void LoadSortBy()
    {
        if (isBestSeller)
        {
            BestSeller.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
        }
        if (isNewest)
        {
            Newest.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
        }
        //if (isMostPopular)
        //{
        //    Popular.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
        //}
        if (isPriceOrder == 1)
        {
            gtSelect.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected ");

        }
        if (isPriceOrder == 2)
        {
            ltSelect.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected ");
        }
    }
    private string GetSQL_ListAll()
    {
        string orderby = "";
        if (isNewest)
        {
            orderby = " NgayTao desc ";
        }
        if (isPriceOrder == 1)
        {
            orderby = " GiaMoi desc ";
        }
        if (isPriceOrder == 2)
        {
            orderby = " GiaMoi asc ";
        }
        if (orderby == "")
        {
            orderby = "idSanPham desc";
        }

        sqlPrefix = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY " + orderby + " )AS RowNumber ,*,'LinkHinh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = s.idSanPham) from tb_SanPham s, tb_GianHang g where s.IDGianhang = g.ID and s.IDGianHang = " + shopID + " ";

        string sqlWhere = " ";
        List<string> sqlList = new List<string>();

        if (sqlList.Count > 0)
        {
            sqlWhere += " and ";
        }
        for (int i = 0; i < sqlList.Count; i++)
        {
            sqlWhere += sqlList[i];
            if (i < sqlList.Count - 1)
            {
                sqlWhere += " and ";
            }
        }

        string sqlPaging = @") as tb1 WHERE RowNumber BETWEEN (" + pageNum + " - 1) * " + PageSize + " + 1 AND (((" + pageNum + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";
        return sqlPrefix + sqlWhere + sqlPaging;
    }

    #endregion
    #region Danh sach san pham
    private void LoadSanPham()
    {
        string sql = GetSQL_ListAll();
        DataTable table = Connect.GetTable(sql);

        if (table == null)
        {
            return;
        }

        string html = "";
        curentPage.InnerText = pageNum.ToString();
        pageNumbers.InnerText = ((table.Rows.Count / PageSize) + 1).ToString();
        for (int i = 0; i < table.Rows.Count; i++)
        {
            string sqlha = "select * from tb_HinhAnhSanPham where idSanPham = " + table.Rows[i]["idSanPham"];
            DataTable tbha = Connect.GetTable(sqlha);
            string Anh1 = "";
            string Anh2 = "";
            if (tbha.Rows.Count > 0)
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
            html += "       <div class='left-block left-b' style='height: 230px'>";
            html += @"           <div class='product-image-container second_img'>

									<a href='" + link + @"' target='_self' title='Lastrami bacon' style='height: 229px; display: flex; align-items: center'>
										<img src='" + Anh1 + @"' class='img-1 img-responsive' alt='image1' style='max-height: 229px'>
										
									</a>

								</div>";
            html += "       </div>";
            html += "       <div class='right-block'>";
            html += @"          <div class='button-group so-quickview cartinfo-left' style='top:10px'>
								<button type='button' class='addToCart' title='Mua ngay'>
									<a href='" + link + @"' target='_self' title='Lastrami bacon'><span>Mua ngay</span><a>  
								</button>
							</div>";
            html += @"          <div class='caption hide-cont'>
									<h4><a href='" + link + @"' title='Pastrami bacon' target='_self'>" + MyStaticData.Cut(table.Rows[i]["TenSanPham"].ToString(), 44) + @"</a></h4>
								</div>";
            html += @"          <p class='price'>
									<span class='price-new'>" + StaticData.FormatDouble(table.Rows[i]["GiaMoi"].ToString()) + @"Đ</span>
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
    }

    #endregion
}