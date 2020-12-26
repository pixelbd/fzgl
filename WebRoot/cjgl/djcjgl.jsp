<%@ page language="java" import="" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'djcjgl.jsp' starting page</title>
    
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
   			<td class="word_white" align="center" width="100%" height="30"   bgcolor="#6595D6">==&nbsp;段级管理功能&nbsp;==</tr>
   			<tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img1.style.display=''" onMouseOut="this.style.background='#e4e8ef';img1.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img1" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=1&subpg=1">班组信息查询</a>&nbsp;</td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img2.style.display=''" onMouseOut="this.style.background='#e4e8ef';img2.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img2" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=1&subpg=2">职工信息查询</a>&nbsp;</td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img3.style.display=''" onMouseOut="this.style.background='#e4e8ef';img3.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img3" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=1&subpg=3">车间考核评比</a>&nbsp;</td></tr>
        </table>
   		</div>
   		</td>
   		<!-- 车间管理主显示区 -->
   		<td width="85%" valign="top">
   		<div>
   			<table width="100%" class="tableBorder_B"  border="0" cellpadding="-2" cellspacing="-2">
   			 <tr height="300"><td bgcolor="#ffffff">
   			 
   			  </td></tr>
   			</table>
   		</div>
   		 
   		</td>
   </tr>
   </table>
  </body>
</html>
