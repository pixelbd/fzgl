<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ϴ���������Ҫ...</title>
    
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
if (form1.bt.value=="")
{ alert("��������Ϣ���⣡");form1.bt.focus();return;}
if (form1.nr.value=="")
{ alert("�����붯̬��Ϣ�����");form1.nr.focus();return;}
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
   .wordtitle{color: #E54743}
-->
</style>
</head>

<body background="Images/bg2.gif">
  <%        
  request.setCharacterEncoding("gb2312");
         
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  String scr="";
  String str="";
  
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
   scr=(String)session.getAttribute("usertrue");
   if (((String)session.getAttribute("deptment")).equals("21")) { str="������";}
   if (((String)session.getAttribute("deptment")).equals("22")) { str="������";}
   if (((String)session.getAttribute("deptment")).equals("admin")) { str="ϵͳ����Ա";}     
  }
  %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/scdyhy.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="hygl/uploaddyhtl.jsp" METHOD="POST" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">
      <table width="600" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>
            <td width="150" height="28" class="style1" align="left">&nbsp;��&nbsp;&nbsp;��&nbsp;&nbsp;��&nbsp;:</td>
            <td   align="left" class="style1"><font color="#D43939"><%=scr%></font><input name="scr" type="hidden" value=<%=scr%> ></td>
          </tr>
          <tr>
            <td width="150" height="28" class="style1" align="left">&nbsp;��&nbsp;��&nbsp;��&nbsp;��:</td>
            <td   align="left" class="style1"><font color="#D43939"><%=str%></font><input name="bm" type="hidden" value=<%=str%> ></td>
          </tr>
          <tr>
            <td  height="28" class="style1" align="left">&nbsp;��&nbsp;��&nbsp;ʱ&nbsp;��:</td>
            <td  align="left" class="style1"><font color="#D43939"><%=now%></font><input type="hidden" name="rq" value=<%=now%>></td>
          </tr>
          
	  	  <tr>
	  	    <td height="28" class="style1" align="left">&nbsp;��&nbsp;��&nbsp;ʱ&nbsp;��:</td>
            <td align="left" class="wordtitle">
            <select name="nian" class="Sytle_select"  >
            <option value="2008" >2008��</option>
            <option value="2009">2009��</option>
            <option value="2010">2010��</option>
            <option value="2011">2011��</option>
            <option value="2012">2012��</option>
            <option value="2013">2013��</option>
            </select>
            <select name="yue" class="Sytle_select"  >
            <option value="1" >Ԫ��</option>
            <option value="2">2��</option>
            <option value="3">3��</option>
            <option value="4">4��</option>
            <option value="5">5��</option>
            <option value="6">6��</option>
            <option value="7" >7��</option>
            <option value="8">8��</option>
            <option value="9">9��</option>
            <option value="10">10��</option>
            <option value="11">11��</option>
            <option value="12">12��</option>
            </select>
            </td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ѡ������Ҫ�ļ�:&nbsp;</td>
            <td ><input type="file" name="file1">&nbsp;*&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" height="40"  align="center" valign="middle"> 
                <input name="Submit" type="submit"  class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                &nbsp;&nbsp;&nbsp;&nbsp;<input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
            </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ�����ϴ���������Ҫ.</font> <font color="#15600B">ע���ļ���ΪWinword��ʽ�ļ���</font></div>
  </td>
  </tr>
</table>

  </body>
</html>


