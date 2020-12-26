<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>车间内部管理</title>
    
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
    
   <table width="100%" border="0" cellpadding="-2" cellspacing="1">
   <tr>
        <td width="16%" align="center" valign="top">
   		<div>
   			<table width="100%" cellpadding=3 cellspacing=1 class=tableborder1 bgcolor="#0080c0">
   			<tr >
   			<td class="word_white" align="center" width="100%" height="30"   bgcolor="#6595D6">==&nbsp;车间管理功能&nbsp;==</tr>
   			<tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img1.style.display=''" onMouseOut="this.style.background='#e4e8ef';img1.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img1" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1">车间人事管理</a></td></tr>
   			<tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img7.style.display=''" onMouseOut="this.style.background='#e4e8ef';img7.style.display='none'">
            <td align="center" height="30" >
            <img id="img7" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2">干部专职考评</a></td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img4.style.display=''" onMouseOut="this.style.background='#e4e8ef';img4.style.display='none'">
            <td align="center" height="30">
            <img id="img4" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=3">班组工长考评</a> </td></tr>
<!--             
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img5.style.display=''" onMouseOut="this.style.background='#e4e8ef';img5.style.display='none'">
            <td align="center" height="30" >
            <img id="img5" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=4">质检员考评&nbsp;</a> </td></tr>
-->
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img6.style.display=''" onMouseOut="this.style.background='#e4e8ef';img6.style.display='none'">
            <td align="center" height="30" >
            <img id="img6" style="display:none;" width="4" height="6" src="Images/arrow2.gif" ><a href="cjgl/cjgl.jsp?page=2&subpg=5">&nbsp;职工质检员考评&nbsp;</a> </td></tr>
            <tr >
   			<td class="word_white" align="center" width="100%" height="30"   bgcolor="#6595D6">==&nbsp;其它查询功能&nbsp;==</tr>
   			<tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img10.style.display=''" onMouseOut="this.style.background='#e4e8ef';img10.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img10" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=6">查询段对车间考评情况</a></td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img11.style.display=''" onMouseOut="this.style.background='#e4e8ef';img11.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img11" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=7">车间管理考评标准查询</a></td></tr>
      
   			</table>
   		</div>
   		</td>
   		<!-- 车间管理主显示区 -->
   		<td width="85%" valign="top">
   		<div>
   			<table width="100%"    border="0" cellpadding="-2" cellspacing="-2">
   			 <tr height="300"><td valign="top" bgcolor="#ffffff">
   			 <%if (request.getParameter("subpg") != null)  
   			 {	
   			   if (request.getParameter("subpg").equals("1")) {%> <jsp:include flush="true" page="rsgl.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("2")) {%> <jsp:include flush="true" page="gbkp.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("3")) {%> <jsp:include flush="true" page="bzgl.jsp"></jsp:include> <%}
   			
   			   if (request.getParameter("subpg").equals("5")) {%> <jsp:include flush="true" page="zgkp.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("6")) {%> <jsp:include flush="true" page="ddcjkp.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("7")) {%> <jsp:include flush="true" page="kpbzcx.jsp"></jsp:include> <%}
   			}%>
   			  </td></tr>
   			</table>
   		</div>
   		 
   		</td>
   </tr>
   </table>
  </body>
</html>
