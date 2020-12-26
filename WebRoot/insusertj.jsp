<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>insert record</title>
    
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
          String maxId = null;
	      int ID = 0;
	      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/user","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String tabname="guest";
                            
          String dept=request.getParameter("dept");
          String cjzw=request.getParameter("cjzw");
          String truename=request.getParameter("truename");
          String name=request.getParameter("name"); 
          String id=request.getParameter("id");
          String psw=request.getParameter("psw");
          
          String sql="Insert into "+tabname+" (dept,cjzw,truename,name,id,psw) values ('"+dept+"','"+cjzw+"','"+truename+"','"+name+"','"+id+"','"+psw+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("insertuser.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.close();
              </script>
           <%   response.sendRedirect("insertuser.jsp"); %>
           <%} %>
  </body>
</html>
