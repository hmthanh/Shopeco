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
        if (!IsPostBack)
        {
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

        string idDanhMuc = slDanhMuc.Value;
        string idLinhVuc = slLinhVuc.Value;
        string idTinhThanh = slTinhThanh.Value;
        string idQuanHuyen = slQuanHuyen.Value;

        

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
}