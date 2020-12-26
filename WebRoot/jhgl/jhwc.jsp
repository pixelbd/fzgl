<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计划完成情况</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet> 
  <body>
<script language="javascript">
function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
function Showcxtab(){
	if(cxtab.style.display == ""){
	}else{
		cxtab.style.display = "";
		dxtab.style.display = "none";
		cctab.style.display = "none";
	}
}
function Showdxtab(){
	if(dxtab.style.display == ""){
	}else{
		dxtab.style.display = "";
		cxtab.style.display = "none";
		cctab.style.display = "none"
	}
}
function Showcctab(){
	if(cctab.style.display == ""){
	}else{
		cctab.style.display = "";
		dxtab.style.display = "none";
		cxtab.style.display = "none";
	}
}
</script>
<%  
  int CountPg = 0;
  int CurrPg = 1;
  int PgSize = 20;
  int CountR = 0;

  String sql1="";
  String sql2="";
  String sql3="";
  String sql4="";
  
  String tabname="";
  int t60t=0;
  int t70t=0;
  int zy=0;  
  int zb=0;

  String rq="";
  if (request.getParameter("rq")!=null) rq=new String(request.getParameter("rq"));
  
  String subpg="1";
  if (request.getParameter("subpage")!=null) subpg=new String(request.getParameter("subpage"));
  
  String str="";
  int i=0;
  int j=0;
 
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 
  Statement Smts; 
  ResultSet Rs;

  boolean islog=false;
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
%>
 
 <table width="100%" bgcolor="#FFFFFF" border="0" cellpadding="-2"  cellspacing="-2"  >
  <tr  border="0" valign="middle"> 
  <td  colspan="4" height="30"   align="center" valign="center">
    <form name="form1" method="post" action="jhgl/scrw.jsp">
         按日期查询:
          <input type="text" name="rq" ondblclick="loadCalendar(this)" value="<%=rq%>">&nbsp;
          <input type="hidden" name="page" value="1">
          <input type="hidden" name="subpage" value=<%=subpg%>> 
          <input type="submit" name="Submit"  class="Style_button" value="查  询">
    </form>
  </td>
  </tr>
  <tr><td width="110" onMouseOver="img1.src='Images/dot2.gif'" onMouseOut="img1.src='Images/dot.gif'"><img id="img1" width="18" height="18"  src="Images/dot.gif"><a href="jhgl/scrw.jsp?page=1&subpage=1&rq=<%=rq%>">入段厂修</a></td>
      <td width="100" onMouseOver="img2.src='Images/dot2.gif'" onMouseOut="img2.src='Images/dot.gif'"><img id="img2" width="18" height="18" src="Images/dot.gif" ><a href="jhgl/scrw.jsp?page=1&subpage=2&rq=<%=rq%>">&nbsp;段&nbsp;修&nbsp;</a></td>
      <td width="100" onMouseOver="img3.src='Images/dot2.gif'" onMouseOut="img3.src='Images/dot.gif'"><img id="img3" width="18" height="18" src="Images/dot.gif" ><a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CurrPg%>">残&nbsp;车&nbsp;情&nbsp;况</a></td>
      <td width="560"></td></tr>
  <tr    border="0" valign="middle"> 
     <td  colspan="4"  align="center" valign="center">
     <div>
     <table id="cxtab" <%if (!subpg.equals("1")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %>  width="100%" border="0" cellpadding="-2" cellspacing="1">
     <tr bgcolor="FFCC99" height="20"  >
         <td  rowspan="3" align="center" valign="middle"><font color="#333399">入&nbsp;段&nbsp;厂&nbsp;修</font></td> 
         <td width="68%"  align="center" colspan="21">国铁货车</td>
         <td width="20%"  align="center" colspan="6">自备货车</td>
     </tr>
     <tr bgcolor="FFCC99" height="20">
         <td align="center" colspan="9">60t级货车</td>
         <td align="center" colspan="4">70t级货车</td>
         <td align="center" colspan="4">专用货车</td>
         <td align="center" colspan="4"  valign="middle">国铁改造</td>
         <td  align="center" colspan="2">自备</td>
         <td   align="center" colspan="4"  valign="middle">自备改造</td>
     </tr>
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center">C</td>
         <td width="29"  align="center">N</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">X</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">T</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">行包</td>
         <td width="29" align="center">C</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">D</td>
         <td width="29" align="center">DL1</td>
         <td width="29" align="center">X2H(K)</td>
         <td width="29" align="center">X6K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
     </tr>
<%
   if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						for(i=0;i<3;i++)
						{
						if (i==0) { tabname="jhwczz"; str="郑州检修";}
						if (i==1) { tabname="jhwcly"; str="洛阳检修";}
						if (i==2) { tabname="jhwcys"; str="月山检修";}
						
						if (!rq.equals("")) { sql1="select * from "+tabname+" where rq='"+rq+"'"; 
						                      sql2="select sum(cxgtc) as cxgtcm, sum(cxgtn) as cxgtnm, sum(cxgtnx) as cxgtnxm,sum(cxgtx) as cxgtxm,sum(cxgtp) as cxgtpm,sum(cxgtpb) as cxgtpbm,sum(cxgtg) as cxgtgm,sum(cxgtk) as cxgtkm,sum(cxgtt) as cxgttm,sum(cxgt70c) as cxgt70cm,sum(cxgt70p) as cxgt70pm,sum(cxgt70nx) as cxgt70nxm,sum(cxgt70k) as cxgt70km,sum(cxgtd) as cxgtdm,sum(cxgtdl1) as cxgtdl1m,sum(cxgtx2kh) as cxgtx2khm,sum(cxgtx6k) as cxgtx6km, sum(cxgtgk2) as cxgtgk2m,sum(cxgtgt) as cxgtgtm,sum(cxgtg120) as cxgtg120m,sum(cxgtgzha) as cxgtgzham,sum(cxzbg) as cxzbgm, sum(cxzbgk2) as cxzbgk2m,sum(cxzbgt) as cxzbgtm,sum(cxzbg120) as cxzbg120m,sum(cxzbgzha) as cxzbgzham from "+tabname+ " where month(rq)=month('"+rq+"') and  year(rq)=year('"+rq+"')";
						                      sql3="select sum(cxgtc) as cxgtcy, sum(cxgtn) as cxgtny, sum(cxgtnx) as cxgtnxy,sum(cxgtx) as cxgtxy,sum(cxgtp) as cxgtpy,sum(cxgtpb) as cxgtpby,sum(cxgtg) as cxgtgy,sum(cxgtk) as cxgtky,sum(cxgtt) as cxgtty,sum(cxgt70c) as cxgt70cy,sum(cxgt70p) as cxgt70py,sum(cxgt70nx) as cxgt70nxy,sum(cxgt70k) as cxgt70ky,sum(cxgtd) as cxgtdy,sum(cxgtdl1) as cxgtdl1y,sum(cxgtx2kh) as cxgtx2khy,sum(cxgtx6k) as cxgtx6ky, sum(cxgtgk2) as cxgtgk2y,sum(cxgtgt) as cxgtgty,sum(cxgtg120) as cxgtg120y,sum(cxgtgzha) as cxgtgzhay,sum(cxzbg) as cxzbgy, sum(cxzbgk2) as cxzbgk2y,sum(cxzbgt) as cxzbgty,sum(cxzbg120) as cxzbg120y,sum(cxzbgzha) as cxzbgzhay from "+tabname+ " where year(rq)=year('"+rq+"')";
						}
                        else { sql1="select * from "+tabname+" where rq in (select max(rq) from "+tabname+")"; 
                               sql2="select sum(cxgtc) as cxgtcm, sum(cxgtn) as cxgtnm, sum(cxgtnx) as cxgtnxm,sum(cxgtx) as cxgtxm,sum(cxgtp) as cxgtpm,sum(cxgtpb) as cxgtpbm,sum(cxgtg) as cxgtgm,sum(cxgtk) as cxgtkm,sum(cxgtt) as cxgttm,sum(cxgt70c) as cxgt70cm,sum(cxgt70p) as cxgt70pm,sum(cxgt70nx) as cxgt70nxm,sum(cxgt70k) as cxgt70km,sum(cxgtd) as cxgtdm,sum(cxgtdl1) as cxgtdl1m,sum(cxgtx2kh) as cxgtx2khm,sum(cxgtx6k) as cxgtx6km, sum(cxgtgk2) as cxgtgk2m,sum(cxgtgt) as cxgtgtm,sum(cxgtg120) as cxgtg120m,sum(cxgtgzha) as cxgtgzham,sum(cxzbg) as cxzbgm,sum(cxzbk) as cxzbkm, sum(cxzbgk2) as cxzbgk2m,sum(cxzbgt) as cxzbgtm,sum(cxzbg120) as cxzbg120m,sum(cxzbgzha) as cxzbgzham from "+tabname+ " where month(rq)=month((select max(rq) from "+tabname+")) and  year(rq)=year((select max(rq) from "+tabname+"))";
                               sql3="select sum(cxgtc) as cxgtcy, sum(cxgtn) as cxgtny, sum(cxgtnx) as cxgtnxy,sum(cxgtx) as cxgtxy,sum(cxgtp) as cxgtpy,sum(cxgtpb) as cxgtpby,sum(cxgtg) as cxgtgy,sum(cxgtk) as cxgtky,sum(cxgtt) as cxgtty,sum(cxgt70c) as cxgt70cy,sum(cxgt70p) as cxgt70py,sum(cxgt70nx) as cxgt70nxy,sum(cxgt70k) as cxgt70ky,sum(cxgtd) as cxgtdy,sum(cxgtdl1) as cxgtdl1y,sum(cxgtx2kh) as cxgtx2khy,sum(cxgtx6k) as cxgtx6ky, sum(cxgtgk2) as cxgtgk2y,sum(cxgtgt) as cxgtgty,sum(cxgtg120) as cxgtg120y,sum(cxgtgzha) as cxgtgzhay,sum(cxzbg) as cxzbgy,sum(cxzbk) as cxzbky, sum(cxzbgk2) as cxzbgk2y,sum(cxzbgt) as cxzbgty,sum(cxzbg120) as cxzbg120y,sum(cxzbgzha) as cxzbgzhay from "+tabname+ " where year(rq)=year((select max(rq) from "+tabname+"))";
                        }
            			Rs  = Smts.executeQuery(sql1);
            			Rs.last();
            			CountR = Rs.getRow();
            			
            			if (CountR>0)
            			{
            			Rs .first();
            			t60t=Integer.valueOf(Rs.getString("cxgtc")).intValue()+Integer.valueOf(Rs.getString("cxgtn")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtnx")).intValue()+Integer.valueOf(Rs.getString("cxgtx")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtp")).intValue()+Integer.valueOf(Rs.getString("cxgtg")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtt")).intValue()+Integer.valueOf(Rs.getString("cxgtk")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtpb")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("cxgt70c")).intValue()+Integer.valueOf(Rs.getString("cxgt70nx")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgt70p")).intValue()+Integer.valueOf(Rs.getString("cxgt70k")).intValue();
            			zy= Integer.valueOf(Rs.getString("cxgtd")).intValue()+Integer.valueOf(Rs.getString("cxgtdl1")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtx2kh")).intValue()+Integer.valueOf(Rs.getString("cxgtx6k")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtp")).intValue()+Integer.valueOf(Rs.getString("cxgtg")).intValue();
            			zb= Integer.valueOf(Rs.getString("cxzbg")).intValue()+Integer.valueOf(Rs.getString("cxzbk")).intValue();
            			
            		%>
            		<tr height="25" bgcolor="#CCCCFF"><td><font color="#D33C22"><%=str %></font>:<%=Rs.getString("rq").replace("-", ".")%></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtc").equals("0")) && (Rs.getString("cxgtc")!=null)) { %> <%=Rs.getString("cxgtc")%> <% } else {%>&nbsp; <%} ;%></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtn").equals("0")) && (Rs.getString("cxgtn")!=null)) { %> <%=Rs.getString("cxgtn")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtnx").equals("0")) && (Rs.getString("cxgtnx")!=null)) { %> <%=Rs.getString("cxgtnx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtx").equals("0")) && (Rs.getString("cxgtx")!=null)) { %> <%=Rs.getString("cxgtx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtg").equals("0")) && (Rs.getString("cxgtg")!=null)) { %> <%=Rs.getString("cxgtg")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtk").equals("0")) && (Rs.getString("cxgtk")!=null)) { %> <%=Rs.getString("cxgtk")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtt").equals("0")) && (Rs.getString("cxgtt")!=null)) { %> <%=Rs.getString("cxgtt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtp").equals("0")) && (Rs.getString("cxgtp")!=null)) { %> <%=Rs.getString("cxgtp")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtpb").equals("0")) && (Rs.getString("cxgtpb")!=null)) { %> <%=Rs.getString("cxgtpb")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgt70c").equals("0")) && (Rs.getString("cxgt70c")!=null)) { %> <%=Rs.getString("cxgt70c")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgt70nx").equals("0")) && (Rs.getString("cxgt70nx")!=null)) { %> <%=Rs.getString("cxgt70nx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgt70p").equals("0")) && (Rs.getString("cxgt70p")!=null)) { %> <%=Rs.getString("cxgt70p")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgt70k").equals("0")) && (Rs.getString("cxgt70k")!=null)) { %> <%=Rs.getString("cxgt70k")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtd").equals("0")) && (Rs.getString("cxgtd")!=null)) { %> <%=Rs.getString("cxgtd")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtdl1").equals("0")) && (Rs.getString("cxgtdl1")!=null)) { %> <%=Rs.getString("cxgtdl1")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtx2kh").equals("0")) && (Rs.getString("cxgtx2kh")!=null)) { %> <%=Rs.getString("cxgtx2kh")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtx6k").equals("0")) && (Rs.getString("cxgtx6k")!=null)) { %> <%=Rs.getString("cxgtx6k")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtgk2").equals("0")) && (Rs.getString("cxgtgk2")!=null)) { %> <%=Rs.getString("cxgtgk2")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtgt").equals("0")) && (Rs.getString("cxgtgt")!=null)) { %> <%=Rs.getString("cxgtgt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtg120").equals("0")) && (Rs.getString("cxgtg120")!=null)) { %> <%=Rs.getString("cxgtg120")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxgtgzha").equals("0")) && (Rs.getString("cxgtgzha")!=null)) { %> <%=Rs.getString("cxgtgzha")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbg").equals("0")) && (Rs.getString("cxzbg")!=null)) { %><%=Rs.getString("cxzbg")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbk").equals("0")) && (Rs.getString("cxzbk")!=null)) { %><%=Rs.getString("cxzbk")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbgk2").equals("0")) && (Rs.getString("cxzbgk2")!=null)) { %> <%=Rs.getString("cxzbgk2")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbgt").equals("0")) & (Rs.getString("cxzbgt")!=null)) { %><%=Rs.getString("cxzbgt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbg120").equals("0")) && (Rs.getString("cxzbg120")!=null)) { %> <%=Rs.getString("cxzbg120")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("cxzbgzha").equals("0")) && (Rs.getString("cxzbgzha")!=null)) { %> <%=Rs.getString("cxzbgzha")%> <% } else {%>&nbsp; <%} %></td>
                        
                    </tr>	
                    <tr height="25" bgcolor="#CCCCFF"><td align="center"><%=Rs.getString("rq").replace("-", ".")%>小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#CCCCFF"><td align="center"><%=Rs.getString("rq").replace("-", ".")%>合计</td>
                    <td  colspan="17" align="center"><%=t60t+t70t+zy%></td><td  colspan="4" align="center"></td>
                    <td  colspan="2" align="center"><%=zb%></td>
                    <td  colspan="4" align="center"></td>
                    </tr>
                   <% } 
                    Rs=Smts.executeQuery(sql2);
                    Rs.last();
            			CountR = Rs.getRow();
            			if (CountR>0)
            			{
            		   Rs.first(); 
            		   t60t=Integer.valueOf(Rs.getString("cxgtcm")).intValue()+Integer.valueOf(Rs.getString("cxgtnm")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtnxm")).intValue()+Integer.valueOf(Rs.getString("cxgtxm")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtpm")).intValue()+Integer.valueOf(Rs.getString("cxgtgm")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgttm")).intValue()+Integer.valueOf(Rs.getString("cxgtkm")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtpbm")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("cxgt70cm")).intValue()+Integer.valueOf(Rs.getString("cxgt70nxm")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgt70pm")).intValue()+Integer.valueOf(Rs.getString("cxgt70km")).intValue();
            			zy= Integer.valueOf(Rs.getString("cxgtdm")).intValue()+Integer.valueOf(Rs.getString("cxgtdl1m")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtx2khm")).intValue()+Integer.valueOf(Rs.getString("cxgtx6km")).intValue();
            			zb= Integer.valueOf(Rs.getString("cxzbgm")).intValue()+Integer.valueOf(Rs.getString("cxzbkm")).intValue();
            			%>
                    <tr height="25" bgcolor="#C8DEF5">
                    <td ><font color="#D33C22"><%=str %></font>当月累计</td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtcm")!=null && !Rs.getString("cxgtcm").equals("0")) { %><%=Rs.getString("cxgtcm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtnm")!=null && !Rs.getString("cxgtnm").equals("0")) { %> <%=Rs.getString("cxgtnm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtnxm")!=null && !Rs.getString("cxgtnxm").equals("0")) { %><%=Rs.getString("cxgtnxm")%><% } %> </td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtxm")!=null && !Rs.getString("cxgtxm").equals("0")) { %><%=Rs.getString("cxgtxm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgm")!=null && !Rs.getString("cxgtgm").equals("0")) { %><%=Rs.getString("cxgtgm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtkm")!=null && !Rs.getString("cxgtkm").equals("0")) { %><%=Rs.getString("cxgtkm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgttm")!=null && !Rs.getString("cxgttm").equals("0")) { %><%=Rs.getString("cxgttm")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtpm")!=null && !Rs.getString("cxgtpm").equals("0")) { %><%=Rs.getString("cxgtpm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtpbm")!=null && !Rs.getString("cxgtpbm").equals("0")) { %><%=Rs.getString("cxgtpbm")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70cm")!=null && !Rs.getString("cxgt70cm").equals("0")) { %><%=Rs.getString("cxgt70cm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70nxm")!=null && !Rs.getString("cxgt70nxm").equals("0")) { %><%=Rs.getString("cxgt70nxm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70pm")!=null && !Rs.getString("cxgt70pm").equals("0")) { %><%=Rs.getString("cxgt70pm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70km")!=null && !Rs.getString("cxgt70km").equals("0")) { %><%=Rs.getString("cxgt70km")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtdm")!=null && !Rs.getString("cxgtdm").equals("0")) { %><%=Rs.getString("cxgtdm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtdl1m")!=null && !Rs.getString("cxgtdl1m").equals("0")) { %><%=Rs.getString("cxgtdl1m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtx2khm")!=null && !Rs.getString("cxgtx2khm").equals("0")) { %><%=Rs.getString("cxgtx2khm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtx6km")!=null && !Rs.getString("cxgtx6km").equals("0")) { %><%=Rs.getString("cxgtx6km")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgk2m")!=null && !Rs.getString("cxgtgk2m").equals("0")) { %><%=Rs.getString("cxgtgk2m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgtm")!=null && !Rs.getString("cxgtgtm").equals("0")) { %><%=Rs.getString("cxgtgtm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtg120m")!=null && !Rs.getString("cxgtg120m").equals("0")) { %><%=Rs.getString("cxgtg120m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgzham")!=null && !Rs.getString("cxgtgzham").equals("0")) { %><%=Rs.getString("cxgtgzham")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgm")!=null && !Rs.getString("cxzbgm").equals("0")) { %><%=Rs.getString("cxzbgm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbkm")!=null && !Rs.getString("cxzbkm").equals("0")) { %><%=Rs.getString("cxzbkm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgk2m")!=null && !Rs.getString("cxzbgk2m").equals("0")) { %> <%=Rs.getString("cxzbgk2m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgtm")!=null && !Rs.getString("cxzbgtm").equals("0")) { %> <%=Rs.getString("cxzbgtm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbg120m")!=null && !Rs.getString("cxzbg120m").equals("0")) { %> <%=Rs.getString("cxzbg120m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgzham")!=null && !Rs.getString("cxzbgzham").equals("0")) { %> <%=Rs.getString("cxzbgzham")%><% } %></td>
                    </tr>
                    <tr height="25" bgcolor="#C8DEF5"><td align="center">当月小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#C8DEF5"><td align="center">当月合计</td>
                        <td  colspan="17" align="center"><%=t60t+t70t+zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=Rs.getString("cxzbgm")%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
        <% }  Rs=Smts.executeQuery(sql3);
                    Rs.last();
            			CountR = Rs.getRow();
            			if (CountR>0)
            			{
            		   Rs.first();
            		     t60t=Integer.valueOf(Rs.getString("cxgtcy")).intValue()+Integer.valueOf(Rs.getString("cxgtny")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtnxy")).intValue()+Integer.valueOf(Rs.getString("cxgtxy")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtpy")).intValue()+Integer.valueOf(Rs.getString("cxgtgy")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtty")).intValue()+Integer.valueOf(Rs.getString("cxgtky")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtpby")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("cxgt70cy")).intValue()+Integer.valueOf(Rs.getString("cxgt70nxy")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgt70py")).intValue()+Integer.valueOf(Rs.getString("cxgt70ky")).intValue();
            			zy= Integer.valueOf(Rs.getString("cxgtdy")).intValue()+Integer.valueOf(Rs.getString("cxgtdl1y")).intValue()+
            			    Integer.valueOf(Rs.getString("cxgtx2khy")).intValue()+Integer.valueOf(Rs.getString("cxgtx6ky")).intValue();
            			zb= Integer.valueOf(Rs.getString("cxzbgy")).intValue()+Integer.valueOf(Rs.getString("cxzbky")).intValue();
            			%>
                    <tr height="25" bgcolor="#E4F6EF">
                    <td ><font color="#D33C22"><%=str %></font>当年累计</td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtcy")!=null && !Rs.getString("cxgtcy").equals("0")) { %><%=Rs.getString("cxgtcy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtny")!=null && !Rs.getString("cxgtny").equals("0")) { %> <%=Rs.getString("cxgtny")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtnxy")!=null && !Rs.getString("cxgtnxy").equals("0")) { %> <%=Rs.getString("cxgtnxy")%><% } %> </td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtxy")!=null && !Rs.getString("cxgtxy").equals("0")) { %>  <%=Rs.getString("cxgtxy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgy")!=null && !Rs.getString("cxgtgy").equals("0")) { %> <%=Rs.getString("cxgtgy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtky")!=null && !Rs.getString("cxgtky").equals("0")) { %> <%=Rs.getString("cxgtky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtty")!=null && !Rs.getString("cxgtty").equals("0")) { %> <%=Rs.getString("cxgtty")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtpy")!=null && !Rs.getString("cxgtpy").equals("0")) { %> <%=Rs.getString("cxgtpy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtpby")!=null && !Rs.getString("cxgtpby").equals("0")) { %> <%=Rs.getString("cxgtpby")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70cy")!=null && !Rs.getString("cxgt70cy").equals("0")) { %> <%=Rs.getString("cxgt70cy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70nxy")!=null && !Rs.getString("cxgt70nxy").equals("0")) { %> <%=Rs.getString("cxgt70nxy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70py")!=null && !Rs.getString("cxgt70py").equals("0")) { %> <%=Rs.getString("cxgt70py")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgt70ky")!=null && !Rs.getString("cxgt70ky").equals("0")) { %> <%=Rs.getString("cxgt70ky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtdy")!=null && !Rs.getString("cxgtdy").equals("0")) { %> <%=Rs.getString("cxgtdy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtdl1y")!=null && !Rs.getString("cxgtdl1y").equals("0")) { %> <%=Rs.getString("cxgtdl1y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtx2khy")!=null && !Rs.getString("cxgtx2khy").equals("0")) { %> <%=Rs.getString("cxgtx2khy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtx6ky")!=null && !Rs.getString("cxgtx6ky").equals("0")) { %> <%=Rs.getString("cxgtx6ky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgk2y")!=null && !Rs.getString("cxgtgk2y").equals("0")) { %>  <%=Rs.getString("cxgtgk2y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgty")!=null && !Rs.getString("cxgtgty").equals("0")) { %> <%=Rs.getString("cxgtgty")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtg120y")!=null && !Rs.getString("cxgtg120y").equals("0")) { %> <%=Rs.getString("cxgtg120y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxgtgzhay")!=null && !Rs.getString("cxgtgzhay").equals("0")) { %> <%=Rs.getString("cxgtgzhay")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgy")!=null && !Rs.getString("cxzbgy").equals("0")) { %> <%=Rs.getString("cxzbgy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbky")!=null && !Rs.getString("cxzbky").equals("0")) { %> <%=Rs.getString("cxzbky")%><% } %></td>
                    
                    <td width="30" align="center"><% if (Rs.getString("cxzbgk2y")!=null && !Rs.getString("cxzbgk2y").equals("0")) { %> <%=Rs.getString("cxzbgk2y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgty")!=null && !Rs.getString("cxzbgty").equals("0")) { %> <%=Rs.getString("cxzbgty")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbg120y")!=null && !Rs.getString("cxzbg120y").equals("0")) { %> <%=Rs.getString("cxzbg120y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("cxzbgzhay")!=null && !Rs.getString("cxzbgzhay").equals("0")) { %> <%=Rs.getString("cxzbgzhay")%><% } %></td>
                    </tr>
                    <tr height="25" bgcolor="#E4F6EF"><td align="center">当年小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=Rs.getString("cxzbgy")%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#E4F6EF"><td align="center">当年合计</td>
                        <td  colspan="17" align="center"><%=t60t+t70t+zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=Rs.getString("cxzbgy")%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <% }} %>
                    </table>
                    </div>
                    <div>
                    <table id="dxtab" <%if (!subpg.equals("2")) { %> style="display:none;" <% } %> width="100%" border="0" cellpadding="-2" cellspacing="1">
                    
                    <tr bgcolor="FFCC99" height="20"  bordercolor="#6894D5">
         <td  rowspan="3" align="center" valign="middle"><font color="#333399">&nbsp;段&nbsp;&nbsp;修</font></td> 
         <td width="68%"  align="center" colspan="21">国铁货车</td>
         <td width="20%"  align="center" colspan="6">自备货车</td>
     </tr>
     <tr bgcolor="FFCC99" height="20">
         <td align="center" colspan="9">60t级货车</td>
         <td align="center" colspan="4">70t级货车</td>
         <td align="center" colspan="4">专用货车</td>
         <td align="center" colspan="4"  valign="middle">国铁改造</td>
         <td align="center" colspan="2">自备</td>
         <td align="center" colspan="4"  valign="middle">自备改造</td>
     </tr>
     <tr  bgcolor="FFCC99" height="20">
         <td width="29" align="center">C</td>
         <td width="29"  align="center">N</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">X</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">T</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">行包</td>
         <td width="29" align="center">C</td>
         <td width="29" align="center">NX</td>
         <td width="29" align="center">P</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">D</td>
         <td width="29" align="center">DL1</td>
         <td width="29" align="center">X2H(K)</td>
         <td width="29" align="center">X6K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
         <td width="29" align="center">G</td>
         <td width="29" align="center">K</td>
         <td width="29" align="center">K2改造</td>
         <td width="29" align="center">完善改造</td>
         <td width="29" align="center">改120</td>
         <td width="29" align="center">改闸</td>
     </tr>
                    
            		<%for(i=0;i<3;i++)
						{
						if (i==0) { tabname="jhwczz"; str="郑州检修";}
						if (i==1) { tabname="jhwcly"; str="洛阳检修";}
						if (i==2) { tabname="jhwcys"; str="月山检修";}
						
						if (!rq.equals("")) { sql1="select * from "+tabname+" where rq='"+rq+"'"; 
						                      sql2="select sum(dxgtc) as dxgtcm, sum(dxgtn) as dxgtnm, sum(dxgtnx) as dxgtnxm,sum(dxgtx) as dxgtxm,sum(dxgtp) as dxgtpm,sum(dxgtpb) as dxgtpbm,sum(dxgtg) as dxgtgm,sum(dxgtk) as dxgtkm,sum(dxgtt) as dxgttm,sum(dxgt70c) as dxgt70cm,sum(dxgt70p) as dxgt70pm,sum(dxgt70nx) as dxgt70nxm,sum(dxgt70k) as dxgt70km,sum(dxgtd) as dxgtdm,sum(dxgtdl1) as dxgtdl1m,sum(dxgtx2kh) as dxgtx2khm,sum(dxgtx6k) as dxgtx6km, sum(dxgtgk2) as dxgtgk2m,sum(dxgtgt) as dxgtgtm,sum(dxgtg120) as dxgtg120m,sum(dxgtgzha) as dxgtgzham,sum(dxzbg) as dxzbgm, sum(dxzbgk2) as dxzbgk2m,sum(dxzbgt) as dxzbgtm,sum(dxzbg120) as dxzbg120m,sum(dxzbgzha) as dxzbgzham from "+tabname+ " where month(rq)=month('"+rq+"')";
						                      sql3="select sum(dxgtc) as dxgtcy, sum(dxgtn) as dxgtny, sum(dxgtnx) as dxgtnxy,sum(dxgtx) as dxgtxy,sum(dxgtp) as dxgtpy,sum(dxgtpb) as dxgtpby,sum(dxgtg) as dxgtgy,sum(dxgtk) as dxgtky,sum(dxgtt) as dxgtty,sum(dxgt70c) as dxgt70cy,sum(dxgt70p) as dxgt70py,sum(dxgt70nx) as dxgt70nxy,sum(dxgt70k) as dxgt70ky,sum(dxgtd) as dxgtdy,sum(dxgtdl1) as dxgtdl1y,sum(dxgtx2kh) as dxgtx2khy,sum(dxgtx6k) as dxgtx6ky, sum(dxgtgk2) as dxgtgk2y,sum(dxgtgt) as dxgtgty,sum(dxgtg120) as dxgtg120y,sum(dxgtgzha) as dxgtgzhay,sum(dxzbg) as dxzbgy, sum(dxzbgk2) as dxzbgk2y,sum(dxzbgt) as dxzbgty,sum(dxzbg120) as dxzbg120y,sum(dxzbgzha) as dxzbgzhay from "+tabname+ " where year(rq)=year('"+rq+"')";
						
						  }
                        else { sql1="select * from "+tabname+" where rq in (select max(rq) from "+tabname+")"; 
                               sql2="select sum(dxgtc) as dxgtcm, sum(dxgtn) as dxgtnm, sum(dxgtnx) as dxgtnxm,sum(dxgtx) as dxgtxm,sum(dxgtp) as dxgtpm,sum(dxgtpb) as dxgtpbm,sum(dxgtg) as dxgtgm,sum(dxgtk) as dxgtkm,sum(dxgtt) as dxgttm,sum(dxgt70c) as dxgt70cm,sum(dxgt70p) as dxgt70pm,sum(dxgt70nx) as dxgt70nxm,sum(dxgt70k) as dxgt70km,sum(dxgtd) as dxgtdm,sum(dxgtdl1) as dxgtdl1m,sum(dxgtx2kh) as dxgtx2khm,sum(dxgtx6k) as dxgtx6km, sum(dxgtgk2) as dxgtgk2m,sum(dxgtgt) as dxgtgtm,sum(dxgtg120) as dxgtg120m,sum(dxgtgzha) as dxgtgzham,sum(dxzbg) as dxzbgm,sum(dxzbk) as dxzbkm, sum(dxzbgk2) as dxzbgk2m,sum(dxzbgt) as dxzbgtm,sum(dxzbg120) as dxzbg120m,sum(dxzbgzha) as dxzbgzham from "+tabname+ " where month(rq)=month((select max(rq) from "+tabname+"))";
                               sql3="select sum(dxgtc) as dxgtcy, sum(dxgtn) as dxgtny, sum(dxgtnx) as dxgtnxy,sum(dxgtx) as dxgtxy,sum(dxgtp) as dxgtpy,sum(dxgtpb) as dxgtpby,sum(dxgtg) as dxgtgy,sum(dxgtk) as dxgtky,sum(dxgtt) as dxgtty,sum(dxgt70c) as dxgt70cy,sum(dxgt70p) as dxgt70py,sum(dxgt70nx) as dxgt70nxy,sum(dxgt70k) as dxgt70ky,sum(dxgtd) as dxgtdy,sum(dxgtdl1) as dxgtdl1y,sum(dxgtx2kh) as dxgtx2khy,sum(dxgtx6k) as dxgtx6ky, sum(dxgtgk2) as dxgtgk2y,sum(dxgtgt) as dxgtgty,sum(dxgtg120) as dxgtg120y,sum(dxgtgzha) as dxgtgzhay,sum(dxzbg) as dxzbgy,sum(dxzbk) as dxzbky, sum(dxzbgk2) as dxzbgk2y,sum(dxzbgt) as dxzbgty,sum(dxzbg120) as dxzbg120y,sum(dxzbgzha) as dxzbgzhay from "+tabname+ " where year(rq)=year((select max(rq) from "+tabname+"))";
                        }
            			Rs  = Smts.executeQuery(sql1);
            			Rs.last();
            			CountR = Rs.getRow();
            			
            			if (CountR>0)
            			{
            			Rs .first();
            			t60t=Integer.valueOf(Rs.getString("dxgtc")).intValue()+Integer.valueOf(Rs.getString("dxgtn")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtnx")).intValue()+Integer.valueOf(Rs.getString("dxgtx")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtp")).intValue()+Integer.valueOf(Rs.getString("dxgtg")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtt")).intValue()+Integer.valueOf(Rs.getString("dxgtk")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtpb")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("dxgt70c")).intValue()+Integer.valueOf(Rs.getString("dxgt70nx")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgt70p")).intValue()+Integer.valueOf(Rs.getString("dxgt70k")).intValue();
            			zy= Integer.valueOf(Rs.getString("dxgtd")).intValue()+Integer.valueOf(Rs.getString("dxgtdl1")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtx2kh")).intValue()+Integer.valueOf(Rs.getString("dxgtx6k")).intValue();
            			zb=Integer.valueOf(Rs.getString("dxzbg")).intValue()+Integer.valueOf(Rs.getString("dxzbk")).intValue();
            			    
            		%>
            		<tr height="25" bgcolor="#CCCCFF"><td><font color="#D33C22"><%=str %></font>:<%=Rs.getString("rq").replace("-", ".")%></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtc").equals("0")) && (Rs.getString("dxgtc")!=null)) { %> <%=Rs.getString("dxgtc")%> <% } else {%>&nbsp; <%} ;%></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtn").equals("0")) && (Rs.getString("dxgtn")!=null)) { %> <%=Rs.getString("dxgtn")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtnx").equals("0")) && (Rs.getString("dxgtnx")!=null)) { %> <%=Rs.getString("dxgtnx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtx").equals("0")) && (Rs.getString("dxgtx")!=null)) { %> <%=Rs.getString("dxgtx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtg").equals("0")) && (Rs.getString("dxgtg")!=null)) { %> <%=Rs.getString("dxgtg")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtk").equals("0")) && (Rs.getString("dxgtk")!=null)) { %> <%=Rs.getString("dxgtk")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtt").equals("0")) && (Rs.getString("dxgtt")!=null)) { %> <%=Rs.getString("dxgtt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtp").equals("0")) && (Rs.getString("dxgtp")!=null)) { %> <%=Rs.getString("dxgtp")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtpb").equals("0")) && (Rs.getString("dxgtpb")!=null)) { %> <%=Rs.getString("dxgtpb")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgt70c").equals("0")) && (Rs.getString("dxgt70c")!=null)) { %> <%=Rs.getString("dxgt70c")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgt70nx").equals("0")) && (Rs.getString("dxgt70nx")!=null)) { %> <%=Rs.getString("dxgt70nx")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgt70p").equals("0")) && (Rs.getString("dxgt70p")!=null)) { %> <%=Rs.getString("dxgt70p")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgt70k").equals("0")) && (Rs.getString("dxgt70k")!=null)) { %> <%=Rs.getString("dxgt70k")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtd").equals("0")) && (Rs.getString("dxgtd")!=null)) { %> <%=Rs.getString("dxgtd")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtdl1").equals("0")) && (Rs.getString("dxgtdl1")!=null)) { %> <%=Rs.getString("dxgtdl1")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtx2kh").equals("0")) && (Rs.getString("dxgtx2kh")!=null)) { %> <%=Rs.getString("dxgtx2kh")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtx6k").equals("0")) && (Rs.getString("dxgtx6k")!=null)) { %> <%=Rs.getString("dxgtx6k")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtgk2").equals("0")) && (Rs.getString("dxgtgk2")!=null)) { %> <%=Rs.getString("dxgtgk2")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtgt").equals("0")) && (Rs.getString("dxgtgt")!=null)) { %> <%=Rs.getString("dxgtgt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtg120").equals("0")) && (Rs.getString("dxgtg120")!=null)) { %> <%=Rs.getString("dxgtg120")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxgtgzha").equals("0")) && (Rs.getString("dxgtgzha")!=null)) { %> <%=Rs.getString("dxgtgzha")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbg").equals("0")) && (Rs.getString("dxzbg")!=null)) { %> <%=Rs.getString("dxzbg")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbk").equals("0")) && (Rs.getString("dxzbk")!=null)) { %> <%=Rs.getString("dxzbk")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbgk2").equals("0")) && (Rs.getString("dxzbgk2")!=null)) { %> <%=Rs.getString("dxzbgk2")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbgt").equals("0")) & (Rs.getString("dxzbgt")!=null)) { %> <%=Rs.getString("dxzbgt")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbg120").equals("0")) && (Rs.getString("dxzbg120")!=null)) { %> <%=Rs.getString("dxzbg120")%> <% } else {%>&nbsp; <%} %></td>
                        <td width="30" align="center"><% if ((!Rs.getString("dxzbgzha").equals("0")) && (Rs.getString("dxzbgzha")!=null)) { %> <%=Rs.getString("dxzbgzha")%> <% } else {%>&nbsp; <%} %></td>
                        
                    </tr>
                    <tr height="25" bgcolor="#CCCCFF"><td align="center"><%=Rs.getString("rq").replace("-", ".")%>小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#CCCCFF"><td align="center"><%=Rs.getString("rq").replace("-", ".")%>合计</td>
                        <td  colspan="17" align="center"><%=t60t+t70t+zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>	
                    <% } 
                    Rs=Smts.executeQuery(sql2);
                    Rs.last();
            			CountR = Rs.getRow();
            			
            			 if (CountR>0)
            			{
            		Rs.first(); 
            		t60t=Integer.valueOf(Rs.getString("dxgtcm")).intValue()+Integer.valueOf(Rs.getString("dxgtnm")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtnxm")).intValue()+Integer.valueOf(Rs.getString("dxgtxm")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtpm")).intValue()+Integer.valueOf(Rs.getString("dxgtgm")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgttm")).intValue()+Integer.valueOf(Rs.getString("dxgtkm")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtpbm")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("dxgt70cm")).intValue()+Integer.valueOf(Rs.getString("dxgt70nxm")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgt70pm")).intValue()+Integer.valueOf(Rs.getString("dxgt70km")).intValue();
            			zy= Integer.valueOf(Rs.getString("dxgtdm")).intValue()+Integer.valueOf(Rs.getString("dxgtdl1m")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtx2khm")).intValue()+Integer.valueOf(Rs.getString("dxgtx6km")).intValue();
            			zb=Integer.valueOf(Rs.getString("dxzbgm")).intValue()+Integer.valueOf(Rs.getString("dxzbkm")).intValue();
            			%>
                    <tr height="25" bgcolor="#C8DEF5">
                    <td ><font color="#D33C22"><%=str %></font>当月累计</td>
                    <td width="30" align="center"> <% if (Rs.getString("dxgtcm")!=null && !Rs.getString("dxgtcm").equals("0")) { %><%=Rs.getString("dxgtcm")%><% } %></td>
                    <td width="30" align="center"> <% if (Rs.getString("dxgtnm")!=null && !Rs.getString("dxgtnm").equals("0")) { %><%=Rs.getString("dxgtnm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtnxm")!=null && !Rs.getString("dxgtnxm").equals("0")) { %><%=Rs.getString("dxgtnxm")%><% } %> </td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtxm")!=null && !Rs.getString("dxgtxm").equals("0")) { %><%=Rs.getString("dxgtxm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgm")!=null && !Rs.getString("dxgtgm").equals("0")) { %><%=Rs.getString("dxgtgm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtkm")!=null && !Rs.getString("dxgtkm").equals("0")) { %><%=Rs.getString("dxgtkm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgttm")!=null && !Rs.getString("dxgttm").equals("0")) { %><%=Rs.getString("dxgttm")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtpm")!=null && !Rs.getString("dxgtpm").equals("0")) { %><%=Rs.getString("dxgtpm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtpbm")!=null && !Rs.getString("dxgtpbm").equals("0")) { %><%=Rs.getString("dxgtpbm")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70cm")!=null && !Rs.getString("dxgt70cm").equals("0")) { %><%=Rs.getString("dxgt70cm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70nxm")!=null && !Rs.getString("dxgt70nxm").equals("0")) { %><%=Rs.getString("dxgt70nxm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70pm")!=null && !Rs.getString("dxgt70pm").equals("0")) { %><%=Rs.getString("dxgt70pm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70km")!=null && !Rs.getString("dxgt70km").equals("0")) { %><%=Rs.getString("dxgt70km")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtdm")!=null && !Rs.getString("dxgtdm").equals("0")) { %> <%=Rs.getString("dxgtdm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtdl1m")!=null && !Rs.getString("dxgtdl1m").equals("0")) { %><%=Rs.getString("dxgtdl1m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtx2khm")!=null && !Rs.getString("dxgtx2khm").equals("0")) { %><%=Rs.getString("dxgtx2khm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtx6km")!=null && !Rs.getString("dxgtx6km").equals("0")) { %><%=Rs.getString("dxgtx6km")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgk2m")!=null && !Rs.getString("dxgtgk2m").equals("0")) { %> <%=Rs.getString("dxgtgk2m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgtm")!=null && !Rs.getString("dxgtgtm").equals("0")) { %> <%=Rs.getString("dxgtgtm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtg120m")!=null && !Rs.getString("dxgtg120m").equals("0")) { %><%=Rs.getString("dxgtg120m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgzham")!=null && !Rs.getString("dxgtgzham").equals("0")) { %><%=Rs.getString("dxgtgzham")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgm")!=null && !Rs.getString("dxgtgm").equals("0")) { %> <%=Rs.getString("dxzbgm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbkm")!=null && !Rs.getString("dxgtkm").equals("0")) { %> <%=Rs.getString("dxzbkm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgk2m")!=null && !Rs.getString("dxzbgk2m").equals("0")) { %><%=Rs.getString("dxzbgk2m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgtm")!=null && !Rs.getString("dxzbgtm").equals("0")) { %><%=Rs.getString("dxzbgtm")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbg120m")!=null && !Rs.getString("dxzbg120m").equals("0")) { %><%=Rs.getString("dxzbg120m")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgzham")!=null && !Rs.getString("dxzbgzham").equals("0")) { %><%=Rs.getString("dxzbgzham")%><% } %></td>
                    </tr>
                    <tr height="25" bgcolor="#C8DEF5"><td align="center">当月小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#C8DEF5"><td align="center">当月合计</td>
                        <td  colspan="17" align="center"><%=t60t+t70t+zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <%  } %>	
                    <%
                    Rs=Smts.executeQuery(sql3);
                    Rs.last();
            			CountR = Rs.getRow();
            			
            			 if (CountR>0)
            			{
            		Rs.first(); 
            		t60t=Integer.valueOf(Rs.getString("dxgtcy")).intValue()+Integer.valueOf(Rs.getString("dxgtny")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtnxy")).intValue()+Integer.valueOf(Rs.getString("dxgtxy")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtpy")).intValue()+Integer.valueOf(Rs.getString("dxgtgy")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtty")).intValue()+Integer.valueOf(Rs.getString("dxgtky")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtpby")).intValue();
            		    t70t=Integer.valueOf(Rs.getString("dxgt70cy")).intValue()+Integer.valueOf(Rs.getString("dxgt70nxy")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgt70py")).intValue()+Integer.valueOf(Rs.getString("dxgt70ky")).intValue();
            			zy= Integer.valueOf(Rs.getString("dxgtdy")).intValue()+Integer.valueOf(Rs.getString("dxgtdl1y")).intValue()+
            			    Integer.valueOf(Rs.getString("dxgtx2khy")).intValue()+Integer.valueOf(Rs.getString("dxgtx6ky")).intValue();
            			zb=Integer.valueOf(Rs.getString("dxzbgy")).intValue()+Integer.valueOf(Rs.getString("dxzbky")).intValue();
            			
            			%>
                    <tr height="25" bgcolor="#E4F6EF">
                    <td ><font color="#D33C22"><%=str %></font>当年累计</td>
                    <td width="30" align="center"> <% if (Rs.getString("dxgtcy")!=null && !Rs.getString("dxgtcy").equals("0")) { %><%=Rs.getString("dxgtcy")%><% } %></td>
                    <td width="30" align="center"> <% if (Rs.getString("dxgtny")!=null && !Rs.getString("dxgtny").equals("0")) { %> <%=Rs.getString("dxgtny")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtnxy")!=null && !Rs.getString("dxgtnxy").equals("0")) { %> <%=Rs.getString("dxgtnxy")%><% } %> </td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtxy")!=null && !Rs.getString("dxgtxy").equals("0")) { %>  <%=Rs.getString("dxgtxy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgy")!=null && !Rs.getString("dxgtgy").equals("0")) { %> <%=Rs.getString("dxgtgy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtky")!=null && !Rs.getString("dxgtky").equals("0")) { %> <%=Rs.getString("dxgtky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtty")!=null && !Rs.getString("dxgtty").equals("0")) { %> <%=Rs.getString("dxgtty")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtpy")!=null && !Rs.getString("dxgtpy").equals("0")) { %> <%=Rs.getString("dxgtpy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtpby")!=null && !Rs.getString("dxgtpby").equals("0")) { %> <%=Rs.getString("dxgtpby")%> <% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70cy")!=null && !Rs.getString("dxgt70cy").equals("0")) { %> <%=Rs.getString("dxgt70cy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70nxy")!=null && !Rs.getString("dxgt70nxy").equals("0")) { %> <%=Rs.getString("dxgt70nxy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70py")!=null && !Rs.getString("dxgt70py").equals("0")) { %> <%=Rs.getString("dxgt70py")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgt70ky")!=null && !Rs.getString("dxgt70ky").equals("0")) { %> <%=Rs.getString("dxgt70ky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtdy")!=null && !Rs.getString("dxgtdy").equals("0")) { %> <%=Rs.getString("dxgtdy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtdl1y")!=null && !Rs.getString("dxgtdl1y").equals("0")) { %> <%=Rs.getString("dxgtdl1y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtx2khy")!=null && !Rs.getString("dxgtx2khy").equals("0")) { %> <%=Rs.getString("dxgtx2khy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtx6ky")!=null && !Rs.getString("dxgtx6ky").equals("0")) { %> <%=Rs.getString("dxgtx6ky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgk2y")!=null && !Rs.getString("dxgtgk2y").equals("0")) { %>  <%=Rs.getString("dxgtgk2y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgty")!=null && !Rs.getString("dxgtgty").equals("0")) { %> <%=Rs.getString("dxgtgty")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtg120y")!=null && !Rs.getString("dxgtg120y").equals("0")) { %> <%=Rs.getString("dxgtg120y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxgtgzhay")!=null && !Rs.getString("dxgtgzhay").equals("0")) { %> <%=Rs.getString("dxgtgzhay")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgy")!=null && !Rs.getString("dxgtgy").equals("0")) { %> <%=Rs.getString("dxzbgy")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbky")!=null && !Rs.getString("dxgtky").equals("0")) { %> <%=Rs.getString("dxzbky")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgk2y")!=null && !Rs.getString("dxzbgk2y").equals("0")) { %> <%=Rs.getString("dxzbgk2y")%><% } %></td>
                   <td width="30" align="center"><% if (Rs.getString("dxzbgty")!=null && !Rs.getString("dxzbgty").equals("0")) { %> <%=Rs.getString("dxzbgty")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbg120y")!=null && !Rs.getString("dxzbg120y").equals("0")) { %> <%=Rs.getString("dxzbg120y")%><% } %></td>
                    <td width="30" align="center"><% if (Rs.getString("dxzbgzhay")!=null && !Rs.getString("dxzbgzhay").equals("0")) { %> <%=Rs.getString("dxzbgzhay")%><% } %></td>
                    </tr>
                    <tr height="25" bgcolor="#E4F6EF"><td align="center">当年小计</td>
                        <td  colspan="9" align="center"><%=t60t%></td>
                        <td  colspan="4" align="center"><%=t70t%></td>
                        <td  colspan="4" align="center"><%=zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
                    <tr height="25" bgcolor="#E4F6EF"><td align="center">当年合计</td>
                        <td  colspan="17" align="center"><%=t60t+t70t+zy%></td>
                        <td  colspan="4" align="center"></td>
                        <td  colspan="2" align="center"><%=zb%></td>
                        <td  colspan="4" align="center"></td>
                    </tr>
      <%    }
         }  %>   
     </table>
     </div>
     <div>
     <table id="cctab" <%if (!subpg.equals("3")) { %> style="display:none;" <% } %> width="100%" cellpadding="-2" cellspacing="1">
     <tr bgcolor="FFCC99" height="25">
         <td colspan="7" align="center" >残&nbsp;车&nbsp;情&nbsp;况&nbsp;列&nbsp;表</td>
     </tr>
     <tr bgcolor="FFCC99" height="25">
         <td width="5%" align="center">序号</td>
         <td width="8%" align="center">检修车间</td>
         <td width="8%" align="center">残车日期</td>
         <td width="13%"  align="center">车型-车号</td>
         <td width="8%" align="center">修程</td>
         <td width="40%" align="center">残车原因</td>
         <td width="18%" align="center">备注</td>
         
     </tr>
     <%
     sql4="select *  from canche where ((xjrq is null) or (xjrq=''))";
     
     String StrPg = request.getParameter("pgcode");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
            	
     Rs=Smts.executeQuery(sql4);
     Rs.last();
     CountR = Rs.getRow();
            			
     Rs.last();
     i = 0;
     j = 0;
     CountR = Rs.getRow();
     CountPg = (CountR/PgSize);
     if (CountR%PgSize>0)
     CountPg++;
     Rs.first();
     if (CountR>0)
     {
     Rs.absolute(CurrPg*PgSize-PgSize+1);
	 while (i<PgSize && !Rs.isAfterLast())
     {     
            j++;
     %>
     
       <tr height="25"   bgcolor="#CCCCFF">
          <td width="5%" align="center"><%=(CurrPg-1)*PgSize+j%></td>
          <td width="8%" >
             <div align="center">
             <% if (Rs.getString("area").equals("1")) { %> 郑州检修 <%} %>
             <% if (Rs.getString("area").equals("2")) { %> 洛阳检修 <%} %>
             <% if (Rs.getString("area").equals("3")) { %> 月山检修 <%} %>
             </div>
          </td>
          <td width="8%" height="26">
             <div align="center"><%=Rs.getString("ccrq")%></div>
          </td>
          <td width="13%"  ><div align="center"><%=Rs.getString("cx")%><%=Rs.getString("ch")%></div></td> 
          <td width="8%" >
             <div align="center">
             <% if (Rs.getString("xc").equals("1")) { %> 入段厂修 <%} %>
             <% if (Rs.getString("xc").equals("2")) { %> 段修 <%} %>
             </div>
          </td>
          <td width="40%" ><div align="center"><%=Rs.getString("yy")%></div></td>
          <td width="18%" ><div align="center"><% if (Rs.getString("bz")!=null ) { %><%=Rs.getString("bz")%><% } %></div></td>
     </tr>  
                            <%
					            Rs.next();
					            i++;
					    } }}   catch (SQLException e)
            		{
            			out.println("!-- ");
            		}
            		finally
            		{
            		}	
            }%>                      
     
     <tr>
        <td colspan="7">
        <!-- 显示页码表 -->
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
           <td   height="25" class="word_blue" align="left">
           <form name="form2" method="post" action="jhgl/scrw.jsp&page=1">[<%=CurrPg%>/<%=CountPg %>] 每页20条 共记录残车<%=CountR%>辆&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcode" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
           </form>
           </td>
          <td  height="25" >
          <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=1 " >首页</a>
           <%if (CurrPg>1){%>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CurrPg-1%> " >上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CurrPg+1%>">下一页</a> 
            <%
          	}
          %>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CountPg%> " >最后一页</a>
            </td>
        </tr>
        </table>
        </td>
     </tr>
     </table>
     </div>
     </td>
  </tr>
  </table>
  
  </body>
</html>
