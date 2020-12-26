<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% int CountR = 0;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'temp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script>
function change()
{
form1.submit();}
</script>
  <body>
  
 <% 
    String sql="";
    request.setCharacterEncoding("gb2312"); 
    if (request.getParameter("sql")!=null) sql=new String(request.getParameter("sql"));
    sql="select * from cpzlbz where fl='"+sql+"'"; 
    String sqlfl="select distinct fl from cpzlbz order by fl";
    %>
    <%= sql%>
    <form ACTION="gzgl/temp.jsp" name=form1 METHOD="POST">
    <select name="sql" class="Sytle_select" onchange="change()">
    <option value=""><font color="#ff0000">请选择故障所属部位&nbsp;</font></option>
    <%
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/kpbz","root","123");  
       Statement Smts; 
       ResultSet Rs;
       if (Con!= null)
       {
           try
           {
           Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           Rs = Smts.executeQuery(sqlfl);
           Rs.last();
           int i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
               <option value="<%=Rs.getString("fl") %>"><%=Rs.getString("fl")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;</form>
    <%if (request.getParameter("sql")!=null) { %><%=request.getParameter("sql")%><%} %>
    <form>
    <select ACTION="gzgl/temp.jsp" name=form1 METHOD="POST">
    <%      Rs = Smts.executeQuery(sql);
            Rs.last();
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %>
        <option size="10" value="<%=Rs.getString("bz") %>" >[<%=Rs.getString("xz")%>][-<%=Rs.getString("kf")%>]<%=Rs.getString("bz") %></option>
     <% 
				Rs.next();
				i++;
				} 
			}
		}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {  }
        }%>  
   </select>&nbsp;&nbsp;&nbsp;&nbsp;
   </form>
  </body>
</html>
