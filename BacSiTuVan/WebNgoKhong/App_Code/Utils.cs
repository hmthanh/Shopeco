﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Net.NetworkInformation;
using Microsoft.Win32;
using System.Text.RegularExpressions;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web;

/// <summary>
/// Summary description for Utils
/// </summary>
public static class Utils
{
    public static string HtmlToPlainText(string html)
    {
        const string tagWhiteSpace = @"(>|$)(\W|\n|\r)+<";//matches one or more (white space or line breaks) between '>' and '<'
        const string stripFormatting = @"<[^>]*(>|$)";//match any character between '<' and '>', even when end tag is missing
        const string lineBreak = @"<(br|BR)\s{0,1}\/{0,1}>";//matches: <br>,<br/>,<br />,<BR>,<BR/>,<BR />
        var lineBreakRegex = new Regex(lineBreak, RegexOptions.Multiline);
        var stripFormattingRegex = new Regex(stripFormatting, RegexOptions.Multiline);
        var tagWhiteSpaceRegex = new Regex(tagWhiteSpace, RegexOptions.Multiline);

        var text = html;
        //Decode html specific characters
        text = System.Net.WebUtility.HtmlDecode(text);
        //Remove tag whitespace/line breaks
        text = tagWhiteSpaceRegex.Replace(text, "><");
        //Replace <br /> with line breaks
        text = lineBreakRegex.Replace(text, Environment.NewLine);
        //Strip formatting
        text = stripFormattingRegex.Replace(text, string.Empty);

        return text;
    }
    public static bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }
    public static string validImage(string url)
    {
        if (File.Exists(HttpContext.Current.Server.MapPath(url)))
        {
            return url;
        }
        return "/images/HeThong/thumbnail.jpg";
    }
    public static void LoadCombobox(HtmlSelect sl, string sql, string Text, string Value, string TextSelect)
    {
        sl.DataSource = DataProvider.GetTable(sql);
        sl.DataTextField = Text;
        sl.DataValueField = Value;
        sl.DataBind();
        sl.Items.Add(new ListItem(TextSelect, "-1"));
        sl.Items.FindByValue("-1").Selected = true;
    }
    public static string CreateHTMLPagingAdmin(int page, string url, string[] p)
    {
        string html = "";
        html += "           <a class='notepaging' id='page_fist' href='" + url + p[0] + "'><i class='fa fa-step-backward'></i></a>";
        //Page 1
        if (p[1] != "")
        {
            html += "           <a id='page_1' class='notepaging" + (page.ToString() == p[1] ? "active" : "") + "' href='" + url + p[1] + "'>" + p[1] + "</a>";
        }
        else
        {
            //html += "           <a id='page_1' class='notepagingnone' href='" + url + p[1] + "' />" + p[1] + "</a>";
        }
        //Page 2
        if (p[2] != "")
        {
            html += "           <a id='page_2' class='notepaging" + (page.ToString() == p[2] ? "active" : "") + "' href='" + url + p[2] + "'>" + p[2] + "</a>";
        }
        else
        {
            //html += "           <a id='page_2' class='notepagingnone' href='" + url + p[2] + "' />" + p[2] + "</a>";
        }
        //Page 3
        if (p[3] != "")
        {
            html += "           <a id='page_3' class='notepaging" + (page.ToString() == p[3] ? "active" : "") + "' href='" + url + p[3] + "'>" + p[3] + "</a>";
        }
        else
        {
            //html += "           <a id='page_3' class='notepagingnone' href='" + url + p[3] + "' />" + p[3] + "</a>";
        }
        //Page 4
        if (p[4] != "")
        {
            html += "           <a id='page_4' class='notepaging" + (page.ToString() == p[4] ? "active" : "") + "' href='" + url + p[4] + "'>" + p[4] + "</a>";
        }
        else
        {
            // html += "           <a id='page_4' class='notepagingnone' href='" + url + p[4] + "' />" + p[4] + "</a>";
        }
        //Page 5
        if (p[5] != "")
        {
            html += "           <a id='page_5' class='notepaging" + (page.ToString() == p[5] ? "active" : "") + "' href='" + url + p[5] + "'>" + p[5] + "</a>";
        }
        else
        {
            //html += "           <a id='page_5' class='notepagingnone' href='" + url + p[5] + "' />" + p[5] + "</a>";
        }

        html += "           <a class='notepaging' id='page_last' href='" + url + p[6] + "'><i class='fa fa-step-forward'></i>&nbsp;</a>";

        return html;
    }
    public static string[] SetPage(int Page, int TotalRows, int PageSize)
    {
        int MaxPage = 0;

        if (TotalRows % PageSize == 0)
            MaxPage = TotalRows / PageSize;
        else
            MaxPage = TotalRows / PageSize + 1;

        string pageTruoc = (Page < 2 ? "1" : (Page - 1).ToString());
        string pageSau = (Page == MaxPage ? MaxPage.ToString() : (Page + 1).ToString());
        string[] page = new string[] { pageTruoc, "", "", "", "", "", pageSau };

        page[6] = MaxPage.ToString();
        if (Page == 1)
        {
            for (int i = 1; i <= MaxPage; i++)
            {
                if (i <= 5)
                {
                    switch (i)
                    {
                        case 1: page[1] = i.ToString(); break;
                        case 2: page[2] = i.ToString(); break;
                        case 3: page[3] = i.ToString(); break;
                        case 4: page[4] = i.ToString(); break;
                        case 5: page[5] = i.ToString(); break;
                    }
                }
                else
                    break;
            }
        }
        else
        {
            if (Page == 2)
            {
                for (int i = 1; i <= MaxPage; i++)
                {
                    if (i == 1)
                        page[1] = "1";
                    if (i <= 5)
                    {
                        switch (i)
                        {
                            case 2: page[2] = i.ToString(); break;
                            case 3: page[3] = i.ToString(); break;
                            case 4: page[4] = i.ToString(); break;
                            case 5: page[5] = i.ToString(); break;
                        }
                    }
                    else
                        break;
                }
            }
            else
            {
                int Cout = 1;
                if (Page <= MaxPage)
                {
                    for (int i = Page; i <= MaxPage; i++)
                    {
                        if (i == Page)
                        {
                            page[1] = (Page - 2).ToString();
                            page[2] = (Page - 1).ToString();
                        }
                        if (Cout <= 3)
                        {
                            if (i == Page)
                                page[3] = i.ToString();
                            if (i == (Page + 1))
                                page[4] = i.ToString();
                            if (i == (Page + 2))
                                page[5] = i.ToString();
                            Cout++;
                        }
                        else
                            break;
                    }
                }
                else
                {
                    SetPage(Page, TotalRows, PageSize);
                }
            }
        }

        return page;

    }
    public static string FormatDouble(string str)
    {
        return (str == "" ? "" : double.Parse(str).ToString("N0"));
    }
    public static string GetDate()
    {
        string Ngay = DateTime.Now.Day.ToString();
        string Thang = DateTime.Now.Month.ToString();
        string Nam = DateTime.Now.Year.ToString();
        string Gio = DateTime.Now.Hour.ToString();
        string Phut = DateTime.Now.Minute.ToString();
        string Giay = DateTime.Now.Second.ToString();
        return Thang + "/" + Ngay + "/" + Nam + " " + Gio + ":" + Phut + ":" + Giay;
    }
    public static string ToFormatDate(DateTime date)
    {
        string Ngay = date.Day.ToString();
        string Thang = date.Month.ToString();
        string Nam = date.Year.ToString();
        string Gio = date.Hour.ToString();
        string Phut = date.Minute.ToString();
        string Giay = date.Second.ToString();
        return Thang + "/" + Ngay + "/" + Nam + " " + Gio + ":" + Phut + ":" + Giay;
    }
    public static string DateFormat(string date)
    {
        DateTime d = DateTime.Parse(date);
        return d.ToString("dd/MM/yyyy");
    }
    public static string TimeFormat(string date)
    {
        DateTime d = DateTime.Parse(date);
        return d.ToString("hh:mm:ss");
    }
    #region convert date
    public static string ConvertDDMMtoMMDD(string ngay)
    {
        if (ngay.Equals(""))
        {
            return "";
        }
        else
        {
            string ngayC = ngay.Substring(0, 2);
            string thangC = ngay.Substring(3, 2);
            string namC = ngay.Substring(6, 4);
            return thangC + "/" + ngayC + "/" + namC;
        }
    }
    public static string ConvertMMDDYYtoDDMMYY(string ngay)
    {
        if (ngay.Trim() == "")
        {
            return "";
        }
        else
        {
            int ngayC = 0;
            int thangC = 0;
            int namC = 0;
            try
            {
                thangC = int.Parse(ngay.Substring(0, 2));
                try
                {
                    ngayC = int.Parse(ngay.Substring(3, 2));
                    namC = int.Parse(ngay.Substring(6, 4));
                }
                catch
                {
                    ngayC = int.Parse(ngay.Substring(3, 1));
                    namC = int.Parse(ngay.Substring(5, 4));
                }
            }
            catch
            {
                thangC = int.Parse(ngay.Substring(0, 1));
                try
                {
                    ngayC = int.Parse(ngay.Substring(2, 2));
                    namC = int.Parse(ngay.Substring(5, 4));
                }
                catch
                {
                    ngayC = int.Parse(ngay.Substring(2, 1));
                    namC = int.Parse(ngay.Substring(4, 4));
                }
            }
            string ngaytrave = "";
            if (ngayC < 10 && thangC < 10)
                ngaytrave = "0" + ngayC.ToString() + "/0" + thangC.ToString() + "/" + namC.ToString();
            if (ngayC < 10 && thangC >= 10)
                ngaytrave = "0" + ngayC.ToString() + "/" + thangC.ToString() + "/" + namC.ToString();
            if (ngayC >= 10 && thangC < 10)
                ngaytrave = ngayC.ToString() + "/0" + thangC.ToString() + "/" + namC.ToString();
            if (ngayC >= 10 && thangC >= 10)
                ngaytrave = ngayC.ToString() + "/" + thangC.ToString() + "/" + namC.ToString();

            return ngaytrave;
        }
    }
    #endregion
    //    public static bool IsValidEmail(string email)
    //    {
    //        try
    //        {
    //            int nFirt = int.Parse(email.Substring(0, 1));
    //            return false;
    //        }
    //        catch
    //        {
    //            string pattern = @"^[_a-zA-Z0-9][_.a-zA-Z0-9]*@[-.a-zA-Z0-9]+(\.[_.a-zA-Z0-9]+)*\.
    //                                    (com|edu|info|gov|int|mil|net|org|biz|name|museum|coop|aero|pro|tv|vn|[a-zA-Z]{2})$";
    //            //Regular expression object
    //            Regex check = new Regex(pattern, RegexOptions.IgnorePatternWhitespace);
    //            //boolean variable to return to calling method
    //            bool valid = false;

    //            //make sure an email address was provided
    //            if (string.IsNullOrEmpty(email))
    //            {
    //                valid = false;
    //            }
    //            else
    //            {
    //                //use IsMatch to validate the address
    //                valid = check.IsMatch(email.ToLower());
    //            }
    //            //return the value to the calling method
    //            return valid;
    //        }
    //    }
    public static string Change_AV(string ip_str_change)
    {
        Regex v_reg_regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
        string v_str_FormD = ip_str_change.Normalize(NormalizationForm.FormD);
        return v_reg_regex.Replace(v_str_FormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
    }
    #region Lisence
    public static string GetMD5(string chuoi)
    {
        string str_md5 = "";
        byte[] mang = System.Text.Encoding.UTF8.GetBytes(chuoi);

        MD5CryptoServiceProvider my_md5 = new MD5CryptoServiceProvider();
        mang = my_md5.ComputeHash(mang);

        foreach (byte b in mang)
        {
            str_md5 += b.ToString("X2");
        }

        return str_md5;
    }
    public static string GetMACAddress()
    {
        NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
        String sMacAddress = string.Empty;
        foreach (NetworkInterface adapter in nics)
        {
            if (sMacAddress == String.Empty)// only return MAC Address from first card
            {
                IPInterfaceProperties properties = adapter.GetIPProperties();
                sMacAddress = adapter.GetPhysicalAddress().ToString();
            }
        } return sMacAddress;
    }
    private static void HoanVi(string a, string b)
    {
        string x = "";
        x = a;
        a = b;
        b = x;
    }
    public static string getKey(string physicalAdress)
    {
        string result = "";
        string[] arrS = new string[GetMD5(physicalAdress).Length];
        for (int i = 0; i < GetMD5(physicalAdress).Length; i++)
        {
            arrS[i] = GetMD5(physicalAdress).Substring(i, 1);
        }
        //Hoán vị
        for (int i = 0; i < GetMD5(physicalAdress).Length; i++)
        {
            for (int j = 0; j < (GetMD5(physicalAdress).Length - 1); j++)
            {
                HoanVi(arrS[j], arrS[j + 1]);
            }
            for (int j = 0; j < (GetMD5(physicalAdress).Length - 3); j++)
            {
                HoanVi(arrS[j], arrS[j + 3]);
            }
            for (int j = 0; j < (GetMD5(physicalAdress).Length - 5); j++)
            {
                HoanVi(arrS[j], arrS[j + 5]);
            }
            for (int j = 0; j < (GetMD5(physicalAdress).Length - 2); j++)
            {
                HoanVi(arrS[j], arrS[j + 2]);

            }
            result += arrS[i];
        }
        //MessageBox.Show(result.Substring(0, 5) + "-" + result.Substring(5, 5) +"-"+ result.Substring(10, 5));
        return (result.Substring(0, 5) + "-" + result.Substring(5, 5) + "-" + result.Substring(10, 5));
    }

    //Đọc và ghi dữ liệu vào registry
    public static string ReadRegKey(string path, string getName)
    {
        try
        {
            RegistryKey regkey;
            regkey = Registry.LocalMachine.OpenSubKey(path);
            //return regkey.GetSubKeyNames(); 
            return regkey.GetValue(getName).ToString();
        }
        catch
        {
            return "";
        }
    }

    public static bool WriteRegKey(string keyName, object value, string path)
    {
        RegistryKey rk = Registry.LocalMachine;
        RegistryKey sk1 = rk.CreateSubKey(path);
        sk1.SetValue(keyName, value);
        return true;
    }
    public static void EnabledTCTSQLServer()
    {
        #region Enabeld TCP
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.1\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.1\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.2\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.2\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.3\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.3\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.4\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.4\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.5\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.5\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.6\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.6\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.7\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.7\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.8\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.8\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.9\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.9\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.10\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.10\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.11\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.11\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.12\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.12\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.13\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.13\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.14\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.14\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        try
        {
            RegistryKey regkey = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.15\MSSQLServer\SuperSocketNetLib\Tcp", true);
            regkey.SetValue("Enabled", 1);
            RegistryKey regkey1 = Registry.LocalMachine.OpenSubKey(@"Software\Microsoft\Microsoft SQL Server\MSSQL.15\MSSQLServer", true);
            regkey1.SetValue("LoginMode", 2);
        }
        catch
        { }
        #endregion
    }
    #endregion
    public static bool CoppyFile(string sourceFile, string destinationFile)
    {
        //try
        //{

        SqlConnection.ClearAllPools();
        if (System.IO.File.Exists(destinationFile))
        {
            System.IO.File.Delete(destinationFile);
            //if (System.IO.File.Exists(Application.StartupPath + @"\Database\db_CDSoft_Printer_log.ldf"))
            //    System.IO.File.Delete(Application.StartupPath+@"\Database\db_CDSoft_Printer_log.ldf");
        }
        //destinationFile = System.IO.Path.Combine(destinationFile, System.IO.Path.GetFileName(sourceFile));
        System.IO.File.Copy(sourceFile, destinationFile);
        return true;
        //}
        //catch
        //{
        //    return false;
        //}

    }

    public static string getField(string table, string getField, string paraField, string valueParaField)
    {
        string result = "";
        string sql = "select " + getField + " from " + table + " where " + paraField + "='" + valueParaField + "'";
        try
        {
            DataTable tb = DataProvider.GetTable(sql);
            if (tb.Rows.Count > 0)
                result = tb.Rows[0][0].ToString();
        }
        catch
        { }
        return result;
    }
    public static string getFieldString(string table, string getField, string paraField, string valueParaField)
    {
        string result = "";
        string sql = "select " + getField + " from " + table + " where " + paraField + " like N'" + valueParaField + "'";
        try
        {
            DataTable tb = DataProvider.GetTable(sql);
            if (tb.Rows.Count > 0)
                result = tb.Rows[0][0].ToString();
        }
        catch
        { }
        return result;
    }
    public static bool SendMail(string Subject, string Body, string FromMail, string FromMailPass, string ToMail)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(ToMail);
            mail.From = new MailAddress(ToMail);
            mail.Subject = Subject;
            mail.Body = Body;

            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("localhost", 25);
            smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address  
            smtp.Credentials = new System.Net.NetworkCredential
                 (FromMail, FromMailPass);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return true;
        }
        catch
        {
            return false;
        }
    }
    public static string ValidParameter(string s)
    {
        s = s.Replace("\"", "").Replace("'", "").Replace("update", "").Replace("select", "").Replace("drop", "").Replace(";", "").Replace("--", "").Replace("insert", "").Replace("delete", "").Replace("xp_", "");
        return s;
    }
    private static readonly string[] VietnameseSigns = new string[]

    {

        "aAeEoOuUiIdDyY",

        "áàạảãâấầậẩẫăắằặẳẵ",

        "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",

        "éèẹẻẽêếềệểễ",

        "ÉÈẸẺẼÊẾỀỆỂỄ",

        "óòọỏõôốồộổỗơớờợởỡ",

        "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",

        "úùụủũưứừựửữ",

        "ÚÙỤỦŨƯỨỪỰỬỮ",

        "íìịỉĩ",

        "ÍÌỊỈĨ",

        "đ",

        "Đ",

        "ýỳỵỷỹ",

        "ÝỲỴỶỸ"

    };


    public static string BoDauTiengViet(string str)
    {

        //Tiến hành thay thế , lọc bỏ dấu cho chuỗi

        for (int i = 1; i < VietnameseSigns.Length; i++)
        {

            for (int j = 0; j < VietnameseSigns[i].Length; j++)

                str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);

        }

        return str;

    }
    public static string ReplaceTieuDe(string TieuDe)
    {
        string sTieuDe = TieuDe.Replace("?", "").Replace("[=1]", "").Replace("[=2]", "").Replace("[=3]", "").Replace("[=4]", "").Replace("[=5]", "").Replace("[=6]", "").Replace("[=7]", "").Replace("[=8]", "").Replace("[=9]", "").Replace("[=10]", "").Replace("[=11]", "").Replace("[=12]", "").Replace("[=13]", "").Replace("[=14]", "").Replace("[=15]", "").ToLower().Trim().Replace("/", " ").Replace("|", " ").Replace("–", "").Replace(" ", "-").Replace(".", "").Replace("%", "").Replace(":", "").Replace("!", "").Replace("\"", "").Replace(",", "").Replace(".", "").Replace("'", "").Replace("“", "").Replace("”", "").Replace("(", "").Replace(")", "").Replace(" ", "-").Replace(" ", "-").Replace(" ", "-").Replace(" ", "-").Replace(" ", "-").Replace("--", "-").Replace("--", "-").Replace("--", "-").Replace("---", "-").Replace("----", "-").Replace("-----", "-").Replace("&", "");
        if (sTieuDe.Length <= 62)
            return sTieuDe;
        else
            return sTieuDe.Substring(0, 62);
    }
    public static string ReplaceTieuDePage(string TieuDe)
    {
        string sTieuDe = TieuDe.Replace("?", "").Replace("[=1]", "").Replace("[=2]", "").Replace("[=3]", "").Replace("[=4]", "").Replace("[=5]", "").Replace("[=6]", "").Replace("[=7]", "").Replace("[=8]", "").Replace("[=9]", "").Replace("[=10]", "").Replace("[=11]", "").Replace("[=12]", "").Replace("[=13]", "").Replace("[=14]", "").Replace("[=15]", "").Trim().Replace(".", "").Replace("%", "").Replace(":", ""); ;
        if (sTieuDe.Length <= 62)
            return sTieuDe;
        else
            return sTieuDe.Substring(0, 62);
    }
    public static string RemoveHtmlTagsUsingCharArray(this string htmlString)
    {
        var array = new char[htmlString.Length];
        var arrayIndex = 0;
        var inside = false;

        foreach (var @let in htmlString)
        {
            if (let == '<')
            {
                inside = true;
                continue;
            }
            if (let == '>')
            {
                inside = false;
                continue;
            }
            if (inside) continue;
            array[arrayIndex] = let;
            arrayIndex++;
        }
        return new string(array, 0, arrayIndex);
    }
    public static string DecodeFromUtf8(this string utf8String)
    {
        // read the string as UTF-8 bytes.
        byte[] encodedBytes = Encoding.UTF8.GetBytes(utf8String);

        // convert them into unicode bytes.
        byte[] unicodeBytes = Encoding.Convert(Encoding.UTF8, Encoding.Unicode, encodedBytes);

        // builds the converted string.
        return Encoding.Unicode.GetString(encodedBytes);
    }
}