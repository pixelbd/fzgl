<%@ page language="java" import="java.util.*" import="java.sql.*"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户身份识别</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%
String username=new String(request.getParameter("usrname").getBytes("iso-8859-1"));
String ps=request.getParameter("psword");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection con=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/user","root","123");
Statement stmt=con.createStatement();
String iscorrect="select * from guest where name='"+username+"' and psw='"+ps+"'";
ResultSet rst=stmt.executeQuery(iscorrect);
session.setAttribute("islog",new String("0"));
if (!rst.next())
{
response.sendRedirect("index.jsp");//账号或密码错误，转入错误页面
rst.close();
stmt.close();
con.close();
}
//如果查询后记录，说明登录验证成功
else
{
//保存登录信息到session对象中
    String zw="";
	String usrid=new String(rst.getString("id"));
	String realname=new String(rst.getString("truename"));
	String deptment=new String(rst.getString("dept"));
	if (rst.getString("cjzw")!=null) {
	 zw=new String(rst.getString("cjzw"));} else {};
	session.setAttribute("islog",new String("1"));
	session.setAttribute("userid",usrid);
	session.setAttribute("usertrue",realname);
	session.setAttribute("deptment",deptment);
	if (zw!=null) { session.setAttribute("zw",zw); } else {};
	stmt.close();
    con.close();
    response.sendRedirect("index.jsp");
   }
%>
  </body>
</html>
