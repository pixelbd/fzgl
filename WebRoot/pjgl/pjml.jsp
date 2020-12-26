<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pjml.jsp' starting page</title>
    
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
  .whitecolor{
  color:"#ffffff";
  }
  .orange{
	font-size: 9pt;	color: #FFC000;
}
  -->
   </style>
  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet>
 
  <body>
  <%String pjmlpage = "1"; 
     if (request.getParameter("subpage")!=null) pjmlpage=new String(request.getParameter("subpage")); %>
  <table width="871"  bgcolor="#ffffff" class="tableBorder_LR" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td>
 
   <table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="Images/pjtitle0.gif" width="777" height="40"></td>
        </tr>
        <tr>
          <td height="47"  align="center" background="Images/menubg.gif" class="orange">
               主&nbsp;要&nbsp;配&nbsp;件&nbsp;生&nbsp;产&nbsp;厂&nbsp;家&nbsp;目&nbsp;录</td>
        </tr>
   </table>
  
</td>
</tr>
<tr>
  <td>
  <div>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr  valign="top">
    <td width="44" valign="top" rowspan="200"><img src="Images/left.gif" width="44" ></td>
    <td valign="top" width="698" class="shadow" align="center">
    <div>
     <a href="pjgl/pjgl.jsp?page=4&subpage=1" >&nbsp;基础制动装置&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4&subpage=2" >&nbsp;转向架&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4&subpage=3" >&nbsp;钩缓装置&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4&subpage=4" >&nbsp;空气制动配件&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4&subpage=5" >&nbsp;轮对及轴承&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4&subpage=6" >&nbsp;其他车辆配件&nbsp;</a>
    </div>
    
    </td> 
    <td valign="top" width="35"  rowspan="200"> <img src="Images/right.gif" width="35" ></td>
  </tr>
  <tr  valign="top">
      <td  align="center" width="698" >
      <% if (pjmlpage.equals("1")) { %> <jsp:include flush="true" page="../pjml/jczd.html"></jsp:include> <% } %>
      <% if (pjmlpage.equals("2")) { %> <jsp:include flush="true" page=""></jsp:include> <% } %>
      <% if (pjmlpage.equals("3")) { %> <jsp:include flush="true" page=""></jsp:include> <% } %>
      <% if (pjmlpage.equals("4")) { %> <jsp:include flush="true" page=""></jsp:include> <% } %>
      </td>
  </tr>
</table></div>
 </td></tr>
</table>
  </body>
</html>
