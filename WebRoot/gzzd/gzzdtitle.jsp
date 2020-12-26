<%@ page language="java"   pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>规章制度...</title>
    
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
        if (((String)session.getAttribute("deptment")).equals("44")) { str=str+",郑州轮轴车间.车间级系统";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+",系统管理员";}
  %>
    <td width="423"   height="25" align="left"  valign="center" class=tbbody2><img src="Images/log1.gif"><%=str%></td>
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
      <param name="movie" value="Flash/titletop/gzzd.swf">
      <param name="quality" value="high">
      <param name="wmode" value="transparent">
      <embed src="Flash/titletop/gzzd.swf" width="870" height="150" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
    </object></div></td>
  </tr>
<tr >
    <td width="423" background="Images/menubg1.gif"  class="shadow">
     <a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('wd')">&nbsp;文件电报&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('zd')">&nbsp;管理制度&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('bz')">&nbsp;技术标准&nbsp;</a>
     |<a href="gzzd/gzzd.jsp" onMouseMove="Fsubmenu('zds')">&nbsp;岗位作业指导书&nbsp;</a>
     |<a href="gzzd/gzzd.jsp?page=14" onMouseMove="Fsubmenu('zl')">&nbsp;技术资料&nbsp;</a>
     </td> 
    <%if (islog) { %>
    <td  align="right" background="Images/menubg3.gif">：：[ <a href="index.jsp" target="_top">首页 </a> ] [<a href="logout.jsp" target="_top"> 注销 </a>]：：</td><%} else {    %>
    <td align="right" background="Images/menubg3.gif"> ：：[<a href="gzzd/gzzd.jsp" onClick="Javascript:window.open('../login.jsp','','width=445,height=334')"> 立 即 登 录 </a>][ <a href="index.jsp" target="_top">首页 </a> ] ：：</td>  <%} %>
   
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
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=2'>&nbsp;段管理制度&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=3'>&nbsp;车间管理制度&nbsp;</a>";
			break;
		case "bz":
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=4' >&nbsp;检修规程&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=5' >&nbsp;行标国标&nbsp;</a>";
			break;	
		case "zds":
			submenu.innerHTML="<a href='gzzd/gzzd.jsp?page=6' >&nbsp;厂修&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=7' >&nbsp;段修&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=8'>&nbsp;&nbsp;70t级货车段修&nbsp;&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=9' >&nbsp;&nbsp;X2H、X2K全面检查修&nbsp;&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=10' >&nbsp;DL1型车&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=11' >&nbsp;K2改造&nbsp;</a>|<a href='gzzd/gzzd.jsp?page=12' >&nbsp;8B/8AB完善改造&nbsp;</a>";
			break;			
	    case "zl":
			break;
		}
}
</script>  
  </body>
  </html>
 

