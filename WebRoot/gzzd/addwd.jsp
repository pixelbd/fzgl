<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����ĵ��¼...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link href="Css/css1.css" rel="stylesheet">
<script language="javascript">
function Mycheck()
{
if ((form1.tdb.value=="") && (form1.tlj.value==""))
{ alert("�ļ���ͷ����Ϊ�գ�"); form1.tdb.focus(); return;}
if (form1.tdb.value!="")
{ if((form1.tdbnian.value=="")||(form1.tdbhao.value==""))
  { alert("���ĵ���Ϣ��ȫ,�벹�䣡"); form1.tdb.focus(); return;}
 }
if (form1.tlj.value!="")
{ if((form1.tljnian.value=="")||(form1.tljhao.value==""))
  { alert("���ĵ���Ϣ��ȫ,�벹�䣡"); form1.tlj.focus(); return; }
 }
if (form1.rq.value=="")
{ alert("�������ļ��������ڣ�"); form1.rq.focus(); return;}
if (form1.bw.value=="")
{ alert("�����������漰���࣡"); form1.bw.focus(); return;}
if (form1.bt.value=="")
{ alert("�������ļ��籨���⣡"); form1.bt.focus(); return;}
if (form1.zy.value=="")
{ alert("�������ļ��籨ժҪ��"); form1.zy.focus(); return;}
if (form1.file.value=="")
{ alert("������ļ��籨��"); form1.file.focus(); return;}
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

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjwdjl.gif">
      <tr><td></td></tr>
    </table>  
    <form action="gzzd/addwdtj.jsp" method="post" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">    
    <table align="center">
       <tr><td align="left" colspan="5">
       <strong>�ĵ���Ϣ</strong></td></tr>
       <tr>
          <td height="28">�ĵ����:&nbsp;</td>
          <td><input type="radio" name="wdlb" value="1"> ����</td>
          <td><input type="radio" name="wdlb" value="2"> ��ȫ</td>
          <td><input type="radio" name="wdlb" value="3"> ����</td>
          <td></td>
       </tr>
      <tr> 
          <td colspan="5" height="28">�ļ���ͷ:&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
          <select name="tdb" class="Sytle_select"  >
          <option value="" ></option>
            <option value="��װ����">��װ����</option>
            <option value="��װ������">��װ������</option>
            <option value="��װ����">��װ����</option>
            <option value="��װ�����">��װ�����</option>
            <option value="��Ӫ���ܵ�">��װ�����</option>
            <option value="���Ƽ���">���Ƽ���</option>
            <option value="����">����</option>
            <option value="�������">�������</option>
            </select>&nbsp;&nbsp;&nbsp;
            <input name="tdbnian" type="text" class="Sytle_text"  size="10">&nbsp;��&nbsp;&nbsp;&nbsp;
            <input name="tdbhao" type="text" class="Sytle_text"  size="10">&nbsp;��
         </td>
       </tr>
       <tr>
          <td colspan="5" height="28">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
          <select name="tlj" class="Sytle_select" >
          <option value="" ></option>
            <option value="֣����">֣����&nbsp;&nbsp;</option>
            <option value="֣�����">֣�����&nbsp;&nbsp;</option>
            <option value="֣����">֣����&nbsp;&nbsp;</option>
            <option value="֣�簲">֣�簲&nbsp;&nbsp;</option>
            <option value="֣���˵�">֣���˵�&nbsp;&nbsp;</option>
            <option value="֣���۵�">֣���۵�&nbsp;&nbsp;</option>
            <option value="֣���캯">֣���캯&nbsp;&nbsp;</option>
            <option value="֣���˺�" >֣���˺�&nbsp;</option>
            <option value="֣���캯" >֣���캯&nbsp;</option>
            <option value="֣�ֳ��麯">֣�ֳ��麯</option>
            <option value="֣������">֣������&nbsp;</option>
            <option value="֣���ƺ�">֣���ƺ�&nbsp;</option>
            <option value="֣����">֣����&nbsp;</option>
            <option value="֣����">֣����&nbsp;</option>
            <option value="֣����">֣����&nbsp;</option>
          </select>&nbsp;&nbsp;&nbsp;
          <input name="tljnian" type="text" class="Sytle_text"  size="10">&nbsp;��&nbsp;&nbsp;&nbsp;
          <input name="tljhao" type="text" class="Sytle_text"  size="10">&nbsp;��
          </td>
       </tr>
       <tr>
          <td height="28" align="left">�漰����:&nbsp;</td>
          <td><input type="radio" name="bw" value="1"> ���塢�����</td>
          <td><input type="radio" name="bw" value="2"> ת���</td>
          <td><input type="radio" name="bw" value="3"> ����</td>
          <td><input type="radio" name="bw" value="4"> ����</td>
       </tr>
       <tr>
          <td height="28">&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <TD><input type="radio" name="bw" value="5"> �����ƶ�</td>
          <td><input type="radio" name="bw" value="6"> �����ƶ�</td>
          <td><input type="radio" name="bw" value="7"> ������</td>
          <td><input type="radio" name="bw" value="8"> �����ۺ�</td>
          <td><input type="radio" name="bw" value="9"> �¹�ͨ��</td>
       </tr>
       <tr>
          <td height="28">����ʱ��:&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td colspan="4"><input name="rq" type="text" class="Sytle_text"  size="15" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp; &nbsp;
       </tr>
       <tr>
          <td height="28">�ļ��籨���⣺&nbsp;</td>
          <td colspan="4"><input name="bt" type="text" class="Sytle_text"  size="45">&nbsp;&nbsp;&nbsp; &nbsp;</td>
       </tr>
       <tr>
          <td height="28" >�ļ��籨ժҪ�� &nbsp;</td>
          <td colspan="4" ><textarea  name="zy"  class="Sytle_text"  cols="75" rows="16"></textarea> </td>
      </tr>
      <tr>
          <td height="28" >�ϴ��ļ��籨�� &nbsp;</td>
          <td colspan="4" ><input type="file" name="file"></td>
      </tr>
      <tr><td colspan="6" height="40"  align="center" valign="middle"> 
               <input type="submit" name="Submit" class="Style_button" value="��&nbsp;&nbsp;��">&nbsp;&nbsp;
               <input name="Submit2" type="reset" class="Style_button" value="��&nbsp;&nbsp;�� ">&nbsp;&nbsp;                
               <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				onClick="javascrip:window.close()">
          </td>
      </tr>
    </table>
     </form>
    </td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ��������ļ��籨��¼.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
</body>
</html>

