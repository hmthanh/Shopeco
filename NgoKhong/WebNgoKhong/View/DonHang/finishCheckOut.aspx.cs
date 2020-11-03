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


        String return_url = Request["return_url"];
        String receiver = Request["receiver"];
        String transaction_info = Request["transaction_info"];
        String order_code = Request["order_code"];
        String price = Request["price"];
        String payment_id = Request["payment_id"];
        String payment_type = Request["payment_type"];
        String error_text = Request["error_text"];
        String secure_code = Request["secure_code"];
        NL_Checkout checkOut = new NL_Checkout();
        bool rs = checkOut.verifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code);
        subtitle.InnerHtml = "Đơn hàng " + order_code.ToString() + " đã xử lý thành công<br/> Tổng cộng : <span style='color:red;' >" + price.ToString() + "</span> vnđ <br/> <small>Trình duyệt sẽ tự chuyển trong 3s nữa</small>";
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