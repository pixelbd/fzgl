<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传段验会议纪要...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/stylerjhinsert.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if (form1.bt.value=="")
{ alert("请输入信息标题！");form1.bt.focus();return;}
if (form1.nr.value=="")
{ alert("请输入动态信息情况！");form1.nr.focus();return;}
form1.submit();}
</script>
<style type="text/css">
<!--
   body {
	margin-left: 0px; 
	margin-top: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
   .wordtitle{color: #E54743}
-->
</style>
</head>

<body background="Images/bg2.gif">
  <%        
  request.setCharacterEncoding("gb2312");
         
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String scr="";
  String str="";
  
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
   scr=(String)session.getAttribute("usertrue");
   if (((String)session.getAttribute("deptment")).equals("21")) { str="验收室";}
   if (((String)session.getAttribute("deptment")).equals("22")) { str="技术科";}
   if (((String)session.getAttribute("deptment")).equals("admin")) { str="系统管理员";}     
  }
  %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/scdyhy.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="hygl/uploaddyhtl.jsp" METHOD="POST" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">
      <table width="600" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>
            <td width="150" height="28" class="style1" align="left">&nbsp;上&nbsp;&nbsp;传&nbsp;&nbsp;人&nbsp;:</td>
            <td   align="left" class="style1"><font color="#D43939"><%=scr%></font><input name="scr" type="hidden" value=<%=scr%> ></td>
          </tr>
          <tr>
            <td width="150" height="28" class="style1" align="left">&nbsp;上&nbsp;传&nbsp;部&nbsp;门:</td>
            <td   align="left" class="style1"><font color="#D43939"><%=str%></font><input name="bm" type="hidden" value=<%=str%> ></td>
          </tr>
          <tr>
            <td  height="28" class="style1" align="left">&nbsp;上&nbsp;传&nbsp;时&nbsp;间:</td>
            <td  align="left" class="style1"><font color="#D43939"><%=now%></font><input type="hidden" name="rq" value=<%=now%>></td>
          </tr>
          
	  	  <tr>
	  	    <td height="28" class="style1" align="left">&nbsp;会&nbsp;议&nbsp;时&nbsp;间:</td>
            <td align="left" class="wordtitle">
            <select name="nian" class="Sytle_select"  >
            <option value="2008" >2008年</option>
            <option value="2009">2009年</option>
            <option value="2010">2010年</option>
            <option value="2011">2011年</option>
            <option value="2012">2012年</option>
            <option value="2013">2013年</option>
            </select>
            <select name="yue" class="Sytle_select"  >
            <option value="1" >元月</option>
            <option value="2">2月</option>
            <option value="3">3月</option>
            <option value="4">4月</option>
            <option value="5">5月</option>
            <option value="6">6月</option>
            <option value="7" >7月</option>
            <option value="8">8月</option>
            <option value="9">9月</option>
            <option value="10">10月</option>
            <option value="11">11月</option>
            <option value="12">12月</option>
            </select>
            </td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;选择会议纪要文件:&nbsp;</td>
            <td ><input type="file" name="file1">&nbsp;*&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Submit" type="submit"  class="Style_button" value="上&nbsp;&nbsp;传" onClick="Mycheck()">
                &nbsp;&nbsp;&nbsp;&nbsp;<input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在上传段验会议纪要.</font> <font color="#15600B">注：文件须为Winword格式文件。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>


