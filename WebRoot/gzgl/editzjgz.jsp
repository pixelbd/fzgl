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
    
    <title>�ʼ�Ա���ֹ�������༭</title>
    
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
		font-family:����;}
     INPUT.Style_btn {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #FF6666 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 60px
       }
       .tableBorder_LR {
	   border: #DFE1EB 1px solid;
	   border-bottom-style:none;
	   border-Top-style:none;
       }
       .tableBorder
{
border: 1px #DEDEDE solid; 

}
    body {
	margin-left: 0px; 
	margin-top: 1px;
      }
    -->  
     </style>
	
	
    <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
  <body onLoad="clockon(bgclock)" background="Images/bg2.gif">
  <%
  String zjyid="";
  zjyid=(String)session.getAttribute("userid");
  String zjyname="";
  zjyname=(String)session.getAttribute("usertrue");
  String chejian="";
  if (request.getParameter("cj")!=null) chejian=new String(request.getParameter("cj"));
  String tabname="zjgz";
  String tabzg="zhigong";
  if (!chejian.equals("")) { tabname=tabname+chejian;tabzg=tabzg+chejian; }
  String dtname="zjgz";
  if (!chejian.equals("")) { dtname=dtname+chejian; }
  String dtfrom="";
  if (request.getParameter("value1")!=null) dtfrom = new String(request.getParameter("value1"));
    String dtto ="";
  if (request.getParameter("value2")!= null) dtto =new String(request.getParameter("value2"));
  %>
  
  <table background="Images/titleedit.jpg" class="tableBorder"  height="50" width="871"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td valign="center" align="left"></td></tr>
  </table>
  <table background="Images/Top_02.gif" class="tableBorder2" width="871" height="92" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#6894D5" bgcolor="#ffffff">
  <tr>
  <td colspan="2" height="80%" valign="center" align="center" width="803" height="166" style="FONT:20px ����;COLOR:#ffffff;HEIGHT:18px;BACKGROUND-COLOR:#DFFF1F9">��&nbsp;��&nbsp;��&nbsp;��&nbsp;-&nbsp;>&nbsp;��&nbsp;��&nbsp;ǩ&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��</td>
  </tr>
  <tr>
  <td class="word_white"> �����ߣ�<%=zjyname %></td>
  <td align="right" height="20%">
     <div><script src="JS/onclock.JS"></script><div id="bgclock" class="word_yellow"></div>
  </td>
  </tr>
  </table>
  <%
    boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	   //-  ʶ����������,�粻�ǳ���Ҫѡ�񳵼� --
	   if (islog) {
	if((islog) && (((String)session.getAttribute("deptment")).equals("41"))) { chejian="zz"; } 
	  else {  if((islog) && (((String)session.getAttribute("deptment")).equals("43"))) {  chejian="ly"; }
	          else{ if((islog) && (((String)session.getAttribute("deptment")).equals("42"))) {  chejian="ys"; }
	                else if ((islog) && (((String)session.getAttribute("deptment")).equals("44"))) {  chejian="zl"; }
	          }
	       }
%>
   <table valign="center" width="871" align="center"  class="tableBorder_LR" bgcolor="#ffffff"  cellpadding="-2" cellspacing="-2">
  <% if((islog) && (!((String)session.getAttribute("deptment")).equals("41")) 
     && (!((String)session.getAttribute("deptment")).equals("43")) 
      && (!((String)session.getAttribute("deptment")).equals("44")) 
      && (!((String)session.getAttribute("deptment")).equals("42"))) {  %>
       <tr>
       </tr>
       <tr>
      <td width="870" height="20"  colspan="2"   align="center" valign="middle" bordercolor="#BEE09C">
      <form name="formcj" method="post" action="gzgl/editzjgz.jsp">��ѡ�񳵼䣺
      <input name="cj" type="radio"  value="zz" <%if (chejian.equals("zz")) out.print("checked"); %>> ֣�ݼ��޳���
      <input type="radio" name="cj" value="ys" <%if (chejian.equals("ys")) out.print("checked"); %>> ��ɽ���޳���
      <input type="radio" name="cj" value="ly" <%if (chejian.equals("ly")) out.print("checked"); %>> �������޳���
      <input type="radio" name="cj" value="zl" <%if (chejian.equals("zl")) out.print("checked"); %>> �������޳���
      <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " ></form>
      </td>
      </tr>  <%  } %>
       
    <!-- ���չ�����ϸ -->
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
      <form name="formcx" method="post" action="gzgl/editzjgz.jsp"> ��ѯʱ���:�� 
      <input name="value1" type="text" onDBLClick="loadCalendar(this)" value=<%=dtfrom%>> &nbsp;�� 
      <input name="value2" type="text" onDBLClick="loadCalendar(this)" value=<%=dtto%>>
      <input name="cj" type=hidden value=<%=chejian%>>
      <input type="submit" name="Submit"  class=Style_button value="  ��  ѯ  " >
      </form>
   </td></tr></table>

<table class="tableBorder_LR" bgcolor="#Ffffff" align="center" width="871" border="0" cellpadding="1" cellspacing="1">
<tr >
 <td  colspan="13" align="left" height="20" ><div>&nbsp;<img   width="20" height="18" src="Images/add.gif" >��&nbsp;<a href="gzgl/editzjgz.jsp?cj=<%=chejian%>" onClick="Javascript:window.open('inszjgz.jsp?cj=<%=chejian%>','','width=562,height=464')">��Ӽ�¼</a>&nbsp;��</div></td>
</tr>
<tr align="center"  height="25">
<td colspan="13" bgcolor="#6595D6" style="color:#ffffff;font-size:12;font-family:����"><div align="center" >
<% if (chejian.equals("zz")) { %>�ʼ�Ա���� [֣�ݼ��޳���] ������ϸ<%} else{} %>
<% if (chejian.equals("ys")) { %>�ʼ�Ա���� [��ɽ���޳���] ������ϸ<%} else{}%>
<% if (chejian.equals("ly")) { %>�ʼ�Ա���� [�������޳���] ������ϸ<%} else{}%>
<% if (chejian.equals("ly")) { %>�ʼ�Ա���� [֣�����ᳵ��] ������ϸ<%} else{}%>
</div></td>
</tr>
<tr align="center" height="30"  bgcolor="#6595D6" >
    <td width="3%" align="center">���</td>
    <td width="80" align="center">����</td>
    <td width="140" align="center">���ͳ���/������</td>
    <td width="80" align="center">�ʼ�Ա</td>
    <td width="80" align="center">���ΰ���</td>
    <td width="80" align="center">������</td>
    <td width="80" align="center">���ϲ�λ</td>
    <td width="60" align="center">�������</td>
    <td width="20%" align="center">��������</td>
    <td  align="center" ><font color="#0000ff">�޸�</td>
    <td align="center" ><font color="#ff0000">ɾ��</font></td>
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
   ResultSet Rszjgz;
   if (Con!= null)
            	{
            		try
            		{
            		String  sql="";
            		    
                        if (dtfrom!= null && !dtfrom.equals("") && dtto!= null && !dtto.equals(""))
						{ if  (((String)session.getAttribute("zw")).equals("9")) {
						   sql = "select a.id as id ,a.zjy as zjyid, a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where rq>='"+dtfrom+"' && rq<='"+dtto+"' and a.zjy='"+zjyid+"' and b.zw<>'����'  and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq";
						  } else { sql = "select a.id as id ,a.zjy as zjyid, a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where rq>='"+dtfrom+"' && rq<='"+dtto+"' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq"; }
						}
						else {
						  if  (((String)session.getAttribute("zw")).equals("9"))
						   sql = "select a.id as id,a.zjy as zjyid, a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from "+tabname+" as a,"+tabzg+" as b,"+tabzg+" as c,cpzlbz as d,banzu as e where  a.zjy='"+zjyid+"' and b.zw<>'����' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq";
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
            			if (CountR>0)
            			{
            				Rszjgz.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rszjgz.isAfterLast())
            			       			{     
  	                      %>
            			    <tr border="1" height="25" bgcolor="#E4E8EF">
            			    <td width="3%" align="center"><%=(CurrPg-1)*PgSize+i+1 %></td>
                            <td><div align="center"  ><div align="center">
                            <%=Rszjgz.getString("rq")%></div></td> 
                            <td><div align="center"><%=Rszjgz.getString("cx")%>&nbsp;<%=Rszjgz.getString("ch")%></div></td> 
                            <td><div align="center"><%=Rszjgz.getString("zjy")%></div></td>
                            <td ><div align="center"><%=Rszjgz.getString("zrbz")%></div></td>
                            <td><div align="center"><%=Rszjgz.getString("zrr")%></div></td>
                            <td ><div align="center"><%=Rszjgz.getString("fl")%></div></td>
                            <td ><div align="center"><%=Rszjgz.getString("xz")%></div></td>
                            <td ><div align="center"><%=Rszjgz.getString("gzms")%></div></td> 
                            <td ><div align="center">
                            <% if (Rszjgz.getString("zjyid").equals(zjyid)) {%>
                            <a href="gzgl/eidtzjgz.jsp?cj=<%=chejian%>&value1=<%=dtfrom%>&value1=<%=dtto%>" onClick="Javascript:window.open('updatezjgz.jsp?ID1=<%=Rszjgz.getString("id")%>&ID2=<%=chejian%>','','width=600,height=430')"><img src="Images/edit.gif" width="12" height="12" border="0"></a>
                            <% } %>
                            </div></td>
                            <td ><div align="center">
                            <% if (Rszjgz.getString("zjyid").equals(zjyid)) {%>
                            
                            <a href="gzgl/editzjgz.jsp?cj=<%=chejian%>&value1=<%=dtfrom%>&value1=<%=dtto%>" onClick="Javascript:window.open('delzjgz.jsp?ID1=<%=Rszjgz.getString("id")%>&ID2=<%=chejian%>','','width=519,height=155')">
                            <img src="Images/del.gif" width="16" height="16" border="0" ></a>
                            <% } %></div></td>
                            </tr>  
                              
                           <%
					            Rszjgz.next();
					            i++;
					    }
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
            }    
%>
</table>

<table  class="tableBorder_LR" bgcolor="#ffffff" align="center"  width="871">
            <tr   height="20">
            <td nowrap  align="left">
            <form name="formzg1" method="post" action="gzgl/editzjgz.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="Page" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="value1" type="hidden" value="<%=dtfrom%>">
            <input name="value2" type="hidden" value="<%=dtto%>">
            <input name="cj" type="hidden" value="<%=chejian%>">
            </form>
            </td>
            <td>
            <a href="gzgl/editzjgz.jsp?Page=1&cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto %>">��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="gzgl/editzjgz.jsp?Page=<%=CurrPg-1%>&cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto %>">��һҳ</a> 
            <% }  %>
            <%if (CurrPg<CountPg){%>
            <a href="gzgl/editzjgz.jsp?Page=<%=CurrPg+1%>&cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto %>">��һҳ</a> 
            <% } %>
            <a href="gzgl/editzjgz.jsp?Page=<%=CountPg%>&cj=<%=chejian%>&value1=<%=dtfrom%>&value2=<%=dtto %>">���һҳ</a>
            </td>
            </tr>
            
            </table>
<% } else { %>
   <table class="tableBorder_LR" align="center" valign="center" width="871"    cellpadding="-2" cellspacing="-2">
   <tr>
      <td align="center" valign="top" height="32" bgcolor="#ffffff" class="style1" valign="center"><img width="32" height="32" src="Images/clue.gif" >
       �����µ�¼�� 
      </td>
   </tr>
   </table>
 
 <%} %>
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
