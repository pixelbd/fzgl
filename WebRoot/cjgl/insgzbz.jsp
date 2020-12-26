<%@ page language="java" import="" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加工作质量标准...</title>
    
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
   body {
	margin-left: 0px; 
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
-->
</style>
<link href="Css/stylerjhinsert.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if (form1.bz.value=="")
{ 
alert("请输入工作质量标准描述！");
form1.bz.focus();
return;
}

form1.submit();
}
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

<body background="Images/bg2.gif">
<%       request.setCharacterEncoding("gb2312");  %>

<table align="center" width="557" height="260" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjbz.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="cjgl/insgzbztl.jsp" METHOD="POST" name="form1">
       <table width="559"  align="center" cellpadding="-2" cellspacing="0">
          <tr> <td  height="30" class="style1" align="left">工作质量标准描述:</td></tr>
          <tr> <td align="center"><input name="bz" type="text" class="Sytle_text" size="80">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="left">扣分情况:&nbsp;&nbsp;&nbsp;&nbsp;<input name="kf" type="text" class="Sytle_text" size="5">&nbsp;*</td>
          </tr>
          <tr>
            <td  height="30"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭" onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加工作质量标准信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

