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
<!DOCTYPE HTML PUBLIC "u685ld6-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验收签发返工情况编辑</title>
    
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
     body {
	margin-left: 0px; 
	margin-top: 0px;
      }
      .word_yellow {
	 	font-size: 9pt;
	  	color: #EFD20F;  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体;}
     INPUT.Style_btn {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #FF6666 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 60px
       }
       .tableBorder_LR {
	   border: #DFE1EB 1px solid;
	   border-bottom-style:none;
	   border-Top-style:none;
       }
        INPUT.Style_btnsm {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #D84E3F 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 30px
       }
       .tableBorder
{
border: 1px #DEDEDE solid; 

}
    -->  
     </style>
	
	
    <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
  <body onLoad="clockon(bgclock)" background="Images/bg2.gif">
  <table background="Images/titleedit.jpg" class="tableBorder"  height="50" width="871"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td valign="center" align="left"></td></tr>
  </table>
  <table class="tableBorder_LR" background="Images/Top_02.gif" width="871" height="90" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#6894D5" bgcolor="#ffffff">
  <tr>
  <td  height="80%" valign="center" align="center" width="803" height="166" style="FONT:20px 黑体;COLOR:#ffffff;HEIGHT:18px;BACKGROUND-COLOR:#DFFF1F9">&nbsp;验&nbsp;收&nbsp;签&nbsp;发&nbsp;返&nbsp;工&nbsp;编&nbsp;辑</td>
  </tr>
  <tr>
  <td align="right" height="20%">
     <div><script src="JS/onclock.JS"></script><div id="bgclock" class="word_yellow"></div>
  </td>
  </tr>
  </table>
  <%
  String chejian="";
  if (request.getParameter("cj")!=null) chejian=new String(request.getParameter("cj"));
  String dtname="ysgz";
  String tabzg="zhigong";
  if (!chejian.equals("")) { dtname=dtname+chejian; tabzg=tabzg+chejian;}
  
   
  String dtfrom="";
  if (request.getParameter("value1")!=null) dtfrom = new String(request.getParameter("value1"));
    String dtto ="";
  if (request.getParameter("value2")!= null) dtto =new String(request.getParameter("value2"));
   boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	   //-  识别所属车间,如不是车间要选择车间 --
	if((islog) && (((String)session.getAttribute("deptment")).equals("41"))) { chejian="zz"; } 
	  else {  if((islog) && (((String)session.getAttribute("deptment")).equals("43"))) {  chejian="ly"; }
	          else{ if((islog) && (((String)session.getAttribute("deptment")).equals("42"))) {  chejian="ys"; }
	          }
	       }
%>
   <table valign="center" width="871" align="center"  class="tableBorder_LR" bgcolor="#ffffff"  cellpadding="-2" cellspacing="-2">
  <% if((islog) && (!((String)session.getAttribute("deptment")).equals("41")) 
     && (!((String)session.getAttribute("deptment")).equals("43")) 
      && (!((String)session.getAttribute("deptment")).equals("42"))) {  %>
       <tr>
      <td width="870" height="20"  colspan="2"   align="center" valign="middle" bordercolor="#BEE09C">
      <form name="formcj" method="post" action="gzgl/editysgz.jsp">请选择车间：
      <input name="cj" type="radio"  value="zz" <%if (chejian.equals("zz")) out.print("checked"); %>> 郑州检修车间
      <input type="radio" name="cj" value="ys" <%if (chejian.equals("ys")) out.print("checked"); %>> 月山检修车间
      <input type="radio" name="cj" value="ly" <%if (chejian.equals("ly")) out.print("checked"); %>> 洛阳检修车间
      <input type="radio" name="cj" value="zl" <%if (chejian.equals("zl")) out.print("checked"); %>> 郑州轮轴车间
      <input type="submit" name="Submit" class=Style_button value="  确  定  " ></form>
      </td>
      </tr>  <%  } %>
       
    <!-- 验收故障明细 -->
   <tr>
   <td  width="870" height="20" colspan="2" align="center" bgcolor="#ffffff"  valign="middle">
   <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
}
</script>
      <form name="formcx" method="post" action="gzgl/editysgz.jsp"> 查询时间段:从 
      <input name="value1" type="text" onDBLClick="loadCalendar(this)" value=<%=dtfrom%>> &nbsp;到 
      <input name="value2" type="text" onDBLClick="loadCalendar(this)" value=<%=dtto%>>
      <input name="cj" type=hidden value=<%=chejian %>>
      <input type="submit" name="Submit"  class=Style_button value="  查  询  " >
      </form>
   </td></tr></table>

<table class="tableBorder_LR" bgcolor="#FFFFFF" align="center" width="871" border="0" cellpadding="-2" cellspacing="1">
<tr >
 <td  colspan="13" align="left" height="20" ><div>&nbsp;<img width="20" height="18" src="Images/add.gif" >【&nbsp;<a href="gzgl/editysgz.jsp?cj=<%=chejian%>" onClick="Javascript:window.open('insysgz.jsp?cj=<%=chejian%>','','width=562,height=490')">添加记录</a>&nbsp;】</div></td>
</tr>
<tr align="center"  height="30">
<td colspan="13" bgcolor="#D84E3F"  style="color:#ffffff;font-size:13;font-family:宋体"><div align="center" >
<% if (chejian.equals("zz")) { %>验收签发 [郑州检修车间] 交验返工故障明细<%} else{} %>
<% if (chejian.equals("ys")) { %>验收签发 [月山检修车间] 交验返工故障明细<%} else{}%>
<% if (chejian.equals("ly")) { %>验收签发 [洛阳检修车间] 交验返工故障明细<%} else{}%>
</div></td>
</tr>



   <% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 

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
   ResultSet Rsysgz;
   if (Con!= null)
            	{
            		try
            		{
            		String  sql="";
            		    
                        
                       if (dtfrom!= null && !dtfrom.equals("") && dtto!= null && !dtto.equals(""))
						{   
						   sql = "select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.ysy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+dtname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where rq>='"+dtfrom+"'" +" && rq<='"+dtto+"'"+" and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc,ysy";
						}
						else {
						   sql = "select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.ysy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+dtname+" as a,"+tabzg+" as c,cpzlbz as d,banzu as e where   c.id=a.zrr  and a.gzcode=d.code and e.code=a.zrbz order by rq desc,ysy";
						}         
						 
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsysgz = Smts.executeQuery(sql);
            			
                        Rsysgz.last();
                        int i = 0;
            			CountR = Rsysgz.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsysgz.first();
            			%>
            			   <tr align="center" height="25" bgcolor="#F6E3A9" > 
                             <td width="3%" align="center"> 序号 </td>
                             <td  width="8%" align="center">日期</td>
                             <td width="10%" align="center" >车型车号/配件编号</td>
                             <td width="6%" align="center" >验收员</td>
                             <td width="6%" align="center" >责任班组</td>
                             <td width="6%" align="center" >责任人</td>
                             <td width="8%" align="center" >故障部位</td>
                             <td width="25%" align="center">故障类别描述</td>
                             <td width="25%" align="center">故障详细描述</td>
                             <td width="5%" align="center">质量管理高压线</td>
                             <td  align="center" ><font color="#0000ff">修改</td>
                             <td align="center" ><font color="#ff0000">删除</font></td>
                            </tr>
            			<%
            			if (CountR>0)
            			{
            				Rsysgz.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rsysgz.isAfterLast())
            			       			{     
  	                      %>
            			    <tr   height="25" bgcolor="#F9F1D8">
            			    <td width="3%" align="center"><%=(CurrPg-1)*PgSize+i+1 %></td>
                            <td width="8%"><div align="center" ><%=Rsysgz.getString("rq")%></div></td> 
                            <% if ((Rsysgz.getString("cx"))==null ) {%>
                            <td width="5%"><div align="center" >&nbsp;</div> 
                            <%} else { %>
                            <td width="10%" align="center"><%=Rsysgz.getString("cx")%>&nbsp; <%} %>
                            <%=Rsysgz.getString("ch")%></td> 
                            <td width="6%" align="center"><%=Rsysgz.getString("ysy")%></td>
                            <td width="6%" align="center"><%=Rsysgz.getString("zrbz")%></td>
                            <td width="6%" align="center"><%=Rsysgz.getString("zrr")%></td>
                            <td width="8%" align="center"><%=Rsysgz.getString("fl")%></td>
                            <td width="25%" align="left">[<%if (Rsysgz.getString("xz").equals("B")) {%><font color="#000066"><%=Rsysgz.getString("xz")%></font><%} else { if (Rsysgz.getString("xz").equals("A")) { %><font color="#ff0033"><%=Rsysgz.getString("xz")%></font><%} 
                                     else {%><%=Rsysgz.getString("xz")%><% } }%>]&nbsp;<%=Rsysgz.getString("bz")%></td> 
                            <td width="25%"  align="left"><%=Rsysgz.getString("gzms")%></td>
                            <td width="5%"  align="center"><%if (Rsysgz.getString("gyx").equals("1")) {%><font color="#ff0033">是</font><%} else out.print("否") ;%></td>
                            <td ><div align="center">
                            <a href="gzgl/editysgz.jsp?cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto%>" onClick="Javascript:window.open('updateysgz.jsp?ID1=<%=Rsysgz.getString("id")%>&ID2=<%=chejian%>','','width=600,height=430')"><img src="Images/edit.gif" width="12" height="12" border="0"></a>
                            </div></td>
                            <td ><div align="center">
                            <a href="gzgl/editysgz.jsp?cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto%>" onClick="Javascript:window.open('delysgz.jsp?ID1=<%=Rsysgz.getString("id")%>&ID2=<%=chejian%>','','width=519,height=155')">
                            <img src="Images/del.gif" width="16" height="16" border="0" ></a>
                            </div></td></tr>
                           <%
					            Rsysgz.next();
					            i++;
					    }
					 }
					 
	%>				 
					 
					 <tr><td colspan="12">
                    
                   <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1">
            <tr   height="20">
            <td nowrap  align="left" style="color:#D84E3F;font-size:12;">
            <form name="formzg1" method="post" action="gzgl/gzgl.jsp">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="recpg" type="text" size="3" class=Sytle_textredsm>&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_btnsm">
            <input name="page" type="hidden" value="1">
            <input name="v1" type="hidden" value="<%=dtfrom %>">
            <input name="v2" type="hidden" value="<%=dtto%>">
            <input name="cj" type="hidden" value="<%=chejian%>">
            </form>
            </td>
            <td >
            <a href="gzgl/gzgl.jsp?page=1&recpg=1&cj=<%=chejian%>&v1=<%=dtfrom%>&v2=<%=dtto %>">首页</a>
           <%if (CurrPg>1){%>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CurrPg-1%>&cj=<%=chejian%>&v1=<%=dtfrom%>&v2=<%=dtto %>">上一页</a> 
            <% }  %>
            <%if (CurrPg<CountPg){%>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CurrPg+1%>&cj=<%=chejian%>&v1=<%=dtfrom%>&v2=<%=dtto %>">下一页</a> 
            <% } %>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CountPg%>&cj=<%=chejian%>&v1=<%=dtfrom%>&v2=<%=dtto %>">最后一页</a>
            </td>
            </tr>
            </table></td></tr></table>

     <%
		    
					    
		    }
           catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            			Con.close();
            		}	
            }    
%>
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
