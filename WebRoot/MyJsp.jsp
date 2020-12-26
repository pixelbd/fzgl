<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css" >
#popupcontent
{   position: absolute;   
   visibility: hidden;
   overflow: hidden;
   border:1px solid #CCC;
   background-color:#F9F9F9;   
   border:1px solid #333;   
   padding:5px;
}
</style>

 </head>
  <body>
  <script language="javascript">
var baseText = null; function showPopup(w,h){   var popUp = document.getElementById("popupcontent");    popUp.style.top = "200px";   popUp.style.left = "200px";   popUp.style.width = w + "px";   popUp.style.height = h + "px";    if (baseText == null) baseText = popUp.innerHTML;   popUp.innerHTML = baseText +       "<div id=\"statusbar\"><input type=\"button\" value=\"Close window\" onClick=\"hidePopup();\"></div>";    var sbar = document.getElementById("statusbar");   sbar.style.marginTop = (parseInt(h)-60) + "px";   popUp.style.visibility = "visible";}
function hidePopup(){   var popUp = document.getElementById("popupcontent");   popUp.style.visibility = "hidden";}
</script>
<table>  <tr>
     <td width="25%" align="center" >²Ëµ¥  </td> 
     <td width="75%" align="center" ><p><a  href="http://localhost:8080/fzgl/MyJsp.jsp" onclick="showPopup(300,200);" >Ö÷³ÌÐò</a></p></td>
  </tr></table>

  </body>
</html>
