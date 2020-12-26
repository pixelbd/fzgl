<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>µ‰–Õπ ’œÕº∆¨</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
  <!--     
   body {
	margin-left: 0px; 
	margin-top: 0px;
      }

     -->  
   </style>
  </head>
  
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body >

  <table align="center" width="100%" cellpadding="-2" cellspacing="-2"  >
  <% 
  String id="";
  String showpic="";
  int CountR=0;
  int i=0;
  
  if (request.getParameter("id") != null)  	id = new String(request.getParameter("id"));
  String sql="select * from dxgz where id='"+id+"'"; 
  
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123");
        
  Statement Smts; 
  ResultSet Rs;
  
  if (Con!= null)
  {
    try
    {
      Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
      Rs = Smts.executeQuery(sql);
            	
      Rs.last();
      CountR = Rs.getRow();
      Rs.first();
      if (CountR>0)
      {
  
  %>
  <tr>
     <td class="tb_LR" height="31" width="100%" align="center" background="Images/h.gif">
     <font color="#004080">==µ‰–Õπ ’œÕº∆¨==</font></td>
  </tr> 
  <%
  if (!Rs.getString("pic1").equals("")) {
   showpic="http://10.99.125.238:8080/fzgl/dxgzpic/"+Rs.getString("pic1");
  %>
  <tr><%=showpic %>
     <td bgcolor="#DFF4F7" class=tb_LR align="center" width="100%">
     <div><img class=pic   src=<%=showpic%> alt=<%=Rs.getString("gzms")%>/></div>
     <%if (!Rs.getString("tpjs1").equals("")) { %> 
     <div><font color="#259FEF">Õº∆¨1:[&nbsp;<%=Rs.getString("tpjs1")%>&nbsp;]</font></div>
     <% } %>
     </td>
  </tr>
  <% }
    if (!Rs.getString("pic2").equals("")) {
   showpic="http://10.99.125.238:8080/fzgl/dxgzpic/"+Rs.getString("pic2");
  %>
  <tr>
     <td bgcolor="#DFF4F7" class=tb_LR align="center" width="100%">
     <div><img class=pic   src=<%=showpic%> alt=<%=Rs.getString("gzms")%>/></div>
     <%if (!Rs.getString("tpjs2").equals("")) { %> 
     <div><font color="#259FEF">Õº∆¨2:[&nbsp;<%=Rs.getString("tpjs2")%>&nbsp;]</font></div>
     <% } %>
     </td>
  </tr>
  <% }
  
  }
      }
      catch (SQLException e)
           {
            	out.println("!");
           }
           finally
           {
            	Con.close();
           }
        
        }%>

  <tr><td align="center" width="100%" height="40" background="Images/bodybtm.gif"><input name="Button" type="button" class="btnblue" onClick="window.close();" value="  - πÿ ±’ ¥∞ ø⁄ - ">
  </td></tr>
  </table>
  
  
   
  </body>
</html>
