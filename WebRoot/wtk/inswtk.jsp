<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���������¼...</title>
    
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
{ alert("����������������");form1.wt.focus();return;}
if (form1.cs.value=="")
{ alert("�������ȡ��ʩ��");form1.cs.focus();return;}
if (form1.fzr.value=="")
{ alert("�����븺���ˣ�");form1.fzr.focus();return;}
if (form1.tcrq.value=="")
{ alert("����������������ڣ�");form1.tcrq.focus();return;}
if (form1.wtlb.value=="")
{ alert("�������������");form1.wtlb.focus();return;}
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
          
          if (tabname.equals("wtkzz")) {  wtkname =  "֣�ݼ��޳��������"; 	}
          if (tabname.equals("wtkys")) {  wtkname =  "��ɽ���޳��������"; 	}
          if (tabname.equals("wtkly")) {  wtkname =  "�������޳��������"; 	}
          if (tabname.equals("wtkzl")) {  wtkname =  "֣�����ᳵ�������"; 	}
          if (tabname.equals("dwtk")) {  wtkname =  "�μ������"; 	}
          if (tabname.equals("zxwtk")) {  wtkname =  "ר�������"; 	}
          
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
	  	    <td  height="28" class="style1" align="center" valign="top">��������:</td>
            <td align="left"><textarea  name="wt"  class="Sytle_text"  cols="64" rows="15"></textarea></td>
          </tr>
         
          <tr>
            <td   height="28" class="style1" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ʩ:</td>
            <td  valign="center"><input type="text" name="cs" class="Sytle_text"  size="40" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr><tr>  
            <td  height="28" class="style1" align="center">�������:</td>
            <td><select name="wtlb" class="Sytle_select">
                  <option value="1" >�豸&nbsp;</option>
                  <option value="2" >����ִ��&nbsp;</option>
                  <option value="3" >��ȫ&nbsp;</option>
                  <option value="4" >����&nbsp;</option>
                </select>&nbsp;*
           </td>
          </tr>
          <tr>  
            <td  height="28" class="style1" align="center">��&nbsp;��&nbsp;��:</td>
            <td  ><input name="fzr" type="text" class="Sytle_text" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td height="28" align="center"><span class="style1" >���ʱ��:</span></td>
            <td ><input width="10" name="tcrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr> 
           <td height="28" class="style1" align="center">���ʱ��:</td>
            <td ><input width="20" name="jjrq" type="text" class="Sytle_text"  size="10" onDBLClick="loadCalendar(this)"></td>
          </tr>
          <tr> 
           <td height="28" class="style1" valign="top" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;ע:</td>
            <td valign="top" ><input width="20" name="bz" type="text" class="Sytle_text"  size="70"></td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ����������������.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<%  }   %>
  </body>
</html>

