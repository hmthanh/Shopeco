using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class RaoVat_View_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msgError.Visible = false;
        if (!IsPostBack)
        {
            Page1();
            pageValue.Value = "1";
            if (Session["CurrentUser"] == null)
            {
                string url = HttpContext.Current.Request.Url.AbsolutePath;
                Response.RedirectToRoute("login", new { retUrl = url });
            }
            else
            {
                string idUser = Session["CurrentUser"].ToString();
                string adsCode = StaticData.getField("tb_User", "AdsCode", "ID", idUser);
                if (string.IsNullOrEmpty(adsCode))
                {
                    string url = "";
                    Response.RedirectToRoute("usercreateads", new { retUrl = url });
                }
            }
        }
        
        if (!IsPostBack)
        {
            msgDanger.Visible = false;
            LoadLinhVuc();
            LoadTinhThanh();
            LoadThongTinNguoiDung();
        }

        if (IsPostBack && fileHinhAnh.PostedFile != null)
        {
            //LoadLinhVuc();
            //LoadTinhThanh();
            //LoadThongTinNguoiDung();
            if (Request.Files.Count > 10)
            {
                Response.Write("<script>alert('Bạn vui lòng chọn tối đa 10 ảnh!')</script>");
                return;
            }

            for (int j = 0; j < Request.Files.Count; j++)
            {
                HttpPostedFile file = Request.Files[j];
                if (file.ContentLength > 0)
                {
                    string extension = Path.GetExtension(file.FileName);
                    if (extension.ToUpper() == ".JPG" || extension.ToUpper() == ".BMP" || extension.ToUpper() == ".GIF" || extension.ToUpper() == ".PNG")
                    {
                        if (fileHinhAnh.HasFile)
                        {
                            string FileName = file.FileName;
                            string FilePath = "/images/SanPham/" + FileName;
                            file.SaveAs(Server.MapPath(FilePath));

                            hdHinhAnh.Value += "/images/SanPham/" + FileName + "|~~~~|";

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Bạn vui lòng chọn file là hình ảnh!')</script>");
                        return;
                    }
                }
            }
            string htmlHinhAnh = "";
            string[] arrHinhAnh = hdHinhAnh.Value.Split(new string[] { "|~~~~|" }, StringSplitOptions.None);
            for (int i = 0; i < arrHinhAnh.Length; i++)
            {
                if (arrHinhAnh[i].Trim() != "")
                {
                    htmlHinhAnh += @"<div class='divAnh' id='dvHinhAnh_" + arrHinhAnh[i].Split('/')[2].Trim() + "_" + i + "'>";
                    htmlHinhAnh += "<img src='" + arrHinhAnh[i].Trim() + "' style='width: 100px; height: 93px' />";
                    htmlHinhAnh += "<a class='imgDel' onclick='XoaHinhAnh(\"dvHinhAnh_" + arrHinhAnh[i].Split('/')[2].Trim() + "_" + i + "\",\"" + arrHinhAnh[i].Trim() + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
                    htmlHinhAnh += "</div>";
                }
            }
            listImgHangHoa.InnerHtml = htmlHinhAnh;

            //Response.Write("<script>$('#btn1').removeClass('msf-step-active');$('#btn3').addClass('msf-step-active');$('#btnNextStep').hide();$('#content1').hide();$('#content3').show();</script>");
            //content3.Style.Add("display", "block");
            //btn3.Attributes.Add("class", "msf-step col-md-4 msf-step-active");
            //content1.Style.Remove("display");
            //btn1.Attributes.Add("class", "msf-step col-md-4");
            //btnBackStep.Attributes.Add("class","btn btn-success");
        }
    }

    private void LoadThongTinNguoiDung()
    {
        if (Session["CurrentUser"] == null || string.IsNullOrEmpty(Session["CurrentUser"].ToString()))
        {
            return ;
        }
        string phoneNumber = Session["CurrentUser"].ToString();
        
        string sql = "select * from tb_User where ID = '" + phoneNumber + "'";
        DataTable data = Connect.GetTable(sql);

        txtHoTen.Value = data.Rows[0]["FullName"].ToString();
        txtSoDienThoai.Value = data.Rows[0]["PhoneNumber"].ToString();
        txtEmail.Value = data.Rows[0]["Email"].ToString();
        txtDiaChi.Value = data.Rows[0]["Address"].ToString();
    }

    public void LoadLinhVuc()
    {
        string sql = "select * from tb_RVLinhVuc";
        slLinhVuc.DataSource = Connect.GetTable(sql);
        slLinhVuc.DataTextField = "LinhVuc";
        slLinhVuc.DataValueField = "idLinhVuc";
        slLinhVuc.DataBind();
        slLinhVuc.Items.Add(new ListItem("Tất cả lĩnh vực", "0"));
        slLinhVuc.Items.FindByValue("0").Selected = true;
    }
    public void LoadTinhThanh()
    {
        string sql = "select * from tb_tinhthanhpho order by name";
        slTinhThanh.DataSource = Connect.GetTable(sql);
        slTinhThanh.DataTextField = "name";
        slTinhThanh.DataValueField = "matp";
        slTinhThanh.DataBind();
        slTinhThanh.Items.Add(new ListItem("Toàn quốc", "0"));
        slTinhThanh.Items.FindByValue("0").Selected = true;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (!checkForm3())
        {
            return;
        }

        string adsCode = "RVGUEST";
        if (Session["CurrentUser"] != null)
        {
            string id = Session["CurrentUser"].ToString();
            string sqlFindUser = "select * from tb_User where ID = '" + id + "'";
            DataTable data = Connect.GetTable(sqlFindUser);

            if (data != null && data.Rows.Count > 0)
            {
                adsCode = data.Rows[0]["AdsCode"].ToString();
            }
        }

        msgDanger.Visible = true;
        string tieuDe = txtTieuDe.Value;
        string gia = txtGia.Value;
        string moTa = arMoTa.Value;
        string ngayTao = StaticData.GetDate();
        string ngayHetHan = StaticData.ToFormatDate(DateTime.Now.AddDays(10));

        string hoTen = txtHoTen.Value;
        string soDienThoai = txtSoDienThoai.Value;
        string email = txtEmail.Value;
        string diaChi = txtDiaChi.Value;

        string idDanhMuc = slDanhMuc.SelectedValue;
        string idLinhVuc = slLinhVuc.SelectedValue;
        string idTinhThanh = slTinhThanh.SelectedValue;
        string idQuanHuyen = slQuanHuyen.SelectedValue;

        

        if (string.IsNullOrEmpty(tieuDe))
        {
            msgDanger.InnerHtml = "Bạn chưa nhập tiêu đề !";
            return;
        }
        if (string.IsNullOrEmpty(gia))
        {
            msgDanger.InnerHtml = "Bạn chưa chọn giá !";
            return;
        }
        if (string.IsNullOrEmpty(hoTen))
        {
            msgDanger.InnerHtml = "Bạn chưa nhập họ và tên !";
            return;
        }
        if (string.IsNullOrEmpty(soDienThoai))
        {
            msgDanger.InnerHtml = "Bạn chưa nhập số điện thoại !";
            return;
        }
        if (string.IsNullOrEmpty(email))
        {
            msgDanger.InnerHtml = "Bạn chưa nhập họ và tên !";
            return;
        }
        if (string.IsNullOrEmpty(idDanhMuc))
        {
            msgDanger.InnerHtml = "Bạn chưa chọn danh mục !";
            return;
        }
        if (string.IsNullOrEmpty(idLinhVuc))
        {
            msgDanger.InnerHtml = "Bạn chưa chọn lĩnh vực !";
            return;
        }
        if (string.IsNullOrEmpty(idTinhThanh))
        {
            msgDanger.InnerHtml = "Bạn chưa chọn tỉnh thành !";
            return;
        }
        if (string.IsNullOrEmpty(idQuanHuyen))
        {
            msgDanger.InnerHtml = "Bạn chưa chọn quận huyện !";
            return;
        }
        
        //if (!fileHinhAnh.HasFile)
        //{
        //    msgDanger.InnerHtml = "Bạn chưa chọn hình ảnh !";
        //    return;
        //}

        msgDanger.Visible = true;
        string sql = "insert into tb_RaoVat(TieuDe, Gia, MoTa, NgayTao, NgayHetHan, HoTen, SoDienThoai, Email, DiaChi, idDanhMuc, idLinhVuc, idTinhThanh, idQuanHuyen, AdsCode)";
        sql += " values(N'" + tieuDe + "', '" + gia + "', N'" + moTa + "', '" + ngayTao + "', '" + ngayHetHan + "', N'" + hoTen + "', N'" + soDienThoai + "', '" + email + "', N'" + diaChi + "', '" + idDanhMuc + "', '" + idLinhVuc + "', '" + idTinhThanh + "', '" + idQuanHuyen + "', '" + adsCode + "')";
        bool isUpdate = Connect.Exec(sql);
        if (isUpdate)
        {
            string idRaoVat = StaticData.getField("[tb_RaoVat]", "Max(idRaoVat)", "1", "1");
            SaveHinh(idRaoVat);
            Response.RedirectToRoute("raovat", new object { });
        }
        else
        {

        }


        //string sqlInserNguoiDung = "insert into tb_SanPham(MaSanPham, TenSanPham, GiaCu, GiaMoi, Mau, Size, MoTa, idLoaiSanPham, idBrand, SetHome, SetHot, KichHoat)";

        //sqlInserNguoiDung += " values(N'" + MaSanPham + "',N'" + TenSanPham + "',N'" + GiaCu + "',N'" + GiaMoi + "','" + Mau + "','" + Size + "',N'" + MoTa + "',N'" + idLoaiSanPham + "','" + idThuongHieu + "','" + TrangChu + "','" + TinHOT + "','" + KichHoat + "')";
        //bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

        //if (ktInsertNguoiDung)
        //{
        //    id = StaticData.getField("[tb_SanPham]", "Max(idSanPham)", "1", "1");
        //    //them orderdetail
        //    SaveHinh(id);
        //    Response.Redirect(GetRouteUrl("adminSanPham", new { }));
        //}
        //else
        //{
        //    Response.Write("<script>alert('Lỗi !')</script>");
        //}
    }

    

    protected void LoadDsSanPham()
    {
        //if (id != "")
        //{
        //    string sql = "select * from tb_SanPham where idSanPham ='" + id + "'";
        //    DataTable table = Connect.GetTable(sql);
        //    if (table.Rows.Count > 0)
        //    {
        //        btLuu.Text = "SỬA";
        //        txtTenSP.Value = table.Rows[0]["TenSanPham"].ToString();
        //        txtMaSanPham.Value = table.Rows[0]["MaSanPham"].ToString();
        //        txtGiaCu.Value = StaticData.FormatDouble(table.Rows[0]["GiaCu"].ToString());
        //        txtGiaMoi.Value = StaticData.FormatDouble(table.Rows[0]["GiaMoi"].ToString());

        //        string idCapCha1 = "";
        //        string idCapCha2 = "";
        //        string idCapCha3 = table.Rows[0]["idLoaiSanPham"].ToString();
        //        idCapCha2 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha3);
        //        idCapCha1 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha2);
        //        ddlLoaiSPCap1.SelectedValue = idCapCha1;
        //        LoadLoaiSanPham2(idCapCha1);
        //        ddlLoaiSPCap2.SelectedValue = idCapCha2;
        //        LoadLoaiSanPham3(idCapCha2);
        //        slLoaiSPCap3.Value = idCapCha3;

        //        slThuongHieu.Value = table.Rows[0]["idBrand"].ToString();

        //        txtMoTa.Value = table.Rows[0]["MoTa"].ToString();

        //        ckTrangChu.Checked = bool.Parse(table.Rows[0]["SetHome"].ToString());
        //        ckTinHot.Checked = bool.Parse(table.Rows[0]["SetHot"].ToString());
        //        if (table.Rows[0]["KichHoat"].ToString() == "True")
        //            ckKichHoat.Checked = true;
        //        else
        //            ckKichHoat.Checked = false;

        //        string sqlha = @"select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        //        DataTable dataha = Connect.GetTable(sqlha);
        //        if (dataha.Rows.Count > 0)
        //        {
        //            string sHinhAnh = "";
        //            string htmlHinhAnh = "";
        //            for (int i = 0; i < dataha.Rows.Count; i++)
        //            {
        //                sHinhAnh += dataha.Rows[i]["LinkHinh"].ToString().Trim() + "|~~~~|";
        //                htmlHinhAnh += @"<div class='divAnh' id='dvHinhAnh_" + dataha.Rows[i]["LinkHinh"].ToString().Split('/')[2].Trim() + "_" + i + "'>";
        //                htmlHinhAnh += "<img src='" + dataha.Rows[i]["LinkHinh"] + "' style='width: 100px; height: 93px' />";
        //                htmlHinhAnh += "<a class='imgDel' onclick='XoaHinhAnh(\"dvHinhAnh_" + dataha.Rows[i]["LinkHinh"].ToString().Split('/')[2].Trim() + "_" + i + "\",\"" + dataha.Rows[i]["LinkHinh"] + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
        //                htmlHinhAnh += "</div>";
        //                //if (i < dataha.Rows.Count - 1)
        //                //    sHinhAnh += ",";
        //                //html += @"<div class='divAnh' id='dvImg_" + dataha.Rows[i]["idHinhAnhHangHoa"] + "'>";
        //                //html += "<img src=" + dataha.Rows[i]["LinkHinh"] + " style='width: 100px; height: 100px' />";
        //                //html += "<a class='imgDel' onclick='DeleteHinhAnhHanghoa(\"" + dataha.Rows[i]["idHinhAnhHangHoa"] + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
        //                //html += "</div>";
        //            }
        //            hdHinhAnh.Value = sHinhAnh;
        //            listImgHangHoa.InnerHtml = htmlHinhAnh;
        //        }
        //        listMau.Value = table.Rows[0]["Mau"].ToString().Replace("-", ",");
        //        listSize.Value = table.Rows[0]["Size"].ToString().Replace("-", ",");
        //    }
        //}
    }
    protected void SaveHinh(string idRaoVat)
    {
        string[] arrHinhAnh = hdHinhAnh.Value.Split(new string[] { "|~~~~|" }, StringSplitOptions.None);
        for (int i = 0; i < arrHinhAnh.Length; i++)
        {
            if (arrHinhAnh[i].Trim() != "")
            {
                string sql = "insert into tb_HinhAnhRaoVat(idSanPham,LinkHinh)";
                sql += " Values (" + idRaoVat + ",N'" + arrHinhAnh[i].Trim() + "')";
                Connect.Exec(sql);
            }
        }
    }

    protected void slLinhVuc_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string id = Request.QueryString["id"].ToString();
        string ID = slLinhVuc.SelectedValue;
        string sql = "select * from tb_RVDanhMuc where Cap = '" + ID + "'";
        
        slDanhMuc.DataSource = Connect.GetTable(sql);
        slDanhMuc.DataTextField = "TenDanhMuc";
        slDanhMuc.DataValueField = "idDanhMuc";
        slDanhMuc.DataBind();
        slDanhMuc.Items.Add(new ListItem("Tất cả danh mục", "0"));
        slDanhMuc.Items.FindByValue("0").Selected = true;
    }

    protected void slTinhThanh_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idCity = slTinhThanh.SelectedValue;
        string sql = "select * from tb_quanhuyen where matp = '" + idCity + "'";

        slQuanHuyen.DataSource = Connect.GetTable(sql);
        slQuanHuyen.DataTextField = "name";
        slQuanHuyen.DataValueField = "maqh";
        slQuanHuyen.DataBind();
        slQuanHuyen.Items.Add(new ListItem("Tất cả quận huyện", "0"));
        slQuanHuyen.Items.FindByValue("0").Selected = true;
    }

    
    public bool checkForm1()
    {
        int val1 = int.Parse(slLinhVuc.SelectedValue);
        int val2 = int.Parse((string.IsNullOrEmpty(slDanhMuc.SelectedValue) ? "0" : slDanhMuc.SelectedValue));
        int val3 = int.Parse(slTinhThanh.SelectedValue);
        int val4 = int.Parse((string.IsNullOrEmpty(slQuanHuyen.SelectedValue) ? "0" : slQuanHuyen.SelectedValue));
        string val5 = txtGia.Value;
        if (val1 == 0)
        {
            return Error("Bạn phải chọn lĩnh vực !");
        }
        if (val2 == 0)
        {
            return Error("Bạn phải chọn danh mục !");
        }
        if (val3 == 0)
        {
            return Error("Bạn phải chọn tỉnh thành !");
        }
        if (val4 == 0)
        {
            return Error("Bạn phải chọn quận huyện !");
        }
        if (string.IsNullOrEmpty(val5))
        {
            return Error("Bạn phải chọn giá !");
        }

        return true;
    }
    bool Error(string msg)
    {
        msgError.Visible = true;
        msgError.InnerHtml = msg;
        return false;
    }
    public bool checkForm2()
    {
        var val1 = txtHoTen.Value;
        var val2 = txtSoDienThoai.Value;
        var val3 = txtEmail.Value;
        var val4 = txtDiaChi.Value;

        if (string.IsNullOrEmpty(val1))
        {
            return Error("Bạn phải chọn họ và tên");
        }
        if (string.IsNullOrEmpty(val2))
        {
            return Error("Bạn phải chọn số điện thoại !");
        }
        if (string.IsNullOrEmpty(val3))
        {
            return Error("Bạn phải chọn email !");
        }
        if (string.IsNullOrEmpty(val4))
        {
            return Error("Bạn phải chọn số địa chỉ !");
        }

        return true;
    }
    private bool checkForm3()
    {
        var val1 = txtTieuDe.Value;
        var val2 = arMoTa.Value;

        if (string.IsNullOrEmpty(val1))
        {
            return Error("Bạn phải chọn tiêu đề");
        }
        if (string.IsNullOrEmpty(val2))
        {
            return Error("Bạn chưa nhập mô tả");
        }

        return true;
    }
    protected void btnBackStep_Click(object sender, EventArgs e)
    {
        int pageIndex = int.Parse(pageValue.Value);
        switch (pageIndex)
        {
            case 2:
                Page1();
                pageIndex--;
                break;
            case 3:
                Page2();
                pageIndex--;
                break;
            default:
                break;
        }

        pageValue.Value = pageIndex.ToString();
    }
    protected void btnNextStep_Click(object sender, EventArgs e)
    {
        int pageIndex = int.Parse(pageValue.Value);
        switch (pageIndex)
        {
            case 1:
                if (!checkForm1())
                {
                    return;
                }
                Page2();
                pageIndex++;
                
                break;
            case 2:
                if (!checkForm2())
                {
                    return;
                }
                Page3();
                pageIndex++;
                
                break;
            case 3:
                break;
            default:
                break;
        }
        pageValue.Value = pageIndex.ToString();
    }
    void Page1()
    {
        btn1.Attributes.Add("class", "msf-step col-md-4 msf-step-active");
        btn2.Attributes.Add("class", "msf-step col-md-4");
        btn3.Attributes.Add("class", "msf-step col-md-4");

        content1.Visible = true;
        content2.Visible = false;
        content3.Visible = false;

        btnBackStep.Visible = false;
        btnNextStep.Visible = true;
        btnLuu.Visible = false;
    }
    void Page2()
    {
        btn1.Attributes.Add("class", "msf-step col-md-4"); 
        btn2.Attributes.Add("class", "msf-step col-md-4 msf-step-active");
        btn3.Attributes.Add("class", "msf-step col-md-4");

        content1.Visible = false;
        content2.Visible = true;
        content3.Visible = false;

        btnBackStep.Visible = true;
        btnNextStep.Visible = true;
        btnLuu.Visible = false;
    }
    void Page3()
    {
        btn1.Attributes.Add("class", "msf-step col-md-4");
        btn2.Attributes.Add("class", "msf-step col-md-4");
        btn3.Attributes.Add("class", "msf-step col-md-4 msf-step-active");

        content1.Visible = false;
        content2.Visible = false;
        content3.Visible = true;

        btnBackStep.Visible = true;
        btnNextStep.Visible = false;
        btnLuu.Visible = true;
    }
}
