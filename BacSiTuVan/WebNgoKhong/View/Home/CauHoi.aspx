<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="CauHoi.aspx.cs" Inherits="View_Home_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Assets/css/Forum.css" rel="stylesheet" />
    <link href="../../Assets/css/CustomStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <%--
        <div class="container-fluid">
            <div class="row-fluid">
                <div id="breadcrumb"><a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="#" class="current">Tables</a> </div>
            </div>
            <div class="container">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="fa fa-user-md"></i></span>
                        
                    </div>
                    <div class="widget-content nopadding">
                        <ul class="recent-posts" id="listPost" runat="server">
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <div id="content ">
		<div id="content-header">
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, menuQues%>" /></a></div>
        </div>
    </div>
	
    <div class="container " style="margin-top: 60px;">
        <div class="p-body-header">
            <div class="p-title ">
                <h1 class="p-title-value">
					<span class='label label--royalBlue' dir='auto'><asp:Literal ID="Literal2" runat="server" Text="<%$Resources:name.language, ques %>"/></span><span class='label-append'>&nbsp;</span>
					<span id="headerTitle" runat="server"></span>
                </h1>
            </div>
            <div class="p-description">
                <ul class="listInline listInline--bullet">
                    <li>
                        <i class="fa fa-user" aria-hidden="true" title="Thread starter"></i>
                        <span class="u-srOnly">Thread starter</span>
                        <a href="#" class="username  u-concealed" dir="auto" data-user-id="49566" data-xf-init="member-tooltip" id="lbUserName" runat="server">vinpt</a>
                    </li>
                    <li>
                        <i class="fa fa-clock-o" aria-hidden="true" title="Ngày gửi"></i>
                        <span class="u-srOnly">Ngày gửi</span>
                        <a href="#" class="u-concealed"><time class="u-dt" dir="auto" datetime="2019-01-16T14:04:47+0700" data-time="1547622287" data-date-string="16/1/19" data-time-string="14:04" title="16/1/19 lúc 14:04" id="labelTime" runat="server"></time></a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="p-body-main p-body-main--withSidebar ">
            <div class="p-body-content">
                <div class="p-body-pageContent">
                    <div class="block block--messages" data-xf-init="" data-type="post" data-href="/inline-mod/">
                        <div class="block-outer"></div>
                        <div class="block-outer js-threadStatusField"></div>
                        <div class="block-container lbContainer" data-xf-init="lightbox select-to-quote" data-message-selector=".js-post" data-lb-id="thread-8133" data-lb-universal="0">
                            <div class="block-body js-replyNewMessageContainer" id="mainTopicContent" runat="server">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>