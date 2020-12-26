<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
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
          String maxId = null;
	      int ID = 0;
	      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String chej1=request.getParameter("cj");
          String tabname="";
          if (chej1.equals("41")) { tabname="ysgzzz"; } 
             else { if (chej1.equals("42")) { tabname="ysgzys"; }  
                    else { if (chej1.equals("43")) { tabname="ysgzly"; }
                           else { if (chej1.equals("44")) { tabname="ysgzzl"; } }}
                  }
                  
          String rq=request.getParameter("rq");
          String cx=request.getParameter("cx");
          String ch=request.getParameter("ch");
          String zrbz=request.getParameter("bzcode"); 
          String zrr=request.getParameter("zrr");
          String ysy=request.getParameter("ysy");
          String flms=request.getParameter("flms");
          String gzms=request.getParameter("gzms");
          
          String sql = "Select max(id) as num From "+ tabname+" where rq='"+rq+"'";
          
		  ResultSet rs = Smts.executeQuery(sql);
		if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = "YS"+ rq.replace("-", "") + "0001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
		
        
          sql="Insert into "+tabname+" (id,rq,cx,ch,ysy,zrbz,zrr,gzms,gzcode) values ('"+maxId+"','"+rq+"','"+cx+"','"+ch+"','"+ysy+"','"+zrbz+"','"+zrr+"','"+gzms+"','"+flms+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("insysgz.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.close();
              </script>
           <%   response.sendRedirect("insysgz.jsp"); %>
           <%} %>
  </body>
</html>
