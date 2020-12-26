<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>辅助管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link href="Css/style.css" rel="stylesheet">
   <style type="text/css">
   <!--
   .STYLE2 {color: #fff0dd}
   .wordwhite { color:#ffffff }
   .tableBorder_Top{
	border:2px solid #ffffff;
	border-bottom-style:none;
	border-left-style:none; 
	border-right-style:none
}
   -->
</style>
</head>
<!-- 调入时钟对象 -->
<body onLoad="clockon(bgclock)" >
<table class="tableBorder_Top" width="871" border="0" align="center" cellpadding="-2" cellspacing="-2" class="tableBorder"  >
  <tr>
    <td valign="top"><table width="100%" height="54" border="0" cellpadding="-2" cellspacing="-2" background="Images/Top_01.gif">
      <tr>
	  <!--网页头部-->
        <td valign="top">
<!-- 页面头部菜单、登录、及其他（开始） -->
<table width="871" height="309" border="0" align="center" valign="center" cellpadding="-2" cellspacing="-2"
background="Images/menu/bg.gif" class="tableBorder">
  <tr>
    <td valign="top">
    
    <!-- 页面头部表 时钟显示及刷新页面、关闭系统按钮（开始） -->
    <table width="100%" height="26"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
      <td width="3%">&nbsp;</td>
        <td valign="bottom"><script src="JS/onclock.JS"></script><div id="bgclock" class="word"></div></td>
        <!-- 显示是否已登录，如登录显示登录信息 -->
        <td>
  <%
  boolean islog=false;
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
 %>
 <%
      if(islog) {
  %>
    <td width="50%" valign="bottom" align="left" style="color:#FFFFFF "><img src="Images/log1.gif">
  <% 
        String str=" 欢迎您:"+(String)session.getAttribute("usertrue");
    	if (((String)session.getAttribute("deptment")).equals("1"))  { str=str+",段领导.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str=str+",部门:验收室.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str=str+",部门:技术科.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str=str+",部门:调度科.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str=str+",部门：材料科.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str=str+",部门：质检科.欢迎进入段级系统";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str=str+",郑州检修车间";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str=str+",月山检修车间";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str=str+",洛阳检修车间";}
        if (((String)session.getAttribute("deptment")).equals("44")) { str=str+",郑州轮轴车间";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str=str+",系统管理员";}
        if (((String)session.getAttribute("zw")).equals("1"))  str=str+",车间领导.欢迎进入车间级系统"; 
        else { 	if (((String)session.getAttribute("zw")).equals("2"))  str=str+",计工员.欢迎进入车间级系统";
                else  { if(((String)session.getAttribute("zw")).equals("3"))  str=str+",安全员.欢迎进入车间级系统";
                         else { if(((String)session.getAttribute("zw")).equals("4"))  str=str+",技教员.欢迎进入车间级系统";
                                else {if (((String)session.getAttribute("zw")).equals("5"))  str=str+",材料员.欢迎进入车间级系统";
                                      else { if (((String)session.getAttribute("zw")).equals("6"))  str=str+",技术专职.欢迎进入车间级系统";
                                            else {if (((String)session.getAttribute("zw")).equals("7"))  str=str+",生产调度.欢迎进入车间级系统";
                                                  else {if (((String)session.getAttribute("zw")).equals("8"))  str=str+",工长.欢迎进入车间级系统";
                                                        else {if (((String)session.getAttribute("zw")).equals("9"))  str=str+",质检员.欢迎进入车间级系统";
                                                              else {  if (((String)session.getAttribute("zw")).equals("10"))  str=str+",备品库管库员.欢迎进入车间级系统";
                                                                      else {   if (((String)session.getAttribute("zw")).equals("cjadmin"))  str=str+",车间级管理员.欢迎进入车间级系统"; 
                                                             } str=str+".";
                                                         }
                                                         }
                                                        }
                                                 }
                                            }
                                      }
                              }
                       }
              }
        out.print(str);
      %>
      [<a href="logout.jsp" >  注销  </a>]
      <% 
       } 
        else {
  %>
  <td width="50%" valign="bottom" align="left" style="color:#FFFFFF "><img src="Images/log2.gif">&nbsp;用户身份：游客.</td>
  <%} %> 
    	
        <td class="wordwhite"><div align="right" valign="bottom" ><a href="#" onClick="window.location.reload();">刷新页面
		</a>|
        <script language="javascript">
			function myclose(){
				if(confirm("真的要关闭当前窗口吗?")){
					window.close();
				}
			}
		</script>
        <a href="" onClick="myclose()" >关闭系统</a>|&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
      </tr>
    </table>
    <!-- 页面头部表 时钟显示及刷新页面、关闭系统按钮（结束）-->
    <!-- 菜单（开始）  -->
      <table width="100%" height="119" border="0" cellpadding="-2" cellspacing="-2">
        <tr>
          <td width="180">
          <table width="100%" height="119"  border="0" cellpadding="-2" cellspacing="-2">
            <tr height="28">
              <td height="29"></td>
            </tr>
            <tr align="left">
              <td height="90" background="Images/logo_bg.gif"><div align="center">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="162" height="79">
                  <param name="movie" value="Flash/logo.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="Flash/logo.swf" width="162" height="79" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
              </div></td>
            </tr>
          </table></td>
         <!-- 主菜单显示 -->
          <% if (!islog) {  %>
          <td align="left" width="60" align="left"><a href="cjjs/cjjs.jsp">
          <img src="Images/menu/menu_youke/menu_01.gif" id="image1" width="60" height="119" border="0" onMouseMove="image1.src='Images/menu/menu_youke/menu_01_over.gif'" onMouseout="image1.src='Images/menu/menu_youke/menu_01.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="dtxx/dtxx.jsp">
          <img src="Images/menu/menu_youke/menu_02.gif" id="image2" width="60" height="119" border="0" onMouseMove="image2.src='Images/menu/menu_youke/menu_02_over.gif'" onMouseout="image2.src='Images/menu/menu_youke/menu_02.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp">
          <img src="Images/menu/menu_youke/menu_03.gif" id="image3" width="60" height="119" border="0" onMouseMove="image3.src='Images/menu/menu_youke/menu_03_over.gif'" onMouseout="image3.src='Images/menu/menu_youke/menu_03.gif'"></a></td>
          <td width="480"  valign="bottom" background="Images/menu/menu_youke.gif"><div align="center">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="480" height="88">
                  <param name="movie" value="Flash/feixuan.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="Flash/feixuan.swf" width="480" height="88" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
              </div></td>
                    <td colspan="9"></td>
         <% } else { if ((((String)session.getAttribute("deptment")).equals("1"))||(((String)session.getAttribute("deptment")).equals("admin"))
                      ||(((String)session.getAttribute("deptment")).equals("41"))||(((String)session.getAttribute("deptment")).equals("42"))
                      ||(((String)session.getAttribute("deptment")).equals("43"))||(((String)session.getAttribute("deptment")).equals("44")))  { %>
          <td align="left" width="60" align="left"><a href="cjjs/cjjs.jsp" target="newwin1">
          <img src="Images/menu/menu_lingdao/menu_01.gif" id="image1" width="60" height="119" border="0" onMouseMove="image1.src='Images/menu/menu_lingdao/menu_01_over.gif'" onMouseout="image1.src='Images/menu/menu_lingdao/menu_01.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="jhgl/scrw.jsp" target="newwin2">
          <img src="Images/menu/menu_lingdao/menu_02.gif" id="image2" width="60" height="119" border="0" onMouseMove="image2.src='Images/menu/menu_lingdao/menu_02_over.gif'" onMouseout="image2.src='Images/menu/menu_lingdao/menu_02.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="dtxx/dtxx.jsp" target="newwin3">
          <img src="Images/menu/menu_lingdao/menu_03.gif" id="image3" width="60" height="119" border="0" onMouseMove="image3.src='Images/menu/menu_lingdao/menu_03_over.gif'" onMouseout="image3.src='Images/menu/menu_lingdao/menu_03.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="pjgl/pjgl.jsp" target="newwin4">
          <img src="Images/menu/menu_lingdao/menu_04.gif" id="image4" width="60" height="119" border="0" onMouseMove="image4.src='Images/menu/menu_lingdao/menu_04_over.gif'" onMouseout="image4.src='Images/menu/menu_lingdao/menu_04.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="sbgl/sbgl.jsp" target="newwin5">
          <img src="Images/menu/menu_lingdao/menu_05.gif" id="image5" width="60" height="119" border="0" onMouseMove="image5.src='Images/menu/menu_lingdao/menu_05_over.gif'" onMouseout="image5.src='Images/menu/menu_lingdao/menu_05.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="hygl/hygl.jsp" target="newwin6">
          <img src="Images/menu/menu_lingdao/menu_06.gif" id="image6" width="60" height="119" border="0" onMouseMove="image6.src='Images/menu/menu_lingdao/menu_06_over.gif'" onMouseout="image6.src='Images/menu/menu_lingdao/menu_06.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="wtk/wtk.jsp" target="newwin7">
          <img src="Images/menu/menu_lingdao/menu_07.gif" id="image7" width="60" height="119" border="0" onMouseMove="image7.src='Images/menu/menu_lingdao/menu_07_over.gif'" onMouseout="image7.src='Images/menu/menu_lingdao/menu_07.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzgl/gzgl.jsp" target="newwin8">
          <img src="Images/menu/menu_lingdao/menu_08.gif" id="image8" width="60" height="119" border="0" onMouseMove="image8.src='Images/menu/menu_lingdao/menu_08_over.gif'" onMouseout="image8.src='Images/menu/menu_lingdao/menu_08.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin9">
          <img src="Images/menu/menu_lingdao/menu_09.gif" id="image9" width="60" height="119" border="0" onMouseMove="image9.src='Images/menu/menu_lingdao/menu_09_over.gif'" onMouseout="image9.src='Images/menu/menu_lingdao/menu_09.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="cjgl/cjgl.jsp" target="newwin10">
          <img src="Images/menu/menu_lingdao/menu_10.gif" id="image10" width="60" height="119" border="0" onMouseMove="image10.src='Images/menu/menu_lingdao/menu_10_over.gif'" onMouseout="image10.src='Images/menu/menu_lingdao/menu_10.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="bzgl/bzgl.jsp" target="newwin11">
          <img src="Images/menu/menu_lingdao/menu_11.gif" id="image11" width="60" height="119" border="0" onMouseMove="image11.src='Images/menu/menu_lingdao/menu_11_over.gif'" onMouseout="image11.src='Images/menu/menu_lingdao/menu_11.gif'"></a></td>
          <td colspan="3"></td>
          <% }else {   if (((String)session.getAttribute("deptment")).equals("21")||((String)session.getAttribute("deptment")).equals("22")||((String)session.getAttribute("deptment")).equals("25"))  { %> 
          <td align="left" width="60" align="left"><a href="cjjs/cjjs.jsp" target="newwin1">
          <img src="Images/menu/menu_lingdao/menu_01.gif" id="image1" width="60" height="119" border="0" onMouseMove="image1.src='Images/menu/menu_lingdao/menu_01_over.gif'" onMouseout="image1.src='Images/menu/menu_lingdao/menu_01.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="jhgl/scrw.jsp" target="newwin2">
          <img src="Images/menu/menu_lingdao/menu_02.gif" id="image2" width="60" height="119" border="0" onMouseMove="image2.src='Images/menu/menu_lingdao/menu_02_over.gif'" onMouseout="image2.src='Images/menu/menu_lingdao/menu_02.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="dtxx/dtxx.jsp" target="newwin3">
          <img src="Images/menu/menu_lingdao/menu_03.gif" id="image3" width="60" height="119" border="0" onMouseMove="image3.src='Images/menu/menu_lingdao/menu_03_over.gif'" onMouseout="image3.src='Images/menu/menu_lingdao/menu_03.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="pjgl/pjgl.jsp" target="newwin4">
          <img src="Images/menu/menu_lingdao/menu_04.gif" id="image4" width="60" height="119" border="0" onMouseMove="image4.src='Images/menu/menu_lingdao/menu_04_over.gif'" onMouseout="image4.src='Images/menu/menu_lingdao/menu_04.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="sbgl/sbgl.jsp" target="newwin5">
          <img src="Images/menu/menu_lingdao/menu_05.gif" id="image5" width="60" height="119" border="0" onMouseMove="image5.src='Images/menu/menu_lingdao/menu_05_over.gif'" onMouseout="image5.src='Images/menu/menu_lingdao/menu_05.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="hygl/hygl.jsp" target="newwin6">
          <img src="Images/menu/menu_lingdao/menu_06.gif" id="image6" width="60" height="119" border="0" onMouseMove="image6.src='Images/menu/menu_lingdao/menu_06_over.gif'" onMouseout="image6.src='Images/menu/menu_lingdao/menu_06.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="wtk/wtk.jsp" target="newwin7">
          <img src="Images/menu/menu_lingdao/menu_07.gif" id="image7" width="60" height="119" border="0" onMouseMove="image7.src='Images/menu/menu_lingdao/menu_07_over.gif'" onMouseout="image7.src='Images/menu/menu_lingdao/menu_07.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzgl/gzgl.jsp" target="newwin8">
          <img src="Images/menu/menu_lingdao/menu_08.gif" id="image8" width="60" height="119" border="0" onMouseMove="image8.src='Images/menu/menu_lingdao/menu_08_over.gif'" onMouseout="image8.src='Images/menu/menu_lingdao/menu_08.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin9">
          <img src="Images/menu/menu_lingdao/menu_09.gif" id="image9" width="60" height="119" border="0" onMouseMove="image9.src='Images/menu/menu_lingdao/menu_09_over.gif'" onMouseout="image9.src='Images/menu/menu_lingdao/menu_09.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="cjgl/cjgl.jsp" target="newwin10">
          <img src="Images/menu/menu_lingdao/menu_10.gif" id="image10" width="60" height="119" border="0" onMouseMove="image10.src='Images/menu/menu_lingdao/menu_10_over.gif'" onMouseout="image10.src='Images/menu/menu_lingdao/menu_10.gif'"></a></td>
          <td colspan="3"> </td>         
          <% }else { if (((String)session.getAttribute("deptment")).equals("23"))  { %> 
           <td align="left" width="60" align="left"><a href="cjjs/cjjs.jsp" target="newwin1">
          <img src="Images/menu/menu_jishu/menu_01.gif" id="image1" width="60" height="119" border="0" onMouseMove="image1.src='Images/menu/menu_jishu/menu_01_over.gif'" onMouseout="image1.src='Images/menu/menu_jishu/menu_01.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="jhgl/scrw.jsp"  target="newwin2">
          <img src="Images/menu/menu_jishu/menu_02.gif" id="image2" width="60" height="119" border="0" onMouseMove="image2.src='Images/menu/menu_jishu/menu_02_over.gif'" onMouseout="image2.src='Images/menu/menu_jishu/menu_02.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin3">
          <img src="Images/menu/menu_jishu/menu_03.gif" id="image3" width="60" height="119" border="0" onMouseMove="image3.src='Images/menu/menu_jishu/menu_03_over.gif'" onMouseout="image3.src='Images/menu/menu_jishu/menu_03.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="pjgl/pjgl.jsp" target="newwin4">
          <img src="Images/menu/menu_jishu/menu_04.gif" id="image4" width="60" height="119" border="0" onMouseMove="image4.src='Images/menu/menu_jishu/menu_04_over.gif'" onMouseout="image4.src='Images/menu/menu_jishu/menu_04.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="sbgl/sbgl.jsp" target="newwin5">
          <img src="Images/menu/menu_jishu/menu_05.gif" id="image5" width="60" height="119" border="0" onMouseMove="image5.src='Images/menu/menu_jishu/menu_05_over.gif'" onMouseout="image5.src='Images/menu/menu_jishu/menu_05.gif'"></a></td>
          <td  align="left" width="60" align="left"><a href="hygl/hygl.jsp" target="newwin6">
          <img src="Images/menu/menu_jishu/menu_06.gif" id="image6" width="60" height="119" border="0" onMouseMove="image6.src='Images/menu/menu_jishu/menu_06_over.gif'" onMouseout="image6.src='Images/menu/menu_jishu/menu_06.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin9">
          <img src="Images/menu/menu_lingdao/menu_09.gif" id="image9" width="60" height="119" border="0" onMouseMove="image9.src='Images/menu/menu_lingdao/menu_09_over.gif'" onMouseout="image9.src='Images/menu/menu_lingdao/menu_09.gif'"></a></td>
          <td width="240"  valign="bottom" background="Images/menu/menu_diaodu.gif"><div align="center">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="88">
                  <param name="movie" value="Flash/feixuan.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="Flash/feixuan.swf" width="240" height="88" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
              </div></td>
          <td colspan="2"> </td>
          
          <% }else { if (((String)session.getAttribute("deptment")).equals("24"))  { %> 
           <td align="left" width="60" align="left"><a href="cjjs/cjjs.jsp" target="newwin1">
          <img src="Images/menu/menu_jishu/menu_01.gif" id="image1" width="60" height="119" border="0" onMouseMove="image1.src='Images/menu/menu_jishu/menu_01_over.gif'" onMouseout="image1.src='Images/menu/menu_jishu/menu_01.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="jhgl/scrw.jsp" target="newwin2">
          <img src="Images/menu/menu_jishu/menu_02.gif" id="image2" width="60" height="119" border="0" onMouseMove="image2.src='Images/menu/menu_jishu/menu_02_over.gif'" onMouseout="image2.src='Images/menu/menu_jishu/menu_02.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin3">
          <img src="Images/menu/menu_jishu/menu_03.gif" id="image3" width="60" height="119" border="0" onMouseMove="image3.src='Images/menu/menu_jishu/menu_03_over.gif'" onMouseout="image3.src='Images/menu/menu_jishu/menu_03.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="pjgl/pjgl.jsp" target="newwin4">
          <img src="Images/menu/menu_jishu/menu_04.gif" id="image4" width="60" height="119" border="0" onMouseMove="image4.src='Images/menu/menu_jishu/menu_04_over.gif'" onMouseout="image4.src='Images/menu/menu_jishu/menu_04.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="sbgl/sbgl.jsp" target="newwin5">
          <img src="Images/menu/menu_jishu/menu_05.gif" id="image5" width="60" height="119" border="0" onMouseMove="image5.src='Images/menu/menu_jishu/menu_05_over.gif'" onMouseout="image5.src='Images/menu/menu_jishu/menu_05.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="hygl/hygl.jsp" target="newwin6">
          <img src="Images/menu/menu_jishu/menu_06.gif" id="image6" width="60" height="119" border="0" onMouseMove="image6.src='Images/menu/menu_jishu/menu_06_over.gif'" onMouseout="image6.src='Images/menu/menu_jishu/menu_06.gif'"></a></td>
          <td align="left" width="60" align="left"><a href="gzzd/gzzd.jsp" target="newwin9">
          <img src="Images/menu/menu_lingdao/menu_09.gif" id="image9" width="60" height="119" border="0" onMouseMove="image9.src='Images/menu/menu_lingdao/menu_09_over.gif'" onMouseout="image9.src='Images/menu/menu_lingdao/menu_09.gif'"></a></td>
          <td width="240"  valign="bottom" background="Images/menu/menu_cailiao.gif"><div align="center">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="240" height="88">
                  <param name="movie" value="Flash/feixuan.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="Flash/feixuan.swf" width="240" height="88" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                </object>
              </div></td>
          <td colspan="2"></td>
          <% }else {  } 
          }}}}%>
        </tr>
      </table>
      <!-- 菜单（结束）  -->
      <!-- 登录表单、flash、及联系我们菜单（开始） -->
      <table width="867" height="134"  border="0" cellpadding="-2" cellspacing="-2" >
        <tr>
          <td width="24%">
          <!-- 登录表单 -->
          <%
      if ( !islog) {
  %>
          <form name="form1" method="post" action="check.jsp">
            <label>
              <div align="center"><span class="wordwhite">用户名</span>
              <input name="usrname" type="text" id="name" size="16"  class="txt_grey">
              </div>
            </label>
                    <label>
                    <div align="center"><span class="wordwhite">密&nbsp;&nbsp;码</span>
                      <input name="psword" type="password" id="psw" size="16" class="txt_grey">
                    </div>
                    </label>
                    <p><label>
                      <div align="center">
                        <input type="submit" name="button" id="button" class="btn_grey" value="登  录">
                        <input type="reset" name="button2" id="button2" class="btn_grey" value="重  填">
                      </div>
                      </label>
                    </p>
                    </form>    
               <%} %>      
                    </td>
           <!-- 插入flash -->         
          <td width="57%"><div align="center">
              <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="405" height="157">
                <param name="movie" value="Flash/cultural_bg.swf">
                <param name="quality" value="high">
                <param name="wmode" value="transparent">
                <embed src="Flash/cultural_bg.swf" width="405" height="157" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
              </object>
          </div></td>
          <!-- 联系我们菜单（通过Javascript实现） -->
          <td width="19%" valign="bottom"><div align="center"><img src="Images/our.gif" name="our" width="120" height="0" border="0" usemap="#ourMap"></div></td>
          <script language="javascript">
			  function ourmove(){
			  	if(our.height<134){
			  	our.height=our.height+9
				setTimeout(ourmove,1)
				}
			  }
			  </script>
        </tr>
		<map name="ourMap">
        <area shape="rect" coords="34,28,97,50" href="lz/about.jsp">
        <area shape="rect" coords="34,56,97,78" href="lz/lz.jsp">
        <area shape="rect" coords="34,86,97,106" href="lz/ly.jsp">
      </map>
      </table>
      <!-- 登录表单、flash、及联系我们菜单 （结束） -->
</td>
  </tr>
</table>
		</td>
      </tr>
    </table>
   
<script language="javascript">
	ourmove();
</script>
</body>
</html>
