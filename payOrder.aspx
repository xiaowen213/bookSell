<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payOrder.aspx.cs" Inherits="payOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>提交订单</title>
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
            <h1>
                <image src="Image/sdnuIco.jpg" height="65" width="65"></image>
                山东师范大学图书交易中心</h1>

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" AutoGenerateColumns="False">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="Isbn" HeaderText="ISBN" />
                    <asp:BoundField DataField="Count" HeaderText="购买量" />
                    <asp:BoundField DataField="Bname" HeaderText="书名" />
                    <asp:BoundField DataField="Bprice" HeaderText="单价" />
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

            <asp:Label ID="labSumPrice" runat="server"></asp:Label>

            <br />

            <table border="0" style="height: 212px; width: 323px">
                <tr>
                    <td align="right">收货地址：</td>
                    <td>
                        <asp:TextBox ID="txtPostAdress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtPostAdress" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">收货人手机号：</td>
                    <td>
                        <asp:TextBox ID="txtPostNumber" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtPostNumber" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">收货人：</td>
                    <td>
                        <asp:TextBox ID="txtOrderMember" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtOrderMember" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">支付方式：</td>
                    <td>
                        <asp:DropDownList ID="ddlPid" runat="server"
                            DataSourceID="SqlDataSource1" DataTextField="pName" DataValueField="pId">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [pId], [pName] FROM [payInfo]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="ddlPid" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">查询密码：</td>
                    <td>
                        <asp:TextBox ID="txtFindPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="txtFindPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="btnSaveOrder" runat="server" Text="保存订单"
                            OnClick="btnSaveOrder_Click" />
                    </td>
                </tr>
            </table>

        </div>
        <p>&nbsp;</p>
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
