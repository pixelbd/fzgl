<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ӽƻ���¼...</title>
    
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
{ alert("���������ڣ�");form1.rq.focus();return;}
if (form1.cx.value=="")
{ alert("�����복�ͣ�");form1.cx.focus();return;}
if (form1.ch.value=="")
{ alert("�����복�ţ�");form1.ch.focus();return;}
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
            <td width="20" height="27"><div align="center" class="style1">��&nbsp;&nbsp;��&nbsp;</div></td>
            <td width="10" colspan="2"><input name="rq" type="text" class="Sytle_text" ondblclick="loadCalendar(this)" id="rq">&nbsp;*</td>
            <td colspan="2"></td>
            <td width="20" class="style1" >ʱ&nbsp;&nbsp;��&nbsp;</td>
             <td><select name="apm" class="Sytle_select" >
                 <option value="1">��&nbsp;&nbsp;��</option>
		         <option value="2">��&nbsp;&nbsp;��</option>
		         </select>
	  	    </td>
	  	  </tr>
	  	  <tr>
	  	    <td width="20" class="style1">��&nbsp;&nbsp;��</td>
            <td width="10"><input name="dao" type="text" class="Sytle_text" id="dao" size="10"></td>
            <td ></td>
            <td width="20" class="style1">̨&nbsp;&nbsp;λ</td>
            <td width="10"><input name="wei" type="text" class="Sytle_text" id="wei" size="10"></td>
            <td ></td>
            <td width="20" class="style1">��&nbsp;&nbsp;��</td>
            <td width="10"><input name="hao" type="text" class="Sytle_text" id="hao" size="10"></td>
            <td></td>
          </tr>
          <tr>
            <td height="25" colspan="1"><span class="style1">��&nbsp;&nbsp;��&nbsp;</span></td>
            <td colspan="3"><input width="10" name="cx" type="text" class="Sytle_text" id="cx" size="10">&nbsp;*</td>
            <td colspan="1" class="style1">��&nbsp;&nbsp;��</td>
            <td colspan="3"><input width="20" name="ch" type="text" class="Sytle_text" id="ch" size="20">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="1" class="style1">��&nbsp;&nbsp;��&nbsp;</td>
            <td colspan="3"> <select name="xz" class="Sytle_select">
                          <option value="����">��&nbsp;&nbsp;��</option>
		                  <option value="�Ա�">��&nbsp;&nbsp;��</option>
		         </select></td>
            <td colspan="1" class="style1">��&nbsp;&nbsp;��</td>
            <td colspan="3"><select name="xc" class="Sytle_select">
                          <option value="����">��&nbsp;&nbsp;��</option>
		                  <option value="��γ���">��γ���</option>
		                  <option value="">&nbsp;&nbsp;</option>
		         </select></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">ǰ&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;λ</span></td>
          <td align="left" colspan="6" ><input width="30" name="qccxdw" type="text" class="Style_text" id="qccxdw"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">ǰ&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��</span></td>
          <td align="left" colspan="6"><input name="qccxrq" type="text" class="Style_text" id="qccxrq"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">ǰ&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;λ</span></td>
          <td align="left" colspan="6"><input name="qcdxdw" type="text" class="Style_text" id="qcdxdw"></td>
          </tr>
          <tr>
          <td height="25" colspan="2" align="left"><span class="style1">ǰ&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��</span></td>
          <td align="left" colspan="6"><input name="qcdxrq" type="text" class="Style_text" id="qccxrq"></td>
          </tr>
          <tr>
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;&nbsp;��</span></td>
          <td align="left" colspan="6"><select name="lz" class="Sytle_select">
                          <option value="RD2">RD2</option>
                          <option value="E��">E����</option>
                          </select></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">ת&nbsp;��&nbsp;��</span></td>
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
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;��&nbsp;��</span></td>
          <td align="left" colspan="6"><select name="zdl" class="Sytle_select">
                          <option value="�۸���">�۸���</option>
                          <option value="������">������</option>
                          <option value="L-B">L-B</option>
                          <option value="L-C">L-C</option>
                          <option value="L-A">L-A</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;��&nbsp;��</span></td>
          <td align="left" colspan="6"><select name="zdf" class="Sytle_select">
                          <option value="120">120</option>
                          <option value="120-1">120-1</option>
                          <option value="103">103</option>
                          <option value="GK">GK</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;��&nbsp;��&nbsp;Ŀ</span></td>
          <td align="left" colspan="6"><select name="qz" class="Sytle_select">
                          <option value="">&nbsp;</option>
                          <option value="K2����">K2����</option>
                          <option value="���Ƹ���">���Ƹ���</option>
                          <option value="��120��">��120��</option>
                          <option value="��բ����">��բ����</option>
                          <option value="��բ����K2">��բ��K2</option>
                          <option value="��K2����120��">K2���졢��120��</option>
                          <option value="��K2����120����բ">��K2����120����բ</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;&nbsp;&nbsp;��</span></td>
          <td align="left" colspan="6"><select name="cg" class="Sytle_select">
                          <option value="13��">13��</option>
                          <option value="13��">13��</option>
                          <option value="16��">16��</option>
                          <option value="17��">17��</option>
                          </select>
                          </td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">ʣ&nbsp;��&nbsp;��&nbsp;֤&nbsp;��</span></td>
           <td align="left" colspan="6"><input name="bzq" type="text" class="Style_text" id="bzq" size="10"></td>
          </tr>
          <tr >
          <td height="25" colspan="2" align="left"><span class="style1">HMIS&nbsp;��&nbsp;��&nbsp;ʱ&nbsp;��</span></td>
          <td align="left" colspan="6"><input name="hmisrq" type="text" class="Style_text" ondblclick="loadCalendar(this)" id="hmisrq" size="10"></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;&nbsp;��</span></td>
          <td align="left" colspan="6"><input size="10" name="bl" type="text" class="Style_text" id="bz"></td>
          </tr>
          <tr align="center">
          <td height="25" colspan="2" align="left"><span class="style1">��&nbsp;&nbsp;ע</span></td>
          <td align="left" colspan="6"><input size="40" name="bz" type="text" class="Style_text" id="bz"></td>
          </tr>
         <tr><td height="15"></td></tr>
          <tr>
            <td colspan="8" ><div align="center">
            <input size="40" name="cj" type="hidden" class="Style_text" value="<%=chej%>">
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td>
  <div><font color="#D43939">��ǰ�������룺
   <%if (chej.equals("zz")) { %>֣��<%} 
   else {if (chej.equals("ys")) { %>��ɽ<%} 
   else {if (chej.equals("ly")) { %>����<%} 
   else {} }}%>���޳����������ƻ�...</font></div>
  <div><font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԣ������߳�����δȷ�����ڳ��͡�������������&ldquo;<font color="#ff0080">����</font>&rdquo;��</font></div>
  </td>
  </tr>
</table>

  </body>
</html>
