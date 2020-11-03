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
        if (!IsPostBack)
        {
            if (Session["CurrentUser"] != null)
            {
                //string idUser = Session["CurrentUser"].ToString();
                //string sql = "select * from tb_RVUser where UserID = '" + idUser + "'";

                //DataTable data = Connect.GetTable(sql);

                //txtFullName.Value = data.Rows[0]["FullName"].ToString();
                //txtEmail.Value = data.Rows[0]["Email"].ToString();
                //txtPhone.Value = data.Rows[0]["Phone"].ToString();
                //txtAddress.Value = data.Rows[0]["Address"].ToString();
            }
        }
        msgError.Visible = false;
    }

    //private void LoadDsThanhPho()
    //{
    //    string sql = "select * from tb_tinhthanhpho order by name";

    //    cmbTinh.DataSource = Connect.GetTable(sql);
    //    cmbTinh.DataTextField = "name";
    //    cmbTinh.DataValueField = "matp";
    //    cmbTinh.DataBind();
    //}
    //private void LoadDsQuanHuyen(string maTP)
    //{
    //    string sql = "select * from tb_quanhuyen where matp='" + maTP + "' order by name";

    //    cmbHuyen.DataSource = Connect.GetTable(sql);
    //    cmbHuyen.DataTextField = "name";
    //    cmbHuyen.DataValueField = "maqh";
    //    cmbHuyen.DataBind();
    //}
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string userID = Session["CurrentUser"].ToString();

        string hoTen = txtFullName.Value;
        string email = txtEmail.Value;
        string phone = txtPhone.Value;
        string address = txtAddress.Value;

        if (string.IsNullOrEmpty(hoTen))
        {
            Message("Họ và tên không được để trống");
            return;
        }
        if (string.IsNullOrEmpty(phone))
        {
            Message("Số điện thoại không được để trống");
            return;
        }
        if (phone.Length <= 6)
        {
            Message("Số điện thoại không được dưới 5 ký tự");
            return;
        }
        if (string.IsNullOrEmpty(email))
        {
            Message("Email không được để trống");
            return;
        }
        string idUser = Session["CurrentUser"].ToString();
        string code = StaticData.getField("tb_User", "PhoneNumber", "ID", idUser);
        if (StaticData.IsValidEmail(code))
        {
            int findQ = code.IndexOf('@');
            code = code.Substring(0, findQ);
        }
        string adsCode = "RV" + code;
        string sqlUpdateUser = "update tb_User set AdsCode = '" + adsCode + "' where ID = '" + idUser + "'";
        string sqlCreateShop = "insert into tb_RVUser(FullName, Email, Phone, Address, AdsCode, UserID) values(N'" + hoTen + "', '" + email + "', '" + phone + "', N'" + address + "', '" + adsCode + "', '" + userID + "')";
        bool isUpdateUser = Connect.Exec(sqlUpdateUser);
        bool isUpdate = Connect.Exec(sqlCreateShop);

        if (isUpdate)
        {
            Response.RedirectToRoute("useradsinfo", new { });
        }
        else
        {
            msgError.InnerHtml = "Cập nhật không thành công !";
            msgError.Visible = true;
        }
    }
    void Message(string msg)
    {
        msgError.Visible = true;
        msgError.InnerHtml = msg;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.RedirectToRoute("useradsinfo", new { });
    }
}