<%@ page language="java" import="" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ӹ���������׼...</title>
    
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
alert("�������׼������");
form1.bz.focus();
return;
}
if (form1.kf.value=="")
{ 
alert("������۷������");
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
            <td  height="30" class="style1" align="center">����������׼����:</td>
            <td  ><input name="bz" type="text" class="Sytle_text" size="80">&nbsp;*</td>
          </tr>
          <tr>
          <td height="30" class="style1" align="center">��������:</td> 
          <td><select name="fl" class="Sytle_select">
                  <option value="ת��ܼ���" >ת��ܼ���&nbsp;</option>
                  <option value="����ܼ���" >����ܼ���&nbsp;</option>
                  <option value="�ֳ��ƶ�����" >�ֳ��ƶ�����&nbsp;</option>
                  <option value="�ƶ�������" >�ƶ�������&nbsp;</option>
                  <option value="��������" >��������&nbsp;</option>
                  <option value="�����ƶ�����" >�����ƶ�����&nbsp;</option>
                  <option value="�������" >�������&nbsp;</option>
                  <option value="�ֶԼ���" >�ֶԼ���&nbsp;</option>
                  <option value="��м���" >��м���&nbsp;</option>
                  <option value="���������豸" >���������豸&nbsp;</option>
                  <option value="���ٸ���" >���ٸ���&nbsp;</option>
                  <option value="70t������" >70t������&nbsp;</option>
                </select>
          </td>
          <tr>  
            <td  height="30" class="style1" align="center">�۷����:</td>
            <td  ><input name="kf" type="text" class="Sytle_text" size="5">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="30" class="style1" align="center">�ӷ����:</td>
            <td  ><input name="jf" type="text" class="Sytle_text" size="5" value="0">&nbsp;*</td>
          </tr>
          <tr>
            <td colspan="2" height="30"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">                
                <input name="myclose" type="button" class="Style_button"  value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ������ӹ���������׼��Ϣ.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

