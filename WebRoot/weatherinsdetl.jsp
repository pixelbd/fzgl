<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>insert  record</title>
    
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
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/fzgl","root","123"); 
          Statement Smts; 
        
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          String sql="";
          int    i=0;
          int    rtn=0;
                  
          String rq=request.getParameter("rq");
          String zz1=request.getParameter("zzlow");
          String zz2=request.getParameter("zzhigh");
          String zz3=request.getParameter("weatherzz1");
          String zz4=request.getParameter("weatherzz2");
          String ly1=request.getParameter("lylow");
          String ly2=request.getParameter("lyhigh");
          String ly3=request.getParameter("weatherly1");
          String ly4=request.getParameter("weatherly2");
          String ys1=request.getParameter("yslow");
          String ys2=request.getParameter("yshigh");
          String ys3=request.getParameter("weatherys1");
          String ys4=request.getParameter("weatherys2");
          String xx1=request.getParameter("xxlow");
          String xx2=request.getParameter("xxhigh");
          String xx3=request.getParameter("weatherxx1");
          String xx4=request.getParameter("weatherxx2");
      
          for(i=1;i<=4;i++)
          {
          if (i==1) {  
          sql="Insert into weatherzz (rq,lowtemp,hightemp,weather1,weather2) values ('"+rq+"','"+zz1+"','"+zz2+"','"+zz3+"','"+zz4+"')"; 
          rtn=Smts.executeUpdate(sql);
          if (rtn==0) { break;}
          }
          if (i==2) {  
          sql="Insert into weatherly (rq,lowtemp,hightemp,weather1,weather2) values ('"+rq+"','"+ly1+"','"+ly2+"','"+ly3+"','"+ly4+"')"; 
          rtn=Smts.executeUpdate(sql);
          if (rtn==0) {  break;}
          }
          if (i==3) {  
          sql="Insert into weatherys (rq,lowtemp,hightemp,weather1,weather2) values ('"+rq+"','"+ys1+"','"+ys2+"','"+ys3+"','"+ys4+"')"; 
          rtn=Smts.executeUpdate(sql);
          if (rtn==0) {  break;}
          }
          if (i==4) {  
          sql="Insert into weatherxx (rq,lowtemp,hightemp,weather1,weather2) values ('"+rq+"','"+xx1+"','"+xx2+"','"+xx3+"','"+xx4+"')"; 
          rtn=Smts.executeUpdate(sql);
          if (rtn==0) {  break;}
          }
          }
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              window.close();
              </script>
              <%                  response.sendRedirect("weatherreport.jsp"); 
           } else { } %>
            
              <script language="javascript">
              alert("记录保存成功！");
               window.opener.location.reload();
              </script>
           <%   response.sendRedirect("weatherreport.jsp"); %>

  </body>
</html>
