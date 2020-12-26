<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>给我们留言...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="/Css/style.css" rel="stylesheet">
 <style type="text/css">
<!--
.style2 {font-size: 12px;color: #336178}
.style3 {text-decoration: none; line-height: 22px; font-size: 12px; color:#153c59}
a:hover {
	font-size: 10pt;	color: #FF5000;
}
a {
	font-size: 10pt;	text-decoration: none;	color: #00000c;
	border:'1px' 'soild' '#000000'; outline-color:#000000;
}
-->
</style>
</head>
<body leftmargin="0" topmargin="0">


<table width="762" height="90" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f5f5f5" class="tablelinenotop">
  <tr ><td height="40" ></td></tr>
  <tr> 
    <td height="50"background="lz/lz.gif">&nbsp;</td>
  </tr>
  <tr> 
    <td height="1" bgcolor="#CCCCCC"></td>
  </tr>
</table>
<table width="762" height="413" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tablelinenotop">
<tr><td></td>
</tr>
  <tr> 
    <td width="170" valign="top" bgcolor="f5f5f5" height="413"> 
      <div align="center"> 

        <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td><img src="lz/title.jpg" width="170" height="50"></td>
          </tr>
        </table>
        
        <table width="100%" height="148" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
      </div></td>
    <td width="1" bgcolor="#cccccc" height="413"></td>
    <td width="583" valign="top" height="413">
    <table width="95%" height="45" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="left"><img src="lz/cont_title1.gif" width="200" height="40"></div></td>
        </tr>
      </table>
      <table width="90%" height="1" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td bgcolor="#CCCCCC"></td>
        </tr>
      </table>
       
   
  
  <form action="lz/addly.jsp" method=get>
  <table width="500" height="375" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td class="style3" align="center">姓名:</td>
  <td ><input type="text" name="name" size=25></td>
  </tr>
  <tr>
  <td class="style3" align="center">主题:</td>
  <td><input type="text" name="title" size=25></td>
  </tr>
  <tr>
  <td valign="top" class="style3" align="center">留言:</td>
  <td valign="top"><textarea name="content" rows=10 cols=45></textarea></td>
  </tr>   
  <tr>  
  <td colspan=2>
  <table align="center" width="100%" cellspacing="0" cellpadding="0" bordercolordark="#cccc99" bordercolorlight="#cccc99">
  <tr>
  <td align="center" ><input type="submit" value="提交留言"></td>
  <td align="center" ><a href="lz/viewly.jsp"><font size=2>查看留言</font></a></td>
  <td align="center"><input type="reset" value="重新填写"></td> 
  </tr>
  </table>
  </td>
  </tr>
</table>
</form>
    </td>
  </tr>
  </table>
<table width="762" height="50" border="0" align="center" cellpadding="0" cellspacing="0" >
<tr> 
    <td height="50"background="lz/bottom.gif">&nbsp;</td>
  </tr>
  <tr> 
    <td height="1" align="center"><a href="index.jsp" >返回首页</a></td>
</tr>
</table><br></body>
</html>

