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
draw.setPictureTitle("���������ͳ��");
//draw.setPictureWidth(300);
//draw.setPictureHeight(200);
//draw.setPictureWidth(460);
//draw.setPictureHeight(320);
draw.setPictureWidth(300);
draw.setPictureHeight(200);
String[] xTitle = {"δ����豸����", "δ�����������", "δ�����ȫ����", "δ�����������", "�ѽ������"};
draw.setTitle(xTitle);
double[] data = {10,30,30,0,100};
draw.setData(data);
draw.draw(response);
%>
</body>
</html>
