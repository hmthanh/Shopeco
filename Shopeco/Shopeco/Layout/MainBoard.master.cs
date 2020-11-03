using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_MainBoard : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //object session = Session["CurrentUser"];
        if (Session["CurrentUser"] == null)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            Response.RedirectToRoute("gianhang_login", new { retUrl = url });
            return;
        }
        
        //string email = Session["CurrentUser"].ToString();
    }
}
