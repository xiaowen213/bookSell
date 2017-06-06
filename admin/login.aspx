<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理员登录</title>
    <style type="text/css">
        .footer {
            position: absolute;
            bottom: 0px;
        }
    </style>
</head>
<body>
    <div align="center">
        <div>
            <h1>
                <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                山东师范大学图书交易中心</h1>
        </div>
        <form id="form1" runat="server">
            <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE"
                BorderPadding="4" BorderStyle="Solid" BorderWidth="1px"
                DestinationPageUrl="~/admin/Default.aspx" Font-Names="Verdana" Font-Size="0.8em"
                ForeColor="#333333" Height="158px" OnAuthenticate="Login1_Authenticate" Width="183px">
                <TextBoxStyle Font-Size="0.8em" />
                <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em"
                    ForeColor="White" />
            </asp:Login>



        </form>
    </div>
    <div class="footer">
        <table>
            <tr>
                <td width="500px"></td>
                <td>BY 生态组</td>
                <td></td>
            </tr>
        </table>
    </div>
</body>
</html>
