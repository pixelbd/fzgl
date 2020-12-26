<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加会议记录...</title>
    
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
{ alert("请输入会议日期！");form1.rq.focus();return;}
if (form1.rt.value=="")
{ alert("请输入会议主题！");form1.rt.focus();return;}
if (form1.cjr.value=="")
{ alert("请输入会议参加人！");form1.cjr.focus();return;}
if (form1.zcr.value=="")
{ alert("请输入主持人！");form1.zcr.focus();return;}
if (form1.nr.value=="")
{ alert("请输入会议情况！");form1.nr.focus();return;}
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
          String meeting="";
          
          if ((request.getParameter("ID1") != null)) {
          
          String tabname = new String(request.getParameter("ID1")); 
          
          if (tabname.equals("cjschzz")) {  meeting =  "郑州检修车间生产分析会"; 	}
          if (tabname.equals("cjschys")) {  meeting =  "月山检修车间生产分析会"; 	}
          if (tabname.equals("cjschly")) {  meeting =  "洛阳检修车间生产分析会"; 	}
          if (tabname.equals("cjschzl")) {  meeting =  "郑州轮轴车间生产分析会"; 	}
          if (tabname.equals("cjlxhzz")) {  meeting =  "郑州检修车间联席会"; 	}
          if (tabname.equals("cjlxhys")) {  meeting =  "月山检修车间联席会"; 	}
          if (tabname.equals("cjlxhly")) {  meeting =  "洛阳检修车间联席会"; 	}
          if (tabname.equals("cjlxhzl")) {  meeting =  "郑州轮轴车间联席会"; 	}
          if (tabname.equals("cjzlhzz")) {  meeting =  "郑州检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhys")) {  meeting =  "月山检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhly")) {  meeting =  "洛阳检修车间质量分析会"; 	}
          if (tabname.equals("cjzlhzl")) {  meeting =  "郑州轮轴车间质量分析会"; 	}
          if (tabname.equals("cjzthzz")) {  meeting =  "郑州检修车间专题分析会"; 	}
          if (tabname.equals("cjzthys")) {  meeting =  "月山检修车间专题分析会"; 	}
          if (tabname.equals("cjzthly")) {  meeting =  "洛阳检修车间专题分析会"; 	}
          if (tabname.equals("cjzthzl")) {  meeting =  "郑州轮轴车间专题分析会"; 	}
          if (tabname.equals("dsch")) {  meeting =  "段生产分析会"; 	}
          if (tabname.equals("dqth")) {  meeting =  "段级其他会议"; 	}
         %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjhyjl.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="hygl/inshytj.jsp" METHOD="POST" name="form1">
      <input name="ID1" type="hidden"  value="<%=tabname%>">
      <table width="559" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
            <td  width="80" height="30" align="center" class="style1">会议名称:</td>
             <td  class="style1" ><%=meeting%></td>
          </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="center">会议主题:</td>
            <td align="left"><input type="text" name="rt" class="Sytle_text" id="rt" size="40" >&nbsp;*</td>
          </tr>
         
          <tr>
            <td   height="28" class="style1" align="center">会议时间:</td>
            <td  valign="center"><input type="text" name="rq" class="Sytle_text" id="rq" size="15" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="28" class="style1" align="center">主&nbsp;持&nbsp;人:</td>
            <td  ><input name="zcr" type="text" class="Sytle_text" id="zcr" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td height="28" align="center"><span class="style1" >参&nbsp;加&nbsp;人:</span></td>
            <td ><input width="10" name="cjr" type="text" class="Sytle_text" id="cjr" size="40" >&nbsp;*</td>
          </tr>
          <% if  ((tabname.equals("dqth"))||(tabname.equals("dsch")))
	  	  {  	
	  	  %>
	  	  <tr> 
           <td height="28" class="style1" align="center">会议地点:</td>
            <td ><input width="20" name="dd" type="text" class="Sytle_text"  size="20">&nbsp;*</td>
          </tr>
          <% } %>
          <tr> 
           <td height="300" class="style1" valign="top" align="center">会议内容:</td>
            <td valign="top" ><textarea  name="nr"  class="Sytle_text"  cols="64" rows="20"></textarea> </td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="保&nbsp;&nbsp;存" onClick="Mycheck()">
                                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="关&nbsp;&nbsp;闭"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">当前正在添加会议记录.</font> <font color="#15600B">注：带<font color="#ff0080">&nbsp;*</font>&nbsp;号的项目为必填项，不可省略。</font></div>
  </td>
  </tr>
</table>
<%  }   %>
  </body>
</html>

