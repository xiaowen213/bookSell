<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderList.aspx.cs" Inherits="admin_orderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订单列表</title>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT orders.orderid, orders.postAdress, orders.postNumber, orders.orderMember, orders.orderPrice, orders.isPay, orders.isPost, payInfo.pname FROM orders INNER JOIN payInfo ON orders.pid = payInfo.pid"></asp:SqlDataSource>


            <p>
                &nbsp;
            </p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="orderid" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="orderid" HeaderText="订单号" ReadOnly="True"
                        SortExpression="orderid" />
                    <asp:BoundField DataField="postAdress" HeaderText="收货地址"
                        SortExpression="postAdress" />
                    <asp:BoundField DataField="postNumber" HeaderText="国内邮政编码"
                        SortExpression="postNumber" />
                    <asp:BoundField DataField="orderMember" HeaderText="收货人"
                        SortExpression="orderMember" />
                    <asp:BoundField DataField="orderPrice" HeaderText="订单总金额"
                        SortExpression="orderPrice" />
                    <asp:CheckBoxField DataField="isPay" HeaderText="是否支付" ReadOnly="True"
                        SortExpression="isPay" />
                    <asp:CheckBoxField DataField="isPost" HeaderText="是否发货" ReadOnly="True"
                        SortExpression="isPost" />
                    <asp:BoundField DataField="pname" HeaderText="支付方式" SortExpression="pname" />
                    <asp:HyperLinkField DataNavigateUrlFields="orderid"
                        DataNavigateUrlFormatString="postOrder.aspx?orderid={0}" HeaderText="订单详细"
                        Text="订单详细" />
                </Columns>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
