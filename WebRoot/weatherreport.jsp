<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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

    <style type="text/css">
     <!--
         .body {
	     margin-left: 0px; 
	     margin-top: 0px;
               }
         .style1 { color: #334094 }
         .style2 { color: #669999 }
      -->
    </style>
    <script language="javascript">
      function Mycheck()
      {
         if (form1.rq.value=="")
         { alert("���������ڣ�");  form1.rq.focus();  return; } 
         if (form1.zzlow.value=="")
         { alert("������֣�ݵ��£�");  form1.zzlow.focus();  return; } 
         if (form1.lylow.value=="")
         { alert("�������������£�");  form1.lylow.focus();  return; } 
         if (form1.yslow.value=="")
         { alert("��������ɽ���£�");  form1.yslow.focus();  return; } 
         if (form1.xxlow.value=="")
         { alert("������������£�");  form1.xxlow.focus();  return; }
         if (form1.zzhigh.value=="")
         { alert("������֣�ݸ��£�");  form1.zzhigh.focus();  return; }
         if (form1.lyhigh.value=="")
         { alert("�������������£�");  form1.lyhigh.focus();  return; }
         if (form1.yshigh.value=="")
         { alert("��������ɽ���£�");  form1.yshigh.focus();  return; }
         if (form1.xxhigh.value=="")
         { alert("������������£�");  form1.xxhigh.focus();  return; }
         if (form1.weatherzz1.value=="")
         { alert("������֣���������1��");  form1.weatherzz1.focus();  return; }
         if (form1.weatherly1.value=="")
         { alert("�����������������1��");  form1.weatherly1.focus();  return; } 
         if (form1.weatherys1.value=="")
         { alert("��������ɽ�������1��");  form1.weatherys1.focus();  return; }
         if (form1.weatherxx1.value=="")
         { alert("�����������������1��");  form1.weatherxx1.focus();  return; }
          form1.submit();}
      </script>
</head>

<body background="Images/bg2.gif">
<%    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
      java.util.Date today=new java.util.Date();
      String now = formatter.format(today); 
%>
<table align="center" width="600" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" >
  <tr>
    <td width="557" height="70" valign="top"><div align="center"> 
    </div><table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" >
      <tr>
        <td align="left"><img src="Images/weather2.gif"><font size="5" face="����_GB2312" color="#ff8000">&nbsp;<font color="#0000a0">��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��</font></font></td>
      </tr>
    </table>      
      <form action="weatherinsdetl.jsp" method="POST" name="form1"><div align="left"> 
        </div><table width="600" height="230"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr align="left">
             <td  height="27" align="left" class="style1">��&nbsp;&nbsp;�� </td>
             <td colspan="3" class="style1" ><input type="text" name="rq" id="rq" class="Sytle_text" id="rq" value="<%=now%>">&nbsp;*</td>
	  	  </tr>
	  	  <tr>
	  	    <td height="27"  class="style1">֣������¶�</td>
            <td align="left"><input type="text" name="zzlow" class="Sytle_text" id="zzlow"  size="8">&nbsp;*</td>
            <td class="style1">��������¶�</td>
            <td valign="center"><input type="text" name="lylow" class="Sytle_text" id="lylow"  size="8">&nbsp;*</td>
            <td class="style1">��ɽ����¶�</td>
            <td><input name="yslow" type="text" class="Sytle_text" id="yslow"  size="8">&nbsp;*</td>
            <td class="style1">��������¶�</td>
            <td><input name="xxlow" type="text" class="Sytle_text" id="xxlow"  size="8">&nbsp;*</td>
          </tr>
          <tr>
	  	    <td height="27" class="style1">֣������¶�</td>
            <td align="left"><input type="text" name="zzhigh" class="Sytle_text"  size="8">&nbsp;*</td>
            <td   class="style1">��������¶�</td>
            <td valign="center"><input type="text" name="lyhigh" class="Sytle_text"  size="8">&nbsp;*</td>
            <td class="style1">��ɽ����¶�</td>
            <td><input type="text" name="yshigh" class="Sytle_text"  size="8">&nbsp;*</td>
            <td class="style1">��������¶�</td>
            <td><input type="text" name="xxhigh" class="Sytle_text"  size="8">&nbsp;*</td>
          </tr>
          <tr>
           <td height="27" align="left" ><span class="style1">֣������1</span></td>
          <td align="left"  ><select name="weatherzz1" class="Sytle_select">
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select>&nbsp;*</td>
          <td height="27"  align="left" ><span class="style1">֣������2</span></td>
          <td align="left"  ><select name="weatherzz2" class="Sytle_select">
                          <option value="">	</option>
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select></td>
          <td colspan="2"></td>
          </tr>
          <tr>
          <td height="35"  align="left" ><span class="style1">��������1</span></td>
          <td align="left"><select name="weatherly1" class="Sytle_select">
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select>&nbsp;*</td>
          <td height="35"  align="left" ><span class="style1">��������2</span></td>
          <td align="left"><select name="weatherly2" class="Sytle_select">
                          <option value=""></option>
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select></td>
          <td colspan="2"></td>
          </tr>
          <tr>
          <td height="35"  align="left" ><span class="style1">��ɽ����1</span></td>
          <td align="left"   ><select name="weatherys1" class="Sytle_select">
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select>&nbsp;*</td>
          <td height="35"  align="left" ><span class="style1">��ɽ����2</span></td>
          <td align="left"  ><select name="weatherys2" class="Sytle_select">
                          <option value=""></option>
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select></td>
          <td colspan="2"></td>
          </tr>
          <tr>
          <td height="35"  align="left" ><span class="style1">��������1</span></td>
          <td align="left"   ><select name="weatherxx1" class="Sytle_select">
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select>&nbsp;*</td>
          <td height="35"  align="left" ><span class="style1">��������2</span></td>
          <td align="left"  ><select name="weatherxx2" class="Sytle_select">
                          <option value=""></option>
                          <option value="1">��</option>
                          <option value="2">����</option>
                          <option value="3">��</option>
                          <option value="4">С��</option>
                          <option value="5">����</option>
                          <option value="6">����</option>
                          <option value="7">����</option>
                          <option value="8">����</option>
                          <option value="9">��</option>
                          <option value="10">��</option>
                          <option value="11">Сѩ</option>
                          <option value="12">��ѩ</option>
                          <option value="13">��ѩ</option>
                          <option value="14">��ɳ</option>
                          <option value="15">����</option>
                          <option value="16">��</option>
                          <option value="17">���ѩ</option>
                          </select></td>
          <td colspan="2"></td>
          </tr>
         <tr>
            <td colspan="7" ><div align="center">
            <input  type="button" class="Style_button" value="��&nbsp;&nbsp;��" onclick="Mycheck()">
            <input  type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
            <input  type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��" onClick="javascrip:window.close()">
            </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td>
  <div><font color="#D43939">��ǰ����������������������</div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
 </table>
  </body>
</html>
