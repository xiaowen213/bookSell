<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifyBookInfo.aspx.cs" Inherits="admin_modifyBookInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理图书信息</title>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [bookInfo] WHERE [ISBN] = @ISBN" InsertCommand="INSERT INTO [bookInfo] ([bName], [ISBN], [bCId], [bAuthor], [bCount], [bSaleCount], [bPrice]) VALUES (@bName, @ISBN, @bCId, @bAuthor, @bCount, @bSaleCount, @bPrice)" SelectCommand="SELECT [bName], [ISBN], [bCId], [bAuthor], [bCount], [bSaleCount], [bPrice] FROM [bookInfo] WHERE ([ISBN] = @ISBN)" UpdateCommand="UPDATE [bookInfo] SET [bName] = @bName, [bCId] = @bCId, [bAuthor] = @bAuthor, [bCount] = @bCount, [bSaleCount] = @bSaleCount, [bPrice] = @bPrice WHERE [ISBN] = @ISBN">
            <DeleteParameters>
                <asp:Parameter Name="ISBN" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bName" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="bCId" Type="Int32" />
                <asp:Parameter Name="bAuthor" Type="String" />
                <asp:Parameter Name="bCount" Type="Int32" />
                <asp:Parameter Name="bSaleCount" Type="Int32" />
                <asp:Parameter Name="bPrice" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ISBN" QueryStringField="isbn" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="bName" Type="String" />
                <asp:Parameter Name="bCId" Type="Int32" />
                <asp:Parameter Name="bAuthor" Type="String" />
                <asp:Parameter Name="bCount" Type="Int32" />
                <asp:Parameter Name="bSaleCount" Type="Int32" />
                <asp:Parameter Name="bPrice" Type="Double" />
                <asp:Parameter Name="ISBN" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" DefaultMode="Edit">
            <EditItemTemplate>
                图书名称:
                <asp:TextBox ID="bNameTextBox" runat="server" Text='<%# Bind("bName") %>' />
                <br />
                ISBN:
                <asp:Label ID="ISBNLabel1" runat="server" Text='<%# Eval("ISBN") %>' />
                <br />
                图书类别:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="bcName" DataValueField="bcId" SelectedValue='<%# Bind("bCId") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [bookClass]"></asp:SqlDataSource>
                <br />
                图书作者:
                <asp:TextBox ID="bAuthorTextBox" runat="server" Text='<%# Bind("bAuthor") %>' />
                <br />
                库存量:
                <asp:TextBox ID="bCountTextBox" runat="server" Text='<%# Bind("bCount") %>' />
                <br />
                销售量:
                <asp:TextBox ID="bSaleCountTextBox" runat="server" Text='<%# Bind("bSaleCount") %>' />
                <br />
                图书售价:
                <asp:TextBox ID="bPriceTextBox" runat="server" Text='<%# Bind("bPrice") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                bName:
                <asp:TextBox ID="bNameTextBox" runat="server" Text='<%# Bind("bName") %>' />
                <br />
                ISBN:
                <asp:TextBox ID="ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>' />
                <br />
                bCId:
                <asp:TextBox ID="bCIdTextBox" runat="server" Text='<%# Bind("bCId") %>' />
                <br />
                bAuthor:
                <asp:TextBox ID="bAuthorTextBox" runat="server" Text='<%# Bind("bAuthor") %>' />
                <br />
                bCount:
                <asp:TextBox ID="bCountTextBox" runat="server" Text='<%# Bind("bCount") %>' />
                <br />
                bSaleCount:
                <asp:TextBox ID="bSaleCountTextBox" runat="server" Text='<%# Bind("bSaleCount") %>' />
                <br />
                bPrice:
                <asp:TextBox ID="bPriceTextBox" runat="server" Text='<%# Bind("bPrice") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                bName:
                <asp:Label ID="bNameLabel" runat="server" Text='<%# Bind("bName") %>' />
                <br />
                ISBN:
                <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                <br />
                bCId:
                <asp:Label ID="bCIdLabel" runat="server" Text='<%# Bind("bCId") %>' />
                <br />
                bAuthor:
                <asp:Label ID="bAuthorLabel" runat="server" Text='<%# Bind("bAuthor") %>' />
                <br />
                bCount:
                <asp:Label ID="bCountLabel" runat="server" Text='<%# Bind("bCount") %>' />
                <br />
                bSaleCount:
                <asp:Label ID="bSaleCountLabel" runat="server" Text='<%# Bind("bSaleCount") %>' />
                <br />
                bPrice:
                <asp:Label ID="bPriceLabel" runat="server" Text='<%# Bind("bPrice") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
            </ItemTemplate>
        </asp:FormView>
    
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
