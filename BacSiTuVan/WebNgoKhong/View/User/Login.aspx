<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="View_User_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style>
		.widget-main img {
			width: 30px;
			height: 30px;
		}
		.widget-main .lang {
			display:inline-block;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
	<div class="main-content">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="login-container">
					<div class="center">
						<h1>
							<i class="ace-icon fa fa-hospital-o green"></i>
							<span class="red"><asp:Literal ID="Literal4" runat="server" Text="<%$Resources:name.language, titleHospital %>" /></span>
							<span class="grey" id="id-text2"><asp:Literal ID="Literal5" runat="server" Text="<%$Resources:name.language, titleManage %>" /></span>
						</h1>
						<h4 class="blue" id="id-company-text">&copy; <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, titleSoftwareName %>" /></h4>
					</div>

					<div class="space-6"></div>

					<div class="position-relative">
						<div id="login-box" class="login-box visible widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<asp:LinkButton ID="btnChangeLang" runat="server" CssClass="lang" OnClick="btnChangeLang_Click" style="width: 30px;height: 30px; position: absolute;right: 50px;top: 25px; cursor:pointer;" alt="Đổi ngôn ngữ">
										<img id="imgLang" runat="server" src="<%$Resources:name.language, img_url %>" />
									</asp:LinkButton>
									<h4 class="header blue lighter bigger" id="welcome_message">
										<i class="ace-icon fa fa-user-md green"></i>
										<a><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:name.language, titleLogin %>" /></a>
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
</asp:Content>
