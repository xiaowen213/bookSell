<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookTypeAdmin.aspx.cs" Inherits="admin_bookTypeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理图书类别</title>
    <style type="text/css">
        .footer {
            position: absolute;
            bottom: 0px;
        }
    </style>
</head>
<body>
    <div align="center">
        <div>
                <h1>
                    <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                    山东师范大学图书交易中心</h1>
            </div>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [bookClass] WHERE [bcId] = @bcId" 
        InsertCommand="INSERT INTO [bookClass] ([bcName]) VALUES (@bcName)" 
        SelectCommand="SELECT * FROM [bookClass]" 
        UpdateCommand="UPDATE [bookClass] SET [bcName] = @bcName WHERE [bcId] = @bcId">
        <DeleteParameters>
            <asp:Parameter Name="bcId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="bcName" Type="String" />
            <asp:Parameter Name="bcId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="bcName" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <div>
    
    </div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="bcId" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" onrowdeleting="GridView1_RowDeleting">
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="bcId" HeaderText="类别编号" InsertVisible="False" 
                ReadOnly="True" SortExpression="bcId" />
            <asp:BoundField DataField="bcName" HeaderText="类别名称" SortExpression="bcName" />
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
    添加分类<asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="bcId" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
        ForeColor="#333333" oniteminserting="FormView1_ItemInserting">
            <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditItemTemplate>
            bcName:
            <asp:TextBox ID="bcNameTextBox" runat="server" Text='<%# Bind("bcName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            类别名称:
            <asp:TextBox ID="bcNameTextBox" runat="server" Text='<%# Bind("bcName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            bcId:
            <asp:Label ID="bcIdLabel" runat="server" Text='<%# Eval("bcId") %>' />
            <br />
            bcName:
            <asp:Label ID="bcNameLabel" runat="server" Text='<%# Bind("bcName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="编辑" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="删除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新建" />
        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
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
