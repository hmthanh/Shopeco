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
        //if (Request.Cookies["WebAAu_Login"] != null && Request.Cookies["WebAAu_Login"].Value.Trim() != "")
        if (Session["AdminUser"] != null)
        {
            //_TenDangNhap = Request.Cookies["WebAAu_Login"]["UserName"].Trim();
            _TenDangNhap = Session["AdminUser"].ToString();
        }
        else
        {
            Response.Redirect(GetRouteUrl("adminlogin", new { }));
        }
        if (!IsPostBack)
        {
            LoadMenu();
        }
    }
    private void LoadMenu()
    {
        string URL = HttpContext.Current.Request.Url.AbsoluteUri.ToUpper();
        string URLGOC = ((PageRouteHandler)Page.RouteData.RouteHandler).VirtualPath.ToUpper();
        string html = "<li class='header' style='color:white; background-color: rgb(60, 141, 188);font-size: 14px;font-family: -webkit-body; font-weight:bold;text-shadow: rgba(0,0,0,0.25) 0 -1px 0;box-shadow: rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0;'><img src='/Admin/Content/images/management.png' class='imgcategorymenu'/>DANH MỤC QUẢN LÝ</li>";

        //if (URL.Contains("/ORDER/"))
        //{
        //    html += "<li class='active'>";
        //    htmlmainbar = "<h3><i class='fa fa-table'></i>&nbsp;Order</h3>";
        //}
        //else
        //    html += "<li>";
        //html += @"<a href='dashboard.html'><i class='fa fa-table'></i><span class='link-title'>&nbsp;Order</span></a>";
        //html += "</li>";
        html += "<li" + (URL.Contains("/ADMIN/VIEW/MAUSIZE/") ? " class='active'" : "") + ">";
        html += "   <a href='" + GetRouteUrl("adminMauSize", new { }) + "'><i class='fa fa-puzzle-piece'></i><span class='link-title'>&nbsp;Cài đặt Màu & Size</span></a>";
        html += "</li>";

        html += "<li class='treeview " + (URLGOC.Contains("/ADMIN/VIEW/TINTUC/") ? " active menu-open" : "") + "'>";
        html += "   <a href='javascript:;'><i class='fa fa-book'></i> <span class='link-title'>Tin tức</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>";
        html += "   <ul class='treeview-menu'>";
        html += "       <li" + (URL.Contains("/ADMIN/CATEGORY-NEWS/") ? " class='active'" : "") + ">";
        html += "           <a href='" + GetRouteUrl("adminLoaiTinTuc", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Loại tin tức </a>";
        html += "       </li>";
        html += "       <li" + (URL.Contains("/ADMIN/NEWS/") ? " class='active'" : "") + ">";
        html += "           <a href='" + GetRouteUrl("adminTinTuc", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Tin tức </a>";
        html += "       </li>";
        html += "   </ul>";
        html += "</li>";

        html += "<li class='treeview " + (URLGOC.Contains("/ADMIN/VIEW/SANPHAM/") ? " active menu-open" : "") + "'>";
        html += "   <a href='javascript:;'><i class='fa fa-product-hunt'></i> <span class='link-title'>Sản phẩm</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a>";
        html += "   <ul class='treeview-menu'>";
        html += "       <li" + (URL.Contains("/ADMIN/CATEGORY-PRODUCT/") ? " class='active'" : "") + ">";
        html += "           <a href='" + GetRouteUrl("adminLoaiSanPham", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Loại sản phẩm </a>";
        html += "       </li>";
        html += "       <li" + (URL.Contains("/ADMIN/PRODUCT/") ? " class='active'" : "") + ">";
        html += "           <a href='" + GetRouteUrl("adminSanPham", new { }) + "'><i class='fa fa-circle-o'></i>&nbsp; Sản phẩm </a>";
        html += "       </li>";
        html += "   </ul>";
        html += "</li>";

        html += "<li class='treeview " + (URLGOC.Contains("/ADMIN/VIEW/NGUOIDUNG/") ? " active menu-open" : "") + "'>";
        html += "   <a href='" + GetRouteUrl("adminUser", new { }) + "'><i class='fa fa-user'></i> <span class='link-title'>Người dùng</span></a>";
        html += "</li>";

        html += "<li class='treeview " + (URLGOC.Contains("/ADMIN/VIEW/DONHANG/") ? " active menu-open" : "") + "'>";
        html += "   <a href='" + GetRouteUrl("adminDonHang", new { }) + "'><i class='fa fa-cubes'></i> <span class='link-title'>Đơn hàng</span></a>";
        html += "</li>";

        html += "<li" + (URL.Contains("/ADMIN/SLIDE/") ? " class='active'" : "") + ">";
        html += "   <a href='" + GetRouteUrl("adminslide", new { }) + "'><i class='fa fa-image'></i><span class='link-title'>&nbsp;Slide</span></a>";
        html += "</li>";

        html += "<li" + (URL.Contains("/ADMIN/BANNER/") ? " class='active'" : "") + ">";
        html += "   <a href='" + GetRouteUrl("adminbanner", new { }) + "'><i class='fa fa-image'></i><span class='link-title'>&nbsp;Banner</span></a>";
        html += "</li>";

        html += "<li" + (URL.Contains("/ADMIN/BRANDS/") ? " class='active'" : "") + ">";
        html += "   <a href='" + GetRouteUrl("adminbrands", new { }) + "'><i class='fa fa-image'></i><span class='link-title'>&nbsp;Thương hiệu</span></a>";
        html += "</li>";

        html += "<li class='treeview " + (URL.Contains("/ADMIN/PAGES/?ID=1") ? " active menu-open" : "") + "'>";
        html += "   <a href='" + GetRouteUrl("adminpages", new { id = 1 }) + "'><i class='fa fa-info'></i> <span class='link-title'>Cập nhật thông tin</span></a>";
        html += "</li>";

        html += "<li class='treeview " + (URL.Contains("/ADMIN/PAGES/LIEN-HE-3") ? " active menu-open" : "") + "'>";
        html += "   <a href=''" + GetRouteUrl("adminpages", new { name = "lien-he", id = 3 }) + "'><i class='fa fa-phone'></i> <span class='link-title'>Liên hệ</span></a>";
        html += "</li>";

        html += "<li class='treeview " + (URLGOC.Contains("/ADMIN/VIEW/NHANEMAIL/") ? " active menu-open" : "") + "'>";
        html += "   <a href='" + GetRouteUrl("adminNhanEmail", new { }) + "'><i class='fa fa-user'></i> <span class='link-title'>Nhận Email</span></a>";
        html += "</li>";

        menu.InnerHtml = html;
        //mainbar.InnerHtml = htmlmainbar;
    }
}
