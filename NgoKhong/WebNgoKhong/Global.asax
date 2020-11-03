<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

	void RegisterRoutes(RouteCollection routes)
	{
		//Admin
		routes.MapPageRoute("adminlogin", "admin/login", "~/Admin/View/Account/Login.aspx");

		routes.MapPageRoute("adminbanner", "admin/website/banner", "~/Admin/View/Banner/Banner.aspx");
		routes.MapPageRoute("adminbannerupdate", "admin/banner/banner-update-{id}", "~/Admin/View/Banner/BannerEdit.aspx");
		routes.MapPageRoute("adminNhanEmail", "admin/website/mail", "~/Admin/View/ConfigWebsite/Email.aspx");

		routes.MapPageRoute("adminbrands", "admin/website/brands", "~/Admin/View/Brands/Brands.aspx");
		routes.MapPageRoute("adminbrandsupdate", "admin/brands/brands-update-{id}", "~/Admin/View/Brands/AddBrands.aspx");

		routes.MapPageRoute("adminCustomer", "admin/user/account", "~/Admin/View/Customer/Customer.aspx");
		routes.MapPageRoute("adminSanPhamKhachHang", "admin/customer/detail", "~/Admin/View/Customer/CustomerDetail.aspx");
		routes.MapPageRoute("adminDonHangCuaKhachHang", "admin/customer/order", "~/Admin/View/Customer/CustomerBought.aspx");
		routes.MapPageRoute("adminChinhSuaKhachHang", "admin/customer/edit", "~/Admin/View/Customer/CustomerEditInfo.aspx");
		routes.MapPageRoute("adminEditAds", "admin/customer/editads", "~/Admin/View/Customer/EditAds.aspx");
		routes.MapPageRoute("adminEditShop", "admin/customer/editshop", "~/Admin/View/Customer/EditShop.aspx");

		routes.MapPageRoute("adminDonHang", "admin/order/state", "~/Admin/View/DonHang/Order.aspx");
		routes.MapPageRoute("adminChiTietDonHang", "admin/order/detail", "~/Admin/View/DonHang/OrderDetail.aspx");
		routes.MapPageRoute("adminDonHangThongke", "admin/statistic/total", "~/Admin/View/DonHang/Statistic.aspx");

		routes.MapPageRoute("adminRaoVat", "admin/raovat/list", "~/Admin/View/Forum/Forum.aspx");
		routes.MapPageRoute("adminChiTietRaoVat", "admin/raovat/detail", "~/Admin/View/RaoVat/ForumDetail.aspx");
		routes.MapPageRoute("adminhinhanhraovat", "admin/raovat/hinhanh", "~/Admin/View/RaoVat/ForumImage.aspx");
		routes.MapPageRoute("admincapnhahinhanh", "admin/raovat/capnhat", "~/Admin/View/RaoVat/ForumEditImage.aspx");

		routes.MapPageRoute("adminMauSize", "admin/website/colorsize", "~/Admin/View/MauSize/MauSize.aspx");

		routes.MapPageRoute("adminTinTuc", "admin/news/list", "~/Admin/View/News/News.aspx");
		routes.MapPageRoute("adminCapNhatTinTuc", "admin/news/new-update-{id}", "~/Admin/View/News/NewsEdit.aspx");
		routes.MapPageRoute("adminLoaiTinTuc", "admin/category-news/list-new", "~/Admin/View/News/CatNews.aspx");
		routes.MapPageRoute("adminCapNhatLoaiTinTuc", "admin/category-news/new-update-{id}", "~/Admin/View/News/CatNewsEdit.aspx");

		routes.MapPageRoute("adminUser", "admin/user/list", "~/Admin/View/NguoiDung/NguoiDung.aspx");
		routes.MapPageRoute("adminAddUser", "admin/user/add", "~/Admin/View/NguoiDung/AddUser.aspx");

		routes.MapPageRoute("adminpages", "admin/website/pages", "~/Admin/View/Pages/Page.aspx");

		routes.MapPageRoute("adminLoaiSanPham", "admin/website/category", "~/Admin/View/Product/Categories.aspx");
		routes.MapPageRoute("adminCapNhatLoaiSanPham", "admin/category-product/product-update-{id}", "~/Admin/View/Product/CategoryEdit.aspx");
		routes.MapPageRoute("adminSanPham", "admin/user/product", "~/Admin/View/Product/Product.aspx");
		routes.MapPageRoute("adminCapNhatSanPham", "admin/product/product-update-{id}", "~/Admin/View/Product/ProductEdit.aspx");
		routes.MapPageRoute("adminChiTietSanPham", "admin/product/detail", "~/Admin/View/Product/ProductDetail.aspx");

		routes.MapPageRoute("adminGianHang", "admin/user/order", "~/Admin/View/Shop/Shop.aspx");
		routes.MapPageRoute("adminChiTietDonHangCuaGianHang", "admin/order/shop", "~/Admin/View/Shop/ShopOrder.aspx");
		routes.MapPageRoute("adminChiTietGianHang", "admin/shop/detail", "~/Admin/View/Shop/ShopDetail.aspx");

		routes.MapPageRoute("adminslide", "admin/website/slide", "~/Admin/View/Slide/Slide.aspx");
		routes.MapPageRoute("adminslideupdate", "admin/slide/slide-update-{id}", "~/Admin/View/Slide/SlideEdit.aspx");

		routes.MapPageRoute("tienich", "tienich", "~/View/TienIch/TienIch.aspx");


		//////////////////////////////////////////////////////////
		routes.MapPageRoute("adminQuet", "admin/quet-san-pham/list", "~/Admin/View/SanPham/QuetSanPham.aspx");

		routes.MapPageRoute("finishCheckOut", "finishCheckOut", "~/View/DonHang/finishCheckOut.aspx");
		routes.MapPageRoute("successCheckOut", "successCheckOut", "~/View/DonHang/successCheckOut.aspx");
		routes.MapPageRoute("userSuccessCheckout", "usersuccess", "~/View/DonHang/userSuccessCheckout.aspx");
		routes.MapPageRoute("notCheckOut", "notCheckOut", "~/View/DonHang/notCheckOut.aspx");

		//routes.MapPageRoute("search", "product/search", "~/View/Search/TimKiem.aspx");
		routes.MapPageRoute("searchs", "search", "~/View/Search/Search.aspx");
		routes.MapPageRoute("home", "", "~/View/Home/Default.aspx");
		routes.MapPageRoute("pageGT", "gioithieu", "~/View/Page/Page.aspx?idPage=1");
		routes.MapPageRoute("pageLH", "lien-he", "~/View/Page/Page.aspx?idPage=2");
		routes.MapPageRoute("pages", "pages", "~/View/Page/Page.aspx");
		routes.MapPageRoute("pageHD", "huong-dan", "~/View/Page/Page.aspx?idPage=3");
		routes.MapPageRoute("cart", "cart", "~/View/DonHang/Cart.aspx");
		routes.MapPageRoute("shipping", "shipping", "~/View/DonHang/Shipping.aspx");
		routes.MapPageRoute("ordershop", "ordershop", "~/View/DonHang/Order.aspx");
		routes.MapPageRoute("new", "{nameEn}-tt-{id}", "~/View/TinTuc/TinTuc.aspx");
		routes.MapPageRoute("newdefault", "{nameEn}-cttt-{id}", "~/View/TinTuc/ChiTietTinTuc.aspx");
		routes.MapPageRoute("product", "{nameEn}-{id}", "~/View/SanPham/ChiTietSanPham.aspx");
		routes.MapPageRoute("checkout", "checkout", "~/View/DonHang/Checkout.aspx");
		routes.MapPageRoute("success", "success", "~/DonHang/Success.aspx");

		routes.MapPageRoute("login", "login", "~/View/User/Login.aspx");
		routes.MapPageRoute("logout", "logout", "~/View/User/Logout.aspx");
		routes.MapPageRoute("register", "register", "~/View/User/Register.aspx");

		routes.MapPageRoute("userinfo", "user/userinfo", "~/View/User/UserInfo.aspx");
		routes.MapPageRoute("usercustomer", "user/customer", "~/View/User/CustomerInfo.aspx");
		routes.MapPageRoute("useradsinfo", "user/adsinfo", "~/View/User/AdsInfo.aspx");
		routes.MapPageRoute("usereditcustomer", "user/editcustomer", "~/View/User/CustomerEditInfo.aspx");
		routes.MapPageRoute("usereditads", "user/editads", "~/View/User/AdsEditInfo.aspx");
		routes.MapPageRoute("userpass", "user/userpassword", "~/View/User/ChangePass.aspx");
		routes.MapPageRoute("userbought", "user/bought", "~/View/User/Bought.aspx");
		routes.MapPageRoute("userboughtnew", "bought/new", "~/View/User/BoughtNew.aspx");
		routes.MapPageRoute("userboughtprocessing", "bought/processing", "~/View/User/BoughtProcessing.aspx");
		routes.MapPageRoute("userboughtcomplete", "bought/complete", "~/View/User/BoughtComplete.aspx");
		routes.MapPageRoute("userboughtcancel", "bought/cancel", "~/View/User/BoughtCancel.aspx");
		routes.MapPageRoute("useredit", "user/editinfo", "~/View/User/EditUserInfo.aspx");
		routes.MapPageRoute("usershopinfo", "user/shopinfo", "~/View/User/ShopInfo.aspx");
		routes.MapPageRoute("usershopedit", "user/shopedit", "~/View/User/ShopEditInfo.aspx");
		routes.MapPageRoute("usershopedit2", "user/editshop", "~/View/User/ShopEditInfo2.aspx");
		routes.MapPageRoute("userproduct", "user/product", "~/View/User/Product.aspx");
		routes.MapPageRoute("userrating", "user/rating", "~/View/User/Rating.aspx");
		routes.MapPageRoute("useraddproduct", "user/addproduct", "~/View/User/AddProduct.aspx");
		routes.MapPageRoute("userorder", "user/order", "~/View/User/Order.aspx");
		routes.MapPageRoute("userorderdetail", "user/orderdetail", "~/View/User/OrderDetail.aspx");
		routes.MapPageRoute("userordernew", "order/new", "~/View/User/OrderNew.aspx");
		routes.MapPageRoute("userorderprocessing", "order/processing", "~/View/User/OrderProcessing.aspx");
		routes.MapPageRoute("userordercomplete", "order/complete", "~/View/User/OrderComplete.aspx");
		routes.MapPageRoute("userordercancel", "order/cancel", "~/View/User/OrderCancel.aspx");
		routes.MapPageRoute("userads", "user/ads", "~/View/User/Ads.aspx");
		routes.MapPageRoute("useradsShow", "ads/show", "~/View/User/AdsShow.aspx");
		routes.MapPageRoute("useradsHidden", "ads/hidden", "~/View/User/AdsHidden.aspx");
		routes.MapPageRoute("usercreateshop", "user/createshop", "~/View/User/CreateShop.aspx");
		routes.MapPageRoute("usercreateads", "user/createads", "~/View/User/CreateAds.aspx");

		//router cho người dùng
		routes.MapPageRoute("dangnhap_login", "dangnhap/login", "~/View/User/LoginUser.aspx");
		routes.MapPageRoute("dangnhap_register", "dangnhap/register", "~/View/User/RegisterUser.aspx");
		routes.MapPageRoute("loginUser", "loginUser", "~/View/User/LoginUser.aspx");
		routes.MapPageRoute("dangnhap_dashboard", "dangnhap/dashboard", "~/DangNhap/DashBoard.aspx");
		routes.MapPageRoute("dangnhap_shopedit", "dangnhap/editinfo", "~/DangNhap/ShopInfoEdit.aspx");
		routes.MapPageRoute("dangnhap_saleorder", "dangnhap/saleorder", "~/DangNhap/SaleOrders.aspx");

		routes.MapPageRoute("gianhang_register", "gianhang/register", "~/GianHang/Register.aspx");
		routes.MapPageRoute("gianhang_login", "gianhang/login", "~/GianHang/Login.aspx");
		routes.MapPageRoute("gianhang_dashboard", "gianhang/dashboard", "~/GianHang/DashBoard.aspx");
		routes.MapPageRoute("gianhang_shopcreate", "gianhang/create", "~/GianHang/CreateShop.aspx");

		routes.MapPageRoute("gianhang_shopinfo", "gianhang/info", "~/GianHang/ShopInfo.aspx");
		routes.MapPageRoute("gianhang_account", "gianhang/account", "~/GianHang/Account.aspx");
		routes.MapPageRoute("gianhang_shopedit", "gianhang/editinfo", "~/GianHang/ShopInfoEdit.aspx");
		routes.MapPageRoute("gianhang_createshop", "gianhang/create", "~/GianHang/CreateShop.aspx");
		routes.MapPageRoute("gianhang_shopproduct", "gianhang/product", "~/GianHang/Product.aspx");
		routes.MapPageRoute("gianhang_addproduct", "gianhang/addproduct", "~/GianHang/AddProduct.aspx");
		routes.MapPageRoute("gianhang_shopcategories", "gianhang/shopcat", "~/GianHang/Categories.aspx");
		routes.MapPageRoute("gianhang_saleorder", "gianhang/saleorder", "~/GianHang/SaleOrders.aspx");
		routes.MapPageRoute("thongtingianhang", "shop", "~/View/GianHang/ThongTinGianHang.aspx");

		routes.MapPageRoute("raovat", "tinraovat", "~/RaoVat/View/RaoVat.aspx");
		routes.MapPageRoute("dangtin", "raovat/dangtin", "~/RaoVat/View/DangTin.aspx");
		routes.MapPageRoute("chitiet", "raovat/chitiet", "~/RaoVat/View/ChiTiet.aspx");
		routes.MapPageRoute("timkiem", "raovat/timkiem", "~/RaoVat/View/TimKiem.aspx");


		routes.MapPageRoute("jquery", "jquery", "~/Content/UI/js/jquery-3.3.1.js");
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