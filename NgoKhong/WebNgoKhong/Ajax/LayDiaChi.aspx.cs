using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajax_LayDiaChi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string action = Request.QueryString["a"];
        if (action == null)
        {
            return;
        }

        action = action.Trim();
        switch (action)
        {
            case "city":
                layThanhPho(); break;
            case "district":
                string city = Request.QueryString["city"].Trim();
                layQuanHuyen(city); break;
            case "hamlet":
                string district = Request.QueryString["district"].Trim();
                layPhuongXa(district); break;
            
            default:
                break;
        }

        
    }
    
    private void layPhuongXa(string district)
    {
        string sql = "select * from tb_xaphuongthitran where maqh = '" + district + "' order by name";
        DataTable data = Connect.GetTable(sql);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in data.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in data.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        Response.Write(serializer.Serialize(rows));
    }

    private void layQuanHuyen(string city)
    {
        string sql = "select * from tb_quanhuyen where matp='" + city + "' order by name";
        DataTable data = Connect.GetTable(sql);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in data.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in data.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        Response.Write(serializer.Serialize(rows));
    }
    //string loaiTP(string type)
    //{
    //    switch (type)
    //    {
    //        case "1":
    //            return "Thành phố Trung ương";
    //        default:
    //            return "Tỉnh";
    //    }
    //}
    //string loaiQH(string type)
    //{
    //    switch (type)
    //    {
    //        case "2":
    //            return "Huyện";
    //        case "3":
    //            return "Thành phố";
    //        case "4":
    //            return "Thị Xã";
    //        default:
    //            return "Quận";
    //    }
    //}
    //string loaiXP(string type)
    //{
    //    switch (type)
    //    {
    //        case "2":
    //            return "Xã";
    //        case "3":
    //            return "Thị trấn";
    //        default:
    //            return "Phường";
    //    }
    //}
    private void layThanhPho()
    {
        string sql = "select * from tb_tinhthanhpho order by name";
        DataTable data = Connect.GetTable(sql);
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in data.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in data.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        Response.Write(serializer.Serialize(rows));
        
    }
}