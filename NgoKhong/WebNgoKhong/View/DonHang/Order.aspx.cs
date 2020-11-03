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
            Response.RedirectToRoute("cart", new { });
        }
        if (!IsPostBack)
        {
            btnOrder.Text = "Thanh toán Online";
            payOffline.Checked = false;
            payOnline.Checked = true;
            LoadGioHang();
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
    private void LoadGioHang()
    {
        if (Session["CartSession"] == null)
        {
            //listProduct.InnerHtml = "Không có sản phẩm nào trong giỏ hàng ... ";
            ErrorShow();
            return;
        }
        string html = "";
        DataTable cart = Session["CartSession"] as DataTable;
        if (cart.Rows.Count <= 0)
        {
            //listProduct.InnerHtml = "Không có sản phẩm nào trong giỏ hàng ... ";
            ErrorShow();
            return;
        }

        double totalMoney = 0;

        foreach (DataRow dr in cart.Rows)
        {
            string idProduct = dr["idSanPham"].ToString();
            string str_quantity = dr["SoLuong"].ToString();
            string idColor = dr["idMau"].ToString();
            string idSize = dr["idSize"].ToString();
            int quantity = 0;
            try
            {
                quantity = int.Parse(str_quantity);
            }
            catch (Exception)
            {
                quantity = 0;
            }
            string str_price = StaticData.getField("tb_SanPham", "GiaMoi", "idSanPham", idProduct);
            double price = 0;
            try
            {
                price = double.Parse(str_price);
            }
            catch (Exception)
            {
                price = 0;
            }
            string productName = StaticData.getField("tb_SanPham", "TenSanPham", "idSanPham", idProduct);
            double money = quantity * price;

            totalMoney += money;
            string img_url = StaticData.getField("tb_HinhAnhSanPham", "LinkHinh", "idSanPham", idProduct);
            string str_url = GetRouteUrl("product", new { nameEn = MyStaticData.GenerateURL(productName), id = idProduct });
            string idShop = StaticData.getField("tb_SanPham", "IDGianhang", "idSanPham", idProduct);
            string ShopName = StaticData.getField("tb_GianHang", "TenGianHang", "ID", idShop);

            html += "<div class='checkout-shop-order-group'>";
            html += "    <div class='checkout-shop-order-group__orders'>";
            html += "        <div class='checkout-product-ordered-list-item'>";
            html += "            <div class='checkout-product-ordered-list-item-shop-info'>";
            html += "                <div class='checkout-product-ordered-list-item-shop-info__shop-icon'>";
            html += "                    <a shopid='9290837' class='checkout-product-ordered-list-item-shop-info__shop-icon-link'>";
            html += "                        <svg class='stardust-icon stardust-icon-search-shop' enable-background='new 0 0 15 15' viewBox='0 0 15 15'>";
            html += "                            <path stroke='none' d='m13 1.9c-.2-.5-.8-1-1.4-1h-8.4c-.6.1-1.2.5-1.4 1l-1.4 4.3 0 0c0 .8.3 1.6.9 2.1v4.8c0 .6.5 1 1.1 1h10.2c.6 0 1.1-.5 1.1-1v-4.6c.6-.4.9-1.2.9-2.3zm-11.4 3.4l1-3c .1-.2.4-.4.6-.4h8.3c.3 0 .5.2.6.4l1 3zm .6 3.5h.4c.7 0 1.4-.3 1.8-.8.4.5.9.8 1.5.8.7 0 1.3-.5 1.5-.8.2.3.8.8 1.5.8.6 0 1.1-.3 1.5-.8.4.5 1.1.8 1.7.8h.4v3.9c0 .1 0 .2-.1.3s-.2.1-.3.1h-9.5c-.1 0-.2 0-.3-.1s-.1-.2-.1-.3zm8.8-1.7l0 0h-1v .1s0 .3-.2.6c-.2.1-.5.2-.9.2-.3 0-.6-.1-.8-.3-.2-.3-.2-.6-.2-.6v-.1h-1v .1s0 .3-.2.5c-.2.3-.5.4-.8.4-1 0-1-.8-1-.8l0 0h-1l0 0c0 .8-.7.8-1.3.8s-1.1-1-1.2-1.7h12.1c0 .2-.1.9-.5 1.4-.2.2-.5.3-.8.3-1.2 0-1.2-.8-1.2-.9z'></path></svg></a>";
            html += "                </div>";
            html += "                <a class='checkout-product-ordered-list-item-shop-info__shop-name' shopid='9290837' href='" + GetRouteUrl("thongtingianhang", new { id = idShop }) + "'>" + ShopName + "</a><a href='" + GetRouteUrl("thongtingianhang", new { id = idShop }) + "' class='checkout-product-ordered-list-item-shop-info__chat-button'>";
            html += "                    <svg class='shopee-svg-icon checkout-product-ordered-list-item-shop-info__webchat-icon ' height='16' viewBox='0 0 22 16' width='22'>";
            html += "                        <g fill-rule='evenodd' stroke='none' stroke-width='1'>";
            html += "                            <path d='m20.4457887 12.1418577c.7876778-1.0820669 1.2491266-2.39517639 1.2491266-3.81076088 0-3.70250491-3.156772-6.70397818-7.0508475-6.70397818-.0693752 0-.1385164.00095266-.2074099.00284495.5404574.50025601 1.0147388 1.06413368 1.4092798 1.67881242 2.4766811.50241938 4.334147 2.59466525 4.334147 5.09940288 0 1.42273066-.5992965 2.71237411-1.5709606 3.65316531-.038511.0495389-.1182188.17233-.1182188.3400495 0 .0295752.0286166.606356.0286166.606356s.0628359.4223645-.402977.2339696l-.3693587-.1500883s-.282324-.1280652-.7138007.0348215c-.7090281.3180796-1.5013162.4959316-2.3372932.4959316-.0124026 0-.0247956-.0000391-.0371789-.0001173-.4735214.4699114-1.0031122.8888889-1.5786318 1.2473477.5029786.1082913 1.0263607.1654605 1.5637862.1654605.540439 0 1.0666765-.0578121 1.572245-.1672869-.0007126.0013151-.0010723.0024172-.0010723.0033021 1.2460849-.3092111 1.9222453-.012738 1.9222453-.012738l.9795545.4181041c1.2353963.5249174 1.0872542-.6061418 1.0872542-.6061418s-.0526532-1.69977-.0526532-1.69977c0-.3488224.2251239-.7223577.2941474-.8286869z'></path>";
            html += "                            <path d='m6.32146433 15.2776955c.00082231.0015175.00123728.0027891.00123728.0038102-1.43779019-.3567821-2.21797536-.0146977-2.21797536-.0146977l-1.13025518.4824278c-1.42545721.6056739-1.25452408-.6993944-1.25452408-.6993944s.06075368-1.9612731.06075368-1.9612731c0-.4024874-.25975827-.8334897-.33940083-.9561771-.90885893-1.2485387-1.44129984-2.76366504-1.44129984-4.39703176 0-4.27212105 3.64242915-7.73535944 8.13559322-7.73535944 4.49316408 0 8.13559318 3.46323839 8.13559318 7.73535944 0 4.27212106-3.6424291 7.73535946-8.13559318 7.73535946-.62358341 0-1.2307806-.0667063-1.81412889-.1930234zm-.988131-6.03325648c.73637967 0 1.33333334-.59695367 1.33333334-1.33333333 0-.73637967-.59695367-1.33333334-1.33333334-1.33333334-.73637966 0-1.33333333.59695367-1.33333333 1.33333334 0 .73637966.59695367 1.33333333 1.33333333 1.33333333zm5.55555557 0c .7363797 0 1.3333333-.59695367 1.3333333-1.33333333 0-.73637967-.5969536-1.33333334-1.3333333-1.33333334s-1.33333334.59695367-1.33333334 1.33333334c0 .73637966.59695364 1.33333333 1.33333334 1.33333333z'></path>";
            html += "                        </g></svg>Chi tiết gian hàng";
            html += "                </a>";
            html += "            </div>";
            html += "            <div class='checkout-product-ordered-list-item__items'>";
            html += "                <div class='checkout-product-ordered-list-item__item'>";
            html += "                    <div class='checkout-product-ordered-list-item__header checkout-product-ordered-list-item__header--product'>";
            html += "                        <img class='checkout-product-ordered-list-item__product-image' src='" + img_url + "' width='70' height='70'><span class='checkout-product-ordered-list-item__product-info'><span class='checkout-product-ordered-list-item__product-name'>" + productName + "</span></span>";
            html += "                    </div>";
//            html += "                    <div class='checkout-product-ordered-list-item__header checkout-product-ordered-list-item__header--variation'></div>";
            html += "                    <div class='checkout-product-ordered-list-item__header'>" + price.ToString("#,##") + " ₫</div>";
            html += "                    <div class='checkout-product-ordered-list-item__header'>" + quantity.ToString("#,##") + "</div>";
            html += "                    <div class='checkout-product-ordered-list-item__header  checkout-product-ordered-list-item__header--subtotal'>" + money.ToString("#,##") + " ₫</div>";
            html += "                    <div class='checkout-product-ordered-list-item__header'><span aria-hidden='true'><i class='fa fa-close btnDelete' onclick='DeleteSanPham(" + idProduct + "," + idColor + "," + idSize + ")'></i></span></div>";
            html += "                </div>";
            html += "            </div>";
            html += "        </div>";
            html += "    </div>";
            html += "    <div class='_1pkbuI'>";
            html += "        <div class='_1wd2xT'>Tổng số tiền (" + quantity.ToString() + " sản phẩm):</div>";
            html += "        <div class='ZwtlWT'>" + money.ToString("#,##") + " ₫</div>";
            html += "    </div>";
            html += "</div>";

            //html += "<li class='list-group-item d-flex justify-content-between lh-condensed'>";
            //html += "    <div class='product-item'>";
            //html += "        <div class='product-box align-v'>";
            //html += "            <div class='col-sm-3'>";
            //html += "                <a href='" + str_url + "'><img width='70px' class='img-thumbnail' src='" + img_url + "'></a>";
            //html += "            </div>";
            //html += "            <div class='col-sm-9'>";
            //html += "                <a href='" + str_url + "'><strong>" + productName + "</strong></a>";
            //html += "                <br />";
            //html += "                <div style='text-align:left;'>";
            //html += "                    <div class='inline-block'>";
            //html += "                        <small class='text-muted'>Số lượng</small>";
            //html += "                    </div>";
            //html += "                    <div class='inline-block'>";
            //html += "                        <select class='custom-select d-block' style='width: 50px;' id='slQuantity" + idProduct + "' onChange='ThayDoiSoLuong(" + idProduct + ")'>";
            //int[] num = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            //if (quantity > 10)
            //{
            //    num[9] = quantity;
            //}

            //for (int i = 0; i < 10; i++)
            //{
            //    if (num[i] == quantity)
            //    {
            //        html += "<option value='" + num[i] + "' selected>" + num[i] + "</option>";
            //    }
            //    else
            //    {
            //        html += "<option value='" + num[i] + "'>" + num[i] + "</option>";
            //    }
            //}
            //html += "                        </select>";
            //html += "                    </div>";
            //html += "                    <div class='inline-block'>";
            //html += "                        <small class='text-muted'>X</small>";
            //html += "                    </div>";
            //html += "                    <div class='inline-block'>";
            //html += "                        <small class='text-muted'>" + price.ToString("#,##").Replace(",", ".") + "</small>";
            //html += "                    </div>";
            //html += "                    <div class='text-muted col-sm-6' >";
            //html += "                    </div>";
            //html += "                </div><div style='text-align:left;'><div class='inline-block'><small class='text-muted'>Số lượng</small></div></div>";
            //html += "            </div>";
            //html += "        </div>";
            //html += "    </div>";
            //html += "    <span class='text-muted align-v' id='lbTotalPrice' runat='server'>" + money.ToString("#,##").Replace(",", ".") + "</span>";
            //html += " <span aria-hidden='true'><i class='fa fa-close btnDelete' onclick='DeleteSanPham(" + idProduct + "," + idColor + "," + idSize + ")'></i></span>";
            //html += "</li>";
        }
        //html += "<li class='list-group-item d-flex justify-content-between'>";
        //html += "    <span>Tổng tiền :</span>";
        //html += "    <strong>" + totalMoney.ToString("#,##").Replace(",", ".") + " VNĐ</strong>";
        //html += "</li>";

    }
    void ErrorShow()
    {
        msgError.Visible = true;
    }
    string StrTotalPrice = "";
    string OrderCode = "";
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
            Response.RedirectToRoute("successCheckOut", new { price = StrTotalPrice, ordercode = OrderCode });
            return;
        }
        else
        {
            Response.RedirectToRoute("userSuccessCheckout", new { });
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
        //string tenMuaHang = txtHoTen.Value;
        //string sdtMuaHang = txtSoDienThoai.Value;

        string sql = @"INSERT INTO tb_DonHang (MaDonHang,TenKhachHang, SoDienThoai, DiaChi, Email, Ngay, Status, UserCode, TenNguoiMuaHang, SDTNguoiMuaHang, idUser) 
                           VALUES ('" + MyStaticData.TaoMaDonDatHang() + "',N'" + HoTen + "',N'" + DienThoai + "',N'" + DiaChi + "','" + GhiChu + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "',N'Mới tạo' , '" + userCode + "', N'', '', ";
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
        //string tenMuaHang = txtHoTen.Value;
        //string sdtMuaHang = txtSoDienThoai.Value;

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