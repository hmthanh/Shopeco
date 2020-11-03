using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{
    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCreateAds_Click(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            NoSuccess();
            return;
        }
        
        Response.RedirectToRoute("useradsinfo", new { create = true });
    }
    void NoSuccess()
    {
        title.InnerHtml = "Không thành công !";
        subtitle.InnerHtml = "Đã có lỗi trong quá trình tạo kênh rao vặt, vui lòng cập nhật số điện thoại trước khi tạo kênh rao vặt của bạn .";
    }
}