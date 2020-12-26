<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>规章制度...</title>
    
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
    -->  
   </style>
  <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
<%	request.setCharacterEncoding("gb2312");  %>
 <body onLoad="clockon(bgclock)" background="Images/back.jpg"  >
 <jsp:include flush="true" page="gzzdtitle.jsp"></jsp:include>
 <%

    String str="当前位置：辅助管理系统>>规章制度";
    String chej = "";
    String currpage = "1";
    
  
                 if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
                 if (request.getParameter("page")!=null) currpage=new String(request.getParameter("page"));
                 if (currpage.equals("1"))  { str=str+">>文件电报";}
                 if (currpage.equals("2"))  { str=str+">>段管理制度";}
                 if (currpage.equals("3"))  { str=str+">>车间管理制度";}
                 if (currpage.equals("4"))  { str=str+">>检修规程";}
                 if (currpage.equals("5"))  { str=str+">>行业、国家标准";}
                 if (currpage.equals("6"))  { str=str+">>厂修作业指导书";}
                 if (currpage.equals("7"))  { str=str+">>段修作业指导书";}
                 if (currpage.equals("8"))  { str=str+">>70t级货车检修作业指导书";}
                 if (currpage.equals("9"))  { str=str+">>X2H、X2K型车全面检查修作业指导书";}
                 if (currpage.equals("10")) { str=str+">>DL1型车作业指导书";}
                 if (currpage.equals("11")) { str=str+">>K2改造作业指导书";}
                 if (currpage.equals("12")) { str=str+">>8B、8AB完善改造作业指导书";}
                 if (currpage.equals("13")) { str=str+">>技术资料";}
                

 %>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td  height="25" background="Images/topbarbk.gif">
      <div class="word_black" valign="center"><%=str%></div>      
      </td>
   </tr>
   </table>


<table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td>
 <% if  (currpage.equals("1")) { %> <jsp:include flush="true" page="wjdb.jsp"></jsp:include> <% } %>
 <% if  (currpage.equals("2")) { %> <jsp:include flush="true" page="glzd.jsp?page=2"></jsp:include> <% } %>
 <% if  (currpage.equals("3")) { %> <jsp:include flush="true" page="glzd.jsp?page=3"></jsp:include> <% } %>
 <% if  (currpage.equals("4")) { %> <jsp:include flush="true" page="jsbz.jsp?page=4"></jsp:include> <% } %>
 <% if  (currpage.equals("5")) { %> <jsp:include flush="true" page="jsbz.jsp?page=5"></jsp:include> <% } %>
 <% if  (currpage.equals("6")) { %> <jsp:include flush="true" page="zds.jsp?page=6"></jsp:include> <% } %>
 <% if  (currpage.equals("7")) { %> <jsp:include flush="true" page="zds.jsp?page=7"></jsp:include> <% } %>
 <% if  (currpage.equals("8")) { %> <jsp:include flush="true" page="zds.jsp?page=8"></jsp:include> <% } %>
 <% if  (currpage.equals("9")) { %> <jsp:include flush="true" page="zds.jsp?page=9"></jsp:include> <% } %>
 <% if  (currpage.equals("10")) { %><jsp:include flush="true" page="zds.jsp?page=10"></jsp:include> <% } %>
 <% if  (currpage.equals("11")) { %><jsp:include flush="true" page="zds.jsp?page=11"></jsp:include> <% } %>
 <% if  (currpage.equals("12")) { %><jsp:include flush="true" page="zds.jsp?page=12"></jsp:include> <% } %>
 <% if  (currpage.equals("13")) { %>  <jsp:include flush="true" page="jszl.jsp?page=13"></jsp:include> <% } %>
  
      </td>
   </tr>
   </table>
   <table class="tableBorder_LR" align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td  height="25" background="Images/bottombarbk.gif">
      </td>
   </tr>
   </table>
   <table align="center" height="30" width="871" class="tableBorder_B">
 <tr>
      <td colspan="2" width="99%">
      <table width="99%"  align="center"  border="0"   cellpadding="0" cellspacing="0" class="tableBorder_B1">
      <tr align="left">
      <td align="right" height="15" class="textcolor1">[ <img  src="Images/tools.gif" width="15" height="15" border="0" >&nbsp;阅&nbsp;读&nbsp;工&nbsp;具&nbsp;下&nbsp;载 ]&nbsp;</td>
      <td align="left" width="26" rowspan="2"><img  src="Images/adobe.gif" width="20" height="20" border="0" ></td>
      <td width="110"> <a href="gzzd/download.jsp?path=e:/tools/AdbeRdr70_chs_full.exe">&nbsp;Adobe Reader 7&nbsp;</a></td>
      <td align="left" width="26" rowspan="2">
      <img src="Images/caxa.gif" width="20" height="20" border="0" ></td>
      <td width="110"> <a href="gzzd/download.jsp?path=e:/tools/caxa电子图板.rar">&nbsp;CAXA&nbsp;电子图板 &nbsp;</a></td>
      <td align="left" width="26" rowspan="2">
      <img src="Images/apabi.gif" width="20" height="20" border="0" ></td>
      <td width="100" align="left"> <a href="gzzd/download.jsp?path=e:/tools/reader2.rar">&nbsp;Apabi Reader 2&nbsp;</a>
      </td>
      <td align="left" width="26" rowspan="2">
      <img src="Images/winrar.gif" width="20" height="20" border="0" ></td>
      <td width="100"> <a href="gzzd/download.jsp?path=e:/tools/winrar30.exe"> &nbsp; Winrar &nbsp;</a></td>
      <td width="80" align="left" width="26" rowspan="2">
      </tr>
      </table>
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