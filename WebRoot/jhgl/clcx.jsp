<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'clcx.jsp' starting page</title>
    
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
   String chehao ="";
   if (request.getParameter("Vch")!=null) chehao = new String(request.getParameter("Vch").getBytes("iso-8859-1"),"gb2312");
  %>
   <form name="form2" method="post" action="jhgl/scrw.jsp">
   <table width="95%" height="60" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#6894D5">
        <tr>
   <td align="center" >请输入要查询车辆的车号：

            <input name="Vch" type="text" size="16" value="<%=chehao%>">
            <input type="submit" name="Submit" value="  查  询  " >
    </td>
    </tr>
    </table>
    </form>

   <% 
   String driverclass="oracle.jdbc.driver.Oracledriver";
   String url="jdbc:oracle:thin:@196.1.1.181:hmis2";
   String username="hmisdx";
   String password="hmisdx";
   
   Class.forName(driverclass);
   Connection conn=DriverManager.getConnection(url,username,password);
   Statement stmt=conn.createStatement();
   ResultSet rss=stmt.executeQuery("select * fom t_dxlz");
   %>
   <table width="30%" bordercolor="#00cc66" border=1>
   <tr align="center" bgcolor="#ff6633">
   <td></td>
   <td></td>
   <tr>
   <% 
    while(rss.next())
    {
       out.println("<tr align='center' bgcolor='#ffcc99'>");
       for(int k=1;k<3;k++)
       {
        out.println("<td>"+rss.getObject(k)+"</td>");
       }
    }
    %> 
    </tr>

    </table>
    <%
     rss.close();
     stmt.close();
     conn.close();
    %>
  </body>
</html>
