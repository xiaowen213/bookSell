<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookInfo.aspx.cs" Inherits="bookInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>图书信息</title>
    <style type="text/css">
        .style1
        {
            width: 238px;
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
            SelectCommand="SELECT bookInfo.ISBN, bookInfo.bName, bookInfo.bCId, bookInfo.bPrice, bookInfo.bSaleCount, bookInfo.bContent, bookClass.bcName, bookInfo.bCount, bookInfo.bPricture, bookInfo.bAuthor FROM bookInfo INNER JOIN bookClass ON bookInfo.bCId = bookClass.bcId WHERE (bookInfo.ISBN = @ISBN)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ISBN" QueryStringField="isbn" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    <div>
    
        <table align="center" style="width: 437px">
            <tr>
            <td class="style1">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ISBN" DataSourceID="SqlDataSource1" Height="50px" Width="341px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" 
                SortExpression="ISBN" />
            <asp:BoundField DataField="bname" HeaderText="书名" SortExpression="bname" />
            <asp:BoundField DataField="bcName" HeaderText="类别" SortExpression="bcName" />
            <asp:BoundField DataField="bAuthor" HeaderText="作者" SortExpression="bzz" />
            <asp:BoundField DataField="bprice" HeaderText="价格" SortExpression="bprice" />
            <asp:BoundField DataField="bCount" HeaderText="库存量" 
                SortExpression="bkcCount" />
            <asp:BoundField DataField="bSaleCount" HeaderText="销售量" 
                SortExpression="bSaleCount" />
            <asp:BoundField DataField="bContent" HeaderText="介绍" 
                SortExpression="bContent" />
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
                </td>
            <td>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ISBN" 
        DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333">
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("bPricture") %>' />
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
                </td>
            </tr>
        </table>
    
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
