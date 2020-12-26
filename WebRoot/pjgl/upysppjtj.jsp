<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>update record</title>
    
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
          
          request.setCharacterEncoding("gb2312");  
                 
          if (Con != null)
          {
            	
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          if ((request.getParameter("ID1") != null)&&(request.getParameter("ID2") != null)) {
          String v1 = request.getParameter("ID1");
          String chej = request.getParameter("ID2"); 
                  
          String rq=request.getParameter("rq");
          String pjmc=request.getParameter("pjmc");
          String xinghao=request.getParameter("xinghao");
          String zzcdh=request.getParameter("zzcdh");
          String zzsj=request.getParameter("zzsj");
          String shuliang=request.getParameter("shuliang");
          String beizhu=request.getParameter("beizhu");
          String bw=request.getParameter("bw");
          
          String sql="";		
          sql= "Update sppj"+chej+" Set rq='"+rq+"'"+ ",pjmc='"+pjmc+"'"+ ",xinghao='"+xinghao+"'"+"'"+",zzcdh='"+zzcdh+"'"+",zzsj='"+zzsj+"'"+",shuliang='"+shuliang+"'"+ ",beizhu='"+beizhu+"'"+",bw='"+bw+"' where num='"+v1+"'";	  	  
          
        
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录修改失败");
              window.close();
              </script>
             
          <%} else {%>
              <script language="javascript">
              alert("记录修改成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
             </script>
<% }}} %>
  </body>
</html>
