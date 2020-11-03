using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GianHang_ShopInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object session = Session["CurrentUser"];
        if (session == null)
        {
            return;
        }
        if (!IsPostBack)
        {
            LoadCity();
        }
        
        //object session = Session["CurrentUser"];
        //HttpCookie cookies = Request.Cookies["GianHangUser"];

        //if (session == null && cookies == null)
        //{
        //    Response.RedirectToRoute("gianhang_login");
        //    return;
        //}
        //string email = (cookies != null) ? cookies.Value : session.ToString();

        
        //Response.RedirectToRoute("gianhang_shopinfo", new { });
        
    }
    private void LoadCity()
    {
        string sql = "select * from tb_tinhthanhpho order by name";

        slTinh.DataSource = Connect.GetTable(sql);
        slTinh.DataTextField = "name";
        slTinh.DataValueField = "matp";
        slTinh.DataBind();
        slTinh.Items.Add(new ListItem("Toàn quốc", "0"));
        slTinh.Items.FindByValue("0").Selected = true;
        LoadProvince();
        UpdateAddress();
        //string html = "<select>";

        //if (data != null)
        //{
        //    for (int i = 0; i < data.Rows.Count; i++)
        //    {
        //        string name = data.Rows[i]["name"].ToString();
        //        string id = data.Rows[i]["matp"].ToString();
        //        html += "<option value='" + id + "'>" + name + "</option>";
        //    }
        //}
        //html += "</select>";
    }

    private void LoadProvince()
    {
        string sql = "select * from tb_quanhuyen order by name";

        slHuyen.DataSource = Connect.GetTable(sql);
        slHuyen.DataTextField = "name";
        slHuyen.DataValueField = "maqh";
        slHuyen.DataBind();
        slHuyen.Items.Add(new ListItem("Toàn quốc", "0"));
        slHuyen.Items.FindByValue("0").Selected = true;

        //string html = "<select>";

        //if (data != null)
        //{
        //    for (int i = 0; i < data.Rows.Count; i++)
        //    {
        //        string name = data.Rows[i]["name"].ToString();
        //        string id = data.Rows[i]["matp"].ToString();
        //        html += "<option value='" + id + "'>" + name + "</option>";
        //    }
        //}
        //html += "</select>";
    }
    protected void btnLuuThongTin_Click(object sender, EventArgs e)
    {
        string ten = tenGianHang.Text;
        string diaChi = diachiGianHang.Text;
        string moTa = moTaGianHang.Value;
        string maqh = slHuyen.SelectedItem.Text;

        string idUser = Session["CurrentUser"].ToString();
        string sql = "select * from tb_User u where u.ID = '" + idUser + "'";

        DataTable dataUser = Connect.GetTable(sql);
        if (dataUser == null || dataUser.Rows.Count <= 0)
        {
            return;
        }

        if (dataUser.Rows.Count > 0)
        {
            string chuGianHang = dataUser.Rows[0]["FullName"].ToString();
            string email = dataUser.Rows[0]["Email"].ToString();

            sql = "insert into tb_GianHang(TenGianHang, DiaChi, MoTa, ChuGianHang, Email, SoDienThoai, maqh) values(N'" + ten + "', N'" + diaChi + "', N'" + moTa + "', N'" + chuGianHang + "', '" + email + "', '" + idUser + "', '" + maqh + "')";

            bool isUpdate = Connect.Exec(sql);

            if (isUpdate)
            {
                string idGianHang = StaticData.getField("tb_GianHang", "Max(ID)", "1", "1");
                sql = "update tb_User set IDGianHang = '" + idGianHang + "' where ID = '" + idUser + "'";
                isUpdate = Connect.Exec(sql);

                if (isUpdate)
                {
                    Response.RedirectToRoute("gianhang_dashboard", new object { });
                }
            }
        }
    }
    public void UpdateAddress()
    {
        string tinh = slTinh.SelectedItem.Text;
        if (string.IsNullOrEmpty(tinh))
        {
            tinh = "Tỉnh";
        }
        string huyen = slHuyen.SelectedItem.Text;
        if (string.IsNullOrEmpty(huyen))
        {
            huyen = "Huyện";
        }
        int commaIndex = diachiGianHang.Text.IndexOf(",");
        string value = "Số nhà ";
        if (commaIndex > 0 && commaIndex < diachiGianHang.Text.Length)
        {
            value = diachiGianHang.Text.Substring(0, commaIndex);
        }
        
        diachiGianHang.Text = value + ", " + huyen + ", " + tinh;
    }
    protected void slTinh_SelectedIndexChanged(object sender, EventArgs e)
    {
        string IDTinh = slTinh.SelectedValue;
        string sql = "select * from tb_quanhuyen where matp = '" + IDTinh + "' order by name ";
        DataTable data = Connect.GetTable(sql);
        if (data == null)
        {
            return;
        }
        slHuyen.DataSource = data;

        slHuyen.DataTextField = "name";
        slHuyen.DataValueField = "maqh";
        slHuyen.DataBind();
        slHuyen.Items.Add(new ListItem("Toàn quốc", "0"));
        slHuyen.Items.FindByValue("0").Selected = true;
        UpdateAddress();
    }
    protected void slHuyen_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateAddress();
    }
}