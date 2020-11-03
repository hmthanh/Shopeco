using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
using System.IO;

public partial class Ajax : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["QuanLyGiaoNhan_Login"] != null && Session["QuanLyGiaoNhan_Login"].ToString() != "")
        //{
        //    sTenDangNhap = Session["QuanLyGiaoNhan_Login"].ToString();
        //    sidNguoiDung = StaticData.getField("tb_NguoiDung", "idNguoiDung", "TenDangNhap", sTenDangNhap);
        //    mQuyen = StaticData.getField("tb_NguoiDung", "MaQuyen", "TenDangNhap", sTenDangNhap);
        //}
        string action = Request.QueryString["Action"].Trim();
        switch (action)
        {
            case "Modify_User":
                Modify_User(); break;
            case "Edit_User":
                Edit_User(); break;
            case "Get_Info_User":
                Get_Info_User(); break;
            case "Delete_User":
                Delete_User(); break;

        }
    }
    void Modify_User()
    {
        string Result = "";
        string userName = Request.QueryString["UserName"].Trim();
        string passWord = Request.QueryString["PassWord"].Trim();
        string fullName = Request.QueryString["FullName"].Trim();
        string phoneNumber = Request.QueryString["PhoneNumber"].Trim();
        string address = Request.QueryString["Address"].Trim();

        string sql = "select * from tb_Admin where TenDangNhap ='" + userName + "' ";
        DataTable table = Connect.GetTable(sql);
        if (table.Rows.Count > 0)
            Result = "Existential";
        else
        {
            string sql_modify = string.Format(@"insert into tb_admin(TenDangNhap,MatKhau,HoTen,SoDienThoai,DiaChi) 
                                                values('{0}','{1}','{2}','{3}','{4}')", userName, passWord, fullName, phoneNumber, address);
            if (Connect.Exec(sql_modify))
                Result = "Modified";
        }
        Response.Write(Result);
    }
    void Edit_User()
    {
        string Result = "";
        string userName = Request.QueryString["UserName"].Trim();
        string passWord = Request.QueryString["PassWord"].Trim();
        string fullName = Request.QueryString["FullName"].Trim();
        string phoneNumber = Request.QueryString["PhoneNumber"].Trim();
        string address = Request.QueryString["Address"].Trim();


        string sql_modify = string.Format("update tb_admin set MatKhau='{0}',HoTen='{1}',SoDienTHoai='{2}',DiaChi='{3}' where tendangnhap='{4}'", passWord, fullName, phoneNumber, address, userName);
            if (Connect.Exec(sql_modify))
                Result = "Edited"; 
        Response.Write(Result);
    }
    void Get_Info_User()
    {
        string chuoi="";
        string idUser = Request.QueryString["idUser"].Trim();
        string sql_get_info = "select * from tb_admin where idAdmin = '" + idUser + "'";
        DataTable table = Connect.GetTable(sql_get_info);
        if(table.Rows.Count > 0)
        {
            chuoi = table.Rows[0]["TenDangNhap"] + "@_@" + table.Rows[0]["MatKhau"] + "@_@" + table.Rows[0]["HoTen"] + "@_@" + table.Rows[0]["SoDienThoai"] + "@_@" + table.Rows[0]["DiaChi"];
        }
        Response.Write(chuoi);
    }
    void Delete_User()
    {
        string Result = "";
        string idUser = Request.QueryString["idUser"].Trim();
        if (Connect.Exec("delete tb_admin where idADmin ='" + idUser + "'"))
        {
            Result = "Deleted";
        }
        Response.Write(Result);
    }
}