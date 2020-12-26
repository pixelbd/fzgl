<%@ page language="java" import="java.sql.*,java.util.*,com.jb.*" pageEncoding="Gb2312"%>

<jsp:useBean id="msgvo" class="com.jb.Messagevo" scope="page">
<jsp:setProperty name="msgvo" property="*"/>
</jsp:useBean>
<jsp:useBean id="msgbean" class="com.jb.Messagebean" scope="page"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'register.jsp' starting page</title>
   

  </head>
  
  <body>
<%
	try
	{
	   msgbean.setMessage(msgvo);
	   msgbean.addMessage(); 
	   out.println("ok");
	}
	catch (Exception e)
	{
	   e.printStackTrace();
	}   
%>

	
  </body>
</html>
