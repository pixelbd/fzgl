<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test1.jsp' starting page</title>
    
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
<script language="javascript">
function Mycheck(){
if(Form.user.value=="")
{alert("�û�������Ϊ�գ���");Form.user.focus();return;}
form.submit();
}
</script>
<BODY>
<form method="POST" action="loginchk.asp" name="Form" >
�û�����
  <input type="text" name="user" size="16">���룺
    <input name="pwd" type="password"  size="16">
    <input name="B1"  type="button" onclick="Mycheck();" value="��¼">
<a href="register.asp">ע���û�</a>|<a href="found.asp">�һ�����</a></form>

  </body>
</html>
