<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="View_User_Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<meta name="theme-color" content="#438eb9" />
	<title>Page Web </title>

	<meta name="description" content="User login page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

	<!-- bootstrap & fontawesome -->
	<link href="https://fonts.googleapis.com/css?family=Lato|Open+Sans|Roboto" rel="stylesheet">
	<link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
	<%--<link href="../Assets/css/bootstrap.min2.css" rel="stylesheet" />--%>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link href="../../Assets/css/ace.min.css" rel="stylesheet" />
	<script
		src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<%--CustomStyle--%>
	<%--<link href="../Assets/css/ace.min.css" rel="stylesheet" />--%>
	<link href="../Assets/css/CustomStyle.css" rel="stylesheet" />

	<link href="../Assets/css/bootstrap-table.min.css" rel="stylesheet" />
	<script src="../Assets/js/bootstrap-table.min.js"></script>
	<script src="../Assets/js/bootstrap-table-vi-VN.js"></script>
	<style>
		.widget-main img {
			width: 30px;
			height: 30px;
		}

		.widget-main .lang {
			display: inline-block;
		}
	</style>
</head>

<body class="login-layout light-login">
	<form runat="server">
		<%--<div class="header-top hidden-compact">
            <div class="container">
                <div class="row">
                    <div class="header-top-left col-lg-7 col-md-8 col-sm-6 col-xs-4">
                        <div class="hidden-md hidden-sm hidden-xs welcome-msg"></div>
                    </div>
                    <div class="header-top-right collapsed-block col-lg-5 col-md-4 col-sm-6 col-xs-8">
                        <ul class="top-link list-inline lang-curr">
                            <li class="currency">
                                <div class="btn-group currencies-block">
                                    <a href="/user/product" class="btn btn-link dropdown-toggle">
                                        <i class="fa fa-user"></i>
                                        <span class="spanheader1">hmthanh</span>
                                    </a>
                                </div>
                            </li>
                            <li class="language">
                                <div class="btn-group languages-block ">
                                    <a href="/tinraovat" class="btn btn-link ">
                                        <i class="fa fa-bullhorn"></i>
                                        <span class="spanheader1">Đăng xuất</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>--%>

		<div class="main-container">
			<div class="main-content">
				<header>
				</header>

				<div class="main-content">
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1">
							<div class="login-container">
								<div class="center">
									<h1>
										<i class="ace-icon fa fa-hospital-o green"></i>
										<span class="red">
											<asp:Literal ID="Literal4" runat="server" Text="<%$Resources:name.language, titleHospital %>" /></span>
										<span class="grey" id="id-text2">
											<asp:Literal ID="Literal5" runat="server" Text="<%$Resources:name.language, titleManage %>" /></span>
									</h1>
									<h4 class="blue" id="id-company-text">&copy;
										<asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, titleSoftwareName %>" /></h4>
								</div>

								<div class="space-6"></div>

								<div class="position-relative">
									<div id="login-box" class="login-box visible widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<asp:LinkButton ID="btnChangeLang" runat="server" CssClass="lang" OnClick="btnChangeLang_Click" Style="width: 30px; height: 30px; position: absolute; right: 50px; top: 25px; cursor: pointer;" alt="Đổi ngôn ngữ">
													<img id="imgLang" runat="server" src="<%$Resources:name.language, img_url %>" />
												</asp:LinkButton>
												<h4 class="header blue lighter bigger" id="welcome_message">
													<i class="ace-icon fa fa-user-md green"></i>
													<a>
														<asp:Literal ID="Literal2" runat="server" Text="<%$Resources:name.language, titleLogin %>" /></a>
												</h4>
												<div class="space-6"></div>

												<div id="loginform">
													<fieldset>
														<label class="block clearfix">
															<span class="block input-icon input-icon-right">
																<input type="text" name="username" id="txtUsername" runat="server" class="form-control" placeholder="<%$Resources:name.language, username %>" />
																<i class="ace-icon fa fa-user"></i>
															</span>
															<%--<span class="label label-danger" id="msgUsername" runat="server">*</span>--%>
														</label>

														<label class="block clearfix">
															<span class="block input-icon input-icon-right">
																<input type="password" name="password" id="txtPassword" runat="server" class="form-control" placeholder="<%$Resources:name.language, password %>" />
																<i class="ace-icon fa fa-lock"></i>
															</span>
															<%--<span class="label label-danger" id="msgPassword" runat="server">*</span>--%>
														</label>

														<span class="label label-danger" id="msgLogin" runat="server">*</span>
														<div class="space"></div>
														<label class="inline">
															<input type="checkbox" id="autologin" class="ace">
															<span class="lbl">
																<asp:Literal ID="Literal1" runat="server" Text="<%$Resources:name.language, titleRemember %>" /></span>
														</label>
														<asp:LinkButton runat="server" CssClass="width-35 pull-right btn btn-sm btn-primary" ID="btnLogin" OnClick="btnLogin_Click">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">
																<asp:Literal ID="Literal7" runat="server" Text="<%$Resources:name.language, titleLogin %>" /></span>
														</asp:LinkButton>
													</fieldset>
												</div>
											</div>
										</div>
										<!-- /.widget-body -->
									</div>
									<!-- /.login-box -->
									<span id="version_info" class="lighter blue pull-right"></span>
								</div>
								<!-- /.position-relative -->
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
			</div>
			<!-- /.main-content -->
		</div>
	</form>
</body>
</html>
