<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payInfo.aspx.cs" Inherits="admin_payInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>支付信息</title>
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
                DeleteCommand="DELETE FROM [payInfo] WHERE [pid] = @pid"
                InsertCommand="INSERT INTO [payInfo] ([pname], [pcontent]) VALUES (@pname, @pcontent)"
                SelectCommand="SELECT * FROM [payInfo]"
                UpdateCommand="UPDATE [payInfo] SET [pname] = @pname, [pcontent] = @pcontent WHERE [pid] = @pid">
                <DeleteParameters>
                    <asp:Parameter Name="pid" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pname" Type="String" />
                    <asp:Parameter Name="pcontent" Type="String" />
                    <asp:Parameter Name="pid" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="pname" Type="String" />
                    <asp:Parameter Name="pcontent" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" DataKeyNames="pid" DataSourceID="SqlDataSource1"
                ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="pid" HeaderText="编号" InsertVisible="False"
                        ReadOnly="True" SortExpression="pid" />
                    <asp:BoundField DataField="pname" HeaderText="支付方式名称" SortExpression="pname" />
                    <asp:BoundField DataField="pcontent" HeaderText="支付方式说明"
                        SortExpression="pcontent" />
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
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="pid"
                DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <EditItemTemplate>
                    pid:
            <asp:Label ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' />
                    <br />
                    pname:
            <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
                    <br />
                    pcontent:
            <asp:TextBox ID="pcontentTextBox" runat="server"
                Text='<%# Bind("pcontent") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                        CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server"
                        CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    支付方式名称:
            <asp:TextBox ID="pnameTextBox" runat="server" Text='<%# Bind("pname") %>' />
                    <br />
                    支付方式内容:
            <asp:TextBox ID="pcontentTextBox" runat="server" Text='<%# Bind("pcontent") %>'
                TextMode="MultiLine" />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                        CommandName="Insert" Text="插入" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"
                        CausesValidation="False" CommandName="Cancel" Text="取消" />
                </InsertItemTemplate>
                <ItemTemplate>
                    pid:
            <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
                    <br />
                    pname:
            <asp:Label ID="pnameLabel" runat="server" Text='<%# Bind("pname") %>' />
                    <br />
                    pcontent:
            <asp:Label ID="pcontentLabel" runat="server" Text='<%# Bind("pcontent") %>' />
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
