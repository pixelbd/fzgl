<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ӻ����¼...</title>
    
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
{ alert("������������ڣ�");form1.rq.focus();return;}
if (form1.rt.value=="")
{ alert("������������⣡");form1.rt.focus();return;}
if (form1.cjr.value=="")
{ alert("���������μ��ˣ�");form1.cjr.focus();return;}
if (form1.zcr.value=="")
{ alert("�����������ˣ�");form1.zcr.focus();return;}
if (form1.nr.value=="")
{ alert("��������������");form1.nr.focus();return;}
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
          
          if (tabname.equals("cjschzz")) {  meeting =  "֣�ݼ��޳�������������"; 	}
          if (tabname.equals("cjschys")) {  meeting =  "��ɽ���޳�������������"; 	}
          if (tabname.equals("cjschly")) {  meeting =  "�������޳�������������"; 	}
          if (tabname.equals("cjschzl")) {  meeting =  "֣�����ᳵ������������"; 	}
          if (tabname.equals("cjlxhzz")) {  meeting =  "֣�ݼ��޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhys")) {  meeting =  "��ɽ���޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhly")) {  meeting =  "�������޳�����ϯ��"; 	}
          if (tabname.equals("cjlxhzl")) {  meeting =  "֣�����ᳵ����ϯ��"; 	}
          if (tabname.equals("cjzlhzz")) {  meeting =  "֣�ݼ��޳�������������"; 	}
          if (tabname.equals("cjzlhys")) {  meeting =  "��ɽ���޳�������������"; 	}
          if (tabname.equals("cjzlhly")) {  meeting =  "�������޳�������������"; 	}
          if (tabname.equals("cjzlhzl")) {  meeting =  "֣�����ᳵ������������"; 	}
          if (tabname.equals("cjzthzz")) {  meeting =  "֣�ݼ��޳���ר�������"; 	}
          if (tabname.equals("cjzthys")) {  meeting =  "��ɽ���޳���ר�������"; 	}
          if (tabname.equals("cjzthly")) {  meeting =  "�������޳���ר�������"; 	}
          if (tabname.equals("cjzthzl")) {  meeting =  "֣�����ᳵ��ר�������"; 	}
          if (tabname.equals("dsch")) {  meeting =  "������������"; 	}
          if (tabname.equals("dqth")) {  meeting =  "�μ���������"; 	}
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
            <td  width="80" height="30" align="center" class="style1">��������:</td>
             <td  class="style1" ><%=meeting%></td>
          </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="center">��������:</td>
            <td align="left"><input type="text" name="rt" class="Sytle_text" id="rt" size="40" >&nbsp;*</td>
          </tr>
         
          <tr>
            <td   height="28" class="style1" align="center">����ʱ��:</td>
            <td  valign="center"><input type="text" name="rq" class="Sytle_text" id="rq" size="15" onDBLClick="loadCalendar(this)">&nbsp;*</td>
          </tr>
          <tr>  
            <td  height="28" class="style1" align="center">��&nbsp;��&nbsp;��:</td>
            <td  ><input name="zcr" type="text" class="Sytle_text" id="zcr" size="15">&nbsp;*</td>
          </tr>
          <tr>
            <td height="28" align="center"><span class="style1" >��&nbsp;��&nbsp;��:</span></td>
            <td ><input width="10" name="cjr" type="text" class="Sytle_text" id="cjr" size="40" >&nbsp;*</td>
          </tr>
          <% if  ((tabname.equals("dqth"))||(tabname.equals("dsch")))
	  	  {  	
	  	  %>
	  	  <tr> 
           <td height="28" class="style1" align="center">����ص�:</td>
            <td ><input width="20" name="dd" type="text" class="Sytle_text"  size="20">&nbsp;*</td>
          </tr>
          <% } %>
          <tr> 
           <td height="300" class="style1" valign="top" align="center">��������:</td>
            <td valign="top" ><textarea  name="nr"  class="Sytle_text"  cols="64" rows="20"></textarea> </td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Button" type="button" class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                                
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ������ӻ����¼.</font> <font color="#15600B">ע����<font color="#ff0080">&nbsp;*</font>&nbsp;�ŵ���ĿΪ���������ʡ�ԡ�</font></div>
  </td>
  </tr>
</table>
<%  }   %>
  </body>
</html>

