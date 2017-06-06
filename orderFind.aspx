<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orderFind.aspx.cs" Inherits="orderFind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查询订单</title>
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
            订单号：<asp:TextBox ID="txtOrderId" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; 查询密码：<asp:TextBox ID="txtFindPassword" runat="server"
                TextMode="Password"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="查询" />
            <br />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px"
                Style="margin-top: 0px" Width="407px">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="postAdress" HeaderText="收货地址" />
                    <asp:BoundField DataField="postNumber" HeaderText="国内邮政编码" />
                    <asp:BoundField DataField="orderMember" HeaderText="收货人" />
                    <asp:BoundField DataField="pname" HeaderText="支付方式" />
                    <asp:BoundField DataField="orderPrice" HeaderText="订单总额" />
                    <asp:CheckBoxField DataField="isPay" HeaderText="是否支付" InsertVisible="False"
                        ReadOnly="True" />
                    <asp:CheckBoxField DataField="isPost" HeaderText="是否发货" ReadOnly="True" />
                </Fields>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" />
                    <asp:BoundField DataField="bname" HeaderText="图书名称" />
                    <asp:BoundField DataField="count" HeaderText="数量" />
                    <asp:BoundField DataField="price" HeaderText="单价" />
                    <asp:BoundField DataField="sumPrice" HeaderText="总价" />
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
