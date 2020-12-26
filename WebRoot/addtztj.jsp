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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String tabname="tongzhi";
          
          String rq=request.getParameter("rq");
          String yxrq=request.getParameter("yxrq");
          String fbr=request.getParameter("fbr");
          String fbbm=request.getParameter("fbbm");
          String pzr=request.getParameter("pzr");
          String bt=request.getParameter("bt"); 
          String nr=request.getParameter("nr");
          String bumen[]=request.getParameterValues("bm");
          String bm="";
          
          int i=0;
          
          for(i=0;i<bumen.length;i++)
          {
           if(bumen[i]!= null)
            bm=bm+bumen[i];
          }
          %><%=bm %><br><%=rq %><br><%=yxrq%><br><%=fbr %><br><%=pzr %><br><%
          String sql = "Select max(id) as num From "+ tabname+" where rq='"+rq+"'";
          %><br><%=sql%><br><%
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		  
		 
		 if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = rq.replace("-", "") + "001";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		     }
		  sql = "Insert into  "+ tabname+" (id,rq,yxrq,fbbm,fbr,jsbm,bt,nr,pzr) values ('"+maxId+"','"+rq+"','"+yxrq+"','"+fbbm+"','"+fbr+"','"+bm+"','"+bt+"','"+nr+"','"+pzr+"')";  	  
		  
	  	  %><br><%=sql%><br><%

          int rtn=Smts.executeUpdate(sql);
          
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
           <%}else{%>
              <script language="javascript">
              alert("记录保存成功！");
              window.close();
              window.opener.location.reload();
             </script>
                   
          <%}
           
          }
                   catch (SQLException e)
            		{    
            		     out.println("");
            		}
            		finally
            		{
            		     Con.close();
            		}
     } %>

  </body>
</html>
