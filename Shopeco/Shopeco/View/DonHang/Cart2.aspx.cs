using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DonHang_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            LoadThongTin();

            //string url = HttpContext.Current.Request.Url.AbsolutePath;
            //Response.RedirectToRoute("login", new { retUrl = url });
            //return;
        }
        if (!IsPostBack)
        {
            LoadGioHang();

        }
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan("Giỏ hàng");
    }

    public void LoadThongTin()
    {
        string IDUser = Session["CurrentUser"].ToString();
        string sql = @"select * from tb_User where ID = '" + IDUser + "'";
        DataTable tb = Connect.GetTable(sql);
        if(tb.Rows.Count > 0)
        {
            txtHoTen.Value = tb.Rows[0]["FullName"].ToString();
            txtSoDienThoai.Value = tb.Rows[0]["PhoneNumber"].ToString();
            txtDiaChi.Value = tb.Rows[0]["Address"].ToString();
            txtGhiChu.Value = tb.Rows[0]["Email"].ToString();
            hdidUser.Value = tb.Rows[0]["ID"].ToString();
          //  txtSoDienThoai.
        }
    }
    private void LoadGioHang()
    {
        double TongCong = 0;
        string html = "";
        if (Session["CartSession"] == null)
        {
            html = "Không có sản phẩm nào trong giỏ hàng... ";
        }
        else
        {

            DataTable cart = Session["CartSession"] as DataTable;
            if (cart.Rows.Count > 0)
            {
                html = @" <table id='table-cart' class='table table-bordered'>
                                    <tr>
                                        <th class='text-center'>Ảnh</th>
                                        <th class='text-left'>Sản phẩm</th>
                                        <th class='text-left'>Số lượng</th>
                                        <th class='text-right'>Đơn giá</th>
                                        <th class='text-right'>Thành tiền</th>
                                        <th>Xóa</th>
                                    </tr> ";
                foreach (DataRow dr in cart.Rows)
                {
                    string idSanPham = dr["idSanPham"].ToString();
                    string idMau = dr["idMau"].ToString();
                    string idSize = dr["idSize"].ToString();
                    string SoLuong = dr["SoLuong"].ToString();

                    int Sl = 0;
                    double DonGia = 0;

                    string Gia = StaticData.getField("tb_SanPham", "GiaMoi", "idSanPham", idSanPham);

                    if (Gia.Trim() != "")
                    {
                        DonGia = double.Parse(Gia);
                    }

                    if (SoLuong.Trim() != "")
                    {
                        Sl = int.Parse(SoLuong);
                    }

                    double ThanhTien = Sl * DonGia;


                    TongCong += ThanhTien;
                    string TenLoaiSP = StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", idSanPham);
                    html += @"  <tr>
                                        <td class='text-center'>
                                           <a href='" + MyStaticData.GenerateURL(TenLoaiSP) + "-" + idSanPham + @"'>
                                                <img width='50px' class='img-thumbnail'
                                                   src='" + StaticData.getField("tb_HinhAnhSanPham", "LinkHinh", "idSanPham", idSanPham) + @"' />
                                            </a>
                                        </td>
                                        <td class='prdName' style='text-align: left;vertical-align: middle;'>
                                           <a style='color:blue' href='/" + MyStaticData.GenerateURL(TenLoaiSP) + "-" + idSanPham + @"'>
                                                <strong> " + TenLoaiSP + @" -
                                                                " + StaticData.getField("tb_Mau", "TenMau", "idMau", idMau) + @" - 
                                                          " + StaticData.getField("tb_Size", "Size", "idSize", idSize) + @" </strong>
                                            </a></td>
<td class='qty' style='vertical-align: middle;'>
<div class='input-group btn-block quantity'>
                        <input type='text' id='txtSoLuong" + idSanPham + @"' name='quantity' onkeyup='ThayDoiSoLuong(" + idSanPham + @")' value='" + SoLuong + @"' size='1' class='form-control'></div></td>
                                        <td class='text-right' style='vertical-align: middle;'> " + string.Format("{0:N0}", DonGia).Replace(",", ".") + @" đ <input style='display:none' id='txtDonGia" + idSanPham + @"' value='" + DonGia + @"' /> </td>
                                        
                                        <td class='price text-right' style='vertical-align: middle;'> <span id='spThanhTien" + idSanPham + @"'>" + string.Format("{0:N0}", ThanhTien).Replace(",", ".") + @" đ </span> <input style='display:none' type='text' id='txtThanhTien" + idSanPham + @"' value='" + ThanhTien + @"' name='ThanhTien' />   </td>
                                        <td class='remove' style='text-align: center;vertical-align: middle;'>
                                            <a class='removeCartItem' onclick='DeleteSanPham(" + idSanPham + ","+ idMau + ","+ idSize + @")' >
                                                <img class='ClickRemoveCartItem' width='20px'
                                                    src='../images/Icon/Delete.png' />
                                            </a>
                                        </td>
                                    </tr> ";

                }
//                html += @" </table>
//                        <div class='row-fluid' style='text-align:  right;'>
//                                <td > Tổng Tiền: " + string.Format("{0:N0}", TongCong).Replace(",", ".") + @" đ <input style='display:none' id='txtDonGia' value='" + TongCong + @"' /> </td>
//                            ";

                html += @"</table>";
            }
        }

        cartform.InnerHtml = html;
       lblTongTien.InnerHtml = string.Format("{0:N0}", TongCong).Replace(",", ".") + " đ";
    }
}