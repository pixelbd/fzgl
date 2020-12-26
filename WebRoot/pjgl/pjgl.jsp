<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>配件管理...</title>
    
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
      .word_black {
	 	font-size: 9pt;
	  	color: #818284;  
	  	}
	 
	 .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体_GB2312;
		}
	  .tbBorder{
      border: 1px; 
      background-color: #e58515;
      }
      .tbBorder2
      {
       border: 1px #DEDEDE solid; 
       background-color: #00EFEF;
      }
      .tbBody2
      {
      background-color: "#E2EFF8";
      }
      .style1 {
	   font-family: 楷体_GB2312;
	   font-size: 16px;
	   color: #004080;
       }
       .shadow{
        font-size:9pt;
        filter:DropShadow(Color=#FFFFFF,offX=1,offY=1,positive=1);
        height:25;
        color:#336699;
        }
      body {
	margin-left: 0px; 
	margin-top: 1px;
      }
    -->  
   </style>
  </head>

 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
 
<%request.setCharacterEncoding("gb2312");%>
<body background="Images/back.jpg" class="BODY">
 <jsp:include flush="true" page="pjgltitle.jsp"></jsp:include>
 <%
      boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
    String str="当前位置：辅助管理系统>>配件管理";
   
    String currpage = "1";
    
    if (islog) { 
                 if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
                 if (currpage.equals("1"))  { str=str+">>重点配件库存管理";}
                 if (currpage.equals("2"))  { str=str+">>索赔配件管理";}
                 if (currpage.equals("3"))  { str=str+">>配件检验";}
                 if (currpage.equals("5"))  { str=str+">>探头管理";}
                 if (currpage.equals("6"))  { str=str+">>侧架摇枕管理";}
                 if (currpage.equals("4"))  { str=str+">>配件目录";}
               }
 %>
   <table class="tableBorder_LR" valign="top" align="center" width="871" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      <div class="word_black" valign="center"><%=str%></div>      
      </td>
   </tr>
   </table>
    <% if (islog) { %>  
    <% if (currpage.equals("1")) { %> <jsp:include flush="true" page="kcgl.jsp"></jsp:include> <% } %>
    <% if (currpage.equals("2")) { %> <jsp:include flush="true" page="sppjgl.jsp"></jsp:include> <% } %>
    <% if (currpage.equals("3")) { %> <jsp:include flush="true" page="pjjy.jsp"></jsp:include> <% } %>
    <% if (currpage.equals("5")) { %> <jsp:include flush="true" page="tantou.jsp"></jsp:include> <% } %>
    <% if (currpage.equals("6")) { %> <jsp:include flush="true" page="cjyz.jsp"></jsp:include> <% } %>
    <% if (currpage.equals("4")) { %> <jsp:include flush="true" page="pjml.jsp"></jsp:include> <% } %>
    <% } else { %>
   <table align="center"   class="tableBorder_LR" width="871" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="32"  align="center" bgcolor="#ffffff" class="style1" valign="center">
      <div><img width="32" height="32" src="Images/clue.gif" > 未登录，无法查看配件管理情况。 </div>
      </td>
   </tr>
   </table>
<%} %>
   <table class="tableBorder_LR" align="center" width="871" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/bottombarbk.gif"></td>
   </tr>
   </table>
 <table  class="tableBorder_B" align="center" width="871"  cellpadding="-2" cellspacing="-2">
   <tr>
      <td bgcolor="#ffffff">
      <jsp:include flush="true" page="CopyRight.html"></jsp:include>
      </td>
   </tr>
   </table>
</body>
</html>
