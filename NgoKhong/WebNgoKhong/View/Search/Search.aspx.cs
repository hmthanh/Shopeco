using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Search_Search : System.Web.UI.Page
{
	public string[] cat { get; set; }
	public string[] pro { get; set; }
	public string[] bra { get; set; }
	public string[] pla { get; set; }
	public int pageNum { get; set; }
    public string q { get; set; }
	public int gtPrice { get; set; }
	public int ltPrice { get; set; }
	public string search { get; set; }
    //public bool isMostPopular { get; set; }
	public bool isNewest { get; set; }
	public bool isBestSeller { get; set; }
	public int isPriceOrder { get; set; }

	int PageSize = 20;
	protected void Page_Load(object sender, EventArgs e)
	{
		pageNum = 1;
        isNewest = true;
		foreach (String key in Request.QueryString.AllKeys)
		{
			string[] values = Request.QueryString.GetValues(key);

			switch (key)
			{
				case "cat":
					cat = values;
					break;
				case "pro":
					pro = values;
					break;
				case "bra":
					bra = values;
					break;
				case "pla":
					pla = values;
					break;
                case "greate":
                    isPriceOrder = 1;
                    isNewest = false;
                    break;
                case "lowerp":
					isPriceOrder = 2;
                    isNewest = false;
					break;
				case "newest":
					isNewest = true;
					break;
                //case "popula":
                //    isMostPopular = true;
                //    break;
				case "seller":
                    isNewest = false;
					isBestSeller = true;
					break;
				case "page":
					try
					{
						pageNum = int.Parse(values.First());
					}
					catch (Exception)
					{
						pageNum = 1;
					}
					break;
				case "from":
					try
					{
						gtPrice = int.Parse(values.First());
					}
					catch (Exception)
					{
						gtPrice = 0;
					}
					
					break;
                case "q":
                    q = values.First();
                    break;
				case "to":
					try
					{
						ltPrice = int.Parse(values.First());
					}
					catch (Exception)
					{
						ltPrice = -1;
					}
					
					break;
				default:

					break;
			}
		}
		if (!IsPostBack)
		{
			LoadDanhMuc();
			LoadKhoangGia();
			LoadNhaSanXuat();
			LoadThuongHieu();
			LoadNoiBan();
			LoadSanPham();
			LoadSortBy();


			//TaiSanPham();
		}
	}
    //string[] convertVietnamesToUnsign(string input)
    //{
    //    Hashtable hashTable = new Hashtable();
    //    hashTable.Add("a", "áàạảãâấầậẩẫăắằặẳẵ");
    //    hashTable.Add("A", "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ");
    //    hashTable.Add("e", "éèẹẻẽêếềệểễ");
    //    hashTable.Add("E", "ÉÈẸẺẼÊẾỀỆỂỄ");
    //    hashTable.Add("o", "óòọỏõôốồộổỗơớờợởỡ");
    //    hashTable.Add("O", "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ");
    //    hashTable.Add("u", "úùụủũưứừựửữ");
    //    hashTable.Add("U", "ÚÙỤỦŨƯỨỪỰỬỮ");
    //    hashTable.Add("i", "íìịỉĩ");
    //    hashTable.Add("I", "ÍÌỊỈĨ");
    //    hashTable.Add("d", "đ");
    //    hashTable.Add("D", "Đ");
    //    hashTable.Add("y", "ýỳỵỷỹ");
    //    hashTable.Add("Y", "ÝỲỴỶỸ");

    //    ArrayList result = new ArrayList();

    //    for (int i = 0; i < input.Length; i++)
    //    {
    //        char s = input[i];
            

    //        foreach (DictionaryEntry charac in hashTable)
    //        {
    //            string str = input;
    //            char c = charac.Key.ToString()[0];
    //            if (c == s)
    //            {
    //                string replace = charac.Value.ToString();
    //                for (int k = 0; k < replace.Length; k++)
    //                {
    //                    string ret = str
    //                }
    //            }
    //        }
    //    }

    //    return (string[])result.ToArray(typeof(string));
    //}

	private void LoadSortBy()
	{
		if (isBestSeller)
		{
			BestSeller.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
		}
		if (isNewest)
		{
			Newest.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
		}
        //if (isMostPopular)
        //{
        //    Popular.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected");
        //}
        if (isPriceOrder == 1)
        {
            gtSelect.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected ");
            
        }
        if (isPriceOrder == 2)
        {
            ltSelect.Attributes.Add("class", "Shopee-sort-by-options__option Shopee-sort-by-options__option--selected ");
        }
	}
	#region Load left menu
	private void LoadDanhMuc()
	{
        if (cat == null || cat.Length <= 0)
        {
            DanhMuc.Visible = false;
            return;
        }
        string catID = cat.First().ToString();
        string catName = @"select l.TenLoaiSanPham from tb_LoaiSanPham l where l.idLoaiSanPham = '" + catID + "'";
		DataTable tbName = Connect.GetTable(catName);
		if (tbName == null || tbName.Rows.Count <= 0)
		{
            DanhMuc.Visible = false;
			return;
		}
        
		string tenDanhMuc = tbName.Rows[0][0].ToString();
		TenDanhMuc.InnerText = tenDanhMuc;

        string sql = @"select * from tb_LoaiSanPham l where l.idCapCha = '" + catID + "' ";
        
		DataTable data = Connect.GetTable(sql);
		if (data == null)
		{
            DanhMuc.Visible = false;
			return;
		}
		string htmlDsDanhMuc = "";
		for (int i = 0; i < data.Rows.Count; i++)
		{
			string name = data.Rows[i]["TenLoaiSanPham"].ToString();
			string id = data.Rows[i]["idLoaiSanPham"].ToString();
			bool isCheck = false;
			if (cat != null)
			{
				foreach (string item in cat)
				{
					if (item == id)
					{
						htmlDsDanhMuc += "<label class=\"checkbox-custom filterCheckbox_1-Ku checked_3LVu\">";
						isCheck = true;
						break;
					}
				}
			}

			if (!isCheck)
			{
				htmlDsDanhMuc += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			}
			htmlDsDanhMuc += "<input type=\"checkbox\" class=\"input-cb-custom\" data-code=\"cat=" + id + "\"><span class=\"box-check_1KOw\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\" width=\"48\" height=\"48\" class=\"icon-check_mVLE\"><g data-name=\"Layer 2\"><g data-name=\"Layer 1\"><path d=\"M0,0H48V48H0Z\" fill=\"none\"></path>";
			htmlDsDanhMuc += "<polygon points=\"40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46\"></polygon>";
			htmlDsDanhMuc += "</g>";
			htmlDsDanhMuc += "</g></svg></span><span class=\"text_eu8q\">" + name + "</span></label>";
		}
		dsDanhMuc.InnerHtml = htmlDsDanhMuc;
	}
	private void LoadKhoangGia()
	{
		string range = @"select * from tb_KhoangGia g";
		DataTable data = Connect.GetTable(range);
		if (data == null)
		{
			return;
		}
		else
		{
			if (data.Rows.Count <= 0)
			{
				return;
			}
		}
		string htmlDsRange = "";
		for (int i = 0; i < data.Rows.Count; i++)
		{
			string mota = data.Rows[i]["MoTa"].ToString();
			string from = data.Rows[i]["From"].ToString();
			string to = data.Rows[i]["To"].ToString();
			//if()
			htmlDsRange += "<div class=\"col-md-6\"><span class=\"chooseLabel_1hY5\" class=\"input-cb-custom\" data-from=\"" + from + "\" data-to=\"" + to + "\">" + mota + "</span></div>";
		}
		rangePrice.InnerHtml = htmlDsRange;

	}
	private void LoadNhaSanXuat()
	{
		string nsx = @"select n.MaChiNhanh, n.TenNSX, Count(MaChiNhanh) as SoChiNhanh from tb_NhaSanXuat n group by n.MaChiNhanh, n.TenNSX";
		DataTable data = Connect.GetTable(nsx);
		if (data == null)
		{
			return;
		}
		else
		{
			if (data.Rows.Count <= 0)
			{
				return;
			}
		}
		string htmlDsNSX = "";
		for (int i = 0; i < data.Rows.Count; i++)
		{
			string soChiNhanh = data.Rows[i]["SoChiNhanh"].ToString();
			string id = data.Rows[i]["MaChiNhanh"].ToString();
			string tenNSX = data.Rows[i]["TenNSX"].ToString() + " (" + soChiNhanh + ")";

			bool isCheck = false;
			if (pro != null)
			{
				foreach (string item in pro)
				{
					if (item == id)
					{
						htmlDsNSX += "<label class=\"checkbox-custom filterCheckbox_1-Ku checked_3LVu\">";
						isCheck = true;
						break;
					}
				}
			}

			if (!isCheck)
			{
				htmlDsNSX += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			}

			//htmlDsNSX += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			htmlDsNSX += "<input type=\"checkbox\" class=\"input-cb-custom\" data-code=\"pro=" + id + "\"><span class=\"box-check_1KOw\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\" width=\"48\" height=\"48\" class=\"icon-check_mVLE\"><g data-name=\"Layer 2\"><g data-name=\"Layer 1\"><path d=\"M0,0H48V48H0Z\" fill=\"none\"></path>";
			htmlDsNSX += "<polygon points=\"40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46\"></polygon>";
			htmlDsNSX += "</g>";
			htmlDsNSX += "</g></svg></span><span class=\"text_eu8q\">" + tenNSX + "</span></label>";
		}
		DsNSX.InnerHtml = htmlDsNSX;
	}
	private void LoadThuongHieu()
	{
        if (cat == null || cat.Length <= 0)
        {
            divThuongHieu.Visible = false;
            return;
        }
        string idCapCha = cat.First();
        string thuonghieu = @"select * from tb_LoaiSanPham where idCapCha in (select idLoaiSanPham from tb_LoaiSanPham where idCapCha = " + idCapCha + " and TenLoaiSanPham = N'THƯƠNG HIỆU')";
		DataTable data = Connect.GetTable(thuonghieu);
		if (data == null || data.Rows.Count <= 0)
		{
            divThuongHieu.Visible = false;
			return;
		}
		string htmlDsThuongHieu = "";
		for (int i = 0; i < data.Rows.Count; i++)
		{
			string tenLoaiSanPham = data.Rows[i]["TenLoaiSanPham"].ToString();
			string idLoaiSanPham = data.Rows[i]["idLoaiSanPham"].ToString();
			bool isCheck = false;
			if (bra != null)
			{
				foreach (string item in bra)
				{
					if (item == idLoaiSanPham)
					{
						htmlDsThuongHieu += "<label class=\"checkbox-custom filterCheckbox_1-Ku checked_3LVu\">";
						isCheck = true;
						break;
					}
				}
			}

			if (!isCheck)
			{
				htmlDsThuongHieu += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			}
			//htmlDsThuongHieu += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			htmlDsThuongHieu += "<input type=\"checkbox\" class=\"input-cb-custom\" data-code=\"bra=" + idLoaiSanPham + "\"><span class=\"box-check_1KOw\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\" width=\"48\" height=\"48\" class=\"icon-check_mVLE\"><g data-name=\"Layer 2\"><g data-name=\"Layer 1\"><path d=\"M0,0H48V48H0Z\" fill=\"none\"></path>";
			htmlDsThuongHieu += "<polygon points=\"40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46\"></polygon>";
			htmlDsThuongHieu += "</g>";
			htmlDsThuongHieu += "</g></svg></span><span class=\"text_eu8q\">" + tenLoaiSanPham + "</span></label>";
		}

		DsThuongHieu.InnerHtml = htmlDsThuongHieu;
	}
	private void LoadNoiBan()
	{
        string sqlAdrs = @"select g.MaTP, t.name, count(s.idSanPham) as SoluongSanPham
            from tb_GianHang g, tb_SanPham s, tb_tinhthanhpho t
            where g.ID = s.IDGianhang and g.MaTP = t.matp and s.KichHoat = 1
            group by g.MaTP, t.name";
        DataTable data = Connect.GetTable(sqlAdrs);
		if (data == null)
		{
			return;
		}
		else
		{
			if (data.Rows.Count <= 0)
			{
				return;
			}
		}
		string htmlDsNoiBan = "";
		for (int i = 0; i < data.Rows.Count; i++)
		{
			string noiBan = data.Rows[i]["name"].ToString();
			string id = data.Rows[i]["MaTP"].ToString();
            string slSanPham = data.Rows[i]["SoLuongSanPham"].ToString();
			bool isCheck = false;
			if (pla != null)
			{
				foreach (string item in pla)
				{
					if (item == id)
					{
						htmlDsNoiBan += "<label class=\"checkbox-custom filterCheckbox_1-Ku checked_3LVu\">";
						isCheck = true;
						break;
					}
				}
			}

			if (!isCheck)
			{
				htmlDsNoiBan += "<label class=\"checkbox-custom filterCheckbox_1-Ku\">";
			}


			htmlDsNoiBan += "<input type=\"checkbox\" class=\"input-cb-custom\" data-code=\"pla=" + id + "\"><span class=\"box-check_1KOw\"><svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\" width=\"48\" height=\"48\" class=\"icon-check_mVLE\"><g data-name=\"Layer 2\"><g data-name=\"Layer 1\"><path d=\"M0,0H48V48H0Z\" fill=\"none\"></path>";
			htmlDsNoiBan += "<polygon points=\"40 15.46 36.37 11.99 18.56 28.95 11.78 22.48 8 26.09 17.77 35.41 17.79 35.4 18.42 36.01 40 15.46\"></polygon>";
			htmlDsNoiBan += "</g>";
            htmlDsNoiBan += "</g></svg></span><span class=\"text_eu8q\">" + noiBan + " (" + slSanPham + ")" + "</span></label>";
		}

		DsNoiBan.InnerHtml = htmlDsNoiBan;
	}
	#endregion
	
	#region paging
	private void SetPage()
	{
		//if (query != "")
		//{
		//    string sql = @"select count(*) from tb_SanPham where 1 = 1";
		//    sql += " and TenSanPham like N'%" + query + "%'";
		//    DataTable tbTotalRows = Connect.GetTable(sql);
		//    int TotalRows = int.Parse(tbTotalRows.Rows[0][0].ToString());
		//    if (TotalRows % PageSize == 0)
		//        MaxPage = TotalRows / PageSize;
		//    else
		//        MaxPage = TotalRows / PageSize + 1;
		//    txtLastPage = MaxPage.ToString();
		//    if (Page == 1)
		//    {
		//        for (int i = 1; i <= MaxPage; i++)
		//        {
		//            if (i <= 5)
		//            {
		//                switch (i)
		//                {
		//                    case 1: txtPage1 = i.ToString(); break;
		//                    case 2: txtPage2 = i.ToString(); break;
		//                    case 3: txtPage3 = i.ToString(); break;
		//                    case 4: txtPage4 = i.ToString(); break;
		//                    case 5: txtPage5 = i.ToString(); break;
		//                }
		//            }
		//            else
		//                return;
		//        }
		//    }
		//    else
		//    {
		//        if (Page == 2)
		//        {
		//            for (int i = 1; i <= MaxPage; i++)
		//            {
		//                if (i == 1)
		//                    txtPage1 = "1";
		//                if (i <= 5)
		//                {
		//                    switch (i)
		//                    {
		//                        case 2: txtPage2 = i.ToString(); break;
		//                        case 3: txtPage3 = i.ToString(); break;
		//                        case 4: txtPage4 = i.ToString(); break;
		//                        case 5: txtPage5 = i.ToString(); break;
		//                    }
		//                }
		//                else
		//                    return;
		//            }
		//        }
		//        else
		//        {
		//            int Cout = 1;
		//            if (Page <= MaxPage)
		//            {
		//                for (int i = Page; i <= MaxPage; i++)
		//                {
		//                    if (i == Page)
		//                    {
		//                        txtPage1 = (Page - 2).ToString();
		//                        txtPage2 = (Page - 1).ToString();
		//                    }
		//                    if (Cout <= 3)
		//                    {
		//                        if (i == Page)
		//                            txtPage3 = i.ToString();
		//                        if (i == (Page + 1))
		//                            txtPage4 = i.ToString();
		//                        if (i == (Page + 2))
		//                            txtPage5 = i.ToString();
		//                        Cout++;
		//                    }
		//                    else
		//                        return;
		//                }
		//            }
		//            else
		//            {
		//                Page = MaxPage;
		//                SetPage();
		//            }
		//        }
		//    }
		//}
	}
	#endregion
	#region Load san pham
    public string sqlPrefix { get; set; }
    public string sqlSubfix { get; set; }
    public string sqlCommand { get; set; }
    
    private string GetSQL_ListAll()
	{
        string orderby = "";
        if (isNewest)
        {
            orderby = " NgayTao desc ";
        }
        if (isPriceOrder == 1)
        {
            orderby = " GiaMoi desc ";
        }
        if (isPriceOrder == 2)
        {
            orderby = " GiaMoi asc ";
        }
        if (orderby == "")
        {
            orderby = "idSanPham desc";
        }

        sqlPrefix = @"select * from ( SELECT ROW_NUMBER() OVER ( ORDER BY " + orderby + " )AS RowNumber ,idSanPham, TenSanPham, GiaMoi,'LinkHinh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = s.idSanPham) from tb_SanPham s, tb_GianHang g where s.IDGianhang = g.ID  ";

		string sqlWhere = " ";
		List<string> sqlList = new List<string>();
		if (cat != null)
		{
            string sqlTemp = "(idLoaiSanPham in (";
			for (int i = 0; i < cat.Length; i++)
			{

                string idCap1 = cat[i].ToString();

                string sqlCap1 = "select * from tb_LoaiSanPham where idCapCha = '" + idCap1 + "'";
                DataTable dataCap2 = Connect.GetTable(sqlCap1);
                if (dataCap2 != null && dataCap2.Rows.Count > 0)
                {
                    for (int k = 0; k < dataCap2.Rows.Count; k++)
			        {
                        string idCap2 = dataCap2.Rows[k]["idLoaiSanPham"].ToString();
                        string sqlCap3 = "select * from tb_LoaiSanPham where idCapCha = '" + idCap2 + "'";
                        DataTable dataCap3 = Connect.GetTable(sqlCap3);

                        if (dataCap3 != null && dataCap3.Rows.Count > 0)
                        {
                            for (int o = 0; o < dataCap3.Rows.Count; o++)
			                {
                                string idCap3 = dataCap3.Rows[o]["idLoaiSanPham"].ToString();
                                sqlTemp += " '" + idCap3 + "' ";
                                sqlTemp += " , ";
			                }
                            
                        }
                        else
                        {
                            sqlTemp += "'" + idCap2 + "' ";
                            sqlTemp += " , ";
                        }
			        }
                    if (i >= cat.Length - 1)
                    {
                        sqlTemp += " '' ";
                    }
                }
                else
                {
                    sqlTemp += " '" + idCap1 + "' ";
                }
			}
			sqlTemp += " ) )";

			sqlList.Add(sqlTemp);
		}

		if (bra != null)
		{
			string sqlTemp = " (";
			for (int i = 0; i < bra.Length; i++)
			{
				sqlTemp += "idThuongHieu = " + bra[i];
				if (i < bra.Length - 1)
				{
					sqlTemp += " or ";
				}
			}
			sqlTemp += ") ";

			sqlList.Add(sqlTemp);
		}



		if (pro != null)
		{
			string sqlTemp = " (";
			for (int i = 0; i < pro.Length; i++)
			{
				sqlTemp += "idNSX = " + pro[i];
				if (i < pro.Length - 1)
				{
					sqlTemp += " or ";
				}
			}
			sqlTemp += ") ";

			sqlList.Add(sqlTemp);
		}

		if (pla != null)
		{
			string sqlTemp = " (";
			for (int i = 0; i < pla.Length; i++)
			{
				sqlTemp += "g.MaTP = " + pla[i];
				if (i < pla.Length - 1)
				{
					sqlTemp += " or ";
				}
			}
			sqlTemp += ") ";

			sqlList.Add(sqlTemp);
		}
        
		if (gtPrice != 0 && ltPrice != 0)
		{
			string sqlTemp = "s.GiaMoi > " + gtPrice;
			if (ltPrice > 0 && ltPrice > gtPrice)
			{
				sqlTemp += " and s.GiaMoi < " + ltPrice + " ";
			}

			sqlList.Add(sqlTemp);
		}
		if (sqlList.Count > 0)
		{
			sqlWhere += " and ";
		}
		for (int i = 0; i < sqlList.Count; i++)
		{
			 sqlWhere += sqlList[i];
			if (i < sqlList.Count - 1)
			{
				 sqlWhere += " and ";
			}
		}
		
		string sqlPaging = @") as tb1 WHERE RowNumber BETWEEN (" + pageNum + " - 1) * " + PageSize + " + 1 AND (((" + pageNum + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";
		return sqlPrefix + sqlWhere + sqlPaging;
	}

	#endregion
	#region Danh sach san pham
	private void LoadSanPham()
	{
		string sql = GetSQL_ListAll();
		DataTable table = Connect.GetTable(sql);

        if (table == null)
        {
            return;
        }

        if (!String.IsNullOrEmpty(q))
        {
            table = filterName(table, q);
        }
        //DataTable data2 = table;
        //var d = data2.AsEnumerable().GroupBy(row => row.Field<Int32>("IDGianHang")).Select(c => c.Count());
        
        if (table == null)
        {
            dvDSSanPham.InnerHtml = "<a> Không tìm thấy sản phẩm nào </a>";
            return;
        }
		SetPage();
		string html = "";
        curentPage.InnerText = pageNum.ToString();
        pageNumbers.InnerText = (table.Rows.Count/PageSize).ToString();
		for (int i = 0; i < table.Rows.Count; i++)
		{
			string sqlha = "select * from tb_HinhAnhSanPham where idSanPham = " + table.Rows[i]["idSanPham"];
			DataTable tbha = Connect.GetTable(sqlha);
			string Anh1 = "";
			string Anh2 = "";
			if (tbha.Rows.Count > 0)
			{
				Anh1 = StaticData.validImage(tbha.Rows[0]["LinkHinh"].ToString());
				if (tbha.Rows.Count > 1)
					Anh2 = StaticData.validImage(tbha.Rows[1]["LinkHinh"].ToString());
				else
					Anh2 = Anh1;
			}
			string link = GetRouteUrl("product", new { nameEn = MyStaticData.GenerateURL(table.Rows[i]["TenSanPham"].ToString()), id = table.Rows[i]["idSanPham"].ToString() });
			html += "<div class='product-layout col-lg-15 col-md-4 col-sm-6 col-xs-12'>";
			html += "   <div class='product-item-container'>";
			html += "       <div class='left-block left-b' style='height: 230px'>";
			html += @"           <div class='product-image-container second_img'>

									<a href='" + link + @"' target='_self' title='Lastrami bacon' style='height: 229px; display: flex; align-items: center'>
										<img src='" + Anh1 + @"' class='img-1 img-responsive' alt='image1' style='max-height: 229px'>
										
									</a>

								</div>";
			html += "       </div>";
			html += "       <div class='right-block'>";
			html += @"          <div class='button-group so-quickview cartinfo-left' style='top:10px'>
								<button type='button' class='addToCart' title='Mua ngay'>
									<a href='" + link + @"' target='_self' title='Lastrami bacon'><span>Mua ngay</span><a>  
								</button>
							</div>";
			html += @"          <div class='caption hide-cont'>
									<h4><a href='" + link + @"' title='Pastrami bacon' target='_self'>" + MyStaticData.Cut(table.Rows[i]["TenSanPham"].ToString(), 44) + @"</a></h4>
								</div>";
			html += @"          <p class='price'>
									<span class='price-new'>" + StaticData.FormatDouble(table.Rows[i]["GiaMoi"].ToString()) + @"Đ</span>
								</p>";
			html += @"          <div class='description item-desc'>
									<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est . </p>
								</div>";
			html += @"          <div class='list-block hidden'>
									<button class='addToCart btn-button' type='button' title='Add to Cart'><i class='fa fa-shopping-basket'></i>
									</button>
									<button class='wishlist btn-button' type='button' title='Add to Wish List'><i class='fa fa-heart'></i>
									</button>
									<button class='compare btn-button' type='button' title='Compare this Product'><i class='fa fa-refresh'></i>
									</button>
									<!--quickview-->                                                      
									<a class='iframe-link btn-button quickview quickview_handler visible-lg' href='quickview.html' title='Quick view' data-fancybox-type='iframe'><i class='fa fa-eye'></i></a>
									<!--end quickview-->
								</div>";
			html += "       </div>";
			html += "   </div>";
			html += "</div>";
		}
		dvDSSanPham.InnerHtml = html;

		//        string sql = "";
		//        sql += @"select * from
		//            (
		//                SELECT ROW_NUMBER() OVER
		//                  (
		//                        ORDER BY idSanPham desc
		//                  )AS RowNumber
		//                  ,*,'LinkHinh' = (select top 1 LinkHinh from tb_HinhAnhSanPham where idSanPham = s.idSanPham)
		//                  from tb_SanPham s ";
		//        sql += "where and TenSanPham like N'%" + search + "%'";
		//        sql += ") as tb1 WHERE RowNumber BETWEEN (" + Page + " - 1) * " + PageSize + " + 1 AND (((" + Page + " - 1) * " + PageSize + " + 1) + " + PageSize + ") - 1";
		//        DataTable table = Connect.GetTable(sql);
		//        //txtNoiDung.InnerHtml = table.Rows[0]["NoiDung"].ToString();
		//        SetPage();
		//        string html = MyStaticData.htmlSP(table);
		//        //container.InnerHtml = html;
		//        //string htmlPhanTrang = "";
		//        string url = "/product/search?name=" + search;
		//        url += "&Page=";

		////Page 1
		//if (txtPage1 != "")
		//{
		//    if (Page.ToString() == txtPage1)
		//        htmlPhanTrang += "           <span class='page current'>" + txtPage1 + "</span>";
		//    else
		//        htmlPhanTrang += "           <span class='prev'><a href='" + url + txtFistPage + "' title=''>←</a></span><span class='page'><a href='" + url + txtPage1 + "' title=''>" + txtPage1 + "</a></span>";
		//}
		//else
		//{
		//    //html += "           <a id='page_1' class='notepagingnone' href='" + url + txtPage1 + "' />" + txtPage1 + "</a>";
		//}
		////Page 2
		//if (txtPage2 != "")
		//{
		//    if (Page.ToString() == txtPage2)
		//        htmlPhanTrang += "           <span class='page current'>" + txtPage2 + "</span>";
		//    else
		//        htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage2 + "' title=''>" + txtPage2 + "</a></span>";
		//}
		//else
		//{
		//    //html += "           <a id='page_2' class='notepagingnone' href='" + url + txtPage2 + "' />" + txtPage2 + "</a>";
		//}
		////Page 3
		//if (txtPage3 != "")
		//{
		//    if (Page.ToString() == txtPage3)
		//        htmlPhanTrang += "           <span class='page current'>" + txtPage3 + "</span>";
		//    else
		//        htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage3 + "' title=''>" + txtPage3 + "</a></span>";
		//}
		//else
		//{
		//    //html += "           <a id='page_3' class='notepagingnone' href='" + url + txtPage3 + "' />" + txtPage3 + "</a>";
		//}
		////Page 4
		//if (txtPage4 != "")
		//{
		//    if (Page.ToString() == txtPage4)
		//        htmlPhanTrang += "           <span class='page current'>" + txtPage4 + "</span>";
		//    else
		//        htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage4 + "' title=''>" + txtPage4 + "</a></span>";
		//}
		//else
		//{
		//    //html += "           <a id='page_4' class='notepagingnone' href='" + url + txtPage4 + "' />" + txtPage4 + "</a>";
		//}
		////Page 5
		//if (txtPage5 != "")
		//{
		//    if (Page.ToString() == txtPage5)
		//        htmlPhanTrang += "           <span class='page current'>" + txtPage5 + "</span>";
		//    else
		//        htmlPhanTrang += "           <span class='page'><a href='" + url + txtPage5 + "' title=''>" + txtPage5 + "</a></span><span class='next'><a href='" + url + txtLastPage + "' title=''>→</a></span>";
		//}
		//else
		//{
		//    //htmlPhanTrang += "           <span class='next'><a href='" + url + txtLastPage + "' title=''>→</a></span>";
		//}
		////dvPhanTrang.InnerHtml = htmlPhanTrang;

	}
    public static string convertToUnSign(string s)
    {
        Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string temp = s.Normalize(NormalizationForm.FormD);
        return regex.Replace(temp, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }  
    private DataTable filterName(DataTable table, string q)
    {
        q = convertToUnSign(q.ToLower());
        ArrayList list = new ArrayList();
        foreach (DataRow item in table.Rows)
        {
            
            string tensp = item["TenSanPham"].ToString();
            tensp = convertToUnSign(tensp).ToLower();
            if (!tensp.Contains(q))
            {
                list.Add(item);
            }
        }

        foreach (DataRow item in list)
        {
            table.Rows.Remove(item);
        }
        
        return table;
    }
	#endregion
}