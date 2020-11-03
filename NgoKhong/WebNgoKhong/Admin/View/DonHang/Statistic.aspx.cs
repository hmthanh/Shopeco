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
    string[] Status = { "Mới tạo", "Đang xử lý", "Hoàn tất", "Hủy"};

    string sChuoiTimKiem = "";
    string sIDGianHang = "";

    string mTenDangNhap = "";
    string mQuyen = "";
    string midNguoiDung = "";
    string dateFrom = "";
    string dateTo = "";

    int Page = 0;
    int MaxPage = 0;
    int PageSize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadDonHang();
            LoadGianHang();
        }
    }
    string getStatus(string name)
    {
        name = name.Trim();
        string html = "<div class='btn-group btn-group-toggle' data-toggle='buttons'>";
        html += "   <label class='btn btn-default " + (name == "Mới tạo" ? "active" : "") + "'>";
        html += "   <input type='radio' name='options' id='option1' autocomplete='off' checked> Mới tạo";
        html += "   </label>";
        html += "   <label class='btn btn-warning " + (name == "Đang xử lý" ? "active" : "") + "'>";
        html += "   <input type='radio' name='options' id='option2' autocomplete='off'>Đang xử lý";
        html += "   </label>";
        //html += "   <label class='btn btn-primary " + (name == "Đang giao" ? "active" : "") + "'>";
        //html += "   <input type='radio' name='options' id='option3' autocomplete='off'>Đang giao";
        //html += "   </label>";
        html += "   <label class='btn btn-success " + (name == "Hoàn tất" ? "active" : "") + "'>";
        html += "       <input type='radio' name='options' id='option3' autocomplete='off'>Hoàn tất";
        html += "   </label>";
        html += "   <label class='btn btn-danger " + (name == "Hủy" ? "active" : "") + "'>";
        html += "       <input type='radio' name='options' id='option4' autocomplete='off'>Hủy";
        html += "   </label>";
        html += " </div>";
        return html;
    }
    string getImageSanPham(string id)
    {
        string sql = "select * from tb_HinhAnhSanPham where idSanPham = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string url = data.Rows[0]["LinkHinh"].ToString();

        return "<img src=" + url + " class='img-hinhanh'>";
    }
    private void LoadGianHang()
    {
        string strSql = "select * from tb_GianHang";
        slGianHang.DataSource = Connect.GetTable(strSql);
        slGianHang.DataTextField = "TenGianHang";
        slGianHang.DataValueField = "ID";
        slGianHang.DataBind();
        slGianHang.Items.Add(new ListItem("-- Tất cả --", "0"));
        slGianHang.Items.FindByValue("0").Selected = true;
    }
    private void LoadDonHang()
    {
        string idShop = slGianHang.Value;
        string dateFrom = txtDateFrom.Value;
        string dateTo = txtDateTo.Value;

        string sql = @"select count(distinct idDonHang) as TongDonHang, count(distinct idUser) as TongUser, sum(case Status when N'Mới tạo' then 1 else 0 end) as TongMoiTao, sum(case Status when N'Đang xử lý' then 1 else 0 end) as TongDangXuLy, sum(case Status when N'Hoàn tất' then 1 else 0 end) as TongHoanTat, sum(case Status when N'Hủy' then 1 else 0 end)  as TongHuy from tb_DonHang where 1 = 1 ";
        string sqlTotalMoney = @"select sum(DonGia * SoLuong) as TongTien from tb_CTDonHang where idDonhang in (select idDonHang from tb_DonHang where 1 = 1 ";
        if (!string.IsNullOrEmpty(idShop) && idShop != "0")
        {
            sql += " and idDonHang in (select idDonHang from tb_CTDonHang where idGianHang = '" + idShop + "') ";
            sqlTotalMoney += " and idDonHang in (select idDonHang from tb_CTDonHang where idGianHang = '" + idShop + "') ";
        }
        
        if (!string.IsNullOrEmpty(dateFrom))
        {
            sql += " and convert(date, Ngay, 103) >= convert(date, '" + dateFrom + "', 103) ";
            sqlTotalMoney  += " and convert(date, Ngay, 103) >= convert(date, '" + dateFrom + "', 103) ";
        }
        if (!string.IsNullOrEmpty(dateTo))
        {
            sql += " and convert(date, Ngay, 103) < convert(date, '" + dateTo + "', 103) ";
            sqlTotalMoney += " and convert(date, Ngay, 103) < convert(date, '" + dateTo + "', 103) ";
        }

        sqlTotalMoney += ")";

        DataTable data = Connect.GetTable(sql);
        DataTable total = Connect.GetTable(sqlTotalMoney);
        totalOrder.InnerHtml = data.Rows[0]["TongDonHang"].ToString();
        totalCustomer.InnerHtml = data.Rows[0]["TongUser"].ToString();
        totalOrderCreate.InnerHtml = data.Rows[0]["TongMoiTao"].ToString();
        totalOrderProcessing.InnerHtml = data.Rows[0]["TongDangXuLy"].ToString();
        totalOrderComplete.InnerHtml = data.Rows[0]["TongHoanTat"].ToString();
        totalOrderCancel.InnerHtml = data.Rows[0]["TongHuy"].ToString();
        string str_money = total.Rows[0]["TongTien"].ToString();
        totalMoney.InnerHtml = StaticData.ParseNumber(str_money);
    }
    string getResult(string sql)
    {
        DataTable data = Connect.GetTable(sql);
        int number = 0;
        try
        {
            number = int.Parse(((data == null || data.Rows.Count <= 0) ? "0" : data.Rows[0][0].ToString()));
        }
        catch
        {
            number = 0;
        }
        
        return number.ToString("#,##");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

        LoadDonHang();
    }
}