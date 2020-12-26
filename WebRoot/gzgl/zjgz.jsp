<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
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
    
    <title>质检发现故障</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my recordpg">
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
.STYLE2 {color: #FFFFFF}
       
    -->  
   </style>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body class="BODY">
  
  <%
  //获取当前日期的月份
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  int nowyear = today.getYear()+1900;
  int nowmonth = today.getMonth()+1; 
  
  
  String chej="";
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
	   //-  识别所属车间,如不是车间要选择车间 --
	if((islog) && (((String)session.getAttribute("deptment")).equals("41"))) { chej="zz"; } 
	  else {  if((islog) && (((String)session.getAttribute("deptment")).equals("43"))) {  chej="ly"; }
	          else{ if ((islog) && (((String)session.getAttribute("deptment")).equals("42"))) {  chej="ys"; }
	                else if ((islog) && (((String)session.getAttribute("deptment")).equals("44"))) {  chej="zl"; }
	          }
	       }
	String tabzg="zhigong";
  if (!chej.equals("")) { tabname=tabname+chej;tabzg=tabzg+chej; }
%>

   <table width="871" align="center" class="tableBorder_LR"   cellpadding="-2" cellspacing="-2">
   <%
    if((islog) && (!((String)session.getAttribute("deptment")).equals("41")) 
     && (!((String)session.getAttribute("deptment")).equals("43")) 
     && (!((String)session.getAttribute("deptment")).equals("44")) 
      && (!((String)session.getAttribute("deptment")).equals("42"))) {
       %>
       <tr>
      <td width="870" height="25"  colspan="2" bgcolor="#FFFFFF"  align="center">
      <form name="formzj" method="post" action="gzgl/gzgl.jsp">请选择车间：
      <input name="cj" type="radio" value="zz" <%if (chej.equals("zz")) out.print("checked"); %>>郑州检修车间
      <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) out.print("checked"); %>> 月山检修车间
      <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) out.print("checked"); %>> 洛阳检修车间
      <input type="radio" name="cj" value="zl" <%if (chej.equals("zl")) out.print("checked"); %>> 郑州轮轴车间
      <input type="hidden" name="page" value="2">
      <input type="submit" name="Submit" class=Style_button value="  确  定  " ></form>
      </td>
      </tr>
       <%   }   %>
    <!--质检故障明细 -->
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
      <input name="page" type=hidden value="2">
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
   &nbsp;&nbsp;&nbsp;&nbsp;<img   width="20" height="18" src="Images/add.gif" >【<a href="gzgl/editzjgz.jsp?cj=<%=chej %>" target="newwindow" class="STYLE2">编辑质检发现故障记录 </a>】&nbsp;&nbsp;  
   <%} } %>
      </td>
      </tr>
   </table>
   <table width="871" align="center" class="tableBorder_LR"   cellpadding="-2" cellspacing="-2">
   <tr>
       <td><div>
       <table width="100%" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
       <tr>
          <a href="gzgl/gzgl.jsp?page=2&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=1">
          <td width="135" height="29" <%if (subpg.equals("1")) { %>  style="background ='url(Images/cont_img2(blue).gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2(blue).gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#003399">质检发现故障明细&nbsp;</font>
          </td> 
          </a>  
          <a href="gzgl/gzgl.jsp?page=2&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=2">
          <td width="135" height="29" <%if (subpg.equals("2")) { %>  style="background ='url(Images/cont_img2(blue).gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2(blue).gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#003399">质检发现故障分析&nbsp;</font>
          </td>
          </a> 
          <a href="gzgl/gzgl.jsp?page=2&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=3">
          <td width="135" height="29" <%if (subpg.equals("3")) { %>  style="background ='url(Images/cont_img2(blue).gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2(blue).gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#003399">质检数据共享&nbsp;&nbsp;&nbsp;&nbsp;</font>
          </td>
          </a>
          <td width="466"></td>
       </tr>
       </table>
       </div>
       </td>
   </tr>
   <tr><td >
   <table width="867" cellpadding="-1" cellspacing="-1" id="zjgz" <%if (!subpg.equals("1")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %>  align="center" bgcolor="#FFFFFF" >
   <tr>
   <td width="100%" height="25"  bgcolor="#80AFFA"  align="center" valign="center">
  <% if (chej.equals("zz")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;郑州检修车间&nbsp;故障明细</font> <%} 
     else {  if (chej.equals("ys")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;月山检修车间&nbsp;故障明细</font> <%} 
             else {  if (chej.equals("ly")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;洛阳检修车间&nbsp;故障明细</font> <% } 
                     else { if (chej.equals("zl")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;郑州轮轴车间&nbsp;故障明细</font> <% }
                          }
                   }
          }     
   %>
   </td>
   </tr>
   <tr>
   <td width="100%" height="25" bgcolor="#80AFFA"  align="center" valign="center"><font color="#E1EDF9">
   <%
    if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
	{   %>&nbsp;
	[ &nbsp;查询时间段：从&nbsp;<%=datef%>&nbsp;到&nbsp;<%=dateto %>&nbsp;]
	<%} else { %>
    [ &nbsp;当前列表月份：<%=nowyear%>年<%=nowmonth %>月&nbsp;]</font></td>
    <% } %>
   </tr>
   </table>
      <table width="100%" cellpadding="-1" cellspacing="1" id="zjgz" <%if (!subpg.equals("1")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %>  align="center" bgcolor="#FFFFFF" >
   
 <% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
   
   String StrPg = request.getParameter("recpg");
            	if (StrPg == null)
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rszjgz;
   if (Con!= null)
            	{
            		try
            		{
            		String  sql="";
            		    
                        
                        if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
						{   
						   sql = "select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc,zjy";
						}
						else {
						   sql = "select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where  a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"'  order by rq desc,zjy";
						}
						
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rszjgz = Smts.executeQuery(sql);
            			
                        Rszjgz.last();
                        int i = 0;
            			CountR = Rszjgz.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rszjgz.first();
            			%>
            			   <tr align="center" height="25" bgcolor="#6699cc"> 
                             <td width="3%" align="center"><font color="#ffffff">序号</font></td>
                             <td  width="8%" align="center"><font color="#ffffff">日期</font></td>
                             <td width="10%" align="center"><font color="#ffffff">车型车号/配件编号</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">质检员</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">责任班组</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">责任人</font></td>
                             <td width="8%" align="center" ><font color="#ffffff">故障部位</font></td>
                             <td width="25%" align="center" ><font color="#ffffff">故障类别描述</font></td>
                             <td width="25%" align="center"><font color="#ffffff">故障详细描述</font></td>
                             <td width="5%" align="center"><font color="#ffffff">质量管理高压线</font></td>
                            </tr>
            			<%
            			if (CountR>0)
            			{
            				Rszjgz.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rszjgz.isAfterLast())
            			       			{     
  	                      %>
            			    <tr   height="25" bgcolor="#E1EDF9">
            			    <td width="3%" align="center"><%=(CurrPg-1)*PgSize+i+1 %></td>
                            <td width="8%"><div align="center" ><%=Rszjgz.getString("rq")%></div></td> 
                            <% if ((Rszjgz.getString("cx"))==null ) {%>
                            <td width="5%"><div align="center" >&nbsp;</div> 
                            <%} else { %>
                            <td width="10%" align="center"><%=Rszjgz.getString("cx")%>&nbsp; <%} %>
                            <%=Rszjgz.getString("ch")%></td> 
                            <td width="6%" align="center"><%=Rszjgz.getString("zjy")%></td>
                            <td width="6%" align="center"><%=Rszjgz.getString("zrbz")%></td>
                            <td width="6%" align="center"><%=Rszjgz.getString("zrr")%></td>
                            <td width="8%" align="center"><%=Rszjgz.getString("fl")%></td>
                            <td width="25%" align="left">[<%if (Rszjgz.getString("xz").equals("B")) {%><font color="#000066"><%=Rszjgz.getString("xz")%></font><%} else { if (Rszjgz.getString("xz").equals("A")) { %><font color="#ff0033"><%=Rszjgz.getString("xz")%></font><%} 
                                     else {%><%=Rszjgz.getString("xz")%><% } }%>]&nbsp;<%=Rszjgz.getString("bz")%></td> 
                            <td width="25%"  align="left"><%=Rszjgz.getString("gzms")%></td>
                            <td width="5%"  align="center"><%if (Rszjgz.getString("gyx").equals("1")) {%><font color="#ff0033">是</font><%} else out.print("否") ;%></td>
                           <%
					            Rszjgz.next();
					            i++;
					    }
					 }
            %>
            <tr >
            <td colspan="12">
            <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            <tr   height="20">
            <td nowrap  align="left" style="color:#08236F;font-size:12;">
            <form name="formzg1" method="post" action="gzgl/gzgl.jsp">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="recpg" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="v1" type="hidden" value="<%=datef %>">
            <input name="v2" type="hidden" value="<%=dateto%>">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
            </td>
            <td>
            <a href="gzgl/gzgl.jsp?page=2&recpg=1&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">首页</a>
           <%if (CurrPg>1){%>
            <a href="gzgl/gzgl.jsp?page=2&recpg=<%=CurrPg-1%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">上一页</a> 
            <% }  %>
            <%if (CurrPg<CountPg){%>
            <a href="gzgl/gzgl.jsp?page=2&recpg=<%=CurrPg+1%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">下一页</a> 
            <% } %>
            <a href="gzgl/gzgl.jsp?page=2&recpg=<%=CountPg%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">最后一页</a>
            </td>
            </tr>
            </table>
            </td>
            </tr>                     
            <tr align="right"><td colspan="2"></td></tr>            
            </table>
   
  <%
    }
           catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            		}	
            }    

   Statement Smts2,Smts3,Smts4,Smts5,Smts6; 
   ResultSet Rszjgz2;
   ResultSet Rszjgz3;
   ResultSet Rszjgz4;
   ResultSet Rszjgz5;
   ResultSet Rszjgz6;
  
   try
            		{
            		String  sql2="";
            		String  sql3="";
            		String  sql4="";
            		String  sql5="";
            		String  sql6="";
            		    
                        
                        if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
						{   
						   sql2 = "select b.name as zjy,count(a.zjy) as zjytj from "+tabname+" as a,"+tabzg+" as b where a.zjy=b.id and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by zjy order by zjytj desc ";
						   sql3 = "select b.bz as zrbz,count(a.zrbz) as bztj from "+tabname+" as a ,banzu as b where a.zrbz=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by zrbz order by bztj desc " ;
						   sql4 = "select b.name as zrr,c.bz as zrbz ,count(a.zrr) as zrrtj from "+tabname+" as a,"+tabzg+" as b,banzu as c where a.zrbz=c.code and a.zrr=b.id and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by zrr order by zrbz,zrrtj desc " ;
						   sql5 = "select b.fl as bw,count(b.fl) as bwtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by bw order by bwtj desc " ;
						   sql6 = "select b.xz as lb,count(b.xz) as lbtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by lb order by lb " ;
						}
						else {
						   sql2 = "select b.name as zjy,count(a.zjy) as zjytj from "+tabname+" as a,"+tabzg+" as b where a.zjy=b.id  and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by a.zjy order by zjytj desc ";
						   sql3 = "select b.bz as zrbz,count(a.zrbz) as bztj from "+tabname+" as a ,banzu as b where a.zrbz=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by zrbz order by bztj desc " ;
						   sql4 = "select b.name as zrr,c.bz as zrbz ,count(a.zrr) as zrrtj from "+tabname+" as a,"+tabzg+" as b,banzu as c where a.zrbz=c.code and a.zrr=b.id and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by a.zrr order by zrbz,zrrtj desc " ;
						   sql5 = "select b.fl as bw,count(b.fl) as bwtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by b.fl order by bwtj desc " ;
						   sql6 = "select b.xz as lb,count(b.xz) as lbtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by b.xz order by lbtj desc " ;
						}
					
						Smts2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts3 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts4 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts5 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts6 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						 
            			Rszjgz2 = Smts2.executeQuery(sql2);
            			Rszjgz2.first();
            			Rszjgz3 = Smts3.executeQuery(sql3);
            			Rszjgz3.first();
            			Rszjgz4 = Smts4.executeQuery(sql4);
            			Rszjgz4.first();
            			Rszjgz5 = Smts5.executeQuery(sql5);
            			Rszjgz5.first();
            			Rszjgz6 = Smts6.executeQuery(sql6);
            			Rszjgz6.first();
            			%>

   <table width="867" cellpadding="-1" cellspacing="-1" id="zjgz" <%if (!subpg.equals("2")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %>  align="center" bgcolor="#FFFFFF" >
   <tr>
   <td width="100%" height="25"  bgcolor="#80AFFA"  align="center" valign="center">
  <% if (chej.equals("zz")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;郑州检修车间&nbsp;故障统计及分析</font> <%} 
     else {  if (chej.equals("ys")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;月山检修车间&nbsp;故障统计及分析</font> <%} 
             else {  if (chej.equals("ly")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;洛阳检修车间&nbsp;故障统计及分析</font> <% } 
                     else { if (chej.equals("zl")) { %> <font color="#ffffff">&nbsp;质检发现&nbsp;郑州轮轴车间&nbsp;故障统计及分析</font> <% }
                          }
                   }
          }     
   %>
   </td>
   </tr>
   <tr>
   <td width="100%" height="25" bgcolor="#80AFFA"  align="center" valign="center"><font color="#E1EDF9">
   <%if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
	{   %>&nbsp;
	[ &nbsp;查询时间段：从&nbsp;<%=datef%>&nbsp;到&nbsp;<%=dateto %>&nbsp;]
	<%} else { %>
    [ &nbsp;当前列表月份：<%=nowyear%>年<%=nowmonth %>月&nbsp;]
    <% } %>
    </font></td>
    
   </tr>
   </table>
    <table width="100%" cellpadding="-1" cellspacing="1"  id="zjtj" <%if (!subpg.equals("2")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> align="center"  border="0" cellspacing="0" cellpadding="0">
    <tr align="center" height="25" bgcolor="#6699cc">
      <td width="10%" align="center"><font color="#ffffff">质检员</td>
      <td width="10%" align="center"><font color="#ffffff">数&nbsp;量</td>
      <td width="10%" align="center" class="word_blue">责任班组</td>
      <td width="10%" align="center" class="word_blue">数&nbsp;量</td>
      <td width="15%" align="center"><font color="#ffffff">责任人</td>
      <td width="5%" align="center"><font color="#ffffff">数&nbsp;量</td>
      <td width="10%" align="center" class="word_blue">故障部位</td>
      <td width="10%" align="center" class="word_blue">数&nbsp;量</td>
      <td width="10%" align="center" ><font color="#ffffff">故障类别</td>
      <td width="10%" align="center" ><font color="#ffffff">数&nbsp;量</td>
    </tr>
            			<%
            			while ((!Rszjgz2.isAfterLast()) || (!Rszjgz3.isAfterLast()) || (!Rszjgz4.isAfterLast()) || (!Rszjgz5.isAfterLast()))
            			   {     
  	                      %><tr border="1" bordercolor="#6894D5" bgcolor="#E1EDF9" height="25">
            			   <%if (!Rszjgz2.isAfterLast()) { %> 
            			   <td width="10%" align="center"><%=Rszjgz2.getString("zjy")%></td> 
            			   <td width="10%" align="center"><%=Rszjgz2.getString("zjytj")%></td>
            			   <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			   <% } %>
                           <%if (!Rszjgz3.isAfterLast()) { %>
            			    <td width="10%" align="center" class="word_blue"><%=Rszjgz3.getString("zrbz")%></td>
            			    <td width="10%" align="center" class="word_blue"><%=Rszjgz3.getString("bztj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    <%if (!Rszjgz4.isAfterLast()) { %> 
            			   <td width="15%" align="center"><%=Rszjgz4.getString("zrbz")%>:<%=Rszjgz4.getString("zrr")%></td> 
            			   <td width="5%" align="center"><%=Rszjgz4.getString("zrrtj")%></td>
            			   <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="5%" align="center"></td>
            			   <% } %>
                           <%if (!Rszjgz5.isAfterLast()) { %>
            			    <td width="10%" align="center" class="word_blue"><%=Rszjgz5.getString("bw")%></td>
            			    <td width="10%" align="center" class="word_blue"><%=Rszjgz5.getString("bwtj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    <%if (!Rszjgz6.isAfterLast()) { %>
            			    <td width="10%" align="center" ><%=Rszjgz6.getString("lb")%></td>
            			    <td width="10%" align="center"  ><%=Rszjgz6.getString("lbtj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    </tr>
                           <% Rszjgz2.next();
                              Rszjgz3.next();
                              Rszjgz4.next();
                              Rszjgz5.next();
                              Rszjgz6.next();
					    }
			 }
           catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            			Con.close();
            		}	
                          %>
</table>
</td>
</tr>
</table>
<!--  
<table 
<% if (!subpg.equals("3")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> width="871" align="center" class="tableBorder_LR" border="0" cellspacing="0" cellpadding="0">
   <tr>
   <td width="736" bgcolor="#80AFFA"  align="center"><font color="#FFFFFF">数据报表上传、下载</font></td>
   </tr>
</table>
-->
  </body>
</html>
