<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminBookInfo.aspx.cs" Inherits="admin_adminBookInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>管理图书信息</title>
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
                <div>
                    <h1>
                        <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                        山东师范大学图书交易中心</h1>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [bookInfo] WHERE [ISBN] = @ISBN"
                    InsertCommand="INSERT INTO [bookInfo] ([ISBN], [bname], [bcid], [bAuthor], [bprice], [bCount], [bSaleCount], [bPictuer], [bContent]) VALUES (@ISBN, @bname, @bcid, @bAuthor, @bprice, @bCount, @bSaleCount, @bPictuer, @bContent)"
                    SelectCommand="SELECT bookInfo.ISBN, bookInfo.bname, bookInfo.bcid, bookInfo.bAuthor, bookInfo.bprice, bookInfo.bCount, bookInfo.bSaleCount, bookClass.bcName FROM bookInfo INNER JOIN bookClass ON bookInfo.bcid = bookClass.bcId"
                    UpdateCommand="UPDATE [bookInfo] SET [bname] = @bname, [bcid] = @bcid, [bAuthor] = @bAuthor, [bprice] = @bprice, [bCount] = @bCount, [bSaleCount] = @bSaleCount, [bPictuer] = @bPictuer, [bContent] = @bContent WHERE [ISBN] = @ISBN">
                    <DeleteParameters>
                        <asp:Parameter Name="ISBN" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="bname" Type="String" />
                        <asp:Parameter Name="bcid" Type="Int32" />
                        <asp:Parameter Name="bAuthor" Type="String" />
                        <asp:Parameter Name="bprice" Type="Double" />
                        <asp:Parameter Name="bCount" Type="Int32" />
                        <asp:Parameter Name="bSaleCount" Type="Int32" />
                        <asp:Parameter Name="bPictuer" Type="String" />
                        <asp:Parameter Name="bContent" Type="String" />
                        <asp:Parameter Name="ISBN" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ISBN" Type="String" />
                        <asp:Parameter Name="bname" Type="String" />
                        <asp:Parameter Name="bcid" Type="Int32" />
                        <asp:Parameter Name="bAuthor" Type="String" />
                        <asp:Parameter Name="bprice" Type="Double" />
                        <asp:Parameter Name="bCount" Type="Int32" />
                        <asp:Parameter Name="bSaleCount" Type="Int32" />
                        <asp:Parameter Name="bPictuer" Type="String" />
                        <asp:Parameter Name="bContent" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>

            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="ISBN" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None" OnRowEditing="GridView1_RowEditing">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True"
                        SortExpression="ISBN" />
                    <asp:BoundField DataField="bname" HeaderText="书名" SortExpression="bname" />
                    <asp:BoundField DataField="bcName" HeaderText="类别" SortExpression="bcName" />
                    <asp:BoundField DataField="bAuthor" HeaderText="作者" SortExpression="bAuthor" />
                    <asp:BoundField DataField="bprice" HeaderText="价格" SortExpression="bprice" />
                    <asp:BoundField DataField="bCount" HeaderText="库存量"
                        SortExpression="bCount" />
                    <asp:BoundField DataField="bSaleCount" HeaderText="销售量"
                        SortExpression="bSaleCount" />
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
