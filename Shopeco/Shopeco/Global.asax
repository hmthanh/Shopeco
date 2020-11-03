<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("adminUser", "admin/user/list", "~/Admin/View/NguoiDung/NguoiDung.aspx"); 
        routes.MapPageRoute("adminDonHang", "admin/DonHang/list", "~/Admin/View/DonHang/DonHang.aspx");
        routes.MapPageRoute("adminlogin", "admin/login", "~/Admin/View/DangNhap/DangNhap.aspx");
        routes.MapPageRoute("adminNhanEmail", "admin/user/NhanEmail", "~/Admin/View/NhanEmail/NhanEmail.aspx"); 
        routes.MapPageRoute("adminTinTuc", "admin/news/list", "~/Admin/View/TinTuc/TinTuc.aspx");
        routes.MapPageRoute("adminCapNhatTinTuc", "admin/news/new-update-{id}", "~/Admin/View/TinTuc/TinTuc-CapNhat.aspx");
        routes.MapPageRoute("adminLoaiTinTuc", "admin/category-news/list-new", "~/Admin/View/TinTuc/LoaiTinTuc.aspx");
        routes.MapPageRoute("adminCapNhatLoaiTinTuc", "admin/category-news/new-update-{id}", "~/Admin/View/TinTuc/LoaiTinTuc-CapNhat.aspx");
        routes.MapPageRoute("adminLoaiSanPham", "admin/category-product/list-product", "~/Admin/View/SanPham/LoaiSanPham.aspx");
        routes.MapPageRoute("adminCapNhatLoaiSanPham", "admin/category-product/product-update-{id}", "~/Admin/View/SanPham/LoaiSanPham-CapNhat.aspx");
        routes.MapPageRoute("adminSanPham", "admin/product/list", "~/Admin/View/SanPham/SanPham.aspx");
        routes.MapPageRoute("adminMauSize", "admin/colorsize/list", "~/Admin/View/MauSize/MauSize.aspx");
        routes.MapPageRoute("adminCapNhatSanPham", "admin/product/product-update-{id}", "~/Admin/View/SanPham/SanPham-CapNhat.aspx");
        routes.MapPageRoute("adminbanner", "admin/banner/list", "~/Admin/View/Banner/Banner.aspx");
        routes.MapPageRoute("adminbannerupdate", "admin/banner/banner-update-{id}", "~/Admin/View/Banner/Banner-CapNhat.aspx");
        routes.MapPageRoute("adminbrands", "admin/brands/brands", "~/Admin/View/Brands/Brands.aspx");
        routes.MapPageRoute("adminbrandsupdate", "admin/brands/brands-update-{id}", "~/Admin/View/Brands/ThemBrands.aspx");
        routes.MapPageRoute("adminslide", "admin/slide/list", "~/Admin/View/Slide/Slide.aspx");
        routes.MapPageRoute("adminslideupdate", "admin/slide/slide-update-{id}", "~/Admin/View/Slide/Slide-CapNhat.aspx");
        routes.MapPageRoute("adminpages", "admin/pages/", "~/Admin/View/Pages/Page.aspx");
        
        routes.MapPageRoute("adminQuet", "admin/quet-san-pham/list", "~/Admin/View/SanPham/QuetSanPham.aspx");
        routes.MapPageRoute("finishCheckOut", "finishCheckOut", "~/View/DonHang/finishCheckOut.aspx");
        
        routes.MapPageRoute("search", "product/search", "~/View/Search/TimKiem.aspx");
        routes.MapPageRoute("searchs", "search", "~/View/Search/Search.aspx");
        routes.MapPageRoute("home", "", "~/View/Home/Default.aspx");
        routes.MapPageRoute("pageGT", "gioithieu", "~/View/Page/Page.aspx?idPage=1");
        routes.MapPageRoute("pages", "pages", "~/View/Page/Page.aspx");
        routes.MapPageRoute("pageLH", "lienhe", "~/View/Page/Page.aspx?idPage=2");
        routes.MapPageRoute("cart", "gio-hang", "~/View/DonHang/Cart.aspx");
        //routes.MapPageRoute("listproductsall", "{nameEn}-l-{cap}-{id}", "~/View/SanPham/DanhSachSanPham.aspx");
        routes.MapPageRoute("new", "{nameEn}-tt-{id}", "~/View/TinTuc/TinTuc.aspx");
        routes.MapPageRoute("newdefault", "{nameEn}-cttt-{id}", "~/View/TinTuc/ChiTietTinTuc.aspx");
        routes.MapPageRoute("product", "{nameEn}-{id}", "~/View/SanPham/ChiTietSanPham.aspx");
        routes.MapPageRoute("checkout", "checkout", "~/View/DonHang/Checkout.aspx");
        routes.MapPageRoute("success", "success", "~/DonHang/Success.aspx");
        //routes.MapPageRoute("login", "login", "~/View/User/Login.aspx");
        routes.MapPageRoute("logout", "logout", "~/View/User/Logout.aspx");
        routes.MapPageRoute("user_info", "user/info", "~/View/User/UserInfo.aspx");
        routes.MapPageRoute("user_editinfo", "user/edit", "~/View/User/UserEditInfo.aspx");
        routes.MapPageRoute("register", "register", "~/View/User/Register.aspx");
        //routes.MapPageRoute("product", "products/{nameEn}-{id}", "~/SanPham/ChiTietSanPham.aspx");
        routes.MapPageRoute("tienich", "tienich", "~/View/TienIch/TienIch.aspx");
        
        //router cho người dùngsd
        routes.MapPageRoute("login", "login", "~/View/User/Login.aspx");
        routes.MapPageRoute("user_changepass", "user/pass", "~/View/User/ChangePass.aspx");
        //routes.MapPageRoute("dangnhap_login", "dangnhap/login", "~/View/User/LoginUser.aspx");
        routes.MapPageRoute("dangnhap_dashboard", "dangnhap/dashboard", "~/DangNhap/DashBoard.aspx");
        routes.MapPageRoute("dangnhap_shopedit", "dangnhap/editinfo", "~/DangNhap/ShopInfoEdit.aspx");
        routes.MapPageRoute("dangnhap_saleorder", "saleorder", "~/DangNhap/SaleOrders.aspx");
        
        routes.MapPageRoute("gianhang_register", "gianhang/register", "~/GianHang/Register.aspx");
        routes.MapPageRoute("gianhang_login", "gianhang/login", "~/GianHang/Login.aspx");
        routes.MapPageRoute("gianhang_dashboard", "gianhang/dashboard", "~/GianHang/DashBoard.aspx");
        
        routes.MapPageRoute("gianhang_logout", "gianhang/logout", "~/GianHang/Logout.aspx");
        routes.MapPageRoute("gianhang_alert", "gianhang/alert", "~/GianHang/ThongBao.aspx");
        routes.MapPageRoute("gianhang_shopinfo", "gianhang/info", "~/GianHang/ShopInfo.aspx");
        routes.MapPageRoute("gianhang_account", "gianhang/account", "~/GianHang/Account.aspx");
        routes.MapPageRoute("gianhang_shopedit", "gianhang/editinfo", "~/GianHang/ShopInfoEdit.aspx");
        routes.MapPageRoute("gianhang_createshop", "gianhang/create", "~/GianHang/CreateShop.aspx");
        routes.MapPageRoute("gianhang_shopproduct", "gianhang/product", "~/GianHang/Product.aspx");
        routes.MapPageRoute("gianhang_addproduct", "gianhang/addproduct", "~/GianHang/AddProduct.aspx");
        routes.MapPageRoute("gianhang_shopcategories", "gianhang/shopcat", "~/GianHang/Categories.aspx");
        routes.MapPageRoute("gianhang_saleorder", "gianhang/saleorder", "~/GianHang/SaleOrders.aspx");


        routes.MapPageRoute("thongtingianhang", "shop", "~/View/GianHang/ThongTinGianHang.aspx");
    }

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
