<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�������...</title>
    
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
  
      .word_darkblue {
	 	font-size: 9pt;
	  	color:#329EED;}   
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:����_GB2312;
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
	font-family: ����_GB2312;
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

<body onLoad="clockon(bgclock)" class="BODY">
<table width="871" align="center" border="0"  cellpadding="-2" cellspacing="-2" class=tableBorder_B >
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
        String str=" ��ǰ�û�:"+(String)session.getAttribute("usertrue");
    	if (((String)session.getAttribute("deptment")).equals("1"))  { str=str+",���쵼.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str=str+",������.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str=str+",������.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str=str+",���ȿ�.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str=str+",���Ͽ�.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str=str+",�ʼ��.�μ�ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str=str+",֣�ݼ��޳���.���伶ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str=str+",��ɽ���޳���.���伶ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str=str+",�������޳���.���伶ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+",ϵͳ����Ա";}
  %>
    <td width="623"   height="25" align="left"  valign="center" class=tbbody2><img src="Images/log1.gif"><%=str%></td>
  <%       } 
     else {
  %>
  <td width="623" align="center"  valign="center"  class=tbbody2><img src="Images/log3.gif">&nbsp;�û����:�ο�,����δ��¼������������¼�������ܽ������ޡ�</td>
  <% } %> 
    <td width="248" align="right" class=tbbody2  ><div>
    <script src="JS/onclock.JS"></script>
    <div id="bgclock" class="word_darkblue">&nbsp;&nbsp;&nbsp; </div>
    </td>
  </tr>
<tr bgcolor="#ffffff">
    <td colspan="2"><div><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="870" height="150">
      <param name="movie" value="Flash/titletop/pjgl.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/pjgl.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
 <tr >
 <%if (islog) { %> 
    <td width="623" background="Images/menubgpj.gif"  class="shadow">
     <a href="pjgl/pjgl.jsp?page=1">&nbsp;�ص����������&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=2" >&nbsp;�����������&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=3" >&nbsp;�������&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=5" >&nbsp;̽ͷ����&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=6" >&nbsp;ҡ���ܹ���&nbsp;</a>|
     <a href="pjgl/pjgl.jsp?page=4" >&nbsp;���Ŀ¼&nbsp;</a>
    </td> 
    <td  align="right" background="Images/menubg3.gif">����[ <a href="index.jsp" target="_top">��ҳ </a> ] [<a href="logout.jsp" target="_top"> ע�� </a>]����</td><%}
    else {   %> 
    <td width="623" background="Images/menubgpj.gif"  class="shadow">
      &nbsp;�ص����������&nbsp; |  &nbsp;�����������&nbsp; |  &nbsp;�������&nbsp; |  &nbsp;̽ͷ����ҡ&nbsp; |  &nbsp;���ܹ���&nbsp; |  &nbsp;���Ŀ¼&nbsp;
     </td>
     <td align="right" background="Images/menubg3.gif"> ����[<a href="pjgl/pjgl.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')">�� �� �� ¼ </a>][ <a href="index.jsp" target="_top">��ҳ </a> ] ����</td>  <%} %>
   
  </tr>
  
  </table>
 

