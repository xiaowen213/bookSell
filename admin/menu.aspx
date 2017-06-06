<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="admin_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理界面</title>
</head>
<style type="text/css">
    .footer {
        position: absolute;
        bottom: 0px;
    }
</style>
<body>
    <div align="center">
        <h1>
            <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
            山东师范大学图书交易中心</h1>
    </div>
    <table style="width: 100%">
        <tr>
            <td>
                <div align="center">
                    <a href="bookTypeAdmin.aspx" target="mainFrame">图书类别管理</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <a href="addBookInfo.aspx" target="mainFrame">添加图书信息</a>
                </div>

            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <a href="adminBookInfo.aspx" target="mainFrame">管理图书信息</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <a href="orderList.aspx" target="mainFrame">订单信息管理</a>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div align="center">
                    <a href="modifyAdminPassword.aspx" target="mianFrame">修改管理员密码</a>
                </div>
            </td>
        </tr>
    </table>
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
