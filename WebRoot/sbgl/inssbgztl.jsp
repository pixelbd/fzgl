<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加设备故障信息(详细)</title>
    
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
  <%      String maxId = null;
          int ID = 0;
          
          java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
          java.util.Date today=new java.util.Date();
          String rq = formatter.format(today); 
  
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String sb=request.getParameter("sb");
          String syr=request.getParameter("syr");
          String tingj=request.getParameter("tingj");
          String xiuf=request.getParameter("xiuf");
          String gz=request.getParameter("gz");
          String cj=request.getParameter("cj");
          String sql = "Select max(id)  From sbwx";
          
		  rs = Smts.executeQuery(sql);
          if (rs.next())
			maxId = rs.getString(1);
		  if (maxId == null)
			maxId =  rq.replace("-", "") + "001";
          else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		    }
          
          if (xiuf.equals("")) sql="Insert into sbwx (id,syr,code,tingj,gz,cj) values ('"+maxId+"','"+syr+"','"+sb+"','"+tingj+"','"+gz+"','"+cj+"')";
          else sql="Insert into sbwx (id,xiuf,syr,code,tingj,gz,cj) values ('"+maxId+"','"+xiuf+"','"+syr+"','"+sb+"','"+tingj+"','"+gz+"','"+cj+"')";
          
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0) { %>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("inssbgz.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.close();
              </script>
           <%   response.sendRedirect("inssbgz.jsp"); %>
           <%} %>
  </body>
</html>
