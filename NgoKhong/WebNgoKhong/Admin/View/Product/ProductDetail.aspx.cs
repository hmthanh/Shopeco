using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_SanPham_LoaiSanPham : System.Web.UI.Page
{
    string[] Status = { "Mới", "Đang xử lý", "Hoàn tất", "Hủy"};

    string sChuoiTimKiem = "";
    string sIDGianHang = "";

    string mTenDangNhap = "";
    string mQuyen = "";
    string midNguoiDung = "";

    string txtFistPage = "1";
    string txtPage1 = "";
    string txtPage2 = "";
    string txtPage3 = "";
    string txtPage4 = "";
    string txtPage5 = "";
    string txtLastPage = "";
    int Page = 0;
    //int id = 0;
    int MaxPage = 0;
    int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    id = int.Parse(Request.QueryString["id"].ToString());
        //}
        //catch
        //{
        //    id = 1;
        //}
        //if (id > Status.Length)
        //{
        //    id = Status.Length;
        //}
        

        if (!IsPostBack)
        {
//            try
//            {
//                if (Request.QueryString["ChuoiTimKiem"].Trim() != "")
//                {
//                    sChuoiTimKiem = Request.QueryString["ChuoiTimKiem"].Trim();
//                    //txtTimKiem.Value = sChuoiTimKiem;
//                }
//            }
//            catch { }
            //string sql = "SELECT * FROM [tb_Admin] where 1 = 1 ORDER BY idAdmin DESC";
            //StaticData.LoadCombobox(slLoaiSPCapCha,sql,"TenLoaiSanPham","idLoaiSanPham","Tìm kiếm loại sản phẩm con");
            LoadKhachhang();
        }
    }
    
    string getImageSanPham(string id)
    {
        string sql = "select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string url = data.Rows[0]["LinkHinh"].ToString();

        return "<img src=" + url + " class='img-hinhanh'>";
    }
    string getStatus(string name)
    {
        name = name.Trim();
        string html = "<div class='btn-group btn-group-toggle' data-toggle='buttons'>";
        if (name == "true")
        {
            html += "   <label class='btn btn-success active'>";
            html += "   <input type='radio' name='options' id='option1' autocomplete='off' checked>Kích hoạt";
            html += "   </label>";
            html += "   <label class='btn btn-danger'>";
            html += "   <input type='radio' name='options' id='option2' autocomplete='off'>Chưa kích hoạt";
            html += "   </label>";
        }
        else
        {
            html += "   <label class='btn btn-success active'>";
            html += "   <input type='radio' name='options' id='option1' autocomplete='off' checked>Kích hoạt";
            html += "   </label>";
            html += "   <label class='btn btn-danger'>";
            html += "   <input type='radio' name='options' id='option2' autocomplete='off'>Chưa kích hoạt";
            html += "   </label>";
        }
        
        html += " </div>";
        return html;
    }
    private void LoadKhachhang()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        string id = Request.QueryString["id"].ToString();
        _idSanPham.Value = id;

        string sql = @"select * from tb_SanPham where idSanPham = '" + id + "'";
        DataTable table = Connect.GetTable(sql);
        if (table == null)
        {
            return;
        }

        int TotalRows = table.Rows.Count;

        maSanPham.InnerHtml = table.Rows[0]["MaSanPham"].ToString();
        tenSanPham.InnerHtml = table.Rows[0]["TenSanPham"].ToString();

        string idLoaiSanPham = table.Rows[0]["idLoaiSanPham"].ToString();
        loaiSanPham.InnerHtml = StaticData.getField("tb_LoaiSanPham", "TenLoaiSanPham", "idLoaiSanPham", idLoaiSanPham);

        int g = int.Parse(table.Rows[0]["GiaMoi"].ToString());
        gia.InnerHtml = g.ToString("#,##");
        string date = StaticData.DateFormat(table.Rows[0]["NgayTao"].ToString());
        dateCreate.InnerHtml = date;

        string laHome = table.Rows[0]["SetHome"].ToString();
        if (laHome == "True")
        {
            divSetHome.InnerHtml = @"<div class='btn btn-success ' id='lbSetHot' >
                <input type='radio' name='options' id='option5' autocomplete='off'>Hiển thị
                                                </div>";
        }
        else
        {
            divSetHome.InnerHtml = @"<div class='btn btn-danger ' id='lbSetHot' >
                <input type='radio' name='options' id='option5' autocomplete='off'>Ẩn
                                                </div>";
        }
        //////////////////////////////////////////
        string laHot = table.Rows[0]["SetHot"].ToString();
        if (laHot == "True")
        {
            divSetHot.InnerHtml = @"<div class='btn btn-success ' id='lbSetHot' >
                <input type='radio' name='options' id='option5' autocomplete='off'>Hiển thị
                                                </div>";
        }
        else
        {
            divSetHot.InnerHtml = @"<div class='btn btn-danger ' id='lbSetHot' >
                <input type='radio' name='options' id='option5' autocomplete='off'>Ẩn
                                                </div>";
        }
        //////////////////////////////////////////
        string laKichHoat = table.Rows[0]["KichHoat"].ToString();
        if (laKichHoat == "True")
        {
            lb1.Attributes.Add("class", "active btn btn-success");
            lb2.Attributes.Add("class", "btn btn-danger");
        }
        else
        {
            lb1.Attributes.Add("class", "btn btn-success");
            lb2.Attributes.Add("class", "active btn btn btn-danger");
        }
        moTa.InnerHtml = table.Rows[0]["MoTa"].ToString();
        //tinhTrang.InnerHtml = "";

        //sql = "select * from tb_CTDonHang c, tb_SanPham s where c.idSanPham = s.idSanPham and c.idDonHang = '"+id +"'";
//        string html = @"<tr>
//                        <th class='th' style='font-size: 15px; color: white;'>Mã sản phẩm</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Ngày mua hàng</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Tên sản phẩm</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Hình ảnh</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Số lượng</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Giá</th>
//                        <th class='th' style='font-size: 15px; color: white;'>Thành tiền</th>
//                    </tr>";
//        sql = @"select * from tb_SanPham s, tb_CTDonHang c, tb_DonHang d, tb_User u where s.idSanPham = c.idSanPham and d.idDonHang = c.idDonHang and u.ID = d.idUser and u.ID = '" + id + "'";
//        DataTable data = Connect.GetTable(sql);
//        if (data == null)
//        {
//            return;
//        }
//        int tongTien = 0;
//        for (int i = 0; i < data.Rows.Count; i++)
//        {
//            string link = "/" + MyStaticData.GenerateURL(data.Rows[i]["TenSanPham"].ToString()) + "-" + data.Rows[i]["idSanPham"].ToString();
//            int SoLuong = int.Parse(data.Rows[i]["SoLuong"].ToString());
//            int DonGia = int.Parse(data.Rows[i]["DonGia"].ToString());
//            tongTien += SoLuong * DonGia;
//            string strDate = data.Rows[i]["Ngay"].ToString();
            

//            html += "<tr>";
//            html += "<td>" + data.Rows[i]["idSanPham"].ToString() + "</td>";
//            html += "<td>" + StaticData.DateFormat(strDate) + "</td>";
//            html += "<td><a href='" + link + "'>" + data.Rows[i]["TenSanPham"].ToString() + "</a></td>";
//            html += "<td>" + getImageSanPham(data.Rows[i]["idSanPham"].ToString()) + "</td>";
//            html += "<td>" + SoLuong.ToString("#,##") +"</td>";
//            html += "<td>" + DonGia.ToString("#,##") +"</td>";
//            html += "<td>" + (SoLuong * DonGia).ToString("#,##") + "</td>";
//            html += "</tr>";
//        }

//        spTotal.InnerHtml = tongTien.ToString("#,##");
        //dsMuaHang.InnerHtml = html;
    }
}