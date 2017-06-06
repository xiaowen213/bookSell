<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书信息查询</title>
    <style type="text/css">
        .style1 {
            width: 215px;
        }

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
                SelectCommand="SELECT * FROM [bookInfo]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [bcId], [bcName] FROM [bookClass]"></asp:SqlDataSource>
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="bcId"
                            DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("bcId", "?BCID=(0)") %>' Text='<%# Eval("bcName") %>'></asp:HyperLink>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN"
                            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True"
                                    SortExpression="ISBN" />
                                <asp:BoundField DataField="bName" HeaderText="书名" SortExpression="bName" />
                                <asp:BoundField DataField="bAuthor" HeaderText="作者" SortExpression="bAuthor" />
                                <asp:BoundField DataField="bPrice" HeaderText="价格" SortExpression="bPrice" />
                                <asp:BoundField DataField="bCount" HeaderText="库存量" SortExpression="bCount" />
                                <asp:BoundField DataField="bSaleCount" HeaderText="售出量" SortExpression="bSaleCount" />
                                <asp:BoundField DataField="bContent" HeaderText="简介" SortExpression="bContent" />
                                <asp:HyperLinkField DataNavigateUrlFields="ISBN" DataNavigateUrlFormatString="bookInfo.aspx?isbn={0}" HeaderText="详细信息" Text="详细信息" />
                                <asp:HyperLinkField DataNavigateUrlFields="ISBN" DataNavigateUrlFormatString="bookOrder.aspx?op=add&amp;bid={0}" HeaderText="加入购物车" Text="加入购物车" />
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
                    </td>

                </tr>
            </table>
            <br />

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
