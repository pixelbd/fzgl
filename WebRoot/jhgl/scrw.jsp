 <%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>生产任务...</title>
    
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
      .word_black {
	 	font-size: 9pt;
	  	color: #C73E3E;  }
	  	.word_white {
	 	font-size: 9pt;
	  	color: #FFFFFF;  }
	  .word_yellow {
	 	font-size: 9pt;
	  	color:#F2B32D;}	
	 .word_blue {
	 	font-size: 9pt;
	  	color:#329EED;}
	 .word_gray{
	 	font-size: 9pt;
	  	color: #818284;  
	  	}
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体_GB2312;
		}
	  .tbBorder{
      border: 1px; 
      background-color: #e58515;
      }
      .tbBorder2
      {
       border: 1px #DEDEDE solid; 
       background-color: #00EFEF;
      }
      .tbBody2
      {
      background-color: "#E2EFF8";
      }
      .style1 {
	font-family: 楷体_GB2312;
	font-size: 16px;
	color: #004080;
}
.shadow{
font-size=9pt;
filter:DropShadow(Color=#FFFFFF,offX=1,offY=1,positive=1);
height:25;
color:#336699;
}
.tableBorder_B {
	   border: #DFE1EB 1px solid;
	   
	   background-color: #E2EFF8;
       }
       body {
	margin-left: 0px; 
	margin-top: 1px;
      }
    -->  
   </style>
  <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body onLoad="clockon(bgclock)" background="Images/back.jpg" class="BODY">
 <jsp:include flush="true" page="scrwtitle.jsp"></jsp:include>
 <%
      boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
    String str="当前位置：辅助管理系统>>生产任务管理";

  String currpage = "0";
    
  if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
  if (currpage.equals("1"))  { str=str+">>生产任务完成情况";}
  if (currpage.equals("2"))  { str=str+">>月生产计划";}
  if (currpage.equals("3"))  { str=str+">>日生产计划";}
  if (currpage.equals("4"))  { str=str+">>调度管理功能";}
           
 %>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      <div class="word_gray" valign="center"><%=str%></div>      
      </td>
   </tr>
   </table>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
       <td>
       <% if  (currpage.equals("1")) { %> <jsp:include flush="true" page="jhwc.jsp"></jsp:include> <% } %>
       </td>
   </tr>
   </table>
<% if  (currpage.equals("0")) { %>
  <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" valign="middle" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/wtk_topbarbk.gif">
      生产任务管理</td>
   </tr>
   </table> 
   <% } %>

 <% if  (currpage.equals("2")) { %> 
 <%if (islog) { %> <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
       <td bgcolor="#FFFFFF">
       <jsp:include flush="true" page="yjh.jsp"></jsp:include> 
       </td>
   </tr>
   </table> 
 <% } else {%>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" align="center" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/wtk_topbarbk.gif">
      <img width="32" height="32" src="Images/clue.gif" >
       未登录，无法查看生产计划情况。 
      </td>
   </tr>
   </table>
 <%} }%>
 <% if  (currpage.equals("3")) { %> 
 <%if (islog) { %> <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
       <td bgcolor="#FFFFFF">
       <jsp:include flush="true" page="rjhtab.jsp"></jsp:include> 
       </td>
   </tr>
   </table> 
 <% } else {%>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" align="center" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/wtk_topbarbk.gif">
      <img width="32" height="32" src="Images/clue.gif" >
       未登录，无法查看生产计划情况。 
      </td>
   </tr>
   </table>
 <%} }%>
  <% if  (currpage.equals("4")) { %> 
 <%if (islog) { %> <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
       <td bgcolor="#FFFFFF">
       <jsp:include flush="true" page="ddgl.jsp"></jsp:include> 
       </td>
   </tr>
   </table> 
 <% } else {%>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" align="center" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/wtk_topbarbk.gif">
      <img width="32" height="32" src="Images/clue.gif" >
       未登录，无法执行调度功能。 
      </td>
   </tr>
   </table>
 <%} }%>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/bottombarbk.gif"></td>
   </tr>
   </table>
 <table  align="center" class="tableBorder_B" valign="center" width="871"  border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td bgcolor="#ffffff" align="center">
      <div>
      <jsp:include flush="true" page="CopyRight.html"></jsp:include>
      </div>      
      </td>
   </tr>
</table>