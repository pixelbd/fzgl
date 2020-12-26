<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加配件已索赔记录...</title>
    
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
if (form1.rq.value=="")
{ alert("请输入日期！");form1.rq.focus();return;}
if (form1.pjmc.value=="")
{ alert("请输入配件名称！");form1.pjmc.focus();return;}
if (form1.zzcdh.value=="")
{ alert("请输入制造厂代号！");form1.zzcdh.focus();return;}

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

<body background="Images/bg2.gif">
<script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
}
</script>
          
 <% 
    String chej = "zz";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    
 %>
<table align="center" width="557" height="500" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="470" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjysppjjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="pjgl/insertysppjdetl.jsp" METHOD="POST" name="form1"><div align="left"> 
        </div><table width="480" height="286"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr   height="32" align="left">
            <td  align="left" class="style1">日&nbsp;&nbsp;期&nbsp;</td>
            <td colspan="3"  ><input name="rq" type="text" class="Sytle_text" id="rq" onClick="loadCalendar(this)">&nbsp;*</td>
            
	  	  </tr>
	  	  <tr   height="32">
	  	    <td  class="style1">配件名称</td>
            <td ><input name="pjmc" type="text" class="Sytle_text" id="pjmc" size="10">&nbsp;*</td>
            <td  class="style1">配件型号</td>
            <td ><input name="xinghao" type="text" class="Sytle_text" id="xinghao" size="10">&nbsp;*</td>
           </tr>
          <tr  height="32">
            <td colspan="1" class="style1">制造厂代号</td>
            <td colspan="1"><input width="20" name="zzcdh" type="text" class="Sytle_text" id="zzcdh" size="20">&nbsp;*</td>
            <td colspan="1" class="style1">制造时间</td>
            <td colspan="1"><input width="20" name="zzsj" type="text" class="Sytle_text" id="zzcdh" size="20">&nbsp;</td>
         </tr>
         <tr  height="32">
            <td colspan="1" class="style1">数&nbsp;量</td>
            <td colspan="3"><input width="20" name="shuliang" type="text" class="Sytle_text" id="shuliang" size="20">&nbsp;*</td>
         </tr>
          <tr  height="32">
          <td height="25" colspan="1" align="left"><span class="style1">所属部位</span><br></td>
          <td align="left" colspan="3" ><select name="bw" class="Sytle_select">
                          <option value="轮轴">轮轴</option>
                          <option value="转向架">转向架</option>
                          <option value="钩缓">钩缓</option>
                          <option value="基础制动">基础制动</option>
                          <option value="空气制动">空气制动</option>
                          <option value="车体">车体</option>
                          </select></td>
          </tr>
          <tr height="32">
          <td height="25" colspan="1" align="left"><span class="style1">备&nbsp;注</span></td>
          <td align="left" colspan="3"><input name="beizhu" type="text" class="Style_text" id="beizhu"></td>
          </tr>
           <tr height="32">
            <td colspan="4" ><div align="center">
            <input size="40" name="cj" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="Button" type="button" class="Style_button" value="提&nbsp;&nbsp;交" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td>
  <div><font color="#D43939">当前正在输入：
   <%if (chej.equals("zz")) { %>郑州检修车间<%} 
   else {if (chej.equals("ys")) { %>月山郑州检修车间<%} 
   else {if (chej.equals("ly")) { %>洛阳郑州检修车间<%} 
   else {} }}%>配件已索赔情况...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略.</font></div>
  </td>
  </tr>
</table>

  </body>
</html>
