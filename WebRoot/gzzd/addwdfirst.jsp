<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addwdfrist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <% request.setCharacterEncoding("gb2312"); %>
  <body>
<% 
          String maxId = null;
	      int ID = 0;
	      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wjdb","root","123"); 
          Statement Smts; 
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
          
          String tabname="";
         
          if ((request.getParameter("wdlb") != null)) 
          {
           if (request.getParameter("wdlb").equals("1")) tabname="jswd";
           if (request.getParameter("wdlb").equals("2")) tabname="aqwd";
           if (request.getParameter("wdlb").equals("3")) tabname="qtwd";
          }
          
          String rq=request.getParameter("rq");
          String bw=request.getParameter("bw");
          String tdb=request.getParameter("tdb");
          String tdbnian=request.getParameter("tdbnian");
          String tdbhao=request.getParameter("tdbhao");
          String tlj=request.getParameter("tlj");
          String tljnian=request.getParameter("tljnian");
          String tljhao=request.getParameter("tljhao");
          String bt=request.getParameter("bt"); 
          String zy=request.getParameter("zy");

      String sql = "Select max(id) as num From "+ tabname+" where rq='"+rq+"'";
          
      %><%=sql %>tabname<%=tabname%>\rq:<%=rq%><%
      if (Con!= null)
      {
          try
          {
		  ResultSet rs = Smts.executeQuery(sql);
		  
		  String wd="";
		  
		  if (tabname.equals("jswd"))
		  {  wd =  "JS"; 	}
          if (tabname.equals("aqwd"))
		  {  wd =  "AQ"; 	}
          if (tabname.equals("qtwd")) 
		  {  wd =  "QT"; 	}
          
		 
		 if (rs.next())
			maxId = rs.getString(1);
		if (maxId == null)
			maxId = wd+ rq.replace("-", "") + "01";
		else {
			maxId = maxId.trim();
			ID = Integer.parseInt(maxId.substring(maxId.length() - 5));
			maxId = maxId.substring(0, maxId.length() - 5)
			+ String.format("%05d", ID + 1);
		}
	
	   String savefile="";
	   
	   if (!tlj.equals("")){   savefile=tlj+tljnian+tljhao; }
	   else { if (!tdb.equals("")) { savefile=tdb+tdbnian+tdbhao; }
	        }
	          
	   sql = "Insert into  "+ tabname+" (id,rq,bw,tdb,tdbnian,tdbhao,tlj,tljnian,tljhao,bt,zy,filename) values ('"+maxId+"','"+rq+"','"+bw+"','"+tdb+"','"+tdbnian+"','"+tdbhao+"','"+tlj+"','"+tljnian+"','"+tljhao+"','"+bt+"','"+zy+"','"+savefile+"')";  	  
	  
       int rtn=Smts.executeUpdate(sql);
          
       if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              
       <%}else{ %>     
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
