<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="java.io.FileReader"/>
<jsp:directive.page import="java.io.FileWriter"/>
<jsp:directive.page import="java.io.File"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>main page</title>
    
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
      .word_yellow {
	 	font-size: 9pt;
	  	color: #ffffff; 
	  	}
	  .word_blue{
	  font-size: 9pt;
	  	color: #363E67;
	  }
	  .word_gray{
	  font-size: 9pt;
	  	color: #CCCCCC;
	  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体;}
     INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
.STYLE2 {color: #FFFFFF}
    -->  
     </style>  
    
<SCRIPT LANGUAGE="javaScript">

var bsYear;
var bsDate;
var bsWeek;
var arrLen=10;	//数组长度
var sValue=0;	//当年的秒数
var dayiy=0;	//当年第几天
var miy=0;	//月份的下标
var iyear=0;	//年份标记
var dayim=0;	//当月第几天
var spd=86400;	//每天的秒数
var year1999="30;29;29;30;29;29;30;29;30;30;30;29";	//354
var year2000="30;30;29;29;30;29;29;30;29;30;30;29";	//354
var year2001="30;30;29;30;29;30;29;29;30;29;30;29;30";	//384
var year2002="30;30;29;30;29;30;29;29;30;29;30;29";	//354
var year2003="30;30;29;30;30;29;30;29;29;30;29;30";	//355
var year2004="29;30;29;30;30;29;30;29;30;29;30;29;30";	//384
var year2005="29;30;29;30;29;30;30;29;30;29;30;29";	//354
var year2006="30;29;30;29;30;30;29;29;30;30;29;29;30";
var year2007="30;29;30;29;30;30;29;29;30;30;29;29;30";
var year2008="30;29;30;29;30;30;29;29;30;30;29;29;30";
var month1999="正月;二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月";
var month2001="正月;二月;三月;四月;闰四月;五月;六月;七月;八月;九月;十月;十一月;十二月";
var month2004="正月;二月;闰二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月";
var month2006="正月;二月;三月;四月;五月;六月;七月;闰七月;八月;九月;十月;十一月;十二月";
var month2007="正月;二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月";
var month2008="正月;二月;三月;四月;五月;六月;七月;闰四月;闰四月;八月;九月;十月;十一月;十二月";
var Dn="初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";
var Ys=new Array(arrLen);
var Yn=new Array(arrLen); 

Ys[0]=919094400;Ys[1]=949680000;Ys[2]=980265600;
Ys[3]=1013443200;Ys[4]=1044028800;Ys[5]=1074700800;
Ys[6]=1107878400;Ys[7]=1138464000;
  
//农历年的名称
Yn[0]="己卯年";Yn[1]="庚辰年";Yn[2]="辛巳年";
Yn[3]="壬午年";Yn[4]="癸未年";Yn[5]="甲申年";
Yn[6]="乙酉年";Yn[7]="戊子年";Yn[8]="丁亥年";Yn[9]="戊子年";

var D=new Date();
var yy=D.getYear();
var mm=D.getMonth()+1;
var dd=D.getDate();
var ww=D.getDay();

if (ww==0) ww="<font color=RED>星期日</font>";
if (ww==1) ww="星期一";
if (ww==2) ww="星期二";
if (ww==3) ww="星期三";
if (ww==4) ww="星期四";
if (ww==5) ww="星期五";
if (ww==6) ww="<font color=green>星期六</font>";
    ww=ww;
var ss=parseInt(D.getTime() / 1000);

if (yy<100) yy="19"+yy;

for (i=0;i<arrLen;i++)
if (ss>=Ys[i]) {
	iyear=i;
	sValue=ss-Ys[i];    //当年的秒数
	}
	
dayiy=parseInt(sValue/spd)+1;    //当年的天数

var dpm=year1999;

if (iyear==1) dpm=year2000;
if (iyear==2) dpm=year2001;
if (iyear==3) dpm=year2002;
if (iyear==4) dpm=year2003;
if (iyear==5) dpm=year2004;
if (iyear==6) dpm=year2005;
if (iyear==7) dpm=year2006;
if (iyear==8) dpm=year2008;
if (iyear==9) dpm=year2009;

dpm=dpm.split(";");

var Mn=month1999;

if (iyear==2) Mn=month2001;
if (iyear==5) Mn=month2004;
if (iyear==7) Mn=month2008;

Mn=Mn.split(";");
Dn=Dn.split(";");
dayim=dayiy;

var total=new Array(13);

total[0]=parseInt(dpm[0]);
for (i=1;i<dpm.length-1;i++) total[i]=parseInt(dpm[i])+total[i-1];
for (i=dpm.length-1;i>0;i--)
if (dayim>total[i-1]){
	dayim=dayim-total[i-1];
	miy=i;
	}
	
bsWeek=ww;
bsDate=yy+"年"+mm+"月";
bsDate2=dd;
bsYear="农历"+Yn[iyear];
bsYear2=Mn[miy]+Dn[dayim-1];
if (ss>=Ys[7]||ss<Ys[0]) bsYear=Yn[7];
function time(){
document.write("<table border='1' style='font-size:9pt; font-family:Tahoma;' cellspacing='0' width='100' bordercolor='#DFE1EB'  height='103' cellpadding='0'");
document.write("<tr><td align='center' style='border: 0 solid #9DAFE4;padding-top:4px'><b><font style='font-family: Verdana;color:#0979C4'>"+bsDate+"</font><div style='font-family: Arial Black;font-size:18pt;color:#FF8040'>"+bsDate2+"</div><div style='FONT-SIZE: 10.5pt;color:#ff0000'>");
document.write(bsWeek+"</div>"+"</b><font color=#9342B5>");
document.write(bsYear+"</div>");
document.write("</table>");
}
</script>   
  </head>
<%!long count;%>
<%
File file=new File(getServletContext().getRealPath("count"));
FileReader reader=new FileReader(file);
char[] cbuf=new char[(int)file.length()];
reader.read(cbuf);
reader.close();
count=Long.valueOf(new String(cbuf)).longValue()+1;
FileWriter writer=new FileWriter(file);
writer.write(new String(count+""));
writer.close();
%> 
  <body class="body" bgcolor="#ffffff">
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
  <table width="871" border="0" cellpadding="-2" cellspacing="-2"   >
  <!-- 日历 天气 用户管理 -->
  <tr height="133">
      <td align="center" width="101" height="133" bgcolor="#ffffff">
      <table width="100%" border="0" cellpadding="-2" cellspacing="-2" >
      <tr height="30"><td bgcolor="#0075C0" align="center" class="tableBorder">
      <div ><img src="Images/wnl.gif" width="16" height="16">&nbsp;<a href="#" onClick="Javascript:window.open('a.htm','','width=780,height=450')" >查看万年历</a>&nbsp;</div></td>
      <tr height="103"><td  bgcolor="#ffffff" >
      <div ><SCRIPT LANGUAGE="JavaScript">time()</SCRIPT></div></td></tr>
      </table>
      </td>
      <td height="133" width="651" align="center" bgcolor="#ffffff" >
      <jsp:include page="weather.jsp"/>
      </td> 
      <td  width="119" height="133"  valign="top" align="center" bgcolor="#ffffff">
      <div>
      <table width="119" height="133" background="Images/userset.gif" class="tableBorder" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
      <tr><td width="119" height="54" align="left" valign="bottom" ><marquee scrollamount="1" scrolldelay="7" direction="left" onMouseOver="this.stop();" onMouseOut="this.start();">
            <img src="Images/run.gif" border="0">辅助管理系统不开放用户注册,要添加新用户请与系统管理员联系,053-42564 刘志.
            </marquee></td></tr> 
      <tr> <% if (islog) { %>
          <td width="119" height="29" align="center" valign="center" ><img src="Images/thaw.gif" border="0">用户：<a href="updatekey.jsp" class="word_blue">修改密码</a></td> <% }
          else { %> <td width="110" height="29" align="center" valign="center" class="word_gray"><img src="Images/thaw1.gif" border="0" >用户：修改密码</td> <% } %></tr>
      <tr> <% 
          if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")||((String)session.getAttribute("zw")).equals("cjadmin")))
          { %><td width="119" height="25" align="center" valign="center" ><img src="Images/enforce.gif" border="0">系统：
          <a href="index.jsp" onClick="Javascript:window.open('insertuser.jsp?','','width=562,height=335')"  class="word_blue">添加用户</a></td> <% }
          else { %> <td width="110" height="25" align="center" valign="center" class="word_gray"><img src="Images/enforce1.gif" border="0" >系统：添加用户</td> <% } %>
            </tr>
      <tr height="31"></tr>
      </table></div>
      </td>
      
  </tr>
  <tr>
      <td colspan="3" width="871" align="center" bgcolor="#ffffff">
      <hr width="99%" color="#F1F1F1">
      </td>
  </tr>
  </table>
  <!-- 日期 天气 用户管理 结束 -->
   <!-- 加入通知 -->
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td >
      <div>
      <jsp:include flush="true" page="notice.jsp"></jsp:include>
      </div>
      </td>
   </tr>

  </table>
  <!-- 站点刷新统计 -->
  <%
        String backstr="";
		String strnum=Long.toString(count);
 		int length=strnum.length();
		int i=0;
 		while(i<length){
 			backstr+="<img src='Images\\num\\"+strnum.charAt(i)+".gif'/>";
 			i++;
 		}
		backstr="您是本站第 "+backstr+" 位访客！";
  
   %>
  <table width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
  <tr> <td height="25" align="center" valign="middle" class=word_blue ><%=backstr%></td></tr>
  </table>
  <!-- 统计结束 -->
  </body>
</html>
