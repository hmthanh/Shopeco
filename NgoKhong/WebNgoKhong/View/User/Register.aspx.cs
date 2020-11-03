using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_User_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //msgTenDangNhap.InnerHtml = "";
        msgPassword1.InnerHtml = "";
        msgPassword2.InnerHtml = "";
        msgPhone.InnerHtml = "";
        msgRegister.InnerHtml = "";
        msgUsername.InnerHtml = "";
    }

    
    protected void btDangKy_Click(object sender, EventArgs e)
    {
        //string TenGianHang = StaticData.ValidParameter(txtTenGianHang.Value.Trim());
        //string HoTen = StaticData.ValidParameter(txtNguoiDaiDien.Value.Trim());
        //string SoDienThoai = StaticData.ValidParameter(txtSoDienThoai.Value.Trim().Replace(" ",""));
        //string Email = StaticData.ValidParameter(txtEmail.Value.Trim());
        //string TenDangNhap = StaticData.ValidParameter(txtTenDangNhap.Value.Trim());
        //string MatKhau = StaticData.ValidParameter(txtMatKhau.Value.Trim());
        //string tenDangNhap = StaticData.ValidParameter(txtTenDangNhap.Value.Trim());
        string phoneNum = StaticData.ValidParameter(txtPhone.Value.Trim());
        string userName = StaticData.ValidParameter(txtUsername.Value.Trim());
        string password1 = StaticData.ValidParameter(txtPassword1.Value.Trim());
        string password2 = StaticData.ValidParameter(txtPassword2.Value.Trim());

        //if (tenDangNhap == "")
        //{
        //    msgTenDangNhap.InnerText = "Không được để trống";
        //    return;
        //}

        if (String.IsNullOrEmpty(phoneNum))
        {
            msgPhone.InnerText = "Không được để trống";
            return;
        }

        if (!StaticData.IsValidEmail(phoneNum))
        {
            if (phoneNum.Length < 10)
            {
                msgPhone.InnerText = "Chiều dài số điện thoại phải trên 10 ký tự";
                return;
            }
        }

        if (string.IsNullOrEmpty(userName))
        {
            msgUsername.InnerText = "Tên đăng nhập được để trống";
            return;
        }

        if (password1 == "")
        {
            msgPassword1.InnerText = "Không được để trống";
            return;
        }
        if (password2 == "")
        {
            msgPassword2.InnerText = "Không được để trống";
            return;
        }
        if (password1 != password2)
        {
            msgPassword2.InnerText = "Hai mật khẩu không giống nhau";
            return;
        }

        ////////////////////////////////////////////////////////////////
        //string sql = "select * from tb_User u where u.Username = '" + StaticData.ValidParameter(tenDangNhap) + "'";

        //DataTable isValidUsername = Connect.GetTable(sql);
        //if (isValidUsername != null && isValidUsername.Rows.Count > 0)
        //{
        //    msgTenDangNhap.InnerText = "Tên đăng nhập của bạn đã tồn tại";
        //    return;
        //}

        string sql = "select * from tb_User u where u.PhoneNumber = '" + StaticData.ValidParameter(phoneNum) + "' or u.Username = '" + StaticData.ValidParameter(userName) + "'";

        DataTable isValidPhone = Connect.GetTable(sql);
        if (isValidPhone != null && isValidPhone.Rows.Count > 0)
        {
            msgPhone.InnerText = "Email hoặc số điện thoại của bạn đã tồn tại";
            return;
        }


        //sql = "select * from tb_GianHang u where u.TenDangNhap = '" + StaticData.ValidParameter() + "'";

        //DataTable tbCheckPhone = Connect.GetTable(sql);

        //if (tbCheckPhone.Rows.Count > 0)
        //{
        //    msgSoDienThoai.InnerHtml = "Số điện thoại của bạn đã tồn tại";
        //    return;
        //}

        //sql = "insert into tb_(TenGianHang,TenDangNhap, Email, ChuGianHang,SoDienThoai,MatKhau) values(N'" + TenGianHang + "',N'" + TenDangNhap + "', '" + Email + "', N'" + HoTen + "', N'" + SoDienThoai + "', N'" + MatKhau + "')";
        //string code = phoneNum;
        //if (StaticData.IsValidEmail(code))
        //{
        //    int findQ = code.IndexOf('@');
        //    code = code.Substring(0, findQ);
        //}
        //string userCode = "TK" + code;
        string userCode = "KH" + phoneNum;
        string sqlCreateNewUser = "insert into tb_User(Password, PhoneNumber,Username, UserCode) values('" + password1 + "', '" + phoneNum + "', '" + userName + "', '" + userCode + "')";
        bool isSusscess = Connect.Exec(sqlCreateNewUser);
        if (!isSusscess)
        {
            msgRegister.InnerText = "Tài khoản của bạn chưa được tạo, vui lòng đăng ký lại";
            return;
        }

        //string fullName = "";
        //string email = "";
        //string address = "";
        

//        string userID = StaticData.getField("tb_User", "MAX(ID)", "1", "1");
//        string sqlCreateCustomer = @"insert into tb_UserCustomer(FullName, Email, Phone, Address, UserID)
//                values(N'" + fullName + "', '" + email + "', '" + phoneNum + "', N'" + address + "', '" + userID + "')";
//        isSusscess = Connect.Exec(sqlCreateCustomer);
//        if (!isSusscess)
//        {
//            msgRegister.InnerText = "Tài khoản của bạn chưa được tạo, vui lòng đăng ký lại";
//            return;
//        }

        Response.RedirectToRoute("login", new { success = true });
    }
}