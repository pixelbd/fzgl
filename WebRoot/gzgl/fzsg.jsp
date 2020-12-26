<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%  
    int CountPg = 0;
	int CurrPg = 1;
	int PgSize = 30;
	int CountR = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职工发现典型故障...</title>
    
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
	  .word_blue {
	 	font-size: 9pt;
	  	color: #08236F;  }
	  .wyellow{color: #ffff80;}
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
      {background-color: "#E2EFF8";}
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
      .STYLE2 {color: #FFFFFF}
    -->  
   </style>
  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body class="BODY">
  
  <%
  
  //获取当前日期的月份
  String chej="select * from fzsg order by rq desc";
  if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
  String tabname="zjgz";
  String datef="";
  if (request.getParameter("v1")!=null) datef = new String(request.getParameter("v1"));
    String dateto ="";
  if (request.getParameter("v2")!= null) dateto =new String(request.getParameter("v2"));
  String subpg="1";
  if (request.getParameter("subpg")!= null) subpg =new String(request.getParameter("subpg"));
  
   boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
%>

   <table width="871" align="center" class="tableBorder_LR"   cellpadding="-2" cellspacing="-2">
   <tr>
      <td width="870" height="25"  colspan="2" bgcolor="#FFFFFF"  align="center">
      <form name="formzj" method="post" action="gzgl/gzgl.jsp"><font color="003366">请选择要查询的车间：</font>
      <select name="cj" class="Sytle_select"  >
            <option value="" >全部</option>
            <option value="41" <%if (chej.equals("41")) out.print("selected"); %>>郑州检修车间</option>
            <option value="42" <%if (chej.equals("42")) out.print("selected"); %>>月山检修车间</option>
            <option value="43" <%if (chej.equals("43")) out.print("selected"); %>>洛阳检修车间</option>
            <option value="44" <%if (chej.equals("44")) out.print("selected"); %>>郑州轮轴车间</option>
      </select>
      <input type="hidden" name="page" value="3">
      </form>
      </td>
   </tr>
   <tr>
   <td  width="871" height="25" colspan="2" align="center" bgcolor="#FFFFFF"  valign="center">
   <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
    }
    </script>
      <form name="form2" method="post" action="gzgl/gzgl.jsp"><font color="003366">查询时间段:从</font> 
      <input name="v1" type="text" onDBLClick="loadCalendar(this)" value=<%=datef%>><font color="#003366">&nbsp;到</font>
      <input name="v2" type="text" onDBLClick="loadCalendar(this)" value=<%=dateto%>>
      <input name="cj" type=hidden value=<%=chej %>>
      <input name="page" type=hidden value="3">
      <input type="submit" name="Submit"  class=Style_button value="  查  询  " >
      </form></td></tr>
      <tr>
      <td  bgcolor="#FFFFFF">
      <%if  (((String)session.getAttribute("deptment")).equals("41") 
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44")
           || ((String)session.getAttribute("deptment")).equals("admin"))
           {
           if (((String)session.getAttribute("zw")).equals("9")
           ||((String)session.getAttribute("zw")).equals("1")
           ||((String)session.getAttribute("zw")).equals("6")
           ||((String)session.getAttribute("zw")).equals("4")
           ||((String)session.getAttribute("zw")).equals("cjadmin")
           ||((String)session.getAttribute("deptment")).equals("admin")) { %> 
   &nbsp;&nbsp;&nbsp;&nbsp;<img   width="20" height="18" src="Images/add.gif" >【<a href="gzgl/editzjgz.jsp?cj=<%=chej %>" target="newwindow" class="STYLE2">添加职工发现典型故障记录 </a>】&nbsp;&nbsp;  
   <%} } %>
      </td>
      </tr>
   </table>
   <%
   if (!(chej.equals(""))) { String sql="select * from fzsg where cj='"+chej+"' order by rq desc"; } 
   
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 

                String StrPg = request.getParameter("pgcode");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(sql);
            			
                        Rs.last();
                        j = 0;
            			CountR = Rs.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rs.first();
            			%>
  </body>
</html>
