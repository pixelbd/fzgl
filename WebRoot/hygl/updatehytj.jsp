<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>modify record</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
          Statement Smts; 
         
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          String id=request.getParameter("ID1");
          String tabname=request.getParameter("ID2");
          String rq=request.getParameter("rq");
          String zcr=request.getParameter("zcr");
          String cjr=request.getParameter("cjr"); 
          String nr=request.getParameter("nr");
          String rt=request.getParameter("rt"); 
          String dd="";
          String sql="";
          
          if ((tabname.equals("dqth"))||(tabname.equals("dsch")))  
	  	  {  dd=request.getParameter("dd");  
             sql = "Update "+ tabname+" Set rq='"+rq+"'"+ ",zcr='"+zcr+"'"+ ",cjr='"+cjr+"'"+ ",rt='"+rt+"'"+ ",dd='"+dd+"'"+ ",nr='"+nr+"' where id='"+id+"'";	  	  
	  	  }
	  	  else
	  	  {  sql = "Update "+ tabname+" Set rq='"+rq+"'"+ ",zcr='"+zcr+"'"+ ",cjr='"+cjr+"'"+ ",rt='"+rt+"'"+ ",nr='"+nr+"' where id='"+id+"'";	  	  
	  	  }
 
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
          <%} %>
  </body>
</html>