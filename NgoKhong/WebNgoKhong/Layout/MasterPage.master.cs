using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_MasterPage : System.Web.UI.MasterPage
{
   string URL = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            if (Session["CurrentUser"].ToString() != "")
            {
                string id = Session["CurrentUser"].ToString();
                string name = StaticData.getField("tb_User", "Username", "ID", id);
                
                if (string.IsNullOrEmpty(name))
                {
                    name = "Username";
                }
                else
                {
                    if (name.Length > 10)
                    {
                        name = name.Substring(0, 10) + "...";
                    }
                }
                
                //AccountControl.InnerHtml = "<li><a ><i class='fa fa-user'></i>" + email + "</a></li><li><a href='/logout'><i class='fa fa-sign-out'></i>Đăng xuất</a></li>";
                my_account.InnerHtml = "<a href='" + GetRouteUrl("userinfo", new { }) + "' title='My Account ' class='btn-xs dropdown-toggle' data-toggle='dropdown'> <span class='hidden-xs' > <b>" + name + " </b></span></a>";
                accountControl.InnerHtml = "<a href='" + GetRouteUrl("userinfo", new { }) + "'><b> " + name + "</b></a><a href='" + GetRouteUrl("logout", new { }) + "'><p>Đăng xuất</p></a>";
               // accountControl.InnerHtml = "<a href='" + GetRouteUrl("logout",new { }) + "'><b>Đăng xuất</b></a>";
            }
            else
            {
                //string html = "<li><a href=\"/register\"><i class=\"fa fa-user\"></i> Đăng ký</a></li><li><a href=\"/login\"><i class=\"fa fa-pencil-square-o\"></i> Đăng nhập</a></li>";
                //AccountControl.InnerHtml = "";
                accountControl.InnerHtml = "<a href='" + GetRouteUrl("register", new {}) + "'><b>Đăng ký</b></a><a href='" + GetRouteUrl("login", new { }) + "'><p>Đăng nhập</p></a>";
            }
        }
        else
        {
            //string html = "<li><a href=\"/register\"><i class=\"fa fa-user\"></i> Đăng ký</a></li><li><a href=\"/login\"><i class=\"fa fa-pencil-square-o\"></i> Đăng nhập</a></li>";
            //AccountControl.InnerHtml = html;
            my_account.InnerHtml = "";
            accountControl.InnerHtml = "<a href='" + GetRouteUrl("register", new { }) + "'><b>Đăng ký</b></a><a href='" + GetRouteUrl("login", new { }) + "'><p>Đăng nhập</p></a>";
        }
        try
        {
            URL = ((System.Web.Routing.PageRouteHandler)Page.RouteData.RouteHandler).VirtualPath.ToUpper();
        }
        catch { }

        if (!IsPostBack)
        {
            //LoadQuickLink();
            //LoadInfomation();
            LoadMenu();
            LoadLoaiSanPham();
            DataTable cart = new DataTable();
            if (Session["CartSession"] == null)
            {
                cart.Columns.Add("idSanPham");
                cart.Columns.Add("idMau");
                cart.Columns.Add("idSize");
                cart.Columns.Add("SoLuong");
                cart.Columns.Add("Gia");
            }
            else
            {
                cart = Session["CartSession"] as DataTable;
            }

            double TT = 0;
            //lblSoLuongGioHang.InnerHtml = cart.Rows.Count.ToString();
            string html = "";
            if (cart.Rows.Count > 0)
            {
                html = @"<ul class='dropdown-menu pull-right shoppingcart-box' role='menu'>
                                        <li>
                                            <table class='table table-striped'>
                                                <tbody>";
                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    string sqlsp = "select *, 'Anh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = sp.idSanPham) from tb_SanPham sp where idSanPham = " + cart.Rows[i]["idSanPham"];
                    DataTable tb = Connect.GetTable(sqlsp);
                    TT += (double.Parse(cart.Rows[i]["Gia"].ToString()) * double.Parse(cart.Rows[i]["SoLuong"].ToString()));
                    string link = GetRouteUrl("product", new { nameEn = MyStaticData.GenerateURL(tb.Rows[0]["TenSanPham"].ToString()), id = tb.Rows[0]["idSanPham"].ToString() });
                    html += @"
                                                    <tr>
                                                        <td class='text-center' style='width: 70px'>
                                                            <a href='" + link + @"'>
                                                                <img src='" + MyStaticData.LinkAnh(tb.Rows[0]["Anh"].ToString()) + @"' style='width: 70px' alt='Yutculpa ullamcon' title='Yutculpa ullamco' class='preview'>
                                                            </a>
                                                        </td>
                                                        <td class='text-left'><a class='cart_product_name' href='" + link + @"'>" + tb.Rows[0]["TenSanPham"].ToString() + @" - " + StaticData.getField("tb_Mau", "TenMau", "idMau", cart.Rows[i]["idMau"].ToString()) + @" - "
+ StaticData.getField("tb_Size", "Size", "idSize", cart.Rows[i]["idSize"].ToString()) + @" </a>
                                                        </td>
                                                        <td class='text-center'>x" + cart.Rows[i]["SoLuong"] + @"</td>
                                                        <td class='text-center'>" + StaticData.FormatDouble(cart.Rows[i]["Gia"].ToString()) + @"</td>
                                                    </tr>";
                }
                html += @"    
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <div>
                                                <table class='table table-bordered'>
                                                    <tbody>
                                                        <tr>
                                                            <td class='text-left'><strong>Tổng tiền</strong>
                                                            </td>
                                                            <td class='text-right'>" + StaticData.FormatDouble(TT.ToString()) + @"</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <p class='text-right'>
                                                    <a class='btn view-cart' href='/cart'><i class='fa fa-shopping-cart'></i>Xem giỏ hàng</a>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>";
            }
            dvSanPham.InnerHtml = html;
            if (TT <= 0)
            {
               // TongTien.InnerHtml = "";
            }
            else
            {
                //TongTien.InnerHtml = StaticData.FormatDouble(TT.ToString());
            }
            
            int soluong = cart.Rows.Count;
            
            if (soluong < 10)
            {
                lblSoLuongGioHang.InnerHtml = "0" + soluong.ToString();
            }
            else
            {
                lblSoLuongGioHang.InnerHtml = soluong.ToString();
            }
        }

    }
    private void LoadLoaiSanPham()
    {
        string strSql = "select * from tb_LoaiSanPham where KichHoat = 1 and idCapCha = 0 order by idLoaiSanPham asc";
        DataTable tb = Connect.GetTable(strSql);
        if (tb == null)
        {
            return;
        }
        //Loại sản phẩm tìm kiếm
        //slLoaiSanPham.DataSource = tb;
        //slLoaiSanPham.DataTextField = "TenLoaiSanPham";
        //slLoaiSanPham.DataValueField = "idLoaiSanPham";
        //slLoaiSanPham.DataBind();
        //slLoaiSanPham.Items.Add(new ListItem("Sản phẩm", "0"));
        //slLoaiSanPham.Items.FindByValue("0").Selected = true;

        //Loại sản phẩm
        string html = @"<span id='remove-verticalmenu' class='fa fa-times'></span>
                            <div class='megamenu-pattern'>
                                <div class='container-mega'>
                                    <ul class='megamenu'>";

        string searchCat = "<select class='no-border' name='cat' id='selectCat'>";
        searchCat += "<option value='0'>Danh mục</option>";
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            //<img style='width: 13px;margin-top: -2px;' src='" + tb.Rows[i]["icon"] + @"' alt='icon'/>
            string link = GetRouteUrl("searchs", new { cat = tb.Rows[i]["idLoaiSanPham"].ToString()});
            html += "<li class='item-vertical with-sub-menu hover'>";
            html += "  <p class='close-menu'></p>";
            html += "  <a href='" + link + "' class='clearfix'>";
            html += "     <i class=" + tb.Rows[i]["Icon"].ToString() + "></i>";
            html += "      <span>" + tb.Rows[i]["TenLoaiSanPham"] + "</span>";
            searchCat += "<option value='" + tb.Rows[i]["idLoaiSanPham"] + "'>" + tb.Rows[i]["TenLoaiSanPham"] + "</option>";


            string strSqlCap2 = "select * from tb_LoaiSanPham where KichHoat = 1 and idCapCha = " + tb.Rows[i]["idLoaiSanPham"] + " order by TenLoaiSanPham";
            DataTable tbCap2 = Connect.GetTable(strSqlCap2);
            if (tbCap2.Rows.Count > 0)
            {
                html += @"<b class='fa-angle-right'></b></a>
                          <div class='sub-menu' data-subwidth='60'>
                            <div class='content'>
                                <div class='row'>
                                    <div class='col-sm-12'>
                                        <div class='row'>";
                for (int j = 0; j < tbCap2.Rows.Count; j += 2)
                {
                    html += @"<div class='col-md-4 static-menu'>
                                <div class='menu'>
                                    <ul>";
                    for (int k = j; k < (j + 2); k++)
                    {
                        if (k < tbCap2.Rows.Count)
                        {
                            link = GetRouteUrl("searchs", new { cat = tbCap2.Rows[k]["idLoaiSanPham"].ToString()});
                            html += @"<li>
                                        <a href='" + link + @"' class='main-menu'>" + tbCap2.Rows[k]["TenLoaiSanPham"] + "</a>";
                            string strSqlCap3 = "select * from tb_LoaiSanPham where KichHoat = 1 and idCapCha = " + tbCap2.Rows[k]["idLoaiSanPham"] + " order by TenLoaiSanPham";
                            DataTable tbCap3 = Connect.GetTable(strSqlCap3);
                            if (tbCap3.Rows.Count > 0)
                            {
                                html += "<ul>";
                                for (int h = 0; h < tbCap3.Rows.Count; h++)
                                {
                                    link = GetRouteUrl("searchs", new { cat = tbCap3.Rows[h]["idLoaiSanPham"].ToString() });
                                    html += "<li><a href='" + link + @"'>" + tbCap3.Rows[h]["TenLoaiSanPham"] + "</a></li>";
                                }
                                html += "</ul>";
                            }
                            html += "</li>";
                        }
                    }
                    html += "       </ul>";
                    html += "   </div>";
                    html += "</div>";
                }
                html += "               </div>";
                html += "           </div>";
                html += "       </div>";
                html += "   </div>";
                html += "</div>";
            }
            else
            {
                html += "</a>";
            }
            html += "</li>";
        }
        html += "</ul";
        html += "</div";
        html += "</div";
        ulLoaiSanPham.InnerHtml = html;

        searchCat += "</select>";
        //searchCategories.InnerHtml = searchCat;

        if (URL.Contains("/HOME/"))
        {
            ulLoaiSanPham.Style.Add("visibility", "visible");
        }
    }
    public void LoadQuickLink()
    {
        string sql = "select * from tb_Page where Active = 1";
        DataTable table = Connect.GetTable(sql);
        string html = "";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "<li><a href='/pages/" + MyStaticData.GenerateURL(table.Rows[i]["TenPage"].ToString()) + "-" + table.Rows[i]["idPage"].ToString() + "'>" + table.Rows[i]["TenPage"] + "</a></li>";
        }
        //ulQuickLink.InnerHtml = html;
    }
    public void LoadInfomation()
    {
        string sql = "select top 1 * from tb_ThongTin order by idThongTin desc";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
        {
            //aGmail.InnerHtml = table.Rows[0]["Email"].ToString();
            //pThongTin.InnerHtml = "Địa chỉ: " + table.Rows[0]["DiaChi"] + "<br> Email: " + table.Rows[0]["Email"] + "<br> Số điện thoại: " + table.Rows[0]["SoDienThoai"];
            //aEvent.InnerHtml = table.Rows[0]["Event"].ToString();
            //aEventMobile.InnerHtml = table.Rows[0]["Event"].ToString();
            //alogo.InnerHtml = "<img class='nav-bar mobile_nav' src='" + table.Rows[0]["Logo"].ToString() + "' id='mobile_logo' alt='" + table.Rows[0]["Name"].ToString() + @"' itemprop='logo'/>
            //<img class='nav-bar desktop_nav' src='" + table.Rows[0]["Logo"].ToString() + "' alt='" + table.Rows[0]["Name"].ToString() +"' itemprop='logo'/>";
        }
    }

    private void LoadMenu()
    {
        string html = @"";
        ///////// Home
        //html += "<li " + (URL.Contains("/HOME/") ? "class='home'" : "") + "><p class='close-menu'></p>";
        //html += "   <a href='/' class='clearfix'><strong>Trang chủ</strong></a>";
        //html += "</li>";
        /////////// Home
        //html += "<li class='with-sub-menu hover" + (URL.Contains("/TINTUC/") ? " home" : "") + "'><p class='close-menu'></p>";
        //html += "   <a href='" + GetRouteUrl("new", new { nameEn = "tin-tuc", id = 0 }) + "' class='clearfix'><strong>Tin tức</strong>";
        //html += "       <img class='label-hot' src='/Content/UI/image/catalog/menu/new-icon.png' alt='icon items'><b class='caret'></b>";
        //html += "   </a>";
        //string sqltintuc = "select * from tb_LoaiTinTuc where Active = 1";
        //DataTable tbtintuc = Connect.GetTable(sqltintuc);
        //if (tbtintuc.Rows.Count > 0)
        //{
        //    html += "   <div class='sub-menu' style='width: 50%; right: inherit;'>";
        //    html += "       <div class='content' style='padding-top: 10px; padding-bottom: 10px; '>";
        //    html += "           <div class='row'>";
        //    html += "                   <ul class='row-list'>";
        //    for (int i = 0; i < tbtintuc.Rows.Count; i++)
        //    {
        //        html += "                   <li><a href='" + GetRouteUrl("new", new { nameEn = MyStaticData.GenerateURL(tbtintuc.Rows[i]["TenLoaiTinTuc"].ToString()), id = tbtintuc.Rows[i]["idLoaiTinTuc"] }) + "'>" + tbtintuc.Rows[i]["TenLoaiTinTuc"] + "</a></li>";
        //    }
        //    html += "                   </ul>";
        //    html += "           </div>";
        //    html += "       </div>";
        //    html += "   </div>";
        //}
        //html += "</li>";
        /////////// Home

        //html += "<li " + (URL.Contains("/Page/Page.aspx?idPage=1".ToUpper()) ? "class='home'" : "") + "><p class='close-menu'></p>";
        //html += "   <a href='" + GetRouteUrl("pageGT", new { }) + "' class='clearfix'><strong>Giới thiệu</strong></a>";
        //html += "</li>";
        /////////// Home
        //html += "<li " + (URL.Contains("/Page/Page.aspx?idPage=2".ToUpper()) ? "class='home'" : "") + "><p class='close-menu'></p>";
        //html += "   <a href='" + GetRouteUrl("pageLH", new { }) + "' class='clearfix'><strong>Liên hệ</strong></a>";
        //html += "</li>";



        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/ThuongHieu.png' /><strong>Thương hiệu</strong></a>";
        html += "</li>";
        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/NapThe.png' /><strong>Dịch vụ & Nạp thẻ</strong></a>";
        html += "</li>";
        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/MaGiamGia.png' /><strong>Mã giảm giá</strong></a>";
        html += "</li>";
        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/TinTuc.png' /><strong>Tin tức</strong></a>";
        html += "</li>";
        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/HuongDan.png' /><strong>Hướng dẫn</strong></a>";
        html += "</li>";
        html += "<li><p class='close-menu'></p>";
        html += "   <a href='/' class='clearfix'><img src='../images/HeThong/KiemTra.png' /><strong>Kiểm tra hàng</strong></a>";
        html += "</li>";
        //sidebar.InnerHtml = html;
    }
}