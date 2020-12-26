<%@ page contentType="text/html; charset=GBK" %>
<jsp:useBean id="draw" class="mrgf.DrawPicture" scope="page"/>
<html>
<head>
<title>
drawPicture
</title>
</head>
<body >
<%
draw.setPictureTitle("问题库问题统计");
//draw.setPictureWidth(300);
//draw.setPictureHeight(200);
//draw.setPictureWidth(460);
//draw.setPictureHeight(320);
draw.setPictureWidth(300);
draw.setPictureHeight(200);
String[] xTitle = {"未解决设备问题", "未解决工艺问题", "未解决安全问题", "未解决其他问题", "已解决问题"};
draw.setTitle(xTitle);
double[] data = {10,30,30,0,100};
draw.setData(data);
draw.draw(response);
%>
</body>
</html>
