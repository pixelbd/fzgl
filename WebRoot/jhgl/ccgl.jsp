<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ccgl.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%  
  int CountPg = 0;
  int CurrPg = 1;
  int PgSize = 20;
  int CountR = 0;

  String sql="select *  from canche where ((xjrq is null) or (xjrq=''))";
 
  int i=0;
  int j=0;
 
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 
  Statement Smts; 
  ResultSet Rs;
  %>
  <table  width="100%"  align="center" cellpadding="-2" cellspacing="1"  bgcolor="#ffffff">
  <tr>
  <td align="center" height="25">
  <form name="form" method="post" action="jhgl/scrw.jsp?page=4&subpg=2">ѡ����޳��䣺
  <input name="cj" type="radio"  value="zz" checked> ֣�ݼ��޳���
  <input type="radio" name="cj" value="ys" > ��ɽ���޳���
  <input type="radio" name="cj" value="ly" > �������޳���
  <input type="submit" name="Submit" class="Style_button" value="  ȷ   ��  " >
  </form>
  </td>
  </tr>
  </table>
  <table   width="100%" cellpadding="-2" cellspacing="1">
     <tr>
<td  colspan="23" align="left" width="100%"  height="17" >
<div>&nbsp;[&nbsp;+&nbsp;<a href="jhgl/scrw.jsp?page=4&subpg=2" onClick="Javascript:window.open('insertcc.jsp?','','width=710,height=610')">��Ӳг���¼</a>&nbsp;]&nbsp;</div></td>
</tr>
     <tr bgcolor="FFCC99" height="25">
         <td colspan="9" align="center" >��&nbsp;��&nbsp;��&nbsp;��&nbsp;��&nbsp;��</td>
     </tr>
     <tr bgcolor="FFCC99" height="25">
         <td width="4%" align="center">���</td>
         <td width="8%" align="center">���޳���</td>
         <td width="8%" align="center">�г�����</td>
         <td width="10%"  align="center">����-����</td>
         <td width="8%" align="center">�޳�</td>
         <td width="36%" align="center">�г�ԭ��</td>
         <td width="20%" align="center">��ע</td>
         <td width="6%" align="center" colspan="2">����</td>
     </tr>
     <%
      String StrPg = request.getParameter("pgcode");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
     if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
						       	
     Rs=Smts.executeQuery(sql);
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
          <td width="4%" align="center"><%=(CurrPg-1)*PgSize+j%></td>
          <td width="8%" >
             <div align="center">
             <% if (Rs.getString("area").equals("1")) { %> ֣�ݼ��� <%} %>
             <% if (Rs.getString("area").equals("2")) { %> �������� <%} %>
             <% if (Rs.getString("area").equals("3")) { %> ��ɽ���� <%} %>
             </div>
          </td>
          <td width="8%" height="26">
             <div align="center"><%=Rs.getString("ccrq")%></div>
          </td>
          <td width="10%"  ><div align="center"><%=Rs.getString("cx")%><%=Rs.getString("ch")%></div></td> 
          <td width="8%" >
             <div align="center">
             <% if (Rs.getString("xc").equals("1")) { %> ��γ��� <%} %>
             <% if (Rs.getString("xc").equals("2")) { %> ���� <%} %>
             </div>
          </td>
          <td width="36%" ><div align="center"><%=Rs.getString("yy")%></div></td>
          <td width="20%" ><div align="center"><% if (Rs.getString("bz")!=null ) { %><%=Rs.getString("bz")%><% } %></div></td>
          <td width="3%"><div align="center"><a href="jhgl/updatecc.jsp?ID=<%=Rs.getString("id")%>" title="�޸Ĳг���¼">
                <img src="Images/edit.gif" width="12" height="12" border="0" ></a></div></td>
                <td width="3%"><div align="center">
                <a href="jhgl/scrw.jsp?page=4&subpg=2" title="ɾ���г���¼" onClick="Javascript:window.open('delcc.jsp?ID=<%=Rs.getString("id")%>','','width=519,height=155')">
                <img src="Images/del.gif" width="16" height="16" border="0" ></a></div></td>
     </tr>  
                            <%
					            Rs.next();
					            i++;
					    } }}   
					    
					catch (SQLException e)
            		{
            			out.println("!--");
            		}
            		finally
            		{
            		}	
            }%>                      
   <tr>
        <td colspan="7">
        <!-- ��ʾҳ��� -->
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
           <td   height="25" class="word_blue" align="left">
           <form name="form" method="post" action="jhgl/scrw.jsp&page=4&subpg=2">[<%=CurrPg%>/<%=CountPg %>] ÿҳ20�� ����¼�г�<%=CountR%>��&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
           </form>
           </td>
          <td  height="25" >
          <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=1 " >��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CurrPg%>">��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CurrPg+1%>">��һҳ</a> 
            <%
          	}
          %>
            <a href="jhgl/scrw.jsp?page=1&subpage=3&pgcode=<%=CountPg%> " >���һҳ</a>
            </td>
        </tr>
        </table>
        </td></tr></table>
  </body>
</html>
