﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            Response.RedirectToRoute("login", new { retUrl = url });
        }
    }
}
