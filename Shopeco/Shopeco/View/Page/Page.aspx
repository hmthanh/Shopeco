<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout/MasterPage.master" CodeFile="Page.aspx.cs" Inherits="Page_Page" %>

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
            <div class="row" ><%=GetDuongDan() %></div>
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

   <script>
       $(document).ready(function () {
           var query = location.search;
           switch (query) {
               case "?id=12":
                   $("#page_thuonghieu").addClass("active");
                   break;
               case "?id=11":
                   $("#page_dichvu").addClass("active");
                   break;
               case "?id=10":
                   $("#page_magiamgia").addClass("active");
                   break;
               case "?id=8":
                   $("#page_huongdan").addClass("active");
                   break;
               default:
                   break;

           }
       });
   </script>
</asp:Content>