<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>问题库...</title>
    
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
      
	  .word_yellow {
	 	font-size: 9pt;
	  	color:#F2B32D;}	
	 .word_blue {
	 	font-size: 9pt;
	  	color:#329EED;}
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
    -->  
   </style>
  <script src="js/onclock.JS"></script>
  </head>


  <body onLoad="clockon(bgclock)" background="Images/back.jpg" class="BODY">
  
<table width="871" align="center" border="0"  cellpadding=0 cellspacing=0 class=tableBorder_B >
<tr height="29">
<%
  boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if(islog) {
        String str=" 当前用户:"+(String)session.getAttribute("usertrue");
    	if (((String)session.getAttribute("deptment")).equals("1"))  { str=str+",段领导.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str=str+",验收室.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str=str+",技术科.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str=str+",调度科.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str=str+",材料科.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str=str+",质检科.段级系统";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str=str+",郑州检修车间.车间级系统";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str=str+",月山检修车间.车间级系统";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str=str+",洛阳检修车间.车间级系统";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+",系统管理员";}
  %>
    <td width="423"   height="25" align="left"  valign="center" class=tbBody2><img src="Images/log1.gif"><%=str%></td>
  <%       } 
     else {
  %>
  <td width="423" align="center"  valign="center"  class=tbbody2><img src="Images/log3.gif">&nbsp;用户身份:游客,您还未登录。建议立即登录，否则功能将会受限。</td>
  <% } %> 
    <td width="448" align="right" class=tbbody2  ><div>
    <script src="JS/onclock.JS"></script>
    <div id="bgclock" class="word_blue">&nbsp;&nbsp;&nbsp; </div>
    </td>
  </tr>
<tr bgcolor="#ffffff">
    <td colspan="2"><div><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="870" height="150">
      <param name="movie" value="Flash/titletop/wtk.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/wtk.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
 <tr >
    <td width="423" background="Images/menubg1.gif"  class="shadow">
     
     <a href="wtk/wtk.jsp?page=1" >&nbsp;车间级问题库&nbsp;</a>|
     <a href="wtk/wtk.jsp?page=2" >&nbsp;段级问题库&nbsp;</a>|
     <a href="wtk/wtk.jsp?page=3" >&nbsp;专项问题库&nbsp;</a>
     </td> 
    <%if (islog) { %>
    <td  align="right" background="Images/menubg3.gif">：：[ <a href="index.jsp" target="_top">首页 </a> ] [<a href="logout.jsp" target="_top"> 注销 </a>]：：</td><%} else {    %>
    <td align="right" background="Images/menubg3.gif"> ：：[<a href="wtk/wtk.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')"> 立 即 登 录 </a>][ <a href="index.jsp" target="_top">首页 </a> ] ：：</td>  <%} %>
   
  </tr>
  
  </table>
  </body>
  </html>
 

