<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ӷ�̬��Ϣ��¼...</title>
    
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
  String fbr="";
  String fbbm="";
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
   fbr=(String)session.getAttribute("usertrue");
   fbbm=(String)session.getAttribute("deptment");
   if (((String)session.getAttribute("deptment")).equals("1"))  { str="���쵼";}
        if (((String)session.getAttribute("deptment")).equals("21")) { str="������";}
        if (((String)session.getAttribute("deptment")).equals("22")) { str="������";}
        if (((String)session.getAttribute("deptment")).equals("23")) { str="���ȿ�";}
        if (((String)session.getAttribute("deptment")).equals("24")) { str="���Ͽ�";}
        if (((String)session.getAttribute("deptment")).equals("25")) { str="�ʼ��";}
        if (((String)session.getAttribute("deptment")).equals("41")) { str="֣�ݼ��޳���";}
        if (((String)session.getAttribute("deptment")).equals("42")) { str="��ɽ���޳���";}
        if (((String)session.getAttribute("deptment")).equals("43")) { str="�������޳���";}
        if (((String)session.getAttribute("deptment")).equals("44")) { str="֣�����ᳵ��";}
        if (((String)session.getAttribute("deptment")).equals("admin")) { str="ϵͳ����Ա";}
  }
  %>

<table align="center" width="557" height="400" border="1" bordercolor="#BEE09C" cellpadding="-2" cellspacing="-2" style="">
  <tr>
    <td width="557" height="70" valign="top">
    <table  width="100%" height="70"  border="0"  cellpadding="-2" cellspacing="-2" background="Images/tjdtxx.gif">
      <tr>
        <td></td>
      </tr>
    </table>      
      <form ACTION="dtxx/addxxtj.jsp" METHOD="POST" name="form1" enctype="multipart/form-data" onsubmit="return Mycheck(form1)">
      <table width="600" height="250"  border="0" align="center" cellpadding="-2" cellspacing="0">
          <tr>
            <td   height="28" class="style1" align="left">&nbsp;����ʱ��:</td>
            <td  align="left" class="style1"><%=now%><input type="hidden" name="rq" value=<%=now%>></td>
            
            <td  height="28" class="style1" align="right">&nbsp;��������:</td>
            <td  align="left" class="style1"><%=str%><input name="fbbm" type="hidden" value=<%=fbbm%>></td>
            
            <td  height="28" class="style1" align="right">&nbsp;��&nbsp;��&nbsp;��:</td>
            <td  width="150" align="left" class="style1"><%=fbr%><input name="fbr" type="hidden" value=<%=fbr%> ></td>
          </tr>
	  	  <tr>
	  	    <td  height="28" class="style1" align="left">&nbsp;��Ϣ����:</td>
            <td align="left" colspan="5"  class="wordtitle"><input type="text" name="bt" class="Sytle_text" id="bt" size="40" >&nbsp;������</td>
          </tr>
          
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ1˵��:</td>
            <td colspan="5" class="wordtitle"><input type="text" name="tpjs1" class="Sytle_text" size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ1:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic1"><font color="#CC0000">&nbsp;�ļ����в��ܺ��������ַ�</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ2˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs2" class="Sytle_text"  size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ2:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic2"><font color="#CC0000">&nbsp;�ļ����в��ܺ��������ַ�</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ3˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs3" class="Sytle_text" size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ3:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic3"><font color="#CC0000">&nbsp;�ļ����в��ܺ��������ַ�</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ4˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs4" class="Sytle_text"  size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ4:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic4"><font color="#CC0000">&nbsp;�ļ����в��ܺ��������ַ�</font></td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ5˵��:</td>
            <td colspan="5"  class="wordtitle"><input type="text" name="tpjs5" class="Sytle_text"  size="40" >&nbsp;��ѡ��</td>
          </tr>
          <tr>
            <td height="28" class="style1" align="left">&nbsp;ͼƬ5:&nbsp;</td>
            <td colspan="5" ><input type="file" name="pic5"><font color="#CC0000">&nbsp;�ļ����в��ܺ��������ַ�</font></td>
          </tr>
          <tr> 
           <td height="100" class="style1" valign="top" align="left">&nbsp;��ϸ����:</td>
            <td valign="top" colspan="5"><textarea  name="nr"  class="Sytle_text"  cols="68" rows="10"></textarea> </td>
          </tr>
          <tr>
            <td colspan="6" height="40"  align="center" valign="middle"> 
                <input name="Submit" type="submit"  class="Style_button" value="��&nbsp;&nbsp;��" onClick="Mycheck()">
                <input name="myclose" type="button" class="Style_button" id="myclose" value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()">
                 </td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
  <td  height="30">
  <div><font color="#D43939">��ǰ������Ӷ�̬��Ϣ��¼.</font> <font color="#15600B">ע��1.ͼƬ1~5Ϊ��ѡ�ϴ�ͼƬ�ļ���2.ֻ���ϴ�GIF��JPG��BMP��ʽͼƬ��3.Ϊ�˱�֤ͼƬ��������ʾ���ϴ������������ļ�����ͼƬ��</font></div>
  </td>
  </tr>
</table>

  </body>
</html>

