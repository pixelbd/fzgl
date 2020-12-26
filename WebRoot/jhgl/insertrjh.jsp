<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加计划记录...</title>
    
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
if (form1.cx.value=="")
{ alert("请输入车型！");form1.cx.focus();return;}
if (form1.ch.value=="")
{ alert("请输入车号！");form1.ch.focus();return;}
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


<table align="center" width="557" height="610" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/inserttitle.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="jhgl/insertrjhdetl.jsp" METHOD="POST" name="form1">
        <table width="318" height="234"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td width="20" height="27"><div align="center" class="style1">日&nbsp;&nbsp;期&nbsp;</div></td>
            <td width="10" colspan="2"><input name="rq" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" id="rq">&nbsp;*</td>
            <td colspan="2"></td>
            <td width="20" class="style1" >时&nbsp;&nbsp;间&nbsp;</td>
             <td><select name="apm" class="Sytle_select" >
                 <option value="1">上&nbsp;&nbsp;午</option>
		         <option value="2">下&nbsp;&nbsp;午</option>
		         </select>
	  	    </td>
	  	  </tr>
	  	  <tr>
	  	    <td width="20" class="style1">股&nbsp;&nbsp;道</td>
            <td width="10"><input name="dao" type="text" class="Sytle_text" id="dao" size="10"></td>
            <td ></td>
            <td width="20" class="style1">台&nbsp;&nbsp;位</td>
            <td width="10"><input name="wei" type="text" class="Sytle_text" id="wei" size="10"></td>
            <td ></td>
            <td width="20" class="style1">编&nbsp;&nbsp;号</td>
            <td width="10"><input name="hao" type="text" class="Sytle_text" id="hao" size="10"></td>
            <td></td>
          </tr>
          <tr>
            <td height="25" colspan="1"><span class="style1">车&nbsp;&nbsp;型&nbsp;</span></td>
            <td colspan="3"><input width="10" name="cx" type="text" class="Sytle_text" id="cx" size="10">&nbsp;*</td>
            <td colspan="1" class="style1">车&nbsp;&nbsp;号</td>
            <td colspan="3"><input width="20" name="ch" type="text" class="Sytle_text" id="ch" size="20">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="1" class="style1">性&nbsp;&nbsp;质&nbsp;</td>
            <td colspan="3"> <select name="xz" class="Sytle_select">
                          <option value="国铁">国&nbsp;&nbsp;铁</option>
		                  <option value="自备">自&nbsp;&nbsp;备</option>
		         </select></td>
            <td colspan="1" class="style1">修&nbsp;&nbsp;程</td>
            <td colspan="3"><select name="xc" class="Sytle_select">
                          <option value="段修">段&nbsp;&nbsp;修</option>
		                  <option value="入段厂修">入段厂修</option>
		                  <option value="">&nbsp;&nbsp;</option>
		         </select></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">前&nbsp;次&nbsp;厂&nbsp;修&nbsp;单&nbsp;位</span></td>
          <td align="left" colspan="6" ><input width="30" name="qccxdw" type="text" class="Style_text" id="qccxdw"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">前&nbsp;次&nbsp;厂&nbsp;修&nbsp;日&nbsp;期</span></td>
          <td align="left" colspan="6"><input name="qccxrq" type="text" class="Style_text" id="qccxrq"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">前&nbsp;次&nbsp;段&nbsp;修&nbsp;单&nbsp;位</span></td>
          <td align="left" colspan="6"><input name="qcdxdw" type="text" class="Style_text" id="qcdxdw"></td>
          </tr>
          <tr>
          <td height="25" colspan="2" align="left"><span class="style1">前&nbsp;次&nbsp;段&nbsp;修&nbsp;日&nbsp;期</span></td>
          <td align="left" colspan="6"><input name="qcdxrq" type="text" class="Style_text" id="qccxrq"></td>
          </tr>
          <tr>
          <td height="25" colspan="2" align="left"><span class="style1">轮&nbsp;&nbsp;轴</span></td>
          <td align="left" colspan="6"><select name="lz" class="Sytle_select">
                          <option value="RD2">RD2</option>
                          <option value="E轴">E型轴</option>
                          </select></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">转&nbsp;向&nbsp;架</span></td>
          <td align="left" colspan="6"><select  name="zxj" class="Sytle_select">
                          <option value="8A">8A&nbsp;&nbsp;</option>
                          <option value="K1">K1&nbsp;&nbsp;</option>
                          <option value="K2">K2&nbsp;&nbsp;</option>
                          <option value="K4">K4&nbsp;&nbsp;</option>
                          <option value="K5">K5&nbsp;&nbsp;</option>
                          <option value="K6">K6&nbsp;&nbsp;</option>
                          <option value="8B">8B&nbsp;&nbsp;</option>
                          <option value="8AB">8AB&nbsp;&nbsp;</option>
                          <option value="8G">8G&nbsp;&nbsp;</option>
                          <option value="8AG">8AG&nbsp;&nbsp;</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">制&nbsp;动&nbsp;梁</span></td>
          <td align="left" colspan="6"><select name="zdl" class="Sytle_select">
                          <option value="槽钢梁">槽钢梁</option>
                          <option value="防脱梁">防脱梁</option>
                          <option value="L-B">L-B</option>
                          <option value="L-C">L-C</option>
                          <option value="L-A">L-A</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">制&nbsp;动&nbsp;阀</span></td>
          <td align="left" colspan="6"><select name="zdf" class="Sytle_select">
                          <option value="120">120</option>
                          <option value="120-1">120-1</option>
                          <option value="103">103</option>
                          <option value="GK">GK</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">改&nbsp;造&nbsp;项&nbsp;目</span></td>
          <td align="left" colspan="6"><select name="qz" class="Sytle_select">
                          <option value="">&nbsp;</option>
                          <option value="K2改造">K2改造</option>
                          <option value="完善改造">完善改造</option>
                          <option value="改120阀">改120阀</option>
                          <option value="改闸调器">改闸调器</option>
                          <option value="改闸、改K2">改闸改K2</option>
                          <option value="改K2、改120阀">K2改造、改120阀</option>
                          <option value="改K2、改120、改闸">改K2、改120、改闸</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">车&nbsp;&nbsp;&nbsp;钩</span></td>
          <td align="left" colspan="6"><select name="cg" class="Sytle_select">
                          <option value="13上">13上</option>
                          <option value="13下">13下</option>
                          <option value="16号">16号</option>
                          <option value="17号">17号</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">剩&nbsp;余&nbsp;保&nbsp;证&nbsp;期</span></td>
           <td align="left" colspan="6"><input name="bzq" type="text" class="Style_text" id="bzq" size="10"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">HMIS&nbsp;上&nbsp;报&nbsp;时&nbsp;间</span></td>
          <td align="left" colspan="6"><input name="hmisrq" type="text" class="Style_text" ondblclick="loadCalendar(this)" id="hmisrq" size="10"></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">部&nbsp;&nbsp;令</span></td>
          <td align="left" colspan="6"><input size="10" name="bl" type="text" class="Style_text" id="bz"></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">备&nbsp;&nbsp;注</span></td>
          <td align="left" colspan="6"><input size="40" name="bz" type="text" class="Style_text" id="bz"></td>
          </tr>
         <tr><td height="15"></td></tr>
          <tr>
            <td colspan="8" ><div align="center">
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
   <%if (chej.equals("zz")) { %>郑州<%} 
   else {if (chej.equals("ys")) { %>月山<%} 
   else {if (chej.equals("ly")) { %>洛阳<%} 
   else {} }}%>检修车间日生产计划...</font></div>
  <div><font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略，如入线车辆暂未确定可在车型、车号栏内输入&ldquo;<font color="#ff0080">待定</font>&rdquo;。</font></div>
  </td>
  </tr>
</table>

  </body>
</html>
