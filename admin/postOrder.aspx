<%@ Page Language="C#" AutoEventWireup="true" CodeFile="postOrder.aspx.cs" Inherits="admin_postOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书订单信息</title>
    <style type="text/css">
        .footer {
            position: absolute;
            bottom: 0px;
        }
    </style>
</head>
<body>
    <div align="center">
        <form id="form1" runat="server">

            <div>
                <h1>
                    <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                    山东师范大学图书交易中心</h1>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [orderid], [postAdress], [postNumber], [orderMember], [isPay], [isPost], [orderPrice] FROM [orders] WHERE ([orderid] = @orderid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                CellPadding="4" DataKeyNames="orderid" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None" Height="50px" Width="253px">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="orderid" HeaderText="订单编号" ReadOnly="True"
                        SortExpression="orderid" />
                    <asp:BoundField DataField="postAdress" HeaderText="收货地址"
                        SortExpression="postAdress" />
                    <asp:BoundField DataField="postNumber" HeaderText="国内邮政编码"
                        SortExpression="postNumber" />
                    <asp:BoundField DataField="orderMember" HeaderText="收货人"
                        SortExpression="orderMember" />
                    <asp:CheckBoxField DataField="isPay" HeaderText="是否支付" ReadOnly="True"
                        SortExpression="isPay" />
                    <asp:CheckBoxField DataField="isPost" HeaderText="是否发货"
                        SortExpression="isPost" ReadOnly="True" />
                    <asp:BoundField DataField="orderPrice" HeaderText="订单价格"
                        SortExpression="orderPrice" />
                </Fields>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
            <p>
                订单详细
            </p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT orderPocduct.orderid, orderPocduct.ISBN, orderPocduct.count, orderPocduct.price, orderPocduct.sumPrice, bookInfo.bname FROM orderPocduct INNER JOIN bookInfo ON orderPocduct.ISBN = bookInfo.ISBN WHERE (orderPocduct.orderid = @orderid)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="orderid" QueryStringField="orderid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333"
                GridLines="None" Style="" Width="545px">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                    <asp:BoundField DataField="bname" HeaderText="书名" SortExpression="bname" />
                    <asp:BoundField DataField="price" HeaderText="单价" SortExpression="price" />
                    <asp:BoundField DataField="count" HeaderText="数量" SortExpression="count" />
                    <asp:BoundField DataField="sumPrice" HeaderText="总价"
                        SortExpression="sumPrice" />
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
            <br />
            <asp:LinkButton ID="btnIsPay" runat="server" OnClick="btnIsPay_Click">已收款</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnIsPost" runat="server" OnClick="btnIsPost_Click">已发货</asp:LinkButton>
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
