<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ddgl.jsp' starting page</title>
    
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
  boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  String subpage = "0";
  boolean canmodify=false;
    
  if (request.getParameter("subpg")!=null) subpage=new String(request.getParameter("subpg"));
  if(islog) 
   { 
     //调度功能：车间调度，系统管理员可操作
    // 段调度可操作(预留) if((((String)session.getAttribute("deptment")).equals("23")||((String)session.getAttribute("deptment")).equals("admin")) )
    if(
       ((String)session.getAttribute("deptment")).equals("admin")||
       (
       (
        ((String)session.getAttribute("deptment")).equals("41")||
        ((String)session.getAttribute("deptment")).equals("42")||
        ((String)session.getAttribute("deptment")).equals("43")||
        ((String)session.getAttribute("deptment")).equals("44")
       )||
       (
        ((String)session.getAttribute("zw")).equals("7")||((String)session.getAttribute("zw")).equals("cjadmin")
       )
       ))
        { canmodify=true;
        }
   
     
  }
  
       
  if (canmodify) { %>
       <table  class="tableBorder3" width="100%" height="30" border="0" align="center" bgcolor="#FFFFFF">
            <tr > 
            <td width="5%" rowspan="2" align="right" valign="middle" width="100" height="30">
            <img src="Images/edit.ico" width="30" height="30" border="0" >
            </td>
            <td   valign="middle" height="25" >
            <a href="jhgl/scrw.jsp?page=4&subpg=1" >上报任务完成情况</a>&nbsp;|&nbsp;
            <a href="jhgl/scrw.jsp?page=4&subpg=2" >残车管理</a>&nbsp;|&nbsp;
            <a href="jhgl/scrw.jsp?page=4&subpg=3" >编辑日检修计划</a>&nbsp;|&nbsp;
            <a href="jhgl/scrw.jsp?page=4&subpg=4" >编辑月检修计划</a>
            </td>
            </tr>
       
      </table>
      <table width="100%" height="30" border="0" align="center" bgcolor="#FFFFFF">
      <tr>
       <td colspan="2">
       <% if  (subpage.equals("1")) { %> <jsp:include flush="true" page="sbjhwc.jsp"></jsp:include> <% } %>
       <% if  (subpage.equals("2")) { %> <jsp:include flush="true" page="ccgl.jsp"></jsp:include> <% } %>
       <% if  (subpage.equals("3")) { %> <jsp:include flush="true" page="editrjh.jsp"></jsp:include> <% } %>
       <% if  (subpage.equals("4")) { %> <jsp:include flush="true" page="sbjhwc.jsp"></jsp:include> <% } %>
       </td>
       </tr>
       </table>
 <% } %>
 
  </body>
</html>
