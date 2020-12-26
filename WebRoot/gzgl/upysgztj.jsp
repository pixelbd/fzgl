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
          
	      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/gzgl","root","123"); 
          Statement Smts; 
         
  
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
          request.setCharacterEncoding("gb2312");
          
          String chej=request.getParameter("cj");
          String tabname="";
          if (chej.equals("zz")) { tabname="ysgzzz"; } 
             else { if (chej.equals("ys")) { tabname="ysgzys"; }  
                    else { if (chej.equals("ly")) { tabname="ysgzly"; } 
                           else { if (chej.equals("zl")) { tabname="zjgzzl"; }   
                                }
                         }
                  }
                  
          String id=request.getParameter("id");
          String rq=request.getParameter("rq");
          String cx=request.getParameter("cx");
          String ch=request.getParameter("ch");
          String zrbz=request.getParameter("zrbz"); 
          String zrr=request.getParameter("zrr");
          String ysy=request.getParameter("ysy");
          String bw=request.getParameter("bw");
          String lb=request.getParameter("lb");
          String gzms=request.getParameter("gzms");
          
          String sql = "Update "+ tabname+" SET rq='"+rq+"'"+ ",cx='"+cx+"'"+ ",ch='"+ch+"'"+ ",zrbz='"+zrbz+"'"+ ",zrr='"+zrr+"'"+ ",ysy='"+ysy+"'"+ ",bw='"+bw+"'"+",lb='"+lb+"'"+",gzms='"+gzms+"'"+" where id='"+id+"'";
		  int rtn=Smts.executeUpdate(sql);
          if(rtn==0){%>
              <script language="javascript">
              alert("记录保存失败");
              
              </script>
        
          <%}else{%>
              <script language="javascript">
              alert("记录修改成功！");
              //刷新父窗口中的网页
              window.close();
              </script>
            
           <%} %>
  </body>
</html>