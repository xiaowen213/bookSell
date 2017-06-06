<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewSuccessOrder.aspx.cs" Inherits="viewSuccessOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购买成功</title>
</head>
<style type="text/css">
    .footer {
        position: absolute;
        bottom: 0px;
    }
</style>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <div>
                <h1>
                    <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                    山东师范大学图书交易中心</h1>
            </div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT pId, pName, pContent FROM payInfo"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" DataKeyNames="pId">
                <Columns>
                    <asp:BoundField DataField="pName" HeaderText="支付方式" SortExpression="pName" />
                    <asp:BoundField DataField="pContent" HeaderText="详细说明"
                        SortExpression="pContent" />
                </Columns>
            </asp:GridView>

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
