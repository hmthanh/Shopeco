using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;

public partial class Ajax : System.Web.UI.Page
{
    string sTenDangNhap = "";
    string sidNguoiDung = "";
    string mQuyen = "";
    DataTable cart = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["QuanLyGiaoNhan_Login"] != null && Session["QuanLyGiaoNhan_Login"].ToString() != "")
        //{
        //    sTenDangNhap = Session["QuanLyGiaoNhan_Login"].ToString();
        //    sidNguoiDung = StaticData.getField("tb_NguoiDung", "idNguoiDung", "TenDangNhap", sTenDangNhap);
        //    mQuyen = StaticData.getField("tb_NguoiDung", "MaQuyen", "TenDangNhap", sTenDangNhap);
        //}
        if (Request.QueryString["Action"] == null)
        {
            return;
        }
        string action = Request.QueryString["Action"].Trim();
        
        switch (action)
        {
            case "DeleteSanPham":
                DeleteSanPham(); break;
            case "ThemGioHang":
                ThemGioHang(); break;
            case "DangKyNhanMail":
                DangKyNhanMail(); break;
            case "DatHang":
                DatHang(); break;
            case "ThayDoiSoLuong":
                ThayDoiSoLuong();break;
        }
    }
    private void DangKyNhanMail()
    {
        string kq = "";
        string email = Request.QueryString["Mail"].Trim();
        string sql = "select * from tb_NhanEmailDK where Mail = N'" + email + "'";
        DataTable tb = Connect.GetTable(sql);
        if (tb == null)
        {
            kq = "Khách hàng đăng ký nhận tin";
            Response.Write(kq);
            return;
        }
        if (tb.Rows.Count > 0)
        {
            kq = "Khách hàng đăng ký nhận tin";
            Response.Write(kq);
            return;
        }
        else
        {
            string sqlInsertCTDH = "insert into tb_NhanEmailDK(Mail)";
            sqlInsertCTDH += " values('" + email + "')";
            bool ktInsertCTDH = Connect.Exec(sqlInsertCTDH);
            kq = "Đã đăng ký thành công, Chúng tôi sẽ liên hệ với bạn qua email !";
        }
        Response.Write(kq);
    }
    private void DatHang()
    {

        string kq = "";

        if (Session["CartSession"] == null)
        {
            kq = "Rỗng";

        }
        else
        {
            string HoTen = StaticData.ValidParameter(Request.QueryString["HoTen"].Trim());
            string DienThoai = StaticData.ValidParameter(Request.QueryString["DienThoai"].Trim());
            string DiaChi = StaticData.ValidParameter(Request.QueryString["DiaChi"].Trim());
            string GhiChu = StaticData.ValidParameter(Request.QueryString["GhiChu"].Trim());
            string ID = StaticData.ValidParameter(Request.QueryString["ID"].Trim());

            string sql = @"INSERT INTO tb_DonHang (MaDonHang,TenKhachHang, SoDienThoai, DiaChi, Email, Ngay, Status,idUser) 
                           VALUES ('" + MyStaticData.TaoMaDonDatHang() +"',N'" + HoTen + "',N'" + DienThoai + "',N'" + DiaChi + "','" + GhiChu + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "',N'Mới'" + "," ;
            if(ID!="")
            {
                sql += "'" + ID + "'";
            }
            else
                sql += "NULL";

                 sql+= ")";
            bool kt = Connect.Exec(sql);

            if (kt)
            {
                string sql2 = "SELECT TOP 1 idDonHang FROM tb_DonHang ORDER BY idDonHang DESC";
                DataTable tb = Connect.GetTable(sql2);
                if (tb.Rows.Count > 0)
                {
                    string idDonHang = tb.Rows[0][0].ToString();
                    cart = Session["CartSession"] as DataTable;
                    foreach (DataRow dr in cart.Rows)
                    {
                        //string sql3 = @"SELECT TOP 1 idSanPham FROM tb_SanPham WHERE Mau = '" + dr["idMau"].ToString() + "' AND Size = '" + dr["idSize"].ToString() + "' AND idSanPham = '" + dr["idSanPham"].ToString() + "'";

                        //DataTable tb3 = Connect.GetTable(sql3);
                        //if (tb3.Rows.Count > 0)
                        //{
                            int idMau = (dr["idMau"].ToString() == "undefined" ? 0 : int.Parse(dr["idMau"].ToString()));
                            string idHangHoa = dr["idSanPham"].ToString();
                        string[] size = dr["idSize"].ToString().Split(',');
                        for (int i = 0; i < size.Length; i++)
                        {
                            string idGianHang = StaticData.getField("tb_SanPham", "IDGianhang", "idSanPham", idHangHoa);
                            string DonGia = StaticData.getField("tb_SanPham", "GiaMoi", "idSanPham", idHangHoa);
                           
                            string sql4 = @"INSERT INTO tb_CTDonHang (idDonHang, idSanPham, SoLuong, DonGia ,idMau,idSize, idGianHang)
                             VALUES ('" + idDonHang + "','" + idHangHoa + "','" + dr["SoLuong"].ToString() + "','" + DonGia + "'";
                            if (idMau != 0)
                                sql4 += ",'" + idMau + "'";
                            else
                                sql4 += ",null";
                            if (size[i] != "" && size[i] != "0")
                                sql4 += ",'" + size[i] + "'";
                            else
                                sql4 += ",null";
                            sql4 += ",'" + idGianHang + "')";
                            bool kt2 = Connect.Exec(sql4);
                        }
                        //}
                    }

                    Session["CartSession"] = null;
                    kq = "True";

                }

            }

        }

        Response.Write(kq);

    }
    private void DeleteSanPham()
    {
        string idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        string idMau = StaticData.ValidParameter(Request.QueryString["idMau"].Trim());
        string idSize = StaticData.ValidParameter(Request.QueryString["idSize"].Trim());

        DataTable cart = Session["CartSession"] as DataTable;

        foreach (DataRow dr in cart.Rows)
        {
            if (dr["idSanPham"].ToString() == idSanPham)
            {
                dr.Delete();
                break;
            }
        }
        
        Session["CartSession"] = cart;
        Response.Write("True");
    }
    private void ThayDoiSoLuong()
    {
        string idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        string SoLuong = StaticData.ValidParameter(Request.QueryString["SoLuong"].Trim());


        DataTable cart = Session["CartSession"] as DataTable;

        foreach (DataRow dr in cart.Rows)
        {
            if (dr["idSanPham"].ToString() == idSanPham)
            {
                dr["SoLuong"] = int.Parse(SoLuong);
                break;
            }
        }

        Session["CartSession"] = cart;

        Response.Write("True");

    }
    private void ThemGioHang()
    {
        if (Session["CartSession"] == null)
        //if (Session["CartSession"] == null)
        {
            cart.Columns.Add("idSanPham");
            cart.Columns.Add("idMau");
            cart.Columns.Add("idSize");
            cart.Columns.Add("SoLuong");
            cart.Columns.Add("Gia");
        }
        else
        {
            cart = Session["CartSession"] as DataTable;
        }

        string idSanPham = StaticData.ValidParameter(Request.QueryString["idSanPham"].Trim());
        string idMau = StaticData.ValidParameter(Request.QueryString["idMau"].Trim());
        string idSize = StaticData.ValidParameter(Request.QueryString["idSize"].Trim());
        string soluong = StaticData.ValidParameter(Request.QueryString["SoLuong"].Trim());
        //cart = Session["CartSession"] as DataTable;
        bool daTonTai = false;
        foreach (DataRow dr in cart.Rows)
        {
            if (dr["idSanPham"].ToString() == idSanPham && dr["idMau"].ToString() == idMau && dr["idSize"].ToString() == idSize)
            {
                dr["SoLuong"] = double.Parse(dr["SoLuong"].ToString()) + double.Parse(soluong);
                daTonTai = true;
                break;
            }
        }
        if (!daTonTai)
        {
            DataRow dr = cart.NewRow();
            dr["idSanPham"] = idSanPham;
            dr["idMau"] = idMau;
            dr["idSize"] = idSize;
            dr["SoLuong"] = soluong;
            dr["Gia"] = StaticData.getField("tb_SanPham", "GiaMoi", "idSanPham", idSanPham);
            cart.Rows.Add(dr);
        }

        Session["CartSession"] = cart;
        //var sessionCart = (List<CartItem>)Session["CartSession"];
        //sessionCart.Find(x => x.idSanPham == idSanPham && x.idMau == idMau && x.idSize == idSize).SoLuong = soluong;
        //Session["CartSession"] = sessionCart;
        //sessionCart.Columns.Add("idLoaiHangHoa");
        //sessionCart.Columns.Add("idMau");
        //sessionCart.Columns.Add("idSize");
        //sessionCart.Columns.Add("SoLuong");
        Response.Write("True");
    }
}