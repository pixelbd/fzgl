<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'titlehygl.jsp' starting page</title>
    
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
      <param name="movie" value="Flash/titletop/zthy.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/zthy.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
 <tr >
    <td width="423" background="Images/menubg1.gif"  class="shadow">
     <a href="hygl/hygl.jsp" onMouseMove="Fsubmenu('cj')">&nbsp;���伶����&nbsp;</a>|<a href="hygl/hygl.jsp" onMouseMove="Fsubmenu('dj')">&nbsp;�μ�����&nbsp;</a>|<a href="hygl/hygl.jsp?page=7" >&nbsp;�������&nbsp;</a>
     </td> 
    <%if (islog) { %>
    <td  align="right" background="Images/menubg3.gif">����[ <a href="index.jsp" target="_top">��ҳ </a> ] [<a href="logout.jsp" target="_top"> ע�� </a>]����</td><%} else {    %>
    <td align="right" background="Images/menubg3.gif"> ����[<a href="hygl/hygl.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')"> �� �� �� ¼ </a>][ <a href="index.jsp" target="_top">��ҳ </a> ] ����</td>  <%} %>
   
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
		case "dj":
			submenu.innerHTML="<a href='hygl/hygl.jsp?page=5'>&nbsp;����������&nbsp;</a>|<a href='hygl/hygl.jsp?page=6'>&nbsp;�����μ�����&nbsp;</a>";
			break;
		case "cj":
			submenu.innerHTML="<a href='hygl/hygl.jsp?page=1' >&nbsp;����������&nbsp;</a>|<a href='hygl/hygl.jsp?page=2' >&nbsp;�µ�����ϯ��&nbsp;</a>|<a href='hygl/hygl.jsp?page=3'>&nbsp;����������&nbsp;</a>|<a href='hygl/hygl.jsp?page=4'>&nbsp;ר�������&nbsp;</a>";
			break;
		case "dy":
			
			break;	
		case "qt":
			
			break;			
		}
}
</script>  
  </body>
</html>
