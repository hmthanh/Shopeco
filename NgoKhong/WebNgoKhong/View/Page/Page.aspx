﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Page.aspx.cs" Inherits="Page_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .item {
            padding: 0 13px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <!-- Main Container  -->
        <div class="main-container container">
            <div class="row" style="text-transform: uppercase;"><%=GetDuongDan() %></div>
            <div class="row">
                <div id="content" class="col-sm-12">
                    <div class="about-us about-demo-4">
                        <div style="margin: 40px;" id="dvContent" runat="server">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- //Main Container -->
    </form>
</asp:Content>