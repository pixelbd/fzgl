<%@ page language="java"  pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>考评标准查询</title>
    
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
        <td width="20%" align="center" valign="top">
   		<div>
   			<table width="100%" cellpadding=3 cellspacing=1 class=tableborder1 bgcolor="#0080c0">
   			<tr >
            <%
      boolean islog=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      if (islog)  { %>
            <tr >
   			<td height="30" class="word_white" align="center" width="100%"  bgcolor="#6595D6">自控型班组车间考评标准</tr>
   			<tr bgcolor="#e4e8ef"" onMouseOver="this.style.background='#FDFCD9';img4.style.display=''" onMouseOut="this.style.background='#e4e8ef';img4.style.display='none'">
   			<td align="center" height="30" >
   			<img id="img4" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=4&subpg=1">工作质量考评标准</a></td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img5.style.display=''" onMouseOut="this.style.background='#e4e8ef';img5.style.display='none'">
            <td align="center" height="30" >
            <img id="img5" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=4&subpg=2">工程质量考评标准</a></td></tr>
            <tr bgcolor="#e4e8ef" onMouseOver="this.style.background='#FDFCD9';img6.style.display=''" onMouseOut="this.style.background='#e4e8ef';img6.style.display='none'">
            <td align="center" height="30" >
            <img id="img6" style="display:none;" width="4" height="6" src="Images/arrow2.gif" >&nbsp;<a href="cjgl/cjgl.jsp?page=4&subpg=3">产品质量考评标准</a></td></tr>
            
  <% } %>      
      </table>
      </div>
   		</td>
   		<!--   -->
   		<td width="85%" valign="top">
   		<div>
   			<table width="100%" border="0" cellpadding="-2" cellspacing="-2">
   			 <tr >
   			 <td bgcolor="#ffffff"  valign="top"  >
   			 <%if (request.getParameter("subpg") != null)  
   			 {	
   			   if (request.getParameter("subpg").equals("1")) {%> <jsp:include flush="true" page="gzbzcx.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("2")) {%> <jsp:include flush="true" page="gcbzcx.jsp"></jsp:include> <%}
   			   if (request.getParameter("subpg").equals("3")) {%> <jsp:include flush="true" page="cpbzcx.jsp"></jsp:include> <%}

   			 }%>
   			 </td>
   			 </tr>
   			</table>
   		</div>
   		</td>
   </tr>
   </table>
  </body>
</html>
