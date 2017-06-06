<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifyAdminPassword.aspx.cs" Inherits="admin_modifyAdminPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改管理员密码</title>
    <style type="text/css">
        .footer {
            position: absolute;
            bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <div>
                <h1>
                    <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                    山东师范大学图书交易中心</h1>
            </div>
            <br />
            修改密码<br />
            <asp:Label ID="labMsg" runat="server"></asp:Label>
            <br />
            旧密码：<asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtOldPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            新密码：<asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtNewPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            确认密码：<asp:TextBox ID="txtComfigPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="txtComfigPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToCompare="txtNewPassword" ControlToValidate="txtComfigPassword"
                ErrorMessage="2次密码输入不一致"></asp:CompareValidator>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">修改密码</asp:LinkButton>
        </div>
    </form>
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
