<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'inscpbztl.jsp' starting page</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
          
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String tabname="cjkpbz";
          
          String bz=request.getParameter("bz");
          String kf1=request.getParameter("kf1");
          String kf2=request.getParameter("kf2");
          String kf3=request.getParameter("kf3");
          String kf4=request.getParameter("kf4");
          String jf1=request.getParameter("jf1");
          String jf2=request.getParameter("jf2");
          String fl=request.getParameter("fl");
          String gyx=request.getParameter("gyx");
          String ldkh=request.getParameter("ldkh");
          
          String sql = "Select max(code)  From "+ tabname;
		  rs = Smts.executeQuery(sql);
          if (rs.next())
			maxId = rs.getString(1);
		  if (maxId == null)
			maxId = "KP-" + "00001";
          else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		    }
          
          sql="Insert into "+tabname+" (code,bz,fl,kf1,kf2,kf3,kf4,jf1,jf2,gyx,ldkh) values('"+maxId+"','"+bz+"','"+fl+"','"+kf1+"','"+kf2+"','"+kf3+"','"+kf4+"','"+jf1+"','"+jf2+"','"+gyx+"','"+ldkh+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("inscjkpbz.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
              </script>
           <%   response.sendRedirect("inscjkpbz.jsp"); %>
           <%} %>

  </body>
</html>
