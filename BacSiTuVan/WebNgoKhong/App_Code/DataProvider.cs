﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DataProvider
/// </summary>
public class DataProvider
{
    public static SqlConnection ConnectSQL()
    {
        //string s = @"Data Source=27.0.15.8, 1433;Initial Catalog=db_WebThuongMaiDienTu;User ID=login123; Password=123;Connect Timeout=10";
        string s = @"Data Source=27.0.15.8, 1433;Initial Catalog=db_QuanLyBenhVien;User ID=tkdemo; Password=12345;Connect Timeout=10";
        //string s = @"Data Source=.;Initial Catalog=QuanLyBenhVien;Integrated Security=True";
        //Test
        SqlConnection conn = new SqlConnection(s);
        return conn;
    }
    public static string UploadFile(bool isInsert, FileUpload FileUpload1, string code, string path, string picName, HttpServerUtility server)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string filename = "";
                if (isInsert)
                    filename = code + FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.'));
                else
                    filename = code + FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf('.'));
                string location = server.MapPath(path) + filename;
                FileUpload1.SaveAs(location);

                return filename;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        else
        {
            if (isInsert)
                return "NoImage.png";
            else
                return picName;
        }
    }
    public static DataTable GetTable(string strCommandText)
    {
        SqlConnection Conn = ConnectSQL();
        try
        {
            if (Conn.State == ConnectionState.Closed)
                Conn.Open();
            SqlCommand cmd = new SqlCommand(strCommandText, Conn);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter();
            ad.SelectCommand = cmd;
            DataSet ds = new DataSet();
            ad.Fill(ds, "table1");
            ad.Dispose();
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            return ds.Tables[0];
        }
        catch
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            return null;
        }
    }
    public static DataTable GetTable(string strCommandText, string[] parameterNames, object[] parameterValues)
    {
        SqlConnection Conn = ConnectSQL();
        try
        {
            if (Conn.State == ConnectionState.Closed)
                Conn.Open();
            SqlCommand cmd = new SqlCommand(strCommandText, Conn);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter();
            ad.SelectCommand = cmd;
            DataSet ds = new DataSet();
            ad.Fill(ds, "table1");
            ad.Dispose();
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            return ds.Tables[0];
        }
        catch
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            return null;
        }
    }
    public static bool Exec(string strCommandText)
    {
        SqlConnection Conn = ConnectSQL();
        bool flag = false;
        try
        {
            SqlCommand Cmd = new SqlCommand(strCommandText, Conn);
            Cmd.CommandType = CommandType.Text;
            Cmd.Parameters.Clear();
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            Cmd.ExecuteNonQuery();
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            flag = true;
        }
        catch (Exception)
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            flag = false;
        }

        return flag;
    }
    public static bool Exec(string strCommandText, string[] arrParameterName, object[] arrParameterValue)
    {
        SqlConnection Conn = ConnectSQL();
        bool result = false;
        try
        {
            if (Conn.State == ConnectionState.Closed)
                Conn.Open();
            SqlCommand Cmd = new SqlCommand(strCommandText, Conn);
            Cmd.CommandType = CommandType.Text;
            Cmd.Parameters.Clear();
            for (int i = 0; i < arrParameterName.Length; i++)
            {
                SqlParameter s = new SqlParameter(arrParameterName[i], arrParameterValue[i]);
                Cmd.Parameters.Add(s);
            }
            Cmd.ExecuteNonQuery();
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            result = true;
        }
        catch (Exception)
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
        }

        return result;
    }
    public static bool Exec(string strCommandText, string[] arrParameterName, object[] arrParameterValue, SqlDbType[] types)
    {
        SqlConnection Conn = ConnectSQL();
        bool result = false;
        try
        {
            if (Conn.State == ConnectionState.Closed)
                Conn.Open();
            SqlCommand Cmd = new SqlCommand(strCommandText, Conn);
            Cmd.CommandType = CommandType.Text;
            Cmd.Parameters.Clear();
            for (int i = 0; i < arrParameterName.Length; i++)
            {
                SqlParameter s = new SqlParameter(arrParameterName[i], arrParameterValue[i]);
                s.SqlDbType = types[i];
                Cmd.Parameters.Add(s);
            }
            Cmd.ExecuteNonQuery();
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
            result = true;
        }
        catch (Exception)
        {
            if (Conn.State == ConnectionState.Open)
                Conn.Close();
        }
        return result;
    }
}