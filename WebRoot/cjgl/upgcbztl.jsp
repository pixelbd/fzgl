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
          String maxId = null;
          int ID = 0;
          
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet rs;
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          String tabname="gczlbz";
          String str="GC";
          String sql="";
          
          String bz=request.getParameter("bz");
          String kf=request.getParameter("kf");
          String code=request.getParameter("code");
          String jf=request.getParameter("jf");
          String fl=request.getParameter("fl");
          String oldfl=request.getParameter("oldfl");
          
          if (oldfl.equals(fl)) { sql = "Update "+ tabname+" Set  bz='"+bz+"'"+ ",kf='"+kf+ "',jf='"+jf+"' where code='"+code+"'";	
          }
          else { 
          sql = "Select max(code)  From "+ tabname+" where fl='"+fl+"'";
		  rs = Smts.executeQuery(sql);
          if (rs.next()) maxId = rs.getString(1); else {};
		  if (maxId == null)
			maxId = str+"-" + "00001";
          else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		    }
          
          sql = "Update "+ tabname+" Set code='"+maxId+"'"+ ",bz='"+bz+"'"+ ",fl='"+fl+ "',kf='"+kf+ "',jf='"+jf+"' where code='"+code+"'";	
          
          }
          
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
