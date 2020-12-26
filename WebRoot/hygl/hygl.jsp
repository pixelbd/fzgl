<%@ page language="java"  pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专题会议...</title>
    
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
      .style2 {
	   font-family:宋体;
	   font-size:9pt;
	   color: #9A5718;
       }
       .style1 {
	   font-family:楷体;
	   font-size:10pt;
	   color: #7780BA;
       }
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
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #FF6666 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 60px
       }
        INPUT.Style_btngo {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #FF6666 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 30px
       }
       .inputbdpg {
	font-family: "宋体";
	font-size: 10pt;
	color: #666699;
	border: 1px solid #ffcccc;
         }
   .stylered {color: #FF9999}
   .wordred {color: #C60001}
   .inputbd {
	font-family: "宋体";
	font-size: 9pt;
	color: #666699;
	border: 1px solid #ffcccc;
         }
    body {
	margin-left: 0px; 
	margin-top: 0px;
      }
    -->  
   </style>
  <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>

  <body onLoad="clockon(bgclock)" background="Images/back.jpg" class="BODY">
 <jsp:include flush="true" page="titlehygl.jsp"></jsp:include>
 <%
      boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
    String str="当前位置：辅助管理系统>>会议管理";
    String chej = "";
    String currpage = "0";
    
    if (islog) { 
                 if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
                 if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
                 if (currpage.equals("1"))  { str=str+">>车间生产分析会";}
                 if (currpage.equals("2"))  { str=str+">>车间党政联席会";}
                 if (currpage.equals("3"))  { str=str+">>车间质量分析会";}
                 if (currpage.equals("4"))  { str=str+">>专题分析会";}
                 if (currpage.equals("5"))  { str=str+">>段生产分析会";}
                 if (currpage.equals("6"))  { str=str+">>段其他会议";}
                 if (currpage.equals("7"))  { str=str+">>段验联席会";}
                 if (currpage.equals("8"))  { str=str+">>其他会议";}
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
 <% if  (currpage.equals("1")) { %> <jsp:include flush="true" page="cjhy.jsp?cjhy=1"></jsp:include> <% } %>
 <% if  (currpage.equals("2")) { %> <jsp:include flush="true" page="cjhy.jsp?cjhy=2"></jsp:include> <% } %>
 <% if  (currpage.equals("3")) { %> <jsp:include flush="true" page="cjhy.jsp?cjhy=3"></jsp:include> <% } %>
 <% if  (currpage.equals("4")) { %> <jsp:include flush="true" page="cjhy.jsp?cjhy=4"></jsp:include> <% } %>
 <% if  (currpage.equals("5")) { %> <jsp:include flush="true" page="dhy.jsp?page=5"></jsp:include> <% } %>
 <% if  (currpage.equals("6")) { %> <jsp:include flush="true" page="dhy.jsp?page=6"></jsp:include> <% } %>
 <% if  (currpage.equals("7")) { %> <jsp:include flush="true" page="dyh.jsp"></jsp:include> <% } %>
 <% if  (currpage.equals("8")) { %> <jsp:include flush="true" page="qth.jsp"></jsp:include> <% } %>
  <% if  (currpage.equals("0")) { %>
  <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" valign="top" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/hygl_topbarbk.gif">
      </td>
   </tr>
   </table> 
   <% } %>
 <%} else {%>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" align="center" width="870" height="319" bgcolor="#ffffff" class="style1" valign="center" background="Images/bg/hygl_topbarbk.gif">
      <img width="32" height="32" src="Images/clue.gif" >
       未登录，无法查看会议情况。 
      </td>
   </tr>
   </table>
 <%} %>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td  height="25" background="Images/bottombarbk.gif"></td>
   </tr>
   </table>
 <table  align="center" class="tableBorder_B" valign="center" width="871"  border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td bgcolor="#ffffff" align="center">
      <div>
      <jsp:include flush="true" page="CopyRight.html"></jsp:include>
      </div>      
      </td>
   </tr>
</table>
</body>