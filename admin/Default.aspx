<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理界面</title>
    <style type="text/css">
        .footer {
            position: absolute;
            bottom: 0px;
        }
    </style>
</head>
    
<frameset col="20%,80%" frameborder="no" border="0" framesapcing="0">
    <frame src="menu.aspx" name="leftFrame" id="leftFrame" scrolling="no" noresize="noresize" />
    <frame src="adminBookInfo.aspx" name="mainFrame" id="mainFrame" />
</frameset>
<noframes>
    <body>浏览器不支持框架页面</body>
</noframes>
</html>
