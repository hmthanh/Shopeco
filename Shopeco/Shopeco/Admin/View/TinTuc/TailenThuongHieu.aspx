<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TailenThuongHieu.aspx.cs" Inherits="Admin_View_TinTuc_TailenThuongHieu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <br />
            <strong>FILE UPLOAD<br />
            </strong>

        <div>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="348px" Height="27px" />
        &nbsp;
        <asp:Button ID="btnUpload" runat="server" Text="Upload" Height="27px" OnClick="btnUpload_Click" />
        &nbsp;<br />
        <br />
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="None" ErrorMessage="Bạn cần chọn một tệp ảnh trước khi ấn nút &quot;Upload&quot;"></asp:RequiredFieldValidator>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Image ID="Image1" runat="server" Width="150px" />
        </div>
    </form>
</body>
</html>
