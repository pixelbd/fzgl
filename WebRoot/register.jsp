<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<script type="text/javascript">
	fuction checkConfirm(o1,o2)
	{
	 if(o2.value!=""){
	 if(o2.value!=o1.value){
	 alert("������������������ͬ��");
	 o1.focus();}}
	}
</script>

<script type="text/javascript">
	function rgtext()
	{
		if(document.form1.userid.value=="")
		{ 
		  window.alert("�������û����루���֤���룩��");
		  document.form1.userid.focus();
		  return false;
		 }
		 if(document.form1.name.value=="")
		{ 
		  window.alert("�������û�����");
		  document.form1.name.focus();
		  return false;
		 }
		 if(document.form1.truename.value=="")
		{ 
		  window.alert("�������û����루���֤���룩��");
		  document.form1.truename.focus();
		  return false;
		}
		
</script>
<form method="post" action="newuser.jsp" name="form1">
<table border="0" cellspacing="0" cellpadding="0" width="500">
<tr>
<td> �û����루���֤�ţ���</td>
<% 
String userid ="";if (request.getParameter("Values")!=null) userid = new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="userid" value=<%=userid%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>���룺</td>
<% 
String password ="";if (request.getParameter("Values2")!=null) password = new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="password" value=<%=password%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td> �û�����</td>
<% 
String name ="";if (request.getParameter("Values3")!=null) name= new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="name" value=<%=name%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td> �û���ʵ����</td>
<% 
String truename ="";if (request.getParameter("Values4")!=null) truename = new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="truename" value=<%=truename%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td> ���ţ�</td>
<% 
String dept ="";if (request.getParameter("Values5")!=null) dept = new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="dept" value=<%=dept%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td> ������ְ��</td>
<% 
String zw ="";if (request.getParameter("Values6")!=null) zw = new String(request.getParameter("Values").getBytes("iso-8859-1"),"gb2312");
%>
<td><input size="15" name="zw" value=<%=zw%>></input></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
    <input type="submit" name="Submit" value="  ע��  " >    
 
  </table>
  </form>
  </body>
</html>
