using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DonHang_Cart : System.Web.UI.Page
{
    //public string MERCHANT_SITE_CODE = "47186";
    //public string MERCHANT_PASS = "0b48eca6b0f7f51b202b8c2d4a141e38";
    //public string RECEIVER = "sieusaochemgio@gmail.com";
    private string merchant_site_code = "36680";
    private string merchant_pass = "matkhauketnoi";
    private string receiver = "demo@nganluong.vn";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["CurrentUser"] == null)
        //{
        //    string url = HttpContext.Current.Request.Url.AbsolutePath;
        //    Response.RedirectToRoute("login", new { retUrl = url });
        //    return;
        //}
        if (Session["CartSession"] == null)
        {
            errorEmpty.Visible = true;
            orderForm.Visible = false;
        }
        else
        {
            errorEmpty.Visible = false;
            orderForm.Visible = true;
        }
        if (!IsPostBack)
        {
            btnOrder.Text = "Thanh toán Online";
            payOffline.Checked = false;
            payOnline.Checked = true;
            LoadAddress();
            msgError.Visible = false;
            
            LoadThongTin();
        }
    }
    
    private void LoadAddress()
    {
        string sql = "select * from tb_tinhthanhpho order by name";

        slCity.DataSource = Connect.GetTable(sql);
        slCity.DataTextField = "name";
        slCity.DataValueField = "matp";
        slCity.DataBind();
        //slCity.Items.Add(new ListItem("--- Chọn tỉnh ---", ""));
        //slCity.Items.FindByText("--- Chọn tỉnh ---").Selected = true;

        slProvince.Items.Add(new ListItem("--- Chọn huyện ---", "-1"));
        updateAdddress();
    }
    protected void slCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idCity = slCity.SelectedValue;
        string sql = "select * from tb_quanhuyen where matp = '" + idCity + "'";

        slProvince.DataSource = Connect.GetTable(sql);
        slProvince.DataTextField = "name";
        slProvince.DataValueField = "maqh";
        slProvince.DataBind();
        //slProvince.Items.Add(new ListItem("--- Chọn huyện ---", ""));
        //slProvince.Items.FindByText("--- Chọn huyện ---").Selected = true;
    }
    void updateAdddress()
    {
        string tinh = slCity.SelectedItem.Text.ToString();
        if (tinh == "--- Chọn tỉnh ---")
        {
            tinh = "Tỉnh";
        }
        string huyen = slProvince.SelectedItem.Text.ToString();
        if (huyen == "--- Chọn huyện ---")
        {
            huyen = "Huyện";
        }
        //txtAddress.Text = txtNo.Text + ", " + slProvince.SelectedItem.Text.ToString() + ", " + slCity.SelectedItem.Text.ToString();
    }
    public string GetDuongDan()
    {
        return MyStaticData.DuongDan("Giỏ hàng");
    }

    public void LoadThongTin()
    {
        string ID = Session["CurrentUser"] == null ? "" : Session["CurrentUser"].ToString();

        if (!String.IsNullOrEmpty(ID))
        {
            string sql = @"select * from tb_User where ID = '" + ID + "'";
            DataTable tb = Connect.GetTable(sql);
            if (tb.Rows.Count > 0)
            {
                txtFullname.Value = tb.Rows[0]["FullName"].ToString();
                txtPhone.Value = tb.Rows[0]["PhoneNumber"].ToString();
                //txtAddress.Text = tb.Rows[0]["Address"].ToString();
                //txtEmail.Value = tb.Rows[0]["Email"].ToString();

                hdidUser.Value = tb.Rows[0]["ID"].ToString();
            }
        }
    }
    
    void ErrorShow()
    {
        msgError.Visible = true;
    }
    
    DataTable cart = new DataTable();
    protected void btnOrder_Click(object sender, EventArgs e)
    {
        
        if (Session["CartSession"] == null)
        {
            ErrorShow();
            return;
        }
        else
        {
            if (payOnline.Checked)
            {
                PaymentOnline();
            }
            PaymentOffline();

            //else if (payOffline.Checked)
            //{
            //}
            Session["CartSession"] = null;
        }
        if (Session["CurrentUser"] == null)
        {
            Response.RedirectToRoute("home", new { });
            return;
        }
        else
        {
            Response.RedirectToRoute("userbought", new { });
        }
    }

    private void PaymentOffline()
    {
        string userCode = "KHGUEST";
        if (Session["CurrentUser"] != null)
        {
            string idUser = Session["CurrentUser"].ToString();
            userCode = StaticData.getField("tb_User", "UserCode", "ID", idUser);
        }

        string HoTen = txtFullname.Value;//StaticData.ValidParameter(Request.QueryString["HoTen"].Trim());
        string DienThoai = txtPhone.Value;//StaticData.ValidParameter(Request.QueryString["DienThoai"].Trim());
        string DiaChi = txtNo.Text + "," + slProvince.SelectedItem.Text + "," + slCity.SelectedItem.Text;
        string GhiChu = txtDesc.Value;//StaticData.ValidParameter(Request.QueryString["GhiChu"].Trim());
        string ID = Session["CurrentUser"] == null ? "" : Session["CurrentUser"].ToString();//StaticData.ValidParameter(Request.QueryString["ID"].Trim());
        string tenMuaHang = txtHoTen.Value;
        string sdtMuaHang = txtSoDienThoai.Value;

        string sql = @"INSERT INTO tb_DonHang (MaDonHang,TenKhachHang, SoDienThoai, DiaChi, Email, Ngay, Status, UserCode, TenNguoiMuaHang, SDTNguoiMuaHang, idUser) 
                           VALUES ('" + MyStaticData.TaoMaDonDatHang() + "',N'" + HoTen + "',N'" + DienThoai + "',N'" + DiaChi + "','" + GhiChu + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "',N'Mới tạo' , '" + userCode + "', N'" + tenMuaHang + "', '" + sdtMuaHang + "', ";
        if (!string.IsNullOrEmpty(ID))
        {
            sql += " '" + ID + "'";
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
                ErrorShow();
                return;
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
                        ErrorShow();
                        return;
                    }
                }
            }
        }
        else
        {
            ErrorShow();
        }
    }

    private void PaymentOnline()
    {
        string HoTen = txtFullname.Value;//StaticData.ValidParameter(Request.QueryString["HoTen"].Trim());
        string DienThoai = txtPhone.Value;//StaticData.ValidParameter(Request.QueryString["DienThoai"].Trim());
        string DiaChi = txtNo.Text + "," + slProvince.SelectedItem.Text + "," + slCity.SelectedItem.Text;
        string GhiChu = txtDesc.Value;//StaticData.ValidParameter(Request.QueryString["GhiChu"].Trim());
        //string ID = Session["CurrentUser"] == null ? "" : Session["CurrentUser"].ToString();//StaticData.ValidParameter(Request.QueryString["ID"].Trim());
        string tenMuaHang = txtHoTen.Value;
        string sdtMuaHang = txtSoDienThoai.Value;

        double total = 0;
        cart = Session["CartSession"] as DataTable;
        foreach (DataRow dr in cart.Rows)
        {
            
            string idProduct = dr["idSanPham"].ToString();
            string sqlProduct = "select * from tb_SanPham where idSanPham = '" + idProduct + "'";
            DataTable dataUser = Connect.GetTable(sqlProduct);

            string str_price = dataUser.Rows[0]["GiaMoi"].ToString();
            double product_price = 0;
            if (!string.IsNullOrEmpty(str_price))
            {
                product_price = double.Parse(str_price);
            }

            total += product_price;
        }

        NL_Checkout nlcheckout = new NL_Checkout();
        nlcheckout.merchant_site_code = this.merchant_site_code;
        nlcheckout.secure_pass = this.merchant_pass;

        var rnd = new Random(DateTime.Now.Millisecond);
        int oderID = rnd.Next(0, 3000);
        DateTime dtNow = DateTime.Now;
        
        //string strOrderID = dtNow.Year.ToString() + dtNow.Month.ToString() + dtNow.Day.ToString() + dtNow.Hour.ToString() + dtNow.Minute.ToString() + dtNow.Second.ToString();
        
        //string return_url, string receiver, string transaction_info, string order_code, string price, string currency, float quantity, float tax, float discount, float fee_cal, float fee_shipping, string order_description, string buyer_info, string affiliate_code
        string return_url, transaction_info, order_code, price, currency, order_description, buyer_info, affiliate_code;
        float quantity, tax, discount, fee_cal, fee_shipping;
        //return_url = HttpContext.Current.Request.Url.Authority.ToString() + GetRouteUrl("finishCheckOut", new { });
        return_url = "http://" + HttpContext.Current.Request.Url.Authority.ToString() + "/finishcheckout";
        transaction_info = "";
        
        order_code = MyStaticData.TaoMaDonDatHang();
        price = total.ToString();
        currency = "vnd";
        quantity = cart.Rows.Count;
        tax = 0;
        discount = 0;
        fee_cal = 0;
        fee_shipping = 0;
        order_description = "";
        buyer_info = "";
        affiliate_code = "";

        string rs = nlcheckout.buildCheckoutUrlNew(return_url, this.receiver, transaction_info, order_code, price, currency, quantity, tax, discount, fee_cal, fee_shipping, order_description, buyer_info, affiliate_code);
        Response.Redirect(rs);
    }
    protected void slProvince_Load(object sender, EventArgs e)
    {
        string idCity = slCity.SelectedValue;
        string sql = "select * from tb_quanhuyen where matp = '" + idCity + "'";

        slProvince.DataSource = Connect.GetTable(sql);
        slProvince.DataTextField = "name";
        slProvince.DataValueField = "maqh";
        slProvince.DataBind();
        slProvince.Items.Add(new ListItem("--- Chọn huyện ---", ""));
    }
    protected void payOnline_CheckedChanged(object sender, EventArgs e)
    {
        btnOrder.Text = "Thanh toán Online";
        payOffline.Checked = false;
        payOnline.Checked = true;
    }
    protected void payOffline_CheckedChanged(object sender, EventArgs e)
    {
        btnOrder.Text = "Đặt hàng";
        payOffline.Checked = true;
        payOnline.Checked = false;
    }
}