<%@ page language="java" import="java.util.*,com.jb.*,java.sql.*" pageEncoding="GB2312"%>
<jsp:useBean id="msgbean" class="com.jb.Messagebean" scope="page"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>show ly</title>
    
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
<p align="center">所有留言</p>
<hr>
<%
  int msg_count=0;
  Collection messages=msgbean.getMessage();
  Iterator it=messages.iterator();
  while(it.hasNext())
  {
    Messagevo message=(Messagevo)it.next();
 %>
    <table width="100%" align="center" border=1 brcolor=99ccff cellspacing="0" cellpadding="0"
           bordercolordark="#000000" bordercolorlignt="#cccc99">
    <tr><td bgcolor="#cccc99"><font size=2>主题:</font></td>
    <td colspan=3><%=message.getTitle()%></td></tr>
    <tr><td bgcolor="#cccc99"><font size=2>留言人:</font></td>
    <td><%=message.getName()%></td>
    <td bgcolor="#cccc99"><font size=2>留言时间:</font></td><td colspan=3>
    <%out.println("<font size=2>"+message.getDate().toLocaleString()+"</font>");
    %>
    </td></tr>
    <tr><td align="center">
    <% out.println("("+msg_count+")");
    %>
    </td>
    <td colspan=3><%=message.getContent()%>
    </td></tr>
    </table>
    <%out.println("<hr>");
    msg_count++;
 }
    %>
 <p align="center"><a href="ly.jsp">我要留言...</a></p>
 
  </body>
</html>

