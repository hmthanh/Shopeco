using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Home_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            msgError.Visible = false;
            LoadList();
        }
        if (IsPostBack && fileHinhAnh.PostedFile != null)
        {
            //if (Request.Files.Count > 10)
            //{
            //    Response.Write("<script>alert('Bạn vui lòng chọn tối đa 10 ảnh!')</script>");
            //    return;
            //}

            //for (int j = 0; j < Request.Files.Count; j++)
            //{

            //}
            HttpPostedFile file = Request.Files[0];
            if (file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToUpper() == ".JPG" || extension.ToUpper() == ".BMP" || extension.ToUpper() == ".GIF" || extension.ToUpper() == ".PNG")
                {
                    if (fileHinhAnh.HasFile)
                    {
                        string FileName = file.FileName;
                        string FilePath = "/Assets/img/" + FileName;
                        file.SaveAs(Server.MapPath(FilePath));

                        hdHinhAnh.Value += "/Assets/img/" + FileName + "|~~~~|";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Đã có lỗi, vui lòng kiểm tra định dạng ảnh !')</script>");
                    return;
                }
            }
            string htmlHinhAnh = "";
            string[] arrHinhAnh = hdHinhAnh.Value.Split(new string[] { "|~~~~|" }, StringSplitOptions.None);
            //for (int i = 0; i < arrHinhAnh.Length; i++)
            //{

            //}
            if (arrHinhAnh[0].Trim() != "")
            {
                htmlHinhAnh += @"<div class='divAnh' id='dvHinhAnh_" + arrHinhAnh[0].Split('/')[2].Trim() + "_" + 0 + "'>";
                htmlHinhAnh += "<img src='" + arrHinhAnh[0].Trim() + "' style='width: 100px; height: 93px' />";
                htmlHinhAnh += "<a class='imgDel' onclick='XoaHinhAnh(\"dvHinhAnh_" + arrHinhAnh[0].Split('/')[2].Trim() + "_" + 0 + "\",\"" + arrHinhAnh[0].Trim() + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
                htmlHinhAnh += "</div>";
            }

            imgUploaded.InnerHtml = htmlHinhAnh;
        }
    }
    void ShowError(string message)
    {
        msgError.Visible = true;
        msgError.InnerHtml = message;
    }
    private void LoadList()
    {
        string sql = "  select * from Doctor d, [User] u where d.UserID = u.ID";
        DataTable data = DataProvider.GetTable(sql);
        if (data == null || data.Rows.Count <= 0)
        {
            return;
        }

        string html = "";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string col1 = data.Rows[i]["ID"].ToString();
            string col2 = data.Rows[i]["Fullname"].ToString();
            string col3 = data.Rows[i]["Specialist"].ToString();
            string col4 = data.Rows[i]["Phone"].ToString();
            string col5 = data.Rows[i]["Email"].ToString();

            string col6 = "<a href='" + GetRouteUrl("infodoctor", new { id = data.Rows[i]["ID"].ToString() }) + "'><i class='fa fa-lg fa-eye'></i></a>";

            html += "<tr>";
            html += "        <td>" + col1 + "</td>";
            html += "        <td>" + col2 + "</td>";
            html += "        <td>" + col3 + "</td>";
            html += "        <td>" + col4 + "</td>";
            html += "        <td>" + col5 + "</td>";
            html += "        <td style='text-align:center;'>" + col6 + "</td>";
            html += "</tr>";
        }
    }
    protected string SaveImage()
    {
        string[] arrHinhAnh = hdHinhAnh.Value.Split(new string[] { "|~~~~|" }, StringSplitOptions.None);
        if (arrHinhAnh[0].Trim() != "")
        {
            string sql = "insert into [Image](Url)";
            sql += " Values (N'" + arrHinhAnh[0].Trim() + "')";
            DataProvider.Exec(sql);
        }

        string idImage = Utils.getField("[Image]", "MAX(ID)", "1", "1");

        return idImage;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Value;
        string password = txtPassword.Value;
        string name = txtName.Value;
        string email = txtEmail.Value;
        string phone = txtPhone.Value;
        string specialist = txtSpecialist.Value;
        string regency = txtRegency.Value;
        string working = txtWorking.Value;
        string experience = txtExperience.Value;
        string education = txtEducation.Value;
        string description = txtDescription.Value;

        if (string.IsNullOrEmpty(username))
        {
            ShowError("Vui lòng nhập tên đăng nhập !");
            return;
        }
        if (string.IsNullOrEmpty(password))
        {
            ShowError("Vui lòng nhập mật khẩu !");
            return;
        }
        if (string.IsNullOrEmpty(name))
        {
            ShowError("Vui lòng nhập họ và tên !");
            return;
        }
        if (string.IsNullOrEmpty(email))
        {
            ShowError("Vui lòng nhập email !");
            return;
        }
        if (string.IsNullOrEmpty(phone))
        {
            ShowError("Vui lòng nhập số điện thoại !");
            return;
        }
        if (string.IsNullOrEmpty(regency))
        {
            ShowError("Vui lòng nhập chức vụ hiện tại !");
            return;
        }
        if (string.IsNullOrEmpty(working))
        {
            ShowError("Vui lòng nhập công viện hiện tại !");
            return;
        }
        if (string.IsNullOrEmpty(education))
        {
            ShowError("Vui lòng nhập giáo dục !");
            return;
        }
        if (string.IsNullOrEmpty(description))
        {
            ShowError("Vui lòng nhập mô tả !");
            return;
        }

        string idImage = SaveImage();

        //string id = Request.QueryString["id"].ToString();
        string sql = "insert into [User](Username, Password, Fullname, Phone, Email, UserType, ImageID) values('" + username + "', '" + password + "', N'" + name + "', '" + phone + "', '" + email + "', '2', '" + idImage + "')";

        bool isInserted = DataProvider.Exec(sql);

        if (isInserted)
        {
            string idUser = Utils.getField("[User]", "MAX(ID)", "1", "1");

            string sqlDoctor = "insert into Doctor(UserID, [Name], Regency, Specialist, Working, Sumary, Experience, Education) values('" + idUser + "' ,N'" + name + "', N'" + regency + "', N'" + specialist + "', N'" + working + "', N'" + description + "', N'" + experience + "', N'" + education + "')";
            bool isInsertedDoctor = DataProvider.Exec(sqlDoctor);
            if (isInsertedDoctor)
            {
                Response.RedirectToRoute("listdoctor", new { });
            }

            //Response.Redirect(GetRouteUrl("userproduct", new { }));
        }
        else
        {

        }

        
        //string sqlUpdateNguoiDung = "";
        //sqlUpdateNguoiDung += "update tb_SanPham set";
        //sqlUpdateNguoiDung += " TenSanPham = N'" + TenSanPham + "'";
        //sqlUpdateNguoiDung += " ,MaSanPham = N'" + MaSanPham + "'";
        //sqlUpdateNguoiDung += " ,GiaCu = N'" + GiaCu + "'";
        //sqlUpdateNguoiDung += " ,GiaMoi = N'" + GiaMoi + "'";
        //sqlUpdateNguoiDung += " ,Mau = N'" + Mau + "'";
        //sqlUpdateNguoiDung += " ,Size = N'" + Size + "'";
        //sqlUpdateNguoiDung += " ,idLoaiSanPham = N'" + idLoaiSanPham + "'";
        //sqlUpdateNguoiDung += " ,idBrand = '" + idBrand + "'";
        //sqlUpdateNguoiDung += " ,MoTa = N'" + MoTa + "'";
        //sqlUpdateNguoiDung += " ,SetHome = '" + TrangChu + "'";
        //sqlUpdateNguoiDung += " ,SetHot = '" + TinHOT + "'";
        //sqlUpdateNguoiDung += " ,MaLoaiDatHang = '" + maLoaiDatHang + "'";
        //sqlUpdateNguoiDung += " ,KichHoat = '0'";
        //sqlUpdateNguoiDung += " where idSanPham ='" + id + "'";
        //bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
        //if (ktUpdateNguoiDung)
        //{
        //    Connect.Exec("delete tb_HinhAnhSanPham where idSanPham = " + id);
        //    SaveHinh(id);
        //    if (Page != "")
        //        Response.Redirect(GetRouteUrl("userproduct", new { page = Page }));
        //    Response.Redirect(GetRouteUrl("userproduct", new { }));
        //}
        //else
        //{
        //    msgError.InnerHtml = "Lỗi  2 !";
        //    msgError.Visible = true;
        //    return;
        //}
}
}