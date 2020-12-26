<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>设备管理...</title>
    
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
	  .word_blue {
	 	font-size: 9pt;
	  	color:#4E759C;
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
	   margin-top: 0px;
      }
     -->  
   </style>
  </head>

 <LINK href="Css/sbglcss.css" type=text/css rel=stylesheet>
 
<%request.setCharacterEncoding("gb2312");%>
<body background="Images/back.jpg" class="BODY">
 <jsp:include flush="true" page="sbgltitle.jsp"></jsp:include>
 <%
  boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
    String str="当前位置：辅助管理系统>>设备管理";
 //   String chej = "";
    String currpage = "1";
    
    if (islog) { 
                // if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
                 if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
                 if (currpage.equals("1"))  { str=str+">>设备故障维修管理";}
                 if (currpage.equals("2"))  { str=str+">>设备星级评比";}
                 if (currpage.equals("3"))  { str=str+">>设备操作规程";}
                 if (currpage.equals("4"))  { str=str+">>设备基础信息维护";}
                 if (currpage.equals("5"))  { str=str+">>设备基础信息查询";}
               }
 %>
   <table class="tableBorder_LR" valign="top" align="center" width="871" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      <div class="word_black" valign="center"><%=str%></div>      
      </td>
   </tr>
  
    <% if (islog) { %>  
     <tr><td>
    <% 
    if (currpage.equals("5")) { %> <jsp:include flush="true" page="sbxxcx.jsp"></jsp:include> <% }
    else{ if (currpage.equals("4")) { %> <jsp:include flush="true" page="sbxxgl.jsp"></jsp:include> <% }
       else { if (currpage.equals("1")) { %> <jsp:include flush="true" page="sbwxgl.jsp"></jsp:include> <%} 
         else { if (currpage.equals("2")) { %> <jsp:include flush="true" page=""></jsp:include> <% } 
                else  { if (currpage.equals("3")) { %> <jsp:include flush="true" page="czgc.jsp"></jsp:include> <% } 
                       else  { %> <img src="Images/bg/sbgl_topbarbk.gif" width="870" height="319" border="0" >    <% }
                }
              }
            }
          }
        %>
    </td></tr>
    <% } else { %>
   <tr>
      <td  background="Images/bg/sbgl_topbarbk.gif" height="319"  align="center" bgcolor="#ffffff" class="style1" valign="center">
      <div><img width="32" height="32" src="Images/clue.gif" > 未登录，无法查看设备管理情况。 </div>
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
