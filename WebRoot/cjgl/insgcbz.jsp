<%@ page language="java" import="" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加工程质量标准...</title>
    
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
alert("请输入标准描述！");
form1.bz.focus();
return;
}
if (form1.kf.value=="")
{ 
alert("请输入扣分情况！");
form1.kf.focus();
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
      <form ACTION="cjgl/insgcbztl.jsp" METHOD="POST" name="form1">
      <table width="559" height="86"  border="0" align="center" cellpadding="-2" cellspacing="0">
          
          <tr>  
            <td  height="30" class="style1" align="center">工程质量标准描述:</td>
            <td  ><input name="bz" type="text" class="Sytle_text" size="80">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="center">描述分类:</td> 
          <td><select name="fl" class="Sytle_select">
                  <option value="转向架检修" >转向架检修&nbsp;</option>
                  <option value="底体架检修" >底体架检修&nbsp;</option>
                  <option value="现车制动检修" >现车制动检修&nbsp;</option>
                  <option value="制动梁检修" >制动梁检修&nbsp;</option>
                  <option value="钩缓检修" >钩缓检修&nbsp;</option>
                  <option value="空气制动检修" >空气制动检修&nbsp;</option>
                  <option value="配件检修" >配件检修&nbsp;</option>
                  <option value="轮对检修" >轮对检修&nbsp;</option>
                  <option value="轴承检修" >轴承检修&nbsp;</option>
                  <option value="其他检修设备" >其他检修设备&nbsp;</option>
                  <option value="提速改造" >提速改造&nbsp;</option>
                  <option value="70t级检修" >70t级检修&nbsp;</option>
                </select>
          </td>
          <tr>  
            <td  height="30" class="style1" align="center">扣分情况:</td>
            <td  ><input name="kf" type="text" class="Sytle_text" size="5">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="center">加分情况:</td>
            <td  ><input name="jf" type="text" class="Sytle_text" size="5" value="0">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button"  value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加工程质量标准信息.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

