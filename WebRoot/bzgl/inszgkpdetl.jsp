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
          
          String chej=request.getParameter("cj");
          
          String tabname="";
          if (chej.equals("41")) { tabname="kpjlzz"; } 
             else { if (chej.equals("42")) { tabname="kpjlys"; }  
                    else { if (chej.equals("43")) { tabname="kpjlly"; }
                           else { if (chej.equals("44")) { tabname="kpjlzzl"; } 
                         }
                     }
                  }
                  
          String rq=request.getParameter("rq");
          String khr=request.getParameter("gzid");
          String bkhr=request.getParameter("zrr");
          String kpbz=request.getParameter("flms"); 
          String bz=request.getParameter("bzcode");
          String ms=request.getParameter("ms");
          String money=request.getParameter("money");
          
          String sql = "Select max(id) as num From "+ tabname+" where rq='"+rq+"'";
          
		  ResultSet rs = Smts.executeQuery(sql);
		if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = "KP"+ rq.replace("-", "") + "0001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
		
        
          sql="Insert into "+tabname+" (id,rq,khr,bkhr,bz,kpbz,ms,money) values ('"+maxId+"','"+rq+"','"+khr+"','"+bkhr+"','"+bz+"','"+kpbz+"','"+ms+"','"+money+"')";
          
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("inszgkp.jsp"); %>
          <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.close();
              </script>
           <%   response.sendRedirect("inszgkp.jsp"); %>
           <%} %>
  </body>
</html>
