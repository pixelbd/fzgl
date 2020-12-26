<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
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

          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
         
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String oper=request.getParameter("oper");
          String tabname="pjinfo";
          
                         
          String pjbh=request.getParameter("pjbh");
          String pjname=request.getParameter("pjname");
          String gg=request.getParameter("gg");
          String dw=request.getParameter("dw"); 
          String dj=request.getParameter("dj");
          String low=request.getParameter("low");
          String high=request.getParameter("high");
            
          String sql="";
          
          if  (oper.equals("2")) { sql="Insert into "+tabname+" (id,pjname,gg,dw,dj,low,high) values('"+pjbh+"','"+pjname+"','"+gg+"','"+dw+"','"+dj+"','"+low+"','"+high+"')";}
          if  (oper.equals("1")) { sql="Update "+ tabname+" SET pjname='"+pjname+"'"+ ",gg='"+gg+"'"+ ",dw='"+dw+"'"+ ",dj='"+dj+"'"+ ",low='"+low+"'"+ ",high='"+high+"'"+" where id='"+pjbh+"'";}

          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
          <jsp:forward page="pjgl.jsp?page=1&kc=3&oper=<%=oper%>"></jsp:forward> 
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
               //刷新父窗口中的网页
              window.opener.location.reload();  //刷新父窗口中的网页
              </script>
           <jsp:forward page="pjgl.jsp?page=1&kc=3&oper=<%=oper%>"></jsp:forward>   
           <%} %>
  </body>
</html>
