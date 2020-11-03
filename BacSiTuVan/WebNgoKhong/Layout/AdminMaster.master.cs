using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Layout_MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session[Constant.UserField] == null)
        //{
        //    Response.RedirectToRoute("login", new { });
        //}
    }
    protected void btnChangeLang_Click(object sender, EventArgs e)
    {
        if (Session["lang"] == null)
        {
            Session["lang"] = "vi";
            return;
        }
        string lang = Session["lang"].ToString();
        if (lang == "en")
        {
            Session["lang"] = "vi";
        }
        else
        {
            Session["lang"] = "en";
        }
        Response.Redirect(Request.RawUrl);
    }
}
