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
            case "Logout":
                Logout(); break;
            case "LinhVuc":
                LinhVuc(); break;
            case "UserProduct":
                UserProduct(); break;
            case "UserOrder":
                UserOrder(); break;
            case "UserBought":
                UserBought(); break;
            case "UserAds":
                UserAds(); break;
            case "DeleteProduct":
                DeleteProduct(); break;
            case "TinhThanh":
                QuanHuyen(); break;
            case "DeleteSanPham":
                DeleteSanPham(); break;
            case "ThemGioHang":
                ThemGioHang(); break;
            case "DangKyNhanMail":
                DangKyNhanMail(); break;
            case "DatHang":
                DatHang(); break;
            case "ThayDoiSoLuong":
                ThayDoiSoLuong(); break;
            case "ShowProductHot":
                ShowProductHot(); break;
            case "ShowProductHome":
                ShowProductHome(); break;
        }
    }

    private void Logout()
    {
        


    }

    string[] Status = { "Mới tạo", "Đang xử lý", "Hoàn tất", "Hủy" };
    string[] StatusColor = { "btn btn-default ", "btn btn-warning", "btn btn-success", "btn btn-danger " };
    int getIDStatus(string status)
    {
        for (int i = 0; i < Status.Length; i++)
        {
            if (Status[i] == status)
            {
                return i;
            }
        }

        return 0;
    }
    private void UserBought()
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        string typeID = Request.QueryString["type"].ToString();
        string dateSearch = Request.QueryString["date"].ToString();
        string idUser = Session["CurrentUser"].ToString();

        //string userCode = StaticData.getField("tb_User", "UserCode", "ID", idUser);

        //string sqlOrder = "select * from tb_DonHang where "
        //string sql = @"select *, 'TongTien' = (select isNull(Sum(SoLuong * DonGia),0) from tb_CTDonHang where idDonHang = d.idDonHang) from tb_CTDonHang c, tb_DonHang d, tb_SanPham s where c.idDonHang = d.idDonHang and s.idSanPham = c.idSanPham and c.idGianHang = '" + idShop + "'";
        //string sql = @"select *, 'TongTien' = (select isNull(Sum(SoLuong * DonGia),0) from tb_CTDonHang where idDonHang = d.idDonHang) from tb_DonHang d where UserCode = 'KH0123456'";//" + userCode + "'";

//        string sql = @"select * from
//            (
//	            SELECT ROW_NUMBER() OVER
//                  (
//                        ORDER BY ctdh.idSanPham desc
//                  )AS RowNumber
//	              ,ctdh.*
//                  FROM tb_CTDonHang ctdh inner join tb_DonHang dh on ctdh.idDonHang=dh.idDonHang
//                  inner join tb_SanPham sp on ctdh.idSanPham=sp.idSanPham where 1 = 1";
//        sql += ") as tb1 ";
        string sqlOrder = @"select * from
            (
	            SELECT ROW_NUMBER() OVER
                  (
                        ORDER BY dh.Ngay desc
                  )AS RowNumber
	              ,dh.*
                  FROM tb_DonHang dh where dh.idUser = '" + idUser + "' ";
        if (!String.IsNullOrEmpty(dateSearch))
        {
            sqlOrder += " and convert(date, Ngay, 103) = convert(date, '" + dateSearch + "' , 103)";
        }
        switch (typeID)
        {
            case "1":
                sqlOrder += " and Status = N'Mới tạo' ";
                break;                     
            case "2":                      
                sqlOrder += " and Status = N'Đang xử lý' ";
                break;                     
            case "3":                      
                sqlOrder += " and Status = N'Hoàn tất' ";
                break;                     
            case "4":                      
                sqlOrder += " and Status = N'Hủy' ";
                break;
            default: case "0":
                break;
        }
        sqlOrder += ") as tb1 ";
        //sql += "WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";


//        string sqlOrder = @"select * from
//            (
//	            SELECT ROW_NUMBER() OVER
//                  (
//                        ORDER BY ctdh.idSanPham desc
//                  )AS RowNumber
//	              ,ctdh.*
//                  FROM tb_CTDonHang ctdh inner join tb_DonHang dh on ctdh.idDonHang = dh.idDonHang
//                  inner join tb_SanPham sp on ctdh.idSanPham = sp.idSanPham where 1 = 1";
//        sqlOrder += ") as tb1 ";
        //string sqlOrder = "select * from tb_DonHang where idUser = '" + idUser + "'";
        DataTable data = Connect.GetTable(sqlOrder);
        
        string json = "[";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            json += "{";
            string dateOrder = StaticData.DateFormat(data.Rows[i]["Ngay"].ToString());
            json += "\"col1\": \"" + dateOrder + "\",";
            string maDonHang = data.Rows[i]["MaDonHang"].ToString();
            json += "\"col2\": \"" + maDonHang + "\",";
            json += "\"col3\": \"" + data.Rows[i]["TenKhachHang"].ToString() + "\",";
            json += "\"col4\": \"" + data.Rows[i]["DiaChi"].ToString() + "\",";
            json += "\"col5\": \"" + data.Rows[i]["SoDienThoai"].ToString() + "\",";
            int idStatus = getIDStatus(data.Rows[i]["Status"].ToString());
            json += "\"col6\": \"<div class='" + StatusColor[idStatus] + "'>" + data.Rows[i]["Status"] + "</div>\"";
            
            //json += "\"col7\": \"" + data.Rows[i]["SoLuong"].ToString() + "\",";
            //json += "\"col8\": \"" + data.Rows[i]["TongTien"].ToString() + "\",";
            //if (data.Rows[i]["Status"].ToString() == "True")
            //{
            //    json += "\"col9\": \"<a class='btn btn-danger'>Chưa duyệt</a>\"";
            //}
            //else
            //{
            //    json += "\"col9\": \"<a class='btn btn-primary'>Đã duyệt</a>\"";
            //}
            //string url = GetRouteUrl("useraddproduct", new { id = idSanPham });
            //json += "\"col8\": \"<a href='" + url + "' class='btnDelete btn btn-success'>Xóa</a>\"";
            json += "}";
            if (i < data.Rows.Count - 1)
            {
                json += ",";
            }
        }

        json += "]";

        Response.Write(json);
    }

    private void ShowProductHome()
    {
        string idProduct = Request.QueryString["id"].ToString();

        string isHome = StaticData.getField("tb_SanPham", "SetHome", "idSanPham", idProduct);
        isHome = isHome == "True" ? "False" : "True";
        string sql = "update tb_SanPham set SetHome = '" + isHome + "' where idSanPham = '" + idProduct + "'";
        bool isUpdate = Connect.Exec(sql);

        if (isUpdate)
        {
            Response.Write("True");
        }
        else
        {
            Response.Write("False");
        }
    }

    private void ShowProductHot()
    {
        string idProduct = Request.QueryString["id"].ToString();

        string isHot = StaticData.getField("tb_SanPham", "SetHot", "idSanPham", idProduct);
        isHot = isHot == "True" ? "False" : "True";
        string sql = "update tb_SanPham set SetHot = '" + isHot + "' where idSanPham = '" + idProduct + "'";
        bool isUpdate = Connect.Exec(sql);

        if (isUpdate)
        {
            Response.Write("True");
        }
        else
        {
            Response.Write("False");
        }
    }

    private void DeleteProduct()
    {
        string idProduct = Request.QueryString["id"].ToString();
        Connect.Exec("delete tb_HinhAnhSanPham where idSanPham = '" + idProduct + "'");
        string sql = @"delete [tb_SanPham] WHERE idSanPham = '" + idProduct + "'";
        bool ex = Connect.Exec(sql);
        Response.Write(ex.ToString());
    }

    private void UserAds()
    {
        //if (Session["CurrentUser"] == null)
        //{
        //    return;
        //}
        string typeID = Request.QueryString["type"].ToString();
        string idUser = Session["CurrentUser"].ToString();
        string sqluser = "select * from tb_User where ID = '" + idUser + "'";
        DataTable userData = Connect.GetTable(sqluser);

        string shopCode = userData.Rows[0]["AdsCode"].ToString();

        string sql = "select * from tb_RaoVat where 1 = 1 "; // AdsCode = '" + shopCode + "'
        switch (typeID)
        {
            case "1":
                sql += " and  DATEDIFF(day, NgayTao, NgayHetHan) > 0 ";
                break;
            case "2":
                sql += " and DATEDIFF(day, NgayTao, NgayHetHan) <= 0 ";
                break;
            default:
            case "0":
                break;
        }
        DataTable data = Connect.GetTable(sql);

        string json = "[";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            json += "{";
            json += "\"col1\": \"" + data.Rows[i]["idRaoVat"].ToString() + "\",";
            json += "\"col2\": \"" + StaticData.DateFormat(data.Rows[i]["NgayTao"].ToString()) + "\",";
            json += "\"col3\": \"" + StaticData.DateFormat(data.Rows[i]["NgayHetHan"].ToString()) + "\",";
            json += "\"col4\": \"" + data.Rows[i]["TieuDe"].ToString() + "\",";
            json += "\"col5\": \"" + data.Rows[i]["Gia"].ToString() + "\",";
            string idRaoVat = data.Rows[i]["idRaoVat"].ToString();
            string url = GetRouteUrl("chitiet", new { id = idRaoVat });
            json += "\"col6\": \"<a href='" + url + "' class='btn btn-primary'>Xem chi tiết</a>\"";
            //if (data.Rows[i]["KichHoat"].ToString() == "True")
            //{
            //    json += "\"col6\": \"<a class='btn btn-danger'>Chưa duyệt</a>\",";
            //}
            //else
            //{
            //    json += "\"col6\": \"<a class='btn btn-primary'>Đã duyệt</a>\",";

            //}
            //string idSanPham = data.Rows[i]["idSanPham"].ToString();
            //string url = GetRouteUrl("useraddproduct", new { id = idSanPham });
            //json += "\"col7\": \"<a href='" + url + "' class='btnEdit btn btn-warning'>Sửa</a>\",";
            //json += "\"col8\": \"<a href='" + url + "' class='btnDelete btn btn-success'>Xóa</a>\"";
            json += "}";
            if (i < data.Rows.Count - 1)
            {
                json += ",";
            }
        }

        json += "]";

        Response.Write(json);
    }

    private void UserOrder()
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        string typeID = Request.QueryString["type"].ToString();
        string idUser = Session["CurrentUser"].ToString();
        string dateSearch = Request.QueryString["date"] == null ? "" : Request.QueryString["date"].ToString();

        string sqluser = "select * from tb_User where ID = '" + idUser + "'";
        
        DataTable userData = Connect.GetTable(sqluser);

        string shopCode = userData.Rows[0]["ShopCode"].ToString();
        string idShop = StaticData.getField("tb_GianHang", "ID", "ShopCode", shopCode);

        if (string.IsNullOrEmpty(shopCode))
        {
            Response.RedirectToRoute("usercreateshop", new { });
        }

        string sql = @"select *, 'TongTien' = (select isNull(Sum(SoLuong * DonGia),0) from tb_CTDonHang where idDonHang = d.idDonHang) from tb_CTDonHang c, tb_DonHang d, tb_SanPham s where c.idDonHang = d.idDonHang and s.idSanPham = c.idSanPham and c.idGianHang = '" + idShop + "'";
        if (!String.IsNullOrEmpty(dateSearch))
        {
            sql += " and convert(date, Ngay, 103) = convert(date, '" + dateSearch + "' , 103)";
        }
        switch (typeID)
        {
            case "1":
                sql += " and Status = N'Mới tạo' ";
                break;
            case "2":
                sql += " and Status = N'Đang xử lý' ";
                break;
            case "3":
                sql += " and Status = N'Hoàn tất' ";
                break;
            case "4":
                sql += " and Status = N'Hủy' ";
                break;
            default:
            case "0":
                break;
        }
        DataTable data = Connect.GetTable(sql);



        string json = "[";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            json += "{";
            string dateOrder = StaticData.DateFormat(data.Rows[i]["Ngay"].ToString());
            json += "\"col1\": \"" + dateOrder + "\",";
            string maDonHang = data.Rows[i]["MaDonHang"].ToString();//StaticData.getField("tb_DonHang", "MaDonHang", "idDonHang", idDonHang);
            json += "\"col2\": \"" + maDonHang + "\",";
            //string idSanPham = data.Rows[i]["idSanPham"].ToString();
            //json += "\"col2\": \"" + idSanPham + "\",";
            //string tenSanPham = StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", idSanPham);
            json += "\"col3\": \"" + data.Rows[i]["TenSanPham"].ToString() + "\",";
            //string idDonHang = data.Rows[i]["idDonHan"].ToString();
            json += "\"col4\": \"" + data.Rows[i]["TenKhachHang"].ToString() + "\",";
            json += "\"col5\": \"" + data.Rows[i]["DiaChi"].ToString() + "\",";
            json += "\"col6\": \"" + data.Rows[i]["SoDienThoai"].ToString() + "\",";
            json += "\"col7\": \"" + data.Rows[i]["SoLuong"].ToString() + "\",";
            json += "\"col8\": \"" + data.Rows[i]["TongTien"].ToString() + "\",";

            int idStatus = getIDStatus(data.Rows[i]["Status"].ToString());
            json += "\"col9\": \"<div class='" + StatusColor[idStatus] + "'>" + data.Rows[i]["Status"] + "</div>\"";
            //if (data.Rows[i]["KichHoat"].ToString() == "True")
            //{
            //    json += "\"col9\": \"<a class='btn btn-danger'>Chưa duyệt</a>\"";
            //}
            //else
            //{
            //    json += "\"col9\": \"<a class='btn btn-primary'>Đã duyệt</a>\"";
            //}
            //string url = GetRouteUrl("useraddproduct", new { id = idSanPham });
            //json += "\"col8\": \"<a href='" + url + "' class='btnDelete btn btn-success'>Xóa</a>\"";
            json += "}";
            if (i < data.Rows.Count - 1)
            {
                json += ",";
            }
        }

        json += "]";

        Response.Write(json);
    }

    private void UserProduct()
    {
        if (Session["CurrentUser"] == null)
        {
            return;
        }
        string id = Session["CurrentUser"].ToString();
        string sqluser = "select * from tb_User where ID = '" + id + "'";
        DataTable userData = Connect.GetTable(sqluser);

        string shopCode = userData.Rows[0]["ShopCode"].ToString();
        if (string.IsNullOrEmpty(shopCode))
        {
            Response.RedirectToRoute("usercreateshop", new { });
        }

        string sql = "select * from tb_SanPham where ShopCode = '" + shopCode + "'";
        DataTable data = Connect.GetTable(sql);

        string json = "[";
        for (int i = 0; i < data.Rows.Count; i++)
        {
            string idProduct = data.Rows[i]["idSanPham"].ToString();
            string productName = data.Rows[i]["TenSanPham"].ToString();
            string str_url = GetRouteUrl("product", new { nameEn = MyStaticData.GenerateURL(productName), id = idProduct });
            //str_url.Replace("");
            json += "{";
            json += "\"col1\": \"" + data.Rows[i]["MaSanPham"].ToString() + "\",";
            json += "\"col2\": \"<a href='" + str_url + "'>" + productName + "</a>\",";
            json += "\"col3\": \"" + StaticData.FormatDouble(data.Rows[i]["GiaCu"].ToString()) + "\",";
            json += "\"col4\": \"" + StaticData.FormatDouble(data.Rows[i]["GiaMoi"].ToString()) + "\",";
            json += "\"col5\": \"" + StaticData.DateFormat(data.Rows[i]["NgayTao"].ToString()) + "\",";
            if (data.Rows[i]["KichHoat"].ToString() == "True")
            {
                json += "\"col6\": \"<a class='btn btn-primary'>Đã duyệt</a>\",";
            }
            else
            {
                json += "\"col6\": \"<a class='btn btn-danger'>Chưa duyệt</a>\",";
            }
            string idSanPham = data.Rows[i]["idSanPham"].ToString();
            string url = GetRouteUrl("useraddproduct", new { id = idSanPham });
            json += "\"col7\": \"<a href='" + url + "' class='btnEdit btn btn-warning'>Sửa</a>\",";
            json += "\"col8\": \"<a   onclick='DeleteSanPham(" + idSanPham + ")' style='cursor:pointer' class='btnDelete btn btn-success'>Xóa</a>\"";
            json += "}";
            if (i < data.Rows.Count - 1)
            {
                json += ",";
            }
            //json += "\"col1\": \"bootstrap-table\",";
            //json += "\"col2\": \"10sdf\",";
            //json += "\"col3\": \"12sdfs2\",";
            //json += "\"col4\": \"An extended Bootstrap table\",";
            //json += "\"col5\": \"<a href='userinfo'>dsfsdf<a>An esdfsdfxtended Bootstrap table\",";
            //json += "\"col6\": \"An extended Bootstrap table\",";
            //json += "\"col7\": \"bootstrap-table\"";

            //string idSanPham = data.Rows[i]["idSanPham"].ToString();
            //html += "       <td style='text-align:center;vertical-align: inherit;'>" + data.Rows[i]["Ten"].ToString() + "</td>";

            //if (data.Rows[i]["KichHoat"].ToString() == "True")
            //    html += "       <td style='text-align:center;vertical-align: inherit;'>Đã duyệt</td>";
            //else
            //    html += "       <td style='text-align:center;vertical-align: inherit;background-color:yellow'>Chưa duyệt</td>";
            //html += "       <td style='text-align:center;vertical-align: inherit;'><a href='" + GetRouteUrl("gianhang_addproduct", new { id = idSanPham }) + "' title='Sửa'><i class='fa fa-pencil'></i></a></td>";
            //html += "       <td style='text-align:center;vertical-align: inherit;'><a onclick='DeleteSanPham(\"" + idSanPham + "\")' style='cursor:pointer' title='Xóa'><i class='fa fa-trash'></i></a></td>";
            //html += "   </tr>";
        }




        json += "]";

        Response.Write(json);
    }
    private void QuanHuyen()
    {
        string id = Request.QueryString["id"].ToString();
        string sql = "select * from tb_quanhuyen where matp = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string html = "";
        foreach (DataRow item in data.Rows)
        {
            string name = item["name"].ToString();
            string maqh = item["maqh"].ToString();

            html += string.Format("<option value='" + maqh + "'>" + name + "</option>");
        }

        html += "<option selected='selected' value='0'>Tất cả quận huyện</option>";
        Response.Write(html);
    }
    private void LinhVuc()
    {
        string id = Request.QueryString["id"].ToString();
        string sql = "select * from tb_RVDanhMuc where Cap = '" + id + "'";
        DataTable data = Connect.GetTable(sql);

        string html = "";
        foreach (DataRow item in data.Rows)
        {
            string tenDanhMuc = item["TenDanhMuc"].ToString();
            string key = item["idDanhMuc"].ToString();

            html += string.Format("<option value='" + key + "'>" + tenDanhMuc + "</option>");
        }

        html += "<option selected='selected' value='0'>Tất cả lĩnh vực</option>";
        Response.Write(html);
    }

    private void DangKyNhanMail()
    {
        string kq = "";
        string idDonHang = Request.QueryString["Mail"].Trim();
        string sql = "select * from tb_NhanEmailDK where Mail = N'" + idDonHang + "'";
        DataTable tb = Connect.GetTable(sql);
        if (tb.Rows.Count > 0)
        {
            kq = "Khách hàng đăng ký nhận tin";
        }
        else
        {
            string sqlInsertCTDH = "insert into tb_NhanEmailDK(Mail)";
            sqlInsertCTDH += " values('" + idDonHang + "')";
            bool ktInsertCTDH = Connect.Exec(sqlInsertCTDH);
            kq = "Ngộ không sẽ liên hệ với bạn qua email này. Cảm ơn bạn đã quan tâm!";
        }
        Response.Write(kq);
    }
    private void DatHang()
    {

        string userCode = "KHGUEST";
        if (Session["CurrentUser"] != null)
        {
            string idUser = Session["CurrentUser"].ToString();
            userCode = StaticData.getField("tb_User", "UserCode", "ID", idUser);
        }

        if (Session["CartSession"] == null)
        {
            Response.Write("Empty");
            return;
        }
        else
        {
            string HoTen = StaticData.ValidParameter(Request.QueryString["HoTen"].Trim());
            string DienThoai = StaticData.ValidParameter(Request.QueryString["DienThoai"].Trim());
            string DiaChi = StaticData.ValidParameter(Request.QueryString["DiaChi"].Trim());
            string GhiChu = StaticData.ValidParameter(Request.QueryString["GhiChu"].Trim());
            string ID = StaticData.ValidParameter(Request.QueryString["ID"].Trim());

            string sql = @"INSERT INTO tb_DonHang (MaDonHang,TenKhachHang, SoDienThoai, DiaChi, Email, Ngay, Status, UserCode, idUser) 
                           VALUES ('" + MyStaticData.TaoMaDonDatHang() + "',N'" + HoTen + "',N'" + DienThoai + "',N'" + DiaChi + "','" + GhiChu + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "',N'Mới tạo'" + ", '" + userCode + "', ";
            if (ID != "")
            {
                sql += "'" + ID + "'";
            }
            else
                sql += "NULL";

            sql += ")";
            bool kt = Connect.Exec(sql);

            if (kt)
            {
                string idOrder = StaticData.getField("tb_DonHang", "MAX(idDonHang)", "1", "1");

                if (String.IsNullOrEmpty(idOrder))
                {
                    Response.Write("False");
                }
                cart = Session["CartSession"] as DataTable;
                foreach (DataRow dr in cart.Rows)
                {
                    int idMau = (dr["idMau"].ToString() == "undefined" ? 0 : int.Parse(dr["idMau"].ToString()));
                    string idHangHoa = dr["idSanPham"].ToString();
                    string[] size = dr["idSize"].ToString().Split(',');
                    for (int i = 0; i < size.Length; i++)
                    {
                        string idGianHang = StaticData.getField("tb_SanPham", "IDGianhang", "idSanPham", idHangHoa);
                        string shopCode = StaticData.getField("tb_SanPham", "ShopCode", "idSanPham", idHangHoa);
                        string DonGia = StaticData.getField("tb_SanPham", "GiaMoi", "idSanPham", idHangHoa);

                        string sql4 = @"INSERT INTO tb_CTDonHang (idDonHang, idSanPham, SoLuong, DonGia ,idMau,idSize, idGianHang, ShopCode)
                             VALUES ('" + idOrder + "','" + idHangHoa + "','" + dr["SoLuong"].ToString() + "','" + DonGia + "' ";
                        if (idMau != 0)
                            sql4 += ",'" + idMau + "'";
                        else
                            sql4 += ",null";
                        if (size[i] != "" && size[i] != "0")
                            sql4 += ",'" + size[i] + "'";
                        else
                            sql4 += ",null";
                        sql4 += ",'" + idGianHang + "', '" + shopCode + "')";
                        bool kt2 = Connect.Exec(sql4);
                        if (!kt2)
                        {
                            Response.Write("False");
                            return;
                        }
                    }
                }

                Session["CartSession"] = null;
            }
        }

        Response.Write("True");

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