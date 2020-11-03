using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_DonHang_finishCheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string price = Request["price"];
        //string ordercode = Request["Ordercode"];

        subtitle.InnerHtml = "Đơn hàng của đã xử lý thành công<br/> Trình duyệt sẽ tự chuyển trong 3s nữa</small>";
        //if (rs)
        //{
        //    title.InnerHtml = "Thanh toán thành công !";
        //}
        //else
        //{
        //    title.InnerHtml = "Thanh toán không thành công !";
        //}
    }
}