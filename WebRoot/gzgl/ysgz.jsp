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
    
    <title>���չ���</title>
    
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
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:����_GB2312;
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
	   font-family: ����_GB2312;
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
       INPUT.Style_btn {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #D84E3F 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 60px
       }
       INPUT.Style_btnsm {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #D84E3F 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 30px
       }
    -->  
   </style>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>

<body class="BODY">
  <%
    //��ȡ��ǰ���ڵ��·�
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  int nowyear = today.getYear()+1900;
  int nowmonth = today.getMonth()+1; 
  
  String chej="";
  if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
 
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
	   //-  ʶ����������,�粻�ǳ���Ҫѡ�񳵼� --
	if((islog) && (((String)session.getAttribute("deptment")).equals("41"))) { chej="zz"; } 
	  else {  if((islog) && (((String)session.getAttribute("deptment")).equals("43"))) {  chej="ly"; }
	          else{ if((islog) && (((String)session.getAttribute("deptment")).equals("42"))) {  chej="ys"; }
	                else{ if((islog) && (((String)session.getAttribute("deptment")).equals("44"))) {  chej="zl"; }
	          }
	          }
	       }
	 String tabname="ysgz";
	 String tabzg="zhigong";
  if (!chej.equals("")) { tabname=tabname+chej; tabzg=tabzg+chej;}       
%>
   <table width="871" align="center" class="tableBorder_LR"   cellpadding="-2" cellspacing="-2">
   <%
    if((islog) && (!((String)session.getAttribute("deptment")).equals("41")) 
     && (!((String)session.getAttribute("deptment")).equals("43")) 
      && (!((String)session.getAttribute("deptment")).equals("42"))
      && (!((String)session.getAttribute("deptment")).equals("44"))) {
       %>
       <tr>
      <td width="870" height="25"  colspan="2" bgcolor="#FFFAEE"  align="center">
      <form name="form" method="post" action="gzgl/gzgl.jsp">��ѡ�񳵼䣺
      <input name="cj" type="radio"  value="zz" <%if (chej.equals("zz")) out.print("checked"); %>> ֣�ݼ��޳���
      <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) out.print("checked"); %>> ��ɽ���޳���
      <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) out.print("checked"); %>> �������޳���
      <input type="radio" name="cj" value="zl" <%if (chej.equals("zl")) out.print("checked"); %>> ֣�����ᳵ��
      <input type="hidden" name="page" value="1">
      <input type="submit" name="Submit" class=Style_btn value="  ȷ  ��  " ></form>
      </td>
      </tr>
       <%   }   %>
    <!-- ���չ�����ϸ -->
   <tr>
   <td  width="871" height="25" colspan="2" align="center" bgcolor="#FFFAEE"  valign="center">
   <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   </script> 
   <form name="form2" method="post" action="gzgl/gzgl.jsp"><font color="#ff0000">��ѯʱ���:��</font>
      <input name="v1" type="text" class=Sytle_textred ondblClick="loadCalendar(this)" value=<%=datef%>><font color="#ff0000">&nbsp;��</font>
      <input name="v2" type="text" class=Sytle_textred onDBLClick="loadCalendar(this)" value=<%=dateto%> >
      <input name="cj" type=hidden value=<%=chej %>>
      <input name="page" type=hidden value=1>
      <input type="submit" name="Submit"  class=Style_btn value="  ��  ѯ  " >
      </form></td></tr>
      <tr><td height="30" bgcolor="#FFFAEE">
      <%     
     if  (((String)session.getAttribute("deptment")).equals("41") 
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44") 
           || ((String)session.getAttribute("deptment")).equals("admin"))
           {
           if (((String)session.getAttribute("zw")).equals("3")
           ||((String)session.getAttribute("zw")).equals("1")
           ||((String)session.getAttribute("zw")).equals("4")
           ||((String)session.getAttribute("zw")).equals("6")
           ||((String)session.getAttribute("deptment")).equals("admin")
           || ((String)session.getAttribute("zw")).equals("cjadmin"))   { %> 
   &nbsp;&nbsp;&nbsp;&nbsp;<img   width="20" height="18" src="Images/add.gif" >��<a href="gzgl/editysgz.jsp?cj=<%=chej %>" target="newwindow"> �༭����ǩ��������¼ </a>��&nbsp; <%}}  %>
      </td></tr>
   </table>
   
   <table width="871" align="center" class="tableBorder_LR"   cellpadding="-2" cellspacing="-2">
   <tr>
       <td><div>
       <table width="100%" cellpadding="-2" cellspacing="-2"  bgcolor="#FFFAEE" >
       <tr>
          <a href="gzgl/gzgl.jsp?page=1&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=1"> <td width="135" height="29" <%if (subpg.equals("1")) { %>  style="background ='url(Images/cont_img2.gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2.gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#ff0000">���շ��ֹ�����ϸ&nbsp;</font></td></a>  
          <a href="gzgl/gzgl.jsp?page=1&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=2">
          <td width="135" height="29" <%if (subpg.equals("2")) { %>  style="background ='url(Images/cont_img2.gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2.gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#ff0000">���շ��ֹ��Ϸ���&nbsp;</font>
          </td>
          </a>
          <a href="gzgl/gzgl.jsp?page=1&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto%>&subpg=3">
          <td width="135" height="29" <%if (subpg.equals("3")) { %>  style="background ='url(Images/cont_img2.gif)'" <% } %> onMouseover="this.style.backgroundImage ='url(Images/cont_img2.gif)';this.style.cursor='hand';" onMouseout="this.style.background=''" align="right"><font color="#ff0000">�������ݹ���&nbsp;&nbsp;&nbsp;&nbsp;</font>
          </td>
          </a>
          <td width="466"></td>
       </tr>
       </table>
       </div>
       </td>
   </tr>
   </table>
   
   <table width="871" cellpadding="-1" cellspacing="-1" id="ystl" <%if (!subpg.equals("1")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> width="871" align="center" bgcolor="#FFFAEE" class="tableBorder_LR">
   <tr>
   <td width="100%" colspan="10"  height="30" bgcolor="#D84E3F"  align="center" valign="center">
  <% if (chej.equals("zz")) { %> <font color="#ffffff">����ǩ��֣�ݼ��޳��䳵ͳ-93������ϸ</font> <%} 
     else {  if (chej.equals("ys")) { %> <font color="#ffffff">����ǩ����ɽ���޳��䳵ͳ-93������ϸ</font> <%} 
             else {  if (chej.equals("ly")) { %> <font color="#ffffff">����ǩ���������޳��䳵ͳ-93������ϸ</font> <% } 
                     else { if (chej.equals("zl")) { %> <font color="#ffffff">&nbsp;����ǩ��֣�����ᳵ�䳵ͳ-93������ϸ</font> <% }
                          }
                 }
          }     
 %>
   </td>
   </tr>  
   <tr>
      <td colspan="11" height="30" width="100%" bgcolor="#D84E3F"  align="center"><font color="#ffffff">
      <%if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
	{   %>&nbsp;
	[ &nbsp;��ѯʱ��Σ���&nbsp;<%=datef%>&nbsp;��&nbsp;<%=dateto %>&nbsp;]
	<%} else { %>
    [ &nbsp;��ǰ�б��·ݣ�<%=nowyear%>��<%=nowmonth %>��&nbsp;]
    <% } %>
     </font> </td>
   </tr>
   </table>
   <table width="871" cellpadding="-1" cellspacing="1" id="ysgz" <%if (!subpg.equals("1")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> width="871" align="center" bgcolor="#FFFAEE" class="tableBorder_LR">
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
   ResultSet Rsysgz;
   if (Con!= null)
            	{
            		try
            		{
            		String  sql="";
            		    
                        if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
						{   
						   sql = "select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.ysy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as c,cpzlbz as d,banzu as e where rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" and c.id=a.zrr and a.gzcode=d.code and e.code=a.zrbz order by rq desc,ysy";
						}
						else {
						   sql = "select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.ysy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as c,cpzlbz as d,banzu as e where c.id=a.zrr  and a.gzcode=d.code and e.code=a.zrbz and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' order by rq desc,ysy";
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
                             <td width="3%" align="center"> ��� </td>
                             <td  width="8%" align="center">����</td>
                             <td width="10%" align="center" >���ͳ���/������</td>
                             <td width="6%" align="center" >����Ա</td>
                             <td width="6%" align="center" >���ΰ���</td>
                             <td width="6%" align="center" >������</td>
                             <td width="8%" align="center" >���ϲ�λ</td>
                             <td width="25%" align="center">�����������</td>
                             <td width="25%" align="center">������ϸ����</td>
                             <td width="5%" align="center">���������ѹ��</td>
                            </tr>
            			<%
            			if (CountR>0)
            			{
            				Rsysgz.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rsysgz.isAfterLast())
            			       			{     
  	                      %>
            			    <tr   height="25" <% if (i%2==0)  out.print("bgcolor='#F9F1D8'"); %>>
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
                            <td width="5%"  align="center"><%if (Rsysgz.getString("gyx").equals("1")) {%><font color="#ff0033">��</font><%} else out.print("��") ;%></td>
                           <%
					            Rsysgz.next();
					            i++;
					    }
					 }
					 
	%>				 
					 </tr>
					 <tr><td colspan="10">
                    
                   <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            <tr   height="20">
            <td nowrap  align="left" style="color:#D84E3F;font-size:12;">
            <form name="formzg1" method="post" action="gzgl/gzgl.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="recpg" type="text" size="3" class=Sytle_textredsm>&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_btnsm">
            <input name="page" type="hidden" value="1">
            <input name="v1" type="hidden" value="<%=datef %>">
            <input name="v2" type="hidden" value="<%=dateto%>">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
            </td>
            <td >
            <a href="gzgl/gzgl.jsp?page=1&recpg=1&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CurrPg-1%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">��һҳ</a> 
            <% }  %>
            <%if (CurrPg<CountPg){%>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CurrPg+1%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">��һҳ</a> 
            <% } %>
            <a href="gzgl/gzgl.jsp?page=1&recpg=<%=CountPg%>&cj=<%=chej%>&v1=<%=datef%>&v2=<%=dateto %>">���һҳ</a>
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
            		}	
            }    
%>


   <% 
   Statement Smts2,Smts3,Smts4,Smts5,Smts6; 
   ResultSet Rsysgz2;
   ResultSet Rsysgz3;
   ResultSet Rsysgz4;
   ResultSet Rsysgz5;
   ResultSet Rsysgz6;
  
   try
            		{
            		String  sql2="";
            		String  sql3="";
            		String  sql4="";
            		String  sql5="";
            		String  sql6="";
            		    
                        
                        if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
						{   
						   sql2 = "select ysy,count(ysy) as ysytj from "+tabname+" where  rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by ysy order by ysytj desc ";
						   sql3 = "select b.bz as zrbz,count(a.zrbz) as bztj from "+tabname+" as a ,banzu as b where a.zrbz=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by zrbz order by bztj desc " ;
						   sql4 = "select b.name as zrr,count(a.zrr) as zrrtj from "+tabname+" as a,"+tabzg+" as b where a.zrr=b.id and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by zrr order by zrrtj desc " ;
						   sql5 = "select b.fl as bw,count(b.fl) as bwtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by bw order by bwtj desc " ;
						   sql6 = "select b.xz as lb,count(b.xz) as lbtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and rq>='"+datef+"'" +" && rq<='"+dateto+"'"+" group by lb order by lb " ;
						}
						else {
						   sql2 = "select ysy,count(ysy) as ysytj from "+tabname+"  group by ysy order by ysytj desc ";
						   sql3 = "select b.bz as zrbz,count(a.zrbz) as bztj from "+tabname+" as a ,banzu as b where a.zrbz=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"'  group by zrbz order by bztj desc " ;
						   sql4 = "select b.name as zrr,count(a.zrr) as zrrtj from "+tabname+" as a,"+tabzg+" as b where a.zrr=b.id and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by a.zrr order by zrrtj desc " ;
						   sql5 = "select b.fl as bw,count(b.fl) as bwtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by b.fl order by bwtj desc " ;
						   sql6 = "select b.xz as lb,count(b.xz) as lbtj from "+tabname+" as a,cpzlbz as b where a.gzcode=b.code and year(a.rq)='"+nowyear+"' and month(a.rq)='"+nowmonth+"' group by b.xz order by lbtj desc " ;
						}
					
						Smts2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts3 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts4 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts5 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						Smts6 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						 
            			Rsysgz2 = Smts2.executeQuery(sql2);
            			Rsysgz2.first();
            			Rsysgz3 = Smts3.executeQuery(sql3);
            			Rsysgz3.first();
            			Rsysgz4 = Smts4.executeQuery(sql4);
            			Rsysgz4.first();
            			Rsysgz5 = Smts5.executeQuery(sql5);
            			Rsysgz5.first();
            			Rsysgz6 = Smts6.executeQuery(sql6);
            			Rsysgz6.first();
            			%>
   <table width="871" cellpadding="-1" cellspacing="-1"  id="ystj" <%if (!subpg.equals("2")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> align="center" class="tableBorder_LR" border="0" cellspacing="0" cellpadding="0">
   <tr>
      <td colspan="11" height="30" width="100%" bgcolor="#D84E3F"  align="center"><font color="#ffffff">����Աǩ����ͳ-93ͳ��</font></td>
   </tr>
   <tr>
      <td colspan="11" height="30" width="100%" bgcolor="#D84E3F"  align="center"><font color="#ffffff">
      <%if (datef!= null && !datef.equals("") && dateto!= null && !dateto.equals(""))
	{   %>&nbsp;
	[ &nbsp;��ѯʱ��Σ���&nbsp;<%=datef%>&nbsp;��&nbsp;<%=dateto %>&nbsp;]
	<%} else { %>
    [ &nbsp;��ǰ�б��·ݣ�<%=nowyear%>��<%=nowmonth %>��&nbsp;]
    <% } %>
     </font> </td>
   </tr>
 
   </table>
   <table width="871" cellpadding="1" cellspacing="1"  id="ysgz" <%if (!subpg.equals("2")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> align="center" class="tableBorder_LR" border="0" cellspacing="0" cellpadding="0">
   
   <tr align="center" height="25" bgcolor="#F6E3A9">
      <td width="10%" align="center">����Ա</td>
      <td width="10%" align="center">��&nbsp;��</td>
      <td width="10%" align="center" class="word_blue">���ΰ���</td>
      <td width="10%" align="center" class="word_blue">��&nbsp;��</td>
      <td width="10%" align="center">������</td>
      <td width="10%" align="center">��&nbsp;��</td>
      <td width="10%" align="center" class="word_blue">���ϲ�λ</td>
      <td width="10%" align="center" class="word_blue">��&nbsp;��</td>
      <td width="10%" align="center" >�������</td>
      <td width="10%" align="center" >��&nbsp;��</td>
   </tr>
            			<%
            			while ((!Rsysgz2.isAfterLast()) || (!Rsysgz3.isAfterLast()) || (!Rsysgz4.isAfterLast()) || (!Rsysgz5.isAfterLast()))
            			   {     
  	                      %><tr border="1" bordercolor="#6894D5" height="25" bgcolor="#F9F1D8">
            			   <%if (!Rsysgz2.isAfterLast()) { %> 
            			   <td width="10%" align="center"><%=Rsysgz2.getString("ysy")%></td> 
            			   <td width="10%" align="center"><%=Rsysgz2.getString("ysytj")%></td>
            			   <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			   <% } %>
                           <%if (!Rsysgz3.isAfterLast()) { %>
            			    <td width="10%" align="center" class="word_blue"><%=Rsysgz3.getString("zrbz")%></td>
            			    <td width="10%" align="center" class="word_blue"><%=Rsysgz3.getString("bztj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    <%if (!Rsysgz4.isAfterLast()) { %> 
            			   <td width="10%" align="center"><%=Rsysgz4.getString("zrr")%></td> 
            			   <td width="10%" align="center"><%=Rsysgz4.getString("zrrtj")%></td>
            			   <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			   <% } %>
                           <%if (!Rsysgz5.isAfterLast()) { %>
            			    <td width="10%" align="center" class="word_blue"><%=Rsysgz5.getString("bw")%></td>
            			    <td width="10%" align="center" class="word_blue"><%=Rsysgz5.getString("bwtj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    <%if (!Rsysgz6.isAfterLast()) { %>
            			    <td width="10%" align="center" ><%=Rsysgz6.getString("lb")%></td>
            			    <td width="10%" align="center"  ><%=Rsysgz6.getString("lbtj")%></td> 
            			    <% } else { %>
            			    <td width="10%" align="center"></td> 
            			    <td width="10%" align="center"></td>
            			    <%}%>
            			    </tr>
                           <% Rsysgz2.next();
                              Rsysgz3.next();
                              Rsysgz4.next();
                              Rsysgz5.next();
                              Rsysgz6.next();
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
<table id="yssj" <%if (!subpg.equals("3")) { %> style="display:none;" <% } else {%>style="display:'';" <% } %> width="871" align="center" class="tableBorder_LR" border="0" cellspacing="0" cellpadding="0">
   <tr>
   <td height="30" width="736" bgcolor="#D84E3F"  align="center"><font color="#ffffff">һ�ν���ϸ��ʡ��ܹ��ϵ�</font></td>
   </tr>
</table>

  </body>
</html>
