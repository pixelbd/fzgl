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
<% 

          
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 

  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String tabname="gzzlbz";
          
          
          String bz=request.getParameter("bz");
          String kf=request.getParameter("kf");
          String code=request.getParameter("code");
          String sql = "Update "+ tabname+" Set code='"+code+"'"+ ",bz='"+bz+"'"+ ",kf='"+kf+"' where code='"+code+"'";	
          
         
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("��¼����ʧ��");
              window.close();
              </script>

          <%}else{%>
              <script language="javascript">
              alert("��¼����ɹ���");
              window.opener.location.reload();  //ˢ�¸������е���ҳ
              window.close(); 
              </script>

           <%} %>


  </body>
</html>
