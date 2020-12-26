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
          String maxId = null;
	      int ID = 0;
	      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String chej=request.getParameter("cj");
          String tabname="";
          if (chej.equals("zz")) { tabname="ysppjzz"; } 
             else { if (chej.equals("ys")) { tabname="ysppjys"; }  
                    else { if (chej.equals("ly")) { tabname="ysppjly"; } }
                  }
                  
          String rq=request.getParameter("rq");
          String pjmc=request.getParameter("pjmc");
          String xinghao=request.getParameter("xinghao");
          String zzcdh=request.getParameter("zzcdh");
          String zzsj=request.getParameter("zzsj");
          String shuliang=request.getParameter("shuliang");
          String beizhu=request.getParameter("beizhu");
          String bw=request.getParameter("bw"); 
          String sql = "Select max(num) as num From "+ tabname+" where rq='"+rq+"'";
		  ResultSet rs = Smts.executeQuery(sql);
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
		
        
          sql="Insert into "+tabname+" (num,rq,pjmc,xinghao,zzcdh,zzsj,shuliang,beizhu,bw) values('"+maxId+"','"+rq+"','"+pjmc+"','"+xinghao+"','"+zzcdh+"','"+zzsj+"','"+shuliang+"','"+beizhu+"','"+bw+"')";
          int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%   response.sendRedirect("insertysppj.jsp"); %>
          <%} else {%>
              <script language="javascript">
              alert("记录保存成功！");
              window.opener.location.reload();  //刷新父窗口中的网页
             </script>
           <%   response.sendRedirect("insertysppj.jsp"); } %>
  </body>
</html>
