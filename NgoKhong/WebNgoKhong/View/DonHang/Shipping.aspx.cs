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
        NL_Checkout checkOut = new NL_Checkout();
        string html = "Bạn chưa đăng nhập !<br/>";
        html += "Để tiếp tục mua hàng vui lòng chọn ";
        //subtitle.InnerHtml = html;
        //Tổng cộng : <span style='color:red;' ></span> vnđ <br/> <small>Trình duyệt sẽ tự chuyển trong 3s nữa</small>";
    }
}