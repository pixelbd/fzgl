<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inssbxxtj.jsp' starting page</title>
    
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
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String made=request.getParameter("made");
          String xh=request.getParameter("xh");
          String mc=request.getParameter("mc");
          String fl=request.getParameter("fl"); 
          String cj=request.getParameter("cj");
          String bz=request.getParameter("bz");
          String code=request.getParameter("code");
          String work=request.getParameter("work");
          
          String sql="Insert into sbxx (code,mc,xh,fl,cj,bz,made,work) values ('"+code+"','"+mc+"','"+xh+"','"+fl+"','"+cj+"','"+bz+"','"+made+"','"+work+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("inssbxx.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.close();
              </script>
           <%   response.sendRedirect("inssbxx.jsp"); %>
           <%} %>
  </body>
</html>
