<%@ page language="java" import="" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加通知通告...</title>
    
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
if (form1.yxrq.value=="")
{ alert("请输入有效日期！");form1.yxrq.focus();return;}

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
-->
</style>
</head>

<body background="Images/bg2.gif" >
    <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
  </script>
<% 
  request.setCharacterEncoding("gb2312");  

  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String fbr="";
  
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
   fbr=(String)session.getAttribute("usertrue");
  }
   
%>
<table align="center" width="100%" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td align="center"  width="100%" valign="top"><img width="557" height="70" src="Images/tjtztg.gif" border="0"></td>
  </tr>
  <tr>
    <td><div>      
      <form ACTION="dtxx/instztj.jsp" METHOD="POST" name="form1">
      <table width="100%" height="240"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>  
            <td  height="30" class="style1" align="center">&nbsp;&nbsp;发&nbsp;布&nbsp;人:</td>
            <td  class="style1"><%=fbr%></td>
            <input type="hidden" value=<%=fbr%> name="fbr">
          </tr>
          <tr>
            <td   height="30" class="style1" align="center">&nbsp;&nbsp;发布日期:</td>
            <td  class="style1"><%=now%></td>
            <input type="hidden" value=<%=now%> name="rq">
          </tr>
          <tr>
            <td   height="30" class="style1" align="center">&nbsp;&nbsp;有效日期:</td>
            <td  valign="center"><input type="text" name="yxrq" class="Sytle_text" id="rq" size="15" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr>
            <td height="30" align="center"><span class="style1" >&nbsp;&nbsp;批&nbsp;准&nbsp;人:</span></td>
            <td ><input width="10" name="pzr" type="text" class="Sytle_text" id="pzr" size="14" >&nbsp;*</td>
          </tr>
          <tr>
	  	    <td  height="30" class="style1" align="center">&nbsp;&nbsp;通知标题:</td>
            <td align="left"><input type="text" name="bt" class="Sytle_text" id="rt" size="40" >&nbsp;*</td>
          </tr>
          <tr> 
           <td height="160" class="style1" valign="top" align="center">&nbsp;&nbsp;详细内容:</td>
            <td valign="top" ><textarea  name="nr"  class="Sytle_text"  cols="66" rows="10"></textarea> </td>
          </tr>
          <tr>
            <td colspan="2" height="28"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form>
      </div>
      </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">&nbsp; 当前正在添加通知、通告.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

