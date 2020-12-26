<%@ page language="java" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editwtktj.jsp' starting page</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wtk","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          request.setCharacterEncoding("gb2312");
          
          if ((request.getParameter("tabname") != null)&&(request.getParameter("id") != null))
          {
          String id = request.getParameter("id");
          String tabname = request.getParameter("tabname"); 
          
          
          String tcrq=request.getParameter("tcrq");
          String jjrq=request.getParameter("jjrq");
          String wt=request.getParameter("wt");
          String fzr=request.getParameter("fzr");
          String cs=request.getParameter("cs");
          String wtlb=request.getParameter("wtlb"); 
          String bz=request.getParameter("bz");
          
          String  sql = "Update "+ tabname+" Set tcrq='"+tcrq+"',fzr='"+fzr+"',wt='"+wt+"',cs='"+cs+"',wtlb='"+wtlb+"',jjrq='"+jjrq+"',bz='"+bz+"' where num='"+id+"'";	  	  
	  	  
          
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
          <%}else{%>
              <script language="javascript">
              alert("记录修改成功！");
              window.close();
              </script>
          <%} }%>
  </body>
</html>
