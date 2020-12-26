<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加问题库记录...</title>
    
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
if (form1.wt.value=="")
{ alert("请输入问题描述！");form1.wt.focus();return;}
if (form1.cs.value=="")
{ alert("请输入采取措施！");form1.cs.focus();return;}
if (form1.fzr.value=="")
{ alert("请输入负责人！");form1.fzr.focus();return;}
if (form1.tcrq.value=="")
{ alert("请输入提出问题日期！");form1.tcrq.focus();return;}
if (form1.wtlb.value=="")
{ alert("请输入问题类别！");form1.wtlb.focus();return;}
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
         request.setCharacterEncoding("gb2312");
          String wtkname="";
          
          if ((request.getParameter("ID1") != null)) {
          
          String tabname = new String(request.getParameter("ID1")); 
          
          if (tabname.equals("wtkzz")) {  wtkname =  "郑州检修车间问题库"; 	}
          if (tabname.equals("wtkys")) {  wtkname =  "月山检修车间问题库"; 	}
          if (tabname.equals("wtkly")) {  wtkname =  "洛阳检修车间问题库"; 	}
          if (tabname.equals("wtkzl")) {  wtkname =  "郑州轮轴车间问题库"; 	}
          if (tabname.equals("dwtk")) {  wtkname =  "段级问题库"; 	}
          if (tabname.equals("zxwtk")) {  wtkname =  "专项问题库"; 	}
          
         %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjwtkjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="wtk/inswtktj.jsp" METHOD="POST" name="form1">
      <input name="ID1" type="hidden"  value="<%=tabname%>">
      <table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
             <td colspan="2"  height="40" align="center"><%=wtkname%></td>
          </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="center" valign="top">问题描述:</td>
            <td align="left"><textarea  name="wt"  class="Sytle_text"  cols="64" rows="15"></textarea></td>
          </tr>
         
          <tr>
            <td   height="28" class="style1" align="center">措&nbsp;&nbsp;&nbsp;&nbsp;施:</td>
            <td  valign="center"><input type="text" name="cs" class="Sytle_text"  size="40" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr><tr>  
            <td  height="28" class="style1" align="center">问题分类:</td>
            <td><select name="wtlb" class="Sytle_select">
                  <option value="1" >设备&nbsp;</option>
                  <option value="2" >工艺执行&nbsp;</option>
                  <option value="3" >安全&nbsp;</option>
                  <option value="4" >其他&nbsp;</option>
                </select>&nbsp;*
           </td>
          </tr>
          <tr>  
            <td  height="28" class="style1" align="center">负&nbsp;责&nbsp;人:</td>
            <td  ><input name="fzr" type="text" class="Sytle_text" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td height="28" align="center"><span class="style1" >提出时间:</span></td>
            <td ><input width="10" name="tcrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr> 
           <td height="28" class="style1" align="center">解决时间:</td>
            <td ><input width="20" name="jjrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)"></td>
          </tr>
          <tr> 
           <td height="28" class="style1" valign="top" align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注:</td>
            <td valign="top" ><input width="20" name="bz" type="text" class="Sytle_text"  size="70"></td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="重&nbsp;&nbsp;置 ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加问题库问题.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<%  }   %>
  </body>
</html>

