<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 10;
	int CountRow = 0;

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�¼ƻ���ѯ</title>
    
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
  <% 
  
    String vyear ="";
    if (request.getParameter("Values1")!=null) vyear = new String(request.getParameter("Values1").getBytes("iso-8859-1"),"gb2312");
    String vmonth ="13";
    if (request.getParameter("Values2")!= null) vmonth =new String(request.getParameter("Values2").getBytes("iso-8859-1"));
    String varea ="";
    if (request.getParameter("Values3")!= null) varea =new String(request.getParameter("Values3"));
   %>
    
  <form name="form" method="post" action="jhgl/scrw.jsp">
  <table bgcolor="#ffffff" width="95%" height="40" border="0" align="center">
  <tr>
  <td align="center" >������Ҫ��ѯ��ʱ�䣺��:
           <input width="20" name="Values1" type="text" size="16" value="<%=vyear%>">&nbsp;��:
           <select name="Values2" value="<%=vmonth%>">
           <option value="13" >ȫ��</option> 
           <option value="1">Ԫ��</option>
		   <option value="2">����</option>
	  	   <option value="3">����</option>
           <option value="4">����</option>
           <option value="5">����</option>
           <option value="6">����</option>
           <option value="7">����</option>
           <option value="8">����</option>
           <option value="9">����</option>
           <option value="10">ʮ��</option>
           <option value="11">ʮһ��</option>
           <option value="12">ʮ����</option>
           </select>&nbsp;����:  
           <select name="Values3" >
           <option value="" >ȫ��</option>
           <option value="1">֣�ݼ���</option>
           <option value="2">��ɽ����</option>
           <option value="3">��������</option>
           </select>&nbsp;&nbsp;
           <input name="page" value="2" type="hidden">
           <input class="Style_button" type="submit" name="Submit" value="  ��  ѯ  " >
    </td>
  </tr>
  </table>
</form>
<table bgcolor="#ffffff"  width="90%" border="0" align="center" cellpadding="-2" cellspacing="1" bordercolor="#FFFFFF" bordercolorlight="#367E65" bordercolordark="#FFFFFF">
<tr align="center"  bgcolor="#6595D6" height="26">
<td width="12%"><div><font color="#ffffff">��</font></div></td>
<td width="12%"><div><font color="#ffffff">��</font></div></td>
<td width="12%"><div><font color="#ffffff">���޳���</font></div></td>
<td width="12%"><div><font color="#ffffff">����</font></div></td>
<td width="12%"><div><font color="#ffffff">��γ���</font></div></td>
<td width="12%"><div><font color="#ffffff">K2����</font></div></td>
<td width="12%"><div><font color="#ffffff">�Ա�����</font></div></td>
<td width="12%"><div><font color="#ffffff">�Ա�����</font></div></td>
</tr>
<% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 
   String StrPage = request.getParameter("Page");
            	if (StrPage == null)
            	{
            		CurrPage = 1;
            	}
            	else
            	{
            		CurrPage = Integer.parseInt(StrPage);
            	}
   Statement Smt; 
   ResultSet Rs;
   if (Con != null)
            	{
            		try
            		{
            		String  sql1="";
                    if ((vyear!=null)&& (!vyear.equals(""))){
                                     if (vmonth!=null) { if ((vmonth.equals("13")) && (varea.equals("")))
                                                            { sql1="select *  from yjh where year='"+vyear+"'"+"order by year,month "; }
                                                        else { if (!vmonth.equals("13") && varea.equals("")) { sql1="select * from yjh where year='"+vyear+"'"+ "and month='"+vmonth+"'" +"order by year,month ";   } else {}
                                                               if (vmonth.equals("13") && !varea.equals("")) { sql1="select * from yjh where year='"+vyear+"'"+ "and area='"+varea+"'"+"order by year,month ";   } else {} 
                                                               if (!vmonth.equals("13") && !varea.equals("")) { sql1="select * from yjh where year='"+vyear+"'"+ "and month='"+vmonth+"'"+ "and area='"+varea+"'"+"order by year,month ";   } else {} 
                                      }}
                    else { if (!varea.equals("")) { sql1="select * from yjh where year='"+vyear+"'"+ "and area='"+varea+"'"+"order by year,month ";   }  
                           else { sql1="select * from yjh where year='+vyear+'"+" order by year,month ";    }
                              }
                    }  else { sql1="select * from yjh "+" order by year,month " ;};
            			
            			Smt = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smt.executeQuery(sql1);
                        Rs.last();
                        int i = 0;
            			CountRow = Rs.getRow();
            			CountPage = (CountRow/PageSize);
            			if (CountRow%PageSize>0)
            				CountPage++;
            			Rs.first();
            			while (!Rs.isAfterLast())
            			{     
            			
            			%>
            			
            			    <tr bgcolor="#EFF7F4" height="25">

                <td><div align="center" ><%=Rs.getString("year")%></div></td>
                <td><div align="center" ><%=Rs.getString("month")%></div></td>
                <% if (Rs.getString("area").equals("1")) { %>
                <td><div align="center">֣�ݼ���</div></td> <%} %>
                <% if (Rs.getString("area").equals("2")) { %>
                <td><div align="center" >��ɽ����</div></td> <%} %>
                <% if (Rs.getString("area").equals("3")) { %>
                <td><div align="center" >��������</div></td> <%} %>
                <% if (Rs.getString("dx")!=null ) { %>
                <td><div align="center" ><%=Rs.getString("dx")%></div></td> <%} else { %>
                <td><div align="center" >0</div></td> <%} %>
                <% if (Rs.getString("cx")!=null ) { %>
                <td><div align="center" ><%=Rs.getString("cx")%></div></td> <%} else { %>
                <td><div align="center">0</div></td> <%} %>
                <% if (Rs.getString("k2")!=null ) { %>
                <td><div align="center" ><%=Rs.getString("k2")%></div></td> <%} else { %>
                <td><div align="center" >0</div></td> <%} %>
                <% if (Rs.getString("zbdx")!=null ) { %>
                <td><div align="center" ><%=Rs.getString("zbdx")%></div></td> <%} else { %>
                <td><div align="center" >0</div></td> <%} %>
                <% if (Rs.getString("zbcx")!=null ) { %>
                <td><div align="center" ><%=Rs.getString("zbcx")%></div></td> <%} else { %>
                <td><div align="center" >0</div></td> <%} %>

              </tr> 
              <%
					            Rs.next();
					            i++;
					    }
					    }
			
					catch (SQLException e)
            		{
            			out.println(e.getMessage());
            		}
            		finally
            		{
            			Con.close();
            		}	
            }    
%>

</table>
<table align="center"  width="95%"> <tr >
<td  >[<%=CurrPage%>/<%=CountPage %>] ÿҳ10�� ��<%=CountRow%>����¼</td>
          <td width="260">
            <div align="right">
              <% for (int i = 1;i<=CountPage;i++){%>
                <a href="jhgl/scrw.jsp?Page=<%=i%>&Values1=<%=vyear%>&Values2=<%=vmonth%>&Values3=<%=varea%>"><%=i %></a> 
         
              <%}%>
            </div></td></tr>
</table>
  </body>
</html>
