using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class DonHang_Checkout : System.Web.UI.Page
{
    double total = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSanPham();
        }
    }
    private void LoadSanPham()
    {
        string html = "";
        if (Session["CartSession"] != null)
        {
            var sessionCart = (List<CartItem>)Session["CartSession"];
            foreach (var item in sessionCart)
            {
                html += "<tr class='product' >";
                html += "   <td class='product__image'>";
                html += "       <div class='product-thumbnail'>";
                html += "           <div class='product-thumbnail__wrapper'>";
                html += "               <img alt='" + item.idSanPham + "' class='product-thumbnail__image' src='" + item.idSanPham + "' />";
                html += "           </div>";
                html += "           <span class='product-thumbnail__quantity' aria-hidden='true'>" + item.SoLuong + "</span>";
                html += "       </div>";
                html += "   </td>";
                html += "   <td class='product__description'>";
                html += "       <span class='product__description__name order-summary__emphasis'>" + item.idSanPham + "</span>";
                html += "       <span class='product__description__variant order-summary__small-text'>" + StaticData.getField("tb_Mau", "TenMau", "idMau", item.idMau) + " / " + StaticData.getField("tb_Size", "Size", "idSize", item.idSize) + "</span>";
                html += "   </td>";
                html += "   <td class='product__quantity visually-hidden'>" + item.SoLuong + "</td>";
                html += "   <td class='product__price'><span class='order-summary__emphasis'>$" + item.Gia + "</span></td>";
                html += "</tr>";
                total += (item.SoLuong * item.Gia);
            }
            tbSanPham.InnerHtml = html;
            Subtotal.InnerHtml = total.ToString();
            Total.InnerHtml = "$" + total.ToString();
        }
        else
        {
            Response.Redirect("/cart");
        }
        
    }
    public double GetTotal()
    {
        return total;
    }
}