<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

	void RegisterRoutes(RouteCollection routes)
	{
		//routes.MapPageRoute("home", "22", "~/View/Home/Default.aspx");
		// Home 
		routes.MapPageRoute("home", "", "~/View/Home/GioiThieu.aspx");

		// user
		routes.MapPageRoute("logout", "logout", "~/View/User/Logout.aspx");
		routes.MapPageRoute("login", "login", "~/View/User/Login.aspx");

		//page
		routes.MapPageRoute("aboutus", "gioi-thieu", "~/View/Home/GioiThieu.aspx");
		routes.MapPageRoute("notification", "thong-bao", "~/View/Home/ThongBao.aspx");
		routes.MapPageRoute("listquestion", "hoi-dap", "~/View/Home/HoiDap.aspx");
		routes.MapPageRoute("appraise", "danh-gia", "~/View/Home/DanhGia.aspx");
		routes.MapPageRoute("statistical", "thong-ke", "~/View/Home/ThongKe.aspx");
		routes.MapPageRoute("promotion", "khuyen-mai", "~/View/Home/KhuyenMai.aspx");
		routes.MapPageRoute("medical", "kham-benh", "~/View/Home/KhamBenh.aspx");

		//admin
		routes.MapPageRoute("listpage", "danh-sach-trang", "~/View/Page/ListPage.aspx");
		routes.MapPageRoute("editpage", "sua-trang", "~/View/Page/EditPage.aspx");
		routes.MapPageRoute("pagedetail", "trang", "~/View/Page/PageDetail.aspx");

		routes.MapPageRoute("listpagenotify", "ds-thong-bao", "~/View/Page/DsThongBao.aspx");
		routes.MapPageRoute("editnotify", "a-thong-bao", "~/View/Page/ThongBao.aspx");

		routes.MapPageRoute("listpagepromotion", "ds-khuyen-mai", "~/View/Page/DsKhuyenMai.aspx");
		routes.MapPageRoute("editpromotion", "a-khuyen-mai", "~/View/Page/KhuyenMai.aspx");

		routes.MapPageRoute("editaboutus", "a-gioi-thieu", "~/View/Page/GioiThieu.aspx");

		routes.MapPageRoute("listdoctor", "ds-bacsi", "~/View/Admin/DsBacSi.aspx");
		routes.MapPageRoute("adddoctor", "them-bacsi", "~/View/Admin/ThemBacSi.aspx");
		routes.MapPageRoute("infodoctor", "bacsi", "~/View/Admin/ChiTietBacSi.aspx");

		//Doctor
		routes.MapPageRoute("doctor", "bac-si", "~/View/Doctor/BacSi.aspx");
		routes.MapPageRoute("detaildoctor", "chi-tiet-bac-si", "~/View/Doctor/ChiTietBacSi.aspx");
		routes.MapPageRoute("question", "cau-hoi", "~/View/Home/CauHoi.aspx");


		routes.MapPageRoute("money", "bang-gia", "~/View/Home/BangGia.aspx");
		routes.MapPageRoute("qanda", "qa", "~/View/Doctor/QandA.aspx");

		routes.MapPageRoute("createtopic", "tao-cau-hoi", "~/View/Home/TaoCauHoi.aspx");
		routes.MapPageRoute("info", "thong-tin", "~/View/Home/ThongTin.aspx");


		routes.MapPageRoute("about", "about", "~/View/Home/AboutUs.aspx");
		routes.MapPageRoute("ques", "ques", "~/View/Doctor/QandA.aspx");

		routes.MapPageRoute("admin_login", "admin/login", "~/View/Admin/Login.aspx");
		routes.MapPageRoute("admin_logout", "admin/logout", "~/View/Admin/Logout.aspx");
		routes.MapPageRoute("admin_aboutedit", "admin/about/edit", "~/View/Admin/Login.aspx");


		routes.MapPageRoute("index", "index", "~/View/Home/Index.aspx");

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
		Session["lang"] = "vi";
	}

	void Session_End(object sender, EventArgs e)
	{
		// Code that runs when a session ends. 
		// Note: The Session_End event is raised only when the sessionstate mode
		// is set to InProc in the Web.config file. If session mode is set to StateServer 
		// or SQLServer, the event is not raised.

	}

</script>



