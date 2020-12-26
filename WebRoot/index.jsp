<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
   int CurrPage=1;
   boolean islog=false;
   
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>郑州北车辆段货车检修系统门户网站即货车检修辅助管理系统V1.0</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link href="Css/style.css" rel="stylesheet">
   <style type="text/css">
   <!--.STYLE2 {color: #000033}-->
</style>

</head>

<LINK href="Css/style.css" type=text/css rel=stylesheet>
<body background="Images/bgmain.gif" >
<jsp:include page="title.jsp"/>
<jsp:include page="main.jsp"/>
<jsp:include page="CopyRight.htm"/>
<script language="javascript">
	ourmove();
</script>

</body>
</html>
