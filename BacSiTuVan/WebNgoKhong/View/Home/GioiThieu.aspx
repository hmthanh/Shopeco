<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MasterPage.master" AutoEventWireup="true" CodeFile="GioiThieu.aspx.cs" Inherits="View_Home_GioiThieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#col1').addClass("active");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <style>
        .organization-outlet .org-about-company-module__org-info {
            max-height: 284px;
            overflow: hidden;
        }

        .relative {
            position: relative;
        }

        .ph5, .pr5 {
            padding-right: 24px;
        }

        .ph5, .pl5 {
            padding-left: 24px;
        }

        .pt5, .pv5 {
            padding-top: 24px;
        }

        .quick-easeInOut-motion {
            transition-timing-function: cubic-bezier(.4,0,.2,1);
            transition-duration: 167ms;
        }

        .media, .media__body {
            overflow: hidden;
        }

        .color-palette .t-black {
            color: var(--ui-typography-black);
        }

        .mb4, .mv4 {
            margin-bottom: 16px;
        }

        .t-20 {
            font-size: 2rem;
            line-height: 1.4;
        }

        .t-normal {
            font-weight: 400;
        }

        .t-black {
            color: rgba(0,0,0,.9);
        }

        h2 {
            font-size: 3.2rem;
            line-height: 1.25;
        }

        .organization-outlet .org-about-us-organization-description__text {
            white-space: pre-wrap;
        }

        .color-palette .t-black--light {
            color: var(--ui-typography-black--light);
        }

        .mb5, .mv5 {
            margin-bottom: 24px;
        }

        .t-14 {
            font-size: 1.4rem;
            line-height: 1.42857;
        }

        .t-normal {
            font-weight: 400;
        }

        .t-black--light {
            color: rgba(0,0,0,.6);
        }
    </style>
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb"><a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i><asp:Literal ID="Literal3" runat="server" Text="<%$Resources:name.language, menuIntro%>" /></a></div>
        </div>
        <%-- Add content controls here --%>
        <div class="container">
            <div id="dvContent" runat="server"></div>
        </div>
    </div>
</asp:Content>