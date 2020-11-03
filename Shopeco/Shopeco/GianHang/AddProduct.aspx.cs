using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_AddProduct : System.Web.UI.Page
{
    string id = "";
    string idGianHang = "";
    //string TenDangNhapGoc = "";

    string Page = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            idGianHang = Session["CurrentUser"].ToString().Trim();
        }
        try
        {
            //id = RouteData.Values["id"].ToString();
            id = Request.QueryString["id"].ToString();
            //idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        }
        catch {}
        try
        {
            Page = StaticData.ValidParameter(Request.QueryString["Page"].Trim());
        }
        catch { }
        if (!IsPostBack)
        {
            LoadThuongHieu();
            LoadLoaiSanPham();
            LoadColor();
            LoadSize();
            LoadThongTinSanPham();
            LoadMaSanPham();
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
                    //if (fileHinhAnh.PostedFile.FileName.Length > 0)
                    //{
                    string extension = Path.GetExtension(file.FileName);
                    if (extension.ToUpper() == ".JPG" || extension.ToUpper() == ".BMP" || extension.ToUpper() == ".GIF" || extension.ToUpper() == ".PNG")
                    {
                        if (fileHinhAnh.HasFile)
                        {
                            string FileName = file.FileName;
                            string FilePath = "/images/SanPham/" + FileName;
                            //StaticData.LoadWaterMark(file, Server.MapPath(FilePath));
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

                    //htmlHinhAnh += "<div id='dvHinhAnh_" + arrHinhAnh[i].Trim() + "' class='imgupload'>";
                    //htmlHinhAnh += "<p style='margin:0px'><img src='../Images/td/slides/" + arrHinhAnh[i].Trim() + "' style='width: 150px;height: 110px;' /></p>";
                    //htmlHinhAnh += "<p style='text-align:center;margin: 0px;padding: 1px;background: #d6d6d6;'><img onclick='XoaHinhAnh(\"dvHinhAnh_" + arrHinhAnh[i].Trim() + "\",\"" + arrHinhAnh[i].Trim() + "\")' src='../images/icons/delete.png' style='width:25px; height:25px; cursor:pointer' /></p>";
                    //htmlHinhAnh += "</div>";
                }
            }
            listImgHangHoa.InnerHtml = htmlHinhAnh;

        }
    }
    private void LoadThuongHieu()
    {
        string strSql = "select  * from tb_Brands";
        slThuongHieu.DataSource = Connect.GetTable(strSql);
        slThuongHieu.DataTextField = "TieuDe";
        slThuongHieu.DataValueField = "idBrand";
        slThuongHieu.DataBind();
        slThuongHieu.Items.Add(new ListItem("Chọn thương hiệu", "0"));
        slThuongHieu.Items.FindByValue("0").Selected = true;
    }
    private void LoadLoaiSanPham()
    {
        string strSql = "select  * from tb_LoaiSanPham where idCapCha=0";
        ddlLoaiSPCap1.DataSource = Connect.GetTable(strSql);
        ddlLoaiSPCap1.DataTextField = "TenLoaiSanPham";
        ddlLoaiSPCap1.DataValueField = "idLoaiSanPham";
        ddlLoaiSPCap1.DataBind();
        ddlLoaiSPCap1.Items.Add(new ListItem("Chọn loại sản phẩm", "0"));
        ddlLoaiSPCap1.Items.FindByValue("0").Selected = true;
    }
    private void LoadLoaiSanPham2(string idLoaiSanPham1)
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha='" + idLoaiSanPham1 + "'";
        if (id != "0" && id != "")
            strSql += " and idLoaiSanPham!='" + id + "'";
        strSql += " order by TenLoaiSanPham";
        ddlLoaiSPCap2.DataSource = Connect.GetTable(strSql);
        ddlLoaiSPCap2.DataTextField = "TenLoaiSanPham";
        ddlLoaiSPCap2.DataValueField = "idLoaiSanPham";
        ddlLoaiSPCap2.DataBind();
        ddlLoaiSPCap2.Items.Add(new ListItem("--Chọn loại SP cấp 2--", ""));
        ddlLoaiSPCap2.Items.FindByText("--Chọn loại SP cấp 2--").Selected = true;
    }
    private void LoadLoaiSanPham3(string idLoaiSanPham2)
    {
        string strSql = "select * from tb_LoaiSanPham where idCapCha='" + idLoaiSanPham2 + "'";
        if (id != "0" && id != "")
            strSql += " and idLoaiSanPham!='" + id + "'";
        strSql += " order by TenLoaiSanPham";
        slLoaiSPCap3.DataSource = Connect.GetTable(strSql);
        slLoaiSPCap3.DataTextField = "TenLoaiSanPham";
        slLoaiSPCap3.DataValueField = "idLoaiSanPham";
        slLoaiSPCap3.DataBind();
        slLoaiSPCap3.Items.Add(new ListItem("--Chọn loại SP cấp 3--", ""));
        slLoaiSPCap3.Items.FindByText("--Chọn loại SP cấp 3--").Selected = true;
    }
    private void LoadColor()
    {
        string sql = @"select *, 'sp' = (select idMau from (SELECT idSanPham, Members.Member.value('.','VARCHAR(8000)') idMau
FROM
(--Convert delimited string to XML
 SELECT idSanPham, CAST('<p><p>'
        + REPLACE(Mau, '-' , '</p><p>') 
    + '</p></p>' AS XML) AS tempPlayer 
 FROM tb_SanPham ) AS tempPlayer
 CROSS APPLY tempPlayer.nodes('/p/p') Members(Member)) as tb where idMau = m.idMau and idSanPham = '" + id + "') from tb_Mau m where KichHoat = 1";
        DataTable table = Connect.GetTable(sql);

        string html = "";
        string listmau = "";
        html += "<div class='row form-group '>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "   <span class='col-lg-3'  style='display:flex'>";
            html += "       <input class='uniform shopee-checkbox' onchange='CapNhatListMau(this.checked,\"" + table.Rows[i]["idMau"] + "\")' id='color_" + table.Rows[i]["idMau"] + "' " + (table.Rows[i]["sp"].ToString() != "" ? "checked" : "") + " type='checkbox'/>";
            html += "       <span style='padding-left: 5px;'>" + table.Rows[i]["TenMau"] + "</span>&nbsp;&nbsp;";
            html += "<div style='background-color:" + table.Rows[i]["MaMau"].ToString() + "; width:20px'>&nbsp;</div>";
            html += "   </span>";
            if (table.Rows[i]["sp"].ToString() != "")
            {
                if (listmau != "")
                    listmau += ",";
                listmau += table.Rows[i]["idMau"] + "|" + table.Rows[i]["sp"];
            }
        }
        html += "</div>";
        listImg.Value = listmau;
        dvColor.InnerHtml = html;
    }
    private void LoadSize()
    {
        string sql = @"select *, 'sp' = (select idSize from (SELECT idSanPham, Members.Member.value('.','VARCHAR(8000)') idSize
FROM
(--Convert delimited string to XML
 SELECT idSanPham, CAST('<p><p>'
        + REPLACE(Size, '-' , '</p><p>') 
    + '</p></p>' AS XML) AS tempPlayer 
 FROM tb_SanPham ) AS tempPlayer
 CROSS APPLY tempPlayer.nodes('/p/p') Members(Member)) as tb where idSize = m.idSize and idSanPham = '" + id + "') from tb_Size m where KichHoat = 1";
        DataTable table = Connect.GetTable(sql);

        string html = "";
        string listmau = "";
        html += "<div class='row form-group '>";
        for (int i = 0; i < table.Rows.Count; i++)
        {
            html += "   <span class='col-lg-3' style='display:flex;margin-top: 10px;'>";
            html += "       <input class='uniform shopee-checkbox' onchange='CapNhatListSize(this.checked,\"" + table.Rows[i]["idSize"] + "\")' id='size_" + table.Rows[i]["idSize"] + "' " + (table.Rows[i]["sp"].ToString() != "" ? "checked" : "") + " type='checkbox'/>";
            html += "       <span style='padding-left: 5px;'>" + table.Rows[i]["Size"] + "</span>&nbsp;&nbsp;";
            html += "   </span>";
            if (table.Rows[i]["sp"].ToString() != "")
            {
                if (listmau != "")
                    listmau += ",";
                listmau += table.Rows[i]["idSize"] + "|" + table.Rows[i]["sp"];
            }
        }
        html += "</div>";
        listImg.Value = listmau;
        dvSize.InnerHtml = html;
    }

    private void LoadThongTinSanPham()
    {
        if (id != "")
        {
            string sql = "select * from tb_SanPham where idSanPham ='" + id + "'";
            DataTable table = Connect.GetTable(sql);
            if (table.Rows.Count > 0)
            {
                btLuu.Text = "SỬA";
                txtTenSP.Value = table.Rows[0]["TenSanPham"].ToString();
                txtMaSanPham.Value = table.Rows[0]["MaSanPham"].ToString();
                txtGiaCu.Value = StaticData.FormatDouble(table.Rows[0]["GiaCu"].ToString());
                txtGiaMoi.Value = StaticData.FormatDouble(table.Rows[0]["GiaMoi"].ToString());
                ddlLoaiSPCap1.SelectedValue = table.Rows[0]["idLoaiSanPham"].ToString();
                txtMoTa.Value = table.Rows[0]["MoTa"].ToString();

                string idCapCha1 = "";
                string idCapCha2 = "";
                string idCapCha3 = table.Rows[0]["idLoaiSanPham"].ToString();
                idCapCha2 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha3);
                idCapCha1 = StaticData.getField("tb_LoaiSanPham", "idCapCha", "idLoaiSanPham", idCapCha2);
                ddlLoaiSPCap1.SelectedValue = idCapCha1;
                LoadLoaiSanPham2(idCapCha1);
                ddlLoaiSPCap2.SelectedValue = idCapCha2;
                LoadLoaiSanPham3(idCapCha2);
                slLoaiSPCap3.Value = idCapCha3;

                slThuongHieu.Value = table.Rows[0]["idThuongHieu"].ToString();

                //ckTrangChu.Checked = bool.Parse(table.Rows[0]["SetHome"].ToString());
                //ckTinHot.Checked = bool.Parse(table.Rows[0]["SetHot"].ToString());
                //ckKichHoat.Checked = bool.Parse(table.Rows[0]["KichHoat"].ToString());

                string sqlha = @"select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
                DataTable dataha = Connect.GetTable(sqlha);
                if (dataha.Rows.Count > 0)
                {
                    string sHinhAnh = "";
                    string htmlHinhAnh = "";
                    for (int i = 0; i < dataha.Rows.Count; i++)
                    {
                        sHinhAnh += dataha.Rows[i]["LinkHinh"].ToString().Trim() + "|~~~~|";
                        htmlHinhAnh += @"<div class='divAnh' id='dvHinhAnh_" + dataha.Rows[i]["LinkHinh"].ToString().Split('/')[2].Trim() + "_" + i + "'>";
                        htmlHinhAnh += "<img src='" + dataha.Rows[i]["LinkHinh"] + "' style='width: 100px; height: 93px' />";
                        htmlHinhAnh += "<a class='imgDel' onclick='XoaHinhAnh(\"dvHinhAnh_" + dataha.Rows[i]["LinkHinh"].ToString().Split('/')[2].Trim() + "_" + i + "\",\"" + dataha.Rows[i]["LinkHinh"] + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
                        htmlHinhAnh += "</div>";
                        //if (i < dataha.Rows.Count - 1)
                        //    sHinhAnh += ",";
                        //html += @"<div class='divAnh' id='dvImg_" + dataha.Rows[i]["idHinhAnhHangHoa"] + "'>";
                        //html += "<img src=" + dataha.Rows[i]["LinkHinh"] + " style='width: 100px; height: 100px' />";
                        //html += "<a class='imgDel' onclick='DeleteHinhAnhHanghoa(\"" + dataha.Rows[i]["idHinhAnhHangHoa"] + "\")' title='Xóa ảnh'><i class='fa fa-times'></i></a>";
                        //html += "</div>";
                    }
                    hdHinhAnh.Value = sHinhAnh;
                    listImgHangHoa.InnerHtml = htmlHinhAnh;
                }
                listMau.Value = table.Rows[0]["Mau"].ToString().Replace("-", ",");
                listSize.Value = table.Rows[0]["Size"].ToString().Replace("-", ",");
            }
        }
    }
    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    private void LoadMaSanPham()
    {
        if (Request.QueryString["id"] == null)
        {
            txtMaSanPham.Value = RandomString(9);
        }
    }
    protected void btLuu_Click(object sender, EventArgs e)
    {
        string MaSanPham = "";
        string TenSanPham = "";
        string GiaCu = "";
        string GiaMoi = "";
        string idLoaiSanPham = "";
        string idThuongHieu = "";
        string MoTa = "";
        string TrangChu = "";
        string TinHOT = "";
        string Mau = "";
        string Size = "";

        //Tên Người Dùng
        if (txtMaSanPham.Value.Trim() != "")
        {
            MaSanPham = txtMaSanPham.Value.Trim();
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa nhập mã sản phẩm!')</script>");
            return;
        }
        if (txtTenSP.Value.Trim() != "")
        {
            TenSanPham = txtTenSP.Value.Trim();
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa nhập tên sản phẩm!')</script>");
            return;
        }
        if(slLoaiSPCap3.Value.Trim() != "")
            idLoaiSanPham = slLoaiSPCap3.Value.Trim();
        else
        {
            Response.Write("<script>alert('Bạn chưa chọn loại sản phẩm!')</script>");
            return;
        }
        if (slThuongHieu.Value.Trim() != "")
            idThuongHieu = slThuongHieu.Value.Trim();
        else
        {
            Response.Write("<script>alert('Bạn chưa chọn thương hiệu')</script>");
            return;
        }
        if (idLoaiSanPham == "0")
        {
            Response.Write("<script>alert('Bạn chưa chọn loại sản phẩm!')</script>");
            return;
        }
        //Số Điện Thoại
        MaSanPham = txtMaSanPham.Value.Trim();
        GiaCu = txtGiaCu.Value.Trim().Replace(",", "");
        GiaMoi = txtGiaMoi.Value.Trim().Replace(",", "");
        //CMND
        MoTa = txtMoTa.Value.Trim();
        Mau = listMau.Value.Trim().Replace(",", "-");
        Size = listSize.Value.Trim().Replace(",", "-");
        //Quyền
        //TrangChu = ckTrangChu.Checked.ToString();
        ////TinHOT = ckTinHot.Checked.ToString();
        //KichHoat = ckKichHoat.Checked.ToString();

        
        //string email = Session["CurrentUser"].ToString();
        //string sql = "select ID from tb_GianHang where Email = N'"+ email +"'";
        //DataTable dt = Connect.GetTable(sql);
        //string idGianHang = "";
        //if (dt.Rows.Count > 0)
        //{
        //    idGianHang= dt.Rows[0]["ID"].ToString();
        //}
        string phone = Session["CurrentUser"].ToString();
        idGianHang = StaticData.getField("tb_GianHang", "ID", "SoDienThoai", phone);

        if (id == "0" || id == "")
        {
            string sqlInserNguoiDung = "insert into tb_SanPham(MaSanPham, TenSanPham, GiaCu, GiaMoi, Mau, Size, MoTa, idLoaiSanPham, idThuongHieu, SetHome, SetHot, KichHoat, IDGianhang)";
            sqlInserNguoiDung += " values(N'" + MaSanPham + "',N'" + TenSanPham + "',N'" + GiaCu + "',N'" + GiaMoi + "','" + Mau + "','" + Size + "',N'" + MoTa + "',N'" + idLoaiSanPham + "','"+ idThuongHieu +"','0','0','1', '" + idGianHang +"')";
            bool ktInsertNguoiDung = Connect.Exec(sqlInserNguoiDung);

            if (ktInsertNguoiDung)
            {
                id = StaticData.getField("[tb_SanPham]", "Max(idSanPham)", "1", "1");
                //them orderdetail
                SaveHinh(id);
                Response.Redirect(GetRouteUrl("gianhang_shopproduct", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi !')</script>");
            }
        }
        else
        {
            string sqlUpdateNguoiDung = "";
            sqlUpdateNguoiDung += "update tb_SanPham set";
            sqlUpdateNguoiDung += " TenSanPham = N'" + TenSanPham + "'";
            sqlUpdateNguoiDung += " ,MaSanPham = N'" + MaSanPham + "'";
            sqlUpdateNguoiDung += " ,GiaCu = N'" + GiaCu + "'";
            sqlUpdateNguoiDung += " ,GiaMoi = N'" + GiaMoi + "'";
            sqlUpdateNguoiDung += " ,Mau = N'" + Mau + "'";
            sqlUpdateNguoiDung += " ,Size = N'" + Size + "'";
            sqlUpdateNguoiDung += " ,idLoaiSanPham = N'" + idLoaiSanPham + "'";
            sqlUpdateNguoiDung += " ,idThuongHieu = '" + idThuongHieu + "'";
            sqlUpdateNguoiDung += " ,MoTa = N'" + MoTa + "'";
            sqlUpdateNguoiDung += " ,SetHome = '" + TrangChu + "'";
            sqlUpdateNguoiDung += " ,SetHot = '" + TinHOT + "'";
            sqlUpdateNguoiDung += " where idSanPham ='" + id + "'";
            bool ktUpdateNguoiDung = Connect.Exec(sqlUpdateNguoiDung);
            if (ktUpdateNguoiDung)
            {
                Connect.Exec("delete tb_HinhAnhSanPham where idSanPham = " + id);
                SaveHinh(id);
                if (Page != "")
                    Response.Redirect(GetRouteUrl("gianhang_shopproduct", new { page = Page }));
                Response.Redirect(GetRouteUrl("gianhang_shopproduct", new { }));
            }
            else
            {
                Response.Write("<script>alert('Lỗi 2 !')</script>");
            }
        }
    }
    protected void SaveHinh(string idSanPham)
    {
        string[] arrHinhAnh = hdHinhAnh.Value.Split(new string[] { "|~~~~|" }, StringSplitOptions.None);
        for (int i = 0; i < arrHinhAnh.Length; i++)
        {
            if (arrHinhAnh[i].Trim() != "")
            {
                string sql = "insert into tb_HinhAnhSanPham(idSanPham,LinkHinh)";
                sql += " Values (" + idSanPham + ",N'" + arrHinhAnh[i].Trim() + "')";
                Connect.Exec(sql);
            }
        }
    }
    protected void btHuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(GetRouteUrl("gianhang_shopproduct", new { }));
    }
    protected void ddlLoaiSPCap1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idLoaiSanPham1 = ddlLoaiSPCap1.SelectedValue.Trim();
        LoadLoaiSanPham2(idLoaiSanPham1);
    }
    protected void ddlLoaiSPCap2_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idLoaiSanPham2 = ddlLoaiSPCap2.SelectedValue.Trim();
        LoadLoaiSanPham3(idLoaiSanPham2);
    }
}