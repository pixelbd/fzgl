<%@ page language="java"   pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����ƶ�...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  

  <script src="js/onclock.JS"></script>
  </head>

  <body onLoad="clockon(bgclock)" >
  
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
        if (((String)session.getAttribute("deptment")).equals("44")) { str=str+",֣�����ᳵ��.���伶ϵͳ";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+",ϵͳ����Ա";}
  %>
    <td width="423"   height="25" align="left"  valign="center" class=tbbody2><img src="Images/log1.gif"><%=str%></td>
  <%       } 
     else {
  %>
  <td width="423" align="center"  valign="center"  class=tbbody2><img src="Images/log3.gif">&nbsp;�û����:�ο�,����δ��¼������������¼�������ܽ������ޡ�</td>
  <% } %> 
    <td width="448" align="right" class=tbbody2  ><div>
    <script src="JS/onclock.JS"></script>
    <div id="bgclock" class="word_blue">&nbsp;&nbsp;&nbsp; </div>
    </td>
  </tr>
<tr bgcolor="#ffffff">
    <td colspan="2"><div><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="870" height="150">
      <param name="movie" value="Flash/titletop/gzzd.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/gzzd.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
<tr >
    <td width="423" background="Images/menubg1.gif"  class="shadow">
     <a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('wd')">&nbsp;�ļ��籨&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('zd')">&nbsp;�����ƶ�&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('bz')">&nbsp;������׼&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('zds')">&nbsp;��λ��ҵָ����&nbsp;</a>
     |<a href="gzzd/gzzd.jsp?page=14" onMouseMove="Fsubmenu('zl')">&nbsp;��������&nbsp;</a>
     </td> 
    <%if (islog) { %>
    <td  align="right" background="Images/menubg3.gif">����[ <a href="index.jsp" target="_top">��ҳ </a> ] [<a href="logout.jsp" target="_top"> ע�� </a>]����</td><%} else {    %>
    <td align="right" background="Images/menubg3.gif"> ����[<a href="gzzd/gzzd.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')"> �� �� �� ¼ </a>][ <a href="index.jsp" target="_top">��ҳ </a> ] ����</td>  <%} %>
   
  </tr>
  <tr>
   <td colspan="3" height="25" background="Images/menubg2.gif" align="left">
	<div id="submenu" class="word_yellow">&nbsp;</div>
   </td>
  </tr>
  </table>

  <script language="javascript">
function Fsubmenu(value){
	switch (value){
 		case "wd":
			
			break;
		case "zd":
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=2'>&nbsp;�ι����ƶ�&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=3'>&nbsp;��������ƶ�&nbsp;</a>";
			break;
		case "bz":
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=4' >&nbsp;���޹��&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=5' >&nbsp;�б����&nbsp;</a>";
			break;	
		case "zds":
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=6' >&nbsp;����&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=7' >&nbsp;����&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=8'>&nbsp;&nbsp;70t����������&nbsp;&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=9' >&nbsp;&nbsp;X2H��X2Kȫ������&nbsp;&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=10' >&nbsp;DL1�ͳ�&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=11' >&nbsp;K2����&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=12' >&nbsp;8B/8AB���Ƹ���&nbsp;</a>";
			break;			
	    case "zl":
			break;
		}
}
</script>  
  </body>
  </html>
 

