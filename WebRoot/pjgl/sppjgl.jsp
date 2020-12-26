<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sppjgl.jsp' starting page</title>
    
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
    .whitecolor{ color:"#ffffff"; }
    .orange{ font-size: 9pt;	color: #FFC000; }
    -->  
    </style>
  </head>
  <body>
<% 
  String sp="";
  if   (request.getParameter("sp")!=null) sp=new String(request.getParameter("sp"));
  String currpg="";
  if (request.getParameter("page")!=null) currpg=new String(request.getParameter("page"));
%>  
  
  
<table width="871"  bgcolor="#ffffff"   class="tableBorder_LR" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td>
  <div>
       <table width="777"  border="0" align="center" cellpadding="-2" cellspacing="-2">
        <tr>
          <%if (currpg.equals("1")) { %><td><img src="Images/pjtitle1.gif" width="777" height="40"> </td><%}%> 
          <%if (currpg.equals("2")) { %><td><img src="Images/pjtitle2.gif" width="777" height="40"></td> 
          <%  }%>
        </tr>
        <tr>
          <td height="47" valign="top" background="Images/menubg.gif"><div>
          <table width="100%" height="40"  border="0" cellpadding="-2" cellspacing="-2">
              <tr>
                <td height="34" align="center" class="whitecolor">
                | <a href="pjgl/pjgl.jsp?page=<%=currpg%>&sp=1" class="orange">索赔配件管理</a> 
                | <a href="pjgl/pjgl.jsp?page=<%=currpg%>&sp=2" class="orange">已索赔配件管理</a>
                | <a href="pjgl/pjgl.jsp?page=<%=currpg%>&sp=3" class="orange">配件索赔数据分析</a>|</td>
              </tr>
           </table></div></td>
        </tr>
        </table>
  </div>
  <div>
       <table width="777"  border="0" align="center" cellpadding="-2" cellspacing="-2" height="272" bgcolor="#ffffff">
       <tr>
             <td width="44" height="249" valign="top"><img src="Images/left.gif" width="44" height="248"></td>
             <td valign="top" width="698">
              <%if (sp.equals("1")) { %> <div> <jsp:include flush="true" page="pjdsp.jsp"></jsp:include> </div><% } else {
                if (sp.equals("2")) { %> <div> <jsp:include flush="true" page="pjysp.jsp"></jsp:include></div> <% } else {
                if (sp.equals("3")) { %> <div> <jsp:include flush="true" page="pjspfx.jsp"></jsp:include></div> <% } else {
                %>  <%}}}%>
             </td>
             <td valign="top"> <img src="Images/right.gif" width="35" height="248"></td>
       </tr>
      </table>
  </div>
  </td>
  </tr>
</table>
  </body>
</html>
