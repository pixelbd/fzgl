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


  <script language="javascript">
 function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	var arr_week=new Array("����һ","����һ","������","������","������","������","������");
	week=arr_week[day];
	var time="";
	time=year+"��"+month+"��"+date+"�� "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML="["+time+"]"
	}
	var timer=setTimeout("clockon(bgclock)",200);
}  

  </script>
  </head>

  <body    background="Images/back.jpg" >
  
<table width="871" align="center" border="0"  cellpadding="0" cellspacing="0" class=tableBorder_B >
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
  <td width="564"  height="25" align="left"  valign="center" class=tbbody2><img src="Images/log1.gif"><%=str%></td>
  <%       }   else {
  %>
  <td width="564"  height="25" align="left"  valign="center"  class=tbbody2><img src="Images/log3.gif">&nbsp;�û����:�ο�,����δ��¼������������¼�������ܽ������ޡ�</td>
  <%       } %> 
    <td width="307" align="right" class=tbbody2 >
    <div id="bgclock" class="word_blue">
    <script> clockon(bgclock) </script>
    &nbsp;&nbsp;&nbsp; </div>
    </td>
  </tr>
<tr bgcolor="#ffffff">
    <td colspan="3"><div><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="870" height="150">
      <param name="movie" value="Flash/titletop/dtxx.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/dtxx.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
  <tr>
    <td  height="20" background="Images/menubg3.gif"  > ��ǰλ�ã���������ϵͳ>>��̬��Ϣ      
    </td> 
    <%if (islog) { %>
    <td  height="20"   align="right" background="Images/menubg3.gif">����[ <a href="index.jsp" target="_top">��ҳ </a> ] [<a href="logout.jsp" target="_top"> ע�� </a>]����</td><%} else {    %>
    <td  height="20"   align="right" background="Images/menubg3.gif"> ����[<a href="dtxx/dtxx.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')"> �� �� �� ¼ </a>][ <a href="index.jsp" target="_top">��ҳ </a> ] ����</td>  <%} %>
  </tr>
  </table>
</body>
</html>


