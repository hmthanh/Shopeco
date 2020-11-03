using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        msgError.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string oldPassword = txtOldPassword.Value;
        string newPassword1 = txtNewPassword1.Value;
        string newPassword2 = txtNewPassword2.Value;

        if (string.IsNullOrEmpty(oldPassword))
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Không được để trống mật khẩu ";
            return;
        }
        if (string.IsNullOrEmpty(newPassword1))
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Không được để trống mật khẩu mới ";
            return;
        }
        if (newPassword1 != newPassword2)
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Hai mật khẩu không giống nhau ";
            return;
        }

        string id = Session["CurrentUser"].ToString();
        string sqlFind = "select * from tb_User where ID = '" + id + "' and Password = '" + oldPassword + "'";
        DataTable isExist = Connect.GetTable(sqlFind);

        if (isExist == null || isExist.Rows.Count <= 0)
        {
            msgError.Visible = true;
            msgError.InnerHtml = "Mật khẩu cũ không chính xác !";
            return;
        }

        string sql = "update tb_User set Password = '" + newPassword1 + "' where ID = '" + id + "'";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            Response.RedirectToRoute("userinfo", new { });
        }else
        {
            msgError.InnerHtml = "Cập nhật không thành công !";
            msgError.Visible = true;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}