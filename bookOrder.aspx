<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookOrder.aspx.cs" Inherits="bookOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车</title>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="bname" HeaderText="图书名称" />
                    <asp:TemplateField>
                        <HeaderTemplate>购买量</HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" Text='<%# Eval("count") %>' ReadOnly Width="20 px" runat="server"></asp:TextBox>
                            <a href="bookOrder.aspx?op=subcount&isbn=<%# Eval("ISBN") %>">减一</a>
                            <a href="bookOrder.aspx?op=addcount&isbn=<%# Eval("ISBN") %>">加一</a>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="bprice" HeaderText="单价" />

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
            <asp:Label ID="sumCount" runat="server"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="payOrder.aspx">付款</asp:HyperLink>
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
