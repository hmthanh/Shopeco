using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Layout_MasterPage : System.Web.UI.MasterPage
{
    string _TenDangNhap = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["retUrl"] != null)
        {
            string url = Request.QueryString["retUrl"].ToString();
            Response.Redirect(url);
        }
        //if (Request.Cookies["WebAAu_Login"] != null && Request.Cookies["WebAAu_Login"].Value.Trim() != "")
        if (Session["AdminUser"] != null)
        {
            //_TenDangNhap = Request.Cookies["WebAAu_Login"]["UserName"].Trim();
            _TenDangNhap = Session["AdminUser"].ToString();
        }
        else
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            Response.RedirectToRoute("adminlogin", new { retUrl = url });
            return;
        }
        if (!IsPostBack)
        {
            LoadMenu();
        }
    }
    private void LoadMenu()
    {
        string idAdmin = Session["AdminUser"].ToString();
        string quyen = StaticData.getField("tb_Admin", "Quyen", "idAdmin", idAdmin);

        //string[] dsQuen = quyen.Split(' ');
        
        
        string URL = HttpContext.Current.Request.Url.AbsoluteUri.ToLower();
        string URLGOC = ((PageRouteHandler)Page.RouteData.RouteHandler).VirtualPath;
        if (!string.IsNullOrEmpty(URLGOC))
        {
            URLGOC = URLGOC.ToLower();
        }
        string html = "<li class='header' style='color:white; background-color: rgb(60, 141, 188);font-size: 14px;font-family: -webkit-body; font-weight:bold;text-shadow: rgba(0,0,0,0.25) 0 -1px 0;box-shadow: rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0;'><img src='/Admin/Content/images/management.png' class='imgcategorymenu'/>DANH MỤC QUẢN LÝ</li>";
        //string url = GetRouteUrl("", new { });
        //if (path.Contains("/ORDER/"))
        //{
        //    html += "<li class='active'>";
        //    htmlmainbar = "<h3><i class='fa fa-table'></i>&nbsp;Order</h3>";
        //}
        //else
        //    html += "<li>";
        //html += @"<a href='dashboard.html'><i class='fa fa-table'></i><span class='link-title'>&nbsp;Order</span></a>";
        //html += "</li>";
        //if (path.Contains(.ToLower())){
        //    html += "<a>abc</a>";
        //}
        string path = HttpContext.Current.Request.Url.PathAndQuery.ToLower();
        
        //html += URL + "_" + GetRouteUrl("adminMauSize", new { });

        
        if (quyen.Contains("1"))
        {
            html += "<li class='treeview " + (path.Contains("/admin/website") ? " active menu-open" : "") + "'>";
            html += "   <a href='javascript:;'><i class='fa fa-book'></i> <span class='link-title'>Quản Lý Website</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>";
            html += "   <ul class='treeview-menu'>";

            html += "<li" + (path.Contains(GetRouteUrl("adminMauSize", new { }).ToLower()) ? " class='active'" : "") + ">";
            html += "   <a href='" + GetRouteUrl("adminMauSize", new { }) + "'><i class='fa fa-circle-o'></i><span class='link-title'>&nbsp;Cài đặt Màu & Size</span></a>";
            html += "</li>";

            html += "<li" + (path.Contains(GetRouteUrl("adminslide", new { }).ToLower()) ? " class='active'" : "") + ">";
            html += "   <a href='" + GetRouteUrl("adminslide", new { }) + "'><i class='fa fa-circle-o'></i><span class='link-title'>&nbsp;Slide</span></a>";
            html += "</li>";

            html += "<li" + (path.Contains(GetRouteUrl("adminbanner", new { }).ToLower()) ? " class='active'" : "") + ">";
            html += "   <a href='" + GetRouteUrl("adminbanner", new { }) + "'><i class='fa fa-circle-o'></i><span class='link-title'>&nbsp;Banner</span></a>";
            html += "</li>";

            html += "<li" + (path.Contains(GetRouteUrl("adminbrands", new { }).ToLower()) ? " class='active'" : "") + ">";
            html += "   <a href='" + GetRouteUrl("adminbrands", new { }) + "'><i class='fa fa-circle-o'></i><span class='link-title'>&nbsp;Thương hiệu</span></a>";
            html += "</li>";

            html += "       <li" + (path.Contains(GetRouteUrl("adminLoaiSanPham", new { }).ToLower()) ? " class='active'" : "") + ">";
            html += "           <a href='" + GetRouteUrl("adminLoaiSanPham", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Danh mục sản phẩm </a>";
            html += "       </li>";

            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminpages", new { }).ToLower()) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminpages", new { id = 1 }) + "'><i class='fa fa-circle-o'></i> <span class='link-title'>Cập nhật trang</span></a>";
            html += "</li>";

            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminNhanEmail", new { })) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminNhanEmail", new { }) + "'><i class='fa fa-circle-o'></i> <span class='link-title'>Nhận Email</span></a>";
            html += "</li>";

            html += "   </ul>";
            html += "</li>";
        }



        //////////////////////////////////////////////////////////////
        if (quyen.Contains("2"))
        {
            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminCustomer", new { })) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminCustomer", new { }) + "'><i class='fa fa-users'></i> </i> <span class='link-title'>Quản lý khách hàng</span></a>";
            html += "</li>";
        }

        //////////////////////////////////////////////////////////////
        if (quyen.Contains("3"))
        {
            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminSanPham", new { })) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminSanPham", new { }) + "'><i class='fa fa-product-hunt'></i> <span class='link-title'>Quản lý sản phẩm</span></a>";
            html += "</li>";
        }

        //////////////////////////////////////////////////////////////
        if (quyen.Contains("4"))
        {
            html += "<li class='treeview " + (path.Contains("/admin/order") ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminDonHang", new { }) + "'><i class='fa fa-cubes'></i> <span class='link-title'> Quản Lý Đơn Hàng</span></a>";
            //html += "   <ul class='treeview-menu'>";
            //html += "       <li" + (path.Contains(GetRouteUrl("adminDonHang", new { id = 1 })) ? " class='active'" : "") + ">";
            //html += "           <a href='" + GetRouteUrl("adminDonHang", new { id = 1 }) + "'><i class='fa fa-circle-o'></i>&nbsp; Mới </a>";
            //html += "       </li>";
            //html += "       <li" + (path.Contains(GetRouteUrl("adminDonHang", new { id = 2 })) ? " class='active'" : "") + ">";
            //html += "           <a href='" + GetRouteUrl("adminDonHang", new { id = 2 }) + "'><i class='fa fa-circle-o'></i>&nbsp; Đang xử lý </a>";
            //html += "       </li>";
            //html += "       <li" + (path.Contains(GetRouteUrl("adminDonHang", new { id = 3 })) ? " class='active'" : "") + ">";
            //html += "           <a href='" + GetRouteUrl("adminDonHang", new { id = 3 }) + "'><i class='fa fa-circle-o'></i>&nbsp; Hoàn tất </a>";
            //html += "       </li>";
            //html += "       <li" + (path.Contains(GetRouteUrl("adminDonHang", new { id = 4 })) ? " class='active'" : "") + ">";
            //html += "           <a href='" + GetRouteUrl("adminDonHang", new { id = 4 }) + "'><i class='fa fa-circle-o'></i>&nbsp; Hủy </a>";
            //html += "       </li>";

            //html += "   </ul>";
            html += "</li>";
        }
        ///////////////////////////////////////////////////////////////


        if (quyen.Contains("5"))
        {
            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminRaoVat", new { })) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminRaoVat", new { }) + "'><i class='fa fa-cubes'></i> <span class='link-title'>Quản Lý Rao Vặt</span></a>";
            html += "</li>";
        }

        //html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminhinhanhraovat", new { })) ? " active menu-open" : "") + "'>";
        //html += "   <a href='javascript:;'><i class='fa fa-product-hunt'></i> <span class='link-title'>Rao vặt</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>";
        //html += "   <ul class='treeview-menu'>";
        //html += "       <li" + (path.Contains("/ADMIN/CATEGORY-PRODUCT/") ? " class='active'" : "") + ">";
        //html += "           <a href='" + GetRouteUrl("adminRaoVat", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Danh sách </a>";
        //html += "       </li>";
        //html += "       <li" + (path.Contains("/ADMIN/PRODUCT/") ? " class='active'" : "") + ">";
        //html += "           <a href='" + GetRouteUrl("adminhinhanhraovat", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Hình ảnh </a>";
        //html += "       </li>";
        //html += "   </ul>";
        //html += "</li>";

        //html += "<li class='treeview " + (path.Contains("/admin/statistic") ? " active menu-open" : "") + "'>";
        //html += "   <a href='" + GetRouteUrl("adminDonHang", new { }) + "'><i class='fa fa-bar-chart'></i> <span class='link-title'>Thống kê</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>";
        //html += "   <ul class='treeview-menu'>";

        //html += "       <li" + (path.Contains(GetRouteUrl("adminDonHangThongke", new {  })) ? " class='active'" : "") + ">";
        //html += "           <a href='" + GetRouteUrl("adminDonHangThongke", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp;Đơn hàng</a>";
        //html += "       </li>";

        ////html += "       <li" + (path.Contains(GetRouteUrl("adminGianHangThongke", new { })) ? " class='active'" : "") + ">";
        ////html += "           <a href='" + GetRouteUrl("adminGianHangThongke", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp;Gian hàng</a>";
        ////html += "       </li>";

        //html += "   </ul>";
        //html += "</li>";

        if (quyen.Contains("6"))
        {
            html += "<li class='treeview " + (path.Contains(GetRouteUrl("adminUser", new { })) ? " active menu-open" : "") + "'>";
            html += "   <a href='" + GetRouteUrl("adminUser", new { }) + "'><i class='fa fa-user'></i> <span class='link-title'>Tài khoản hệ thống</span></a>";
            html += "</li>";
        }

        //html += "<li class='treeview " + (path.Contains("/ADMIN/PAGES/LIEN-HE-2") ? " active menu-open" : "") + "'>";
        //html += "   <a href='" + GetRouteUrl("adminpages", new { name = "lien-he", id = 2 }) + "'><i class='fa fa-phone'></i> <span class='link-title'>Liên hệ</span></a>";
        //html += "</li>";

        //html += "<li class='treeview " + (path.Contains("/ADMIN/PAGES/HUONG-DAN-3") ? " active menu-open" : "") + "'>";
        //html += "   <a href='" + GetRouteUrl("adminpages", new { name = "huong-dan", id = 3 }) + "'><i class='fa fa-phone'></i> <span class='link-title'>Hướng dẫn</span></a>";
        //html += "</li>";

        //html += "       <li" + (path.Contains("/ADMIN/CATEGORY-NEWS/") ? " class='active'" : "") + ">";
        //html += "           <a href='" + GetRouteUrl("adminLoaiTinTuc", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Loại tin tức </a>";
        //html += "       </li>";
        //html += "       <li" + (path.Contains("/ADMIN/NEWS/") ? " class='active'" : "") + ">";
        //html += "           <a href='" + GetRouteUrl("adminTinTuc", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Tin tức </a>";
        //html += "       </li>";

        menu.InnerHtml = html;
        //mainbar.InnerHtml = htmlmainbar;
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Cookies.Clear();
        Response.Redirect(GetRouteUrl("adminlogin", new { }));
    }
}