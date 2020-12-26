<%@ page language="java" import="java.util.*,java.sql.*,java.lang.*" pageEncoding="GB2312"%>
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
    
    <title>索赔配件编辑</title>
    
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
      .word_yellow {
	 	font-size: 9pt;
	  	color: #EFD20F;  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体;}
     INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
    -->  
     </style>
	
<script src="js/onclock.JS"></script>
 </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
  <body onLoad="clockon(bgclock)" background="Images/bg2.gif">
    <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
</script>
  
  <% 
    String chej = "";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String user="";
    if (request.getParameter("user")!=null) user= new String(request.getParameter("user"));;
    if (user.equals("41")) chej="zz";
    if (user.equals("42")) chej="ys";
    if (user.equals("43")) chej="ly";
    
    String vdate1 ="";
    if (request.getParameter("v1")!=null) vdate1 = new String(request.getParameter("v1"));
    String vdate2 ="";
    if (request.getParameter("v2")!= null) vdate2 =new String(request.getParameter("v2"));
    String dtname=" ";
    if (!chej.equals("")) { dtname="sppj"+chej; } else { }
  %>
  <table background="Images/Top_02.gif" width="871" height="92" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#6894D5" bgcolor="#ffffff">
  <tr>
  <td  height="80%" valign="center" align="center" width="803" height="166" style="FONT:20px 黑体;COLOR:#ffffff;HEIGHT:18px;BACKGROUND-COLOR:#DFFF1F9">配&nbsp;件&nbsp;管&nbsp;理&nbsp;-&nbsp;>&nbsp;配&nbsp;件&nbsp;索&nbsp;赔&nbsp;情&nbsp;况&nbsp;编&nbsp;辑</td>
  </tr>
  <tr>
  <td align="right" height="20%">
     <div><script src="JS/onclock.JS"></script><div id="bgclock" class="word_yellow"></div>
  </td>
  </tr>
  </table>
  <table width="871" height="60" border="1" align="center" cellpadding="-2" cellspacing="-2" bordercolor="#BEE09C" bgcolor="#ffffff">
  <tr>
  <td align="center" valign="center"  >
  <%if ((user.equals("admin"))||(user.equals("admin"))||(user.equals("admin"))||(user.equals("admin"))) { %>
  <form name="form" method="post" action="pjgl/editsppj.jsp">选择检修车间：
  <input type="hidden" name="user" value=<%=user%>>
  <input type="radio" name="cj" value="zz" <%if (chej.equals("zz")) out.print("checked"); %>> 郑州检修车间
  <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) out.print("checked"); %>> 月山检修车间
  <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) out.print("checked"); %>> 洛阳检修车间
  <input type="submit" name="Submit" class="Style_button" value="  确   定  " >
  </form> 
  <%} %></td>
  </tr>
  <tr>
  <td align="center" >

  <form name="form2" method="post" action="pjgl/editsppj.jsp">
        <input width="10" name="cj" type="hidden" size="16"  value="<%=chej%>">请输入要查询的日期：从
        <input width="20" name="v1" type="text" size="16" ondblClick="loadCalendar(this)" value="<%=vdate1%>">到
        <input width="20" name="v2" type="text" size="16" ondblClick="loadCalendar(this)" value="<%=vdate2%>">
        <input type="hidden" name="user" value=<%=user%>>
        <input type="submit" name="Submit" class="Style_button" value="  查  询  " >
   </form></td>
  </tr>
  </table>

<table   class="tableBorder_LR"  align="center" width="871" border="0" cellpadding="-2" cellspacing="1">
<tr align="center"  height="25">
<td colspan="13" bgcolor="#6595D6" style="color:#ffffff;font-size:12;font-family:宋体"><div align="center" >
<% if (chej.equals("zz")) { %>[郑州检修车间] 配件索赔明细<%} else{} %>
<% if (chej.equals("ys")) { %>[月山检修车间] 配件索赔明细<%} else{}%>
<% if (chej.equals("ly")) { %>[洛阳检修车间] 配件索赔明细<%} else{}%>
</div></td>
</tr>
<tr align="center">
    <td width="180" class=tablebody2 bgcolor="#6595D6">日期</td>
    <td width="100" class=tablebody2 bgcolor="#6595D6">配件名称</td>
    <td width="100" class=tablebody2 bgcolor="#6595D6">配件编号</td>
    <td width="200" class=tablebody2 bgcolor="#6595D6">配件型号</td>
    <td width="200" class=tablebody2  bgcolor="#6595D6">原装车型车号</td>
    <td width="160" class=tablebody2 bgcolor="#6595D6">制造厂代号</td>
    <td width="120" class=tablebody2 bgcolor="#6595D6">制造时间</td>
    <td width="20" class=tablebody2 bgcolor="#6595D6">数&nbsp;量</td>
    <td width="100" class=tablebody2 bgcolor="#6595D6">所属部位</td>
    <td width="15%" class=tablebody2 bgcolor="#6595D6">故障描述</td>
    <td width="100" class=tablebody2 bgcolor="#6595D6">处&nbsp;理</td>
    <td class=tablebody2><font color="#0000ff">修改</td>
    <td class=tablebody2><font color="#ff0000">删除</font></td>
</tr>


   <% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Condsp = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 

   String StrPg = request.getParameter("Page");
            	if (StrPg == null)
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rsdsp;
   if (Condsp!= null)
            	{
            		try
            		{
            		String  sql2="";
            		    
                        
                        if (vdate1!= null && !vdate1.equals("") && vdate2!= null && !vdate2.equals(""))
						{   
						   sql2 = "select * from "+dtname+" where rq>='"+vdate1+"'" +" && rq<='"+vdate2+"'"+" order by rq desc";
						}
						else {
							sql2 = "Select * From "+dtname+"  order by rq desc";
						}
						
            			
            			Smts = Condsp.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdsp = Smts.executeQuery(sql2);
            			
                        Rsdsp.last();
                        int j = 0;
            			CountR = Rsdsp.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsdsp.first();
            			if (CountR>0)
            			{
            				Rsdsp.absolute(CurrPg*PgSize-PgSize+1);
	            			while (j<PgSize && !Rsdsp.isAfterLast())
            			       			{     
  	%>
            			    <tr <% if (j%2==0)  out.print("bgcolor='#F1D0AE'"); else out.print("bgcolor='#F9E7D4'"); %> height="25">
                            <td  ><div align="center" class="word_blue"><%=Rsdsp.getString("rq")%></div></td>
                            <td ><div align="center" class="word_blue"><%=Rsdsp.getString("pjmc")%></div></td> 
                            <% if (Rsdsp.getString("pjbh")!=null && Rsdsp.getString("pjbh")!="") { %>
                            <td><div align="center" class="word_blue"><%=Rsdsp.getString("pjbh")%></div></td> 
                            <%} else { %> <td><div align="center" class="word_blue">无</div></td> <%} %>
                            <td ><div align="center"><%=Rsdsp.getString("xinghao")%></div></td>
                            <td ><div align="center"><%=Rsdsp.getString("chexing")%>&nbsp;<%=Rsdsp.getString("chehao")%></div></td>
                            <td width="160"><div align="center"><%=Rsdsp.getString("zzcdh")%></div></td>
                            <td width="120"><div align="center"><%=Rsdsp.getString("zzsj")%></div></td>
                            <td width="20"><div align="center"><%=Rsdsp.getString("shuliang")%></div></td>
                            <td width="100"><div align="center"><%=Rsdsp.getString("bw")%></div></td>
                            <td width="15%"><div align="center"><%=Rsdsp.getString("guzhang")%></div></td>
                            <td width="100"><div align="center"><%=Rsdsp.getString("chuli")%></div></td> 
                            <td width="60"><div align="center">
                            <a href="pjgl/editsppj.jsp?cj=<%=chej%>&user=<%=user%>&Page=<%=CurrPg%>" onClick="Javascript:window.open('updatesppj.jsp?ID1=<%=Rsdsp.getString("num")%>&ID2=<%=chej%>','','width=600,height=505')">
                            <img src="Images/edit.gif" width="12" height="12" border="0" ></a></div></td>
                            <td width="60"><div align="center">
                            <a href="pjgl/editsppj.jsp?cj=<%=chej%>&user=<%=user%>&Page=<%=CurrPg%>" onClick="Javascript:window.open('delsppj.jsp?ID1=<%=Rsdsp.getString("num")%>&ID2=<%=chej%>','','width=519,height=155')">
                            <img src="Images/del.gif" width="16" height="16" border="0" ></a></div></td>
                            </tr>  
              <%
					            Rsdsp.next();
					            j++;
					    }
					    }
		    }
           catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            			Condsp.close();
            		}	
            }    
%>
<tr>
<td colspan="13" width="100%" align="right" height="20" ><div>[<a href="pjgl/editsppj.jsp?cj=<%=chej%>&user=<%=user%>" onClick="Javascript:window.open('insertsppj.jsp?cj=<%=chej%>','','width=710,height=500')">添加索赔记录</a>]</div></td>
</tr>
</table>
<table   class="tableBorder_LR"  bgcolor="#FFFFFF" " align="center"  width="871"> 
          <tr><form name="formpg" method="post" action="pjgl/editsppj.jsp">
          <td class="word_blue"  align="left">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="Page" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="v1" type="hidden" value="<%=vdate1%>">
            <input name="v2" type="hidden" value="<%=vdate2%>">
          </td></form>
          <td>
          <a href="pjgl/editsppj.jsp?Page=1&v1=<%=vdate1%>&v2=<%=vdate2%>&cj=<%=chej%>">首页</a>
           <%if (CurrPg>1){%>
            <a href="pjgl/editsppj.jsp?Page=<%=CurrPg-1%>&v1=<%=vdate1%>&v2=<%=vdate2%>&cj=<%=chej%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="pjgl/editsppj.jsp?Page=<%=CurrPg+1%>&v1=<%=vdate1%>&v2=<%=vdate2%>&cj=<%=chej%>">下一页</a> 
            <%
          	}
          %>
            <a href="pjgl/editsppj.jsp?Page=<%=CountPg%>&v1=<%=vdate1%>&v2=<%=vdate2%>&cj=<%=chej%>">最后一页</a>
            </td>
        </tr>
        </table>



<table>
<tr>
  <table width="871" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#BEE09C" bgcolor="#ffffff">
 <tr >
  <td colspan="2" height="56" bgcolor="#FFFFFF"><div align="center" style="color:#666666 ">
  <jsp:include page="CopyRight.html"/>
            </div></td></tr>
</table>

  </body>
</html>
