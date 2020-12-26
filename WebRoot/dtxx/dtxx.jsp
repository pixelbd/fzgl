<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>动态信息...</title>
    
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
      .word_bl {
	 	font-size: 9pt;
	  	color: #818284;  
	  	}
	 .tableBorder_LR{
	    border:1px solid #FF9900;
	    border-bottom-style:none;
	    border-top-style:none;
        }
       .tdBorder_R{
	    border:1px solid #FFcccc;
	    border-bottom-style:none;
	    border-top-style:none;
	    border-left-style:none;
        }
       .tdBorderno{
	    border:1px solid #FFcccc;
	     
	    border-top-style:none;
	    border-left-style:none;
	    border-right-style:none;
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
      .style1 {color: #FF3399}
       .word_blue{
       
	   color: #0080ff;
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
      
        INPUT.Style_btn {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #D84E3F 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 60px
       }
    -->  
   </style>
  <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
<%	request.setCharacterEncoding("gb2312");  %>
 <body onLoad="clockon(bgclock)" background="Images/back.jpg"  >
 <jsp:include flush="true" page="dtxxtitle.jsp"></jsp:include>
<table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" >
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      </td>
   </tr>
   </table>
   <!-- 加入各部门动态信息 -->
<table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" > 
   <tr>
      <td >
      <div>
      <jsp:include flush="true" page="dtxxmain.jsp"></jsp:include>
      </div>
      </td>
   </tr>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" >
   <tr>
      <td  height="25" background="Images/bottombarbk.gif">
      </td>
   </tr>
   </table>
   
 <table  class="tableBorder_B" align="center" width="871"  border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td bgcolor="#ffffff">
      <div>
      <jsp:include flush="true" page="CopyRight.html"></jsp:include>
      </div>      
      </td>
   </tr>
</table>
 <br>
</body>