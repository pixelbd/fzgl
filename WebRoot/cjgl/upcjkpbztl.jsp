<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upgzbztl.jsp' starting page</title>
    
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
<%        request.setCharacterEncoding("gb2312");
          
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          String tabname="cjkpbz";
          
          String bz=request.getParameter("bz");
          String kf1=request.getParameter("kf1");
          String kf2=request.getParameter("kf2");
          String kf3=request.getParameter("kf3");
          String kf4=request.getParameter("kf4");
          String jf1=request.getParameter("jf1");
          String jf2=request.getParameter("jf2");
          String code=request.getParameter("code");
          String gyx=request.getParameter("gyx");
          String ldkh=request.getParameter("ldkh");
          String fl=request.getParameter("fl");
          
          String sql = "Update "+ tabname+" Set  bz='"+bz+"',kf1='"+kf1+"',kf2='"+kf2+"',kf3='"+kf3+"',kf4='"+kf4+"',fl='"+fl+ "',jf1='"+jf1+"',jf2='"+jf2+"',gyx='"+gyx+"',ldkh='"+ldkh+"' where code='"+code+"'";	
          
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
              window.close(); 
              </script>
           <%} %>
  </body>
</html>
