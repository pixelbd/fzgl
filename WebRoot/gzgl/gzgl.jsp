<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>故障管理...</title>
    
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
	  	color: #818284;  }
	 .tableBorder_LR{
	    border:1px solid #FF9900;
	    border-bottom-style:none;
	    border-top-style:none;
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
        .tableBorder_B {
	   border: #DFE1EB 1px solid;
	   background-color: #E2EFF8;
       }
       body {
	margin-left: 0px; 
	margin-top: 1px;
      }
    -->  
   </style>
  </head>


<body background="Images/back.jpg" >
 <jsp:include flush="true" page="titlegzgl.jsp"></jsp:include>
 <%
      boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
    String str="当前位置：辅助管理系统>>故障管理";
    String chej = "";
    String currpage = "1";
    
    if (islog) { 
                 if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
                 if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
                 if (currpage.equals("1"))  { str=str+">>验收反馈故障";}
                 if (currpage.equals("2"))  { str=str+">>质检发现故障";}
                 if (currpage.equals("3"))  { str=str+">>车辆典型故障";}
                 if (currpage.equals("4"))  { str=str+">>不良信息反馈";}
               }
 %>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      <div class="word_black" valign="center"><%=str%></div>      
      </td>
   </tr>
   </table>
 <%if (islog) { %>  
 <% if  (currpage.equals("1")) { %> <jsp:include flush="true" page="ysgz.jsp"></jsp:include> <% } %>
 <% if  (currpage.equals("2")) { %> <jsp:include flush="true" page="zjgz.jsp"></jsp:include> <% } %>
 <% if  (currpage.equals("3")) { %> <jsp:include flush="true" page="dxgz.jsp"></jsp:include> <% } %>
 <% if  (currpage.equals("4")) { %> <jsp:include flush="true" page="blxx.jsp"></jsp:include> <% } %>
 <%} else {%>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" valign="top" height="32" bgcolor="#ffffff" class="style1" valign="center"><img width="32" height="32" src="Images/clue.gif" >
       未登录，无法查看故障情况。 
      </td>
   </tr>
   </table>
 
 <%} %>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/bottombarbk.gif"></td>
   </tr>
   </table>
 <table  class="tableBorder_B" align="center" width="871"  border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td bgcolor="#ffffff">
      <div>
      <jsp:include flush="true" page="CopyRight.html"></jsp:include>
      </div>      
      </td>
   </tr>
</table>
  </body>
</html>
