<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPg = 0;
	int CurrPg = 1;
	int PgSize = 25;
	int CountR = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���伶�����...</title>
    
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
    <!-- ����ѡ�������� -->

<%      boolean islog=false;

        try
         { islog=((String)session.getAttribute("islog")).equals("1");
         }
        catch(Exception e)
        {
         //out.println(e);
        }
        String wtk="";
        if (request.getParameter("wtk")!=null) wtk=new String(request.getParameter("wtk"));
        String lb="5";
        if (request.getParameter("lb")!=null) lb=new String(request.getParameter("lb"));
        String jj="0";
        if (request.getParameter("jj")!=null) jj=new String(request.getParameter("jj")); 
        String tabname="";
        String str="";
        
        if ((wtk.equals("1"))||(((String)session.getAttribute("deptment")).equals("41"))) { tabname="wtkzz"; str="[ ֣�ݼ��޳�������� ]";}
        if ((wtk.equals("2"))||(((String)session.getAttribute("deptment")).equals("42"))) { tabname="wtkys"; str="[ ��ɽ���޳�������� ]";}
        if ((wtk.equals("3"))||(((String)session.getAttribute("deptment")).equals("43"))) { tabname="wtkly"; str="[ �������޳�������� ]";}
        if ((wtk.equals("4"))||(((String)session.getAttribute("deptment")).equals("44"))) { tabname="wtkzl"; str="[ ֣�����ᳵ������� ]";}
        
%>
   <table align="center" class="tableBorder_LR" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
  <tr>
     <td> 
     <table align="center"  width="800" height="68" border="0" cellpadding="-2" cellspacing="-2" background="Images/cjwtk.gif">
     <tr>
         <td align="center" width="250"></td>
         <td align="left" width="550" class="textcolor1">&nbsp;<%=str %>&nbsp;</td>
     </tr>
     </table>
     </td>
  </tr>
  <tr>
      <td height="25" align="center"><div>
      <%if (!(((String)session.getAttribute("deptment")).equals("41")
          || ((String)session.getAttribute("deptment")).equals("42")
          || ((String)session.getAttribute("deptment")).equals("43") 
          || ((String)session.getAttribute("deptment")).equals("44"))) 
      { %>
     <form name="form1" method="post" action="wtk/wtk.jsp">��ѡ�񳵼�����:
     <input type="radio" name="wtk" value="1" <%if (wtk.equals("1")) out.print("checked"); %>> ֣�ݼ��޳���
     <input type="radio" name="wtk" value="2" <%if (wtk.equals("2")) out.print("checked"); %>> ��ɽ���޳���
     <input type="radio" name="wtk" value="3" <%if (wtk.equals("3")) out.print("checked"); %>> �������޳���
     <input type="radio" name="wtk" value="4" <%if (wtk.equals("4")) out.print("checked"); %>> ֣�����ᳵ��
     <input type="hidden" name="page" value="1">
     <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " >
     </form>
     <% } %></div>
      </td>
  </tr>
  <tr>
     <td align="center">
     <table>
         <tr>
            <td>
             <form name="form2" method="post" action="wtk/wtk.jsp">��������:
              <select name="jj" class="Sytle_select">
                  <option value="0" <%if (jj.equals("0")) out.print("selected");%>>ȫ������&nbsp;</option>
                  <option value="1" <%if (jj.equals("1")) out.print("selected");%>>δ�������&nbsp;</option>
                  <option value="2" <%if (jj.equals("2")) out.print("selected");%>>�ѽ������&nbsp;</option>
              </select>&nbsp;
              <input type="radio" name="lb" value="1" <%if (lb.equals("1")) out.print("checked"); %>> �豸&nbsp;
              <input type="radio" name="lb" value="2" <%if (lb.equals("2")) out.print("checked"); %>> ����ִ��&nbsp;
              <input type="radio" name="lb" value="3" <%if (lb.equals("3")) out.print("checked"); %>> ��ȫ&nbsp;
              <input type="radio" name="lb" value="4" <%if (lb.equals("4")) out.print("checked"); %>> ����&nbsp;
              <input type="radio" name="lb" value="5" <%if (lb.equals("5")) out.print("checked"); %>> ȫ��&nbsp;
              <input type="hidden" name="page" value="1">&nbsp;
              <input type="hidden" name="wtk" value="<%=wtk%>">
              <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " >
              </form>
             </td>
        </tr>
      </table>
     </td>
  </tr>
  <tr>
      <td>
      <table align="center"  width="100%" border="0" cellpadding="-2" cellspacing="-2" >
      <tr>
            <% if((islog) && ((((String)session.getAttribute("deptment")).equals("admin"))
                                         ||(((String)session.getAttribute("zw")).equals("1"))
                                         ||(((String)session.getAttribute("zw")).equals("3"))
                                         ||(((String)session.getAttribute("zw")).equals("cjadmin")))) {%>
                            <td colspan="2" width="140" height="18" align="center" ><div >
                            <img src="Images/zb1.gif" width="16" height="18" border="0" >��&nbsp;
                            <font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#000000'" onClick="Javascript:window.open('inswtk.jsp?ID1=<%=tabname%>','','width=562,height=620')" target="newwindow" >
                            �������&nbsp;</font>��
                            </div>
                            </td>
                            <%} %>
        </tr>
     <tr>
         <td align="center" width="100%">
         <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
         <%
           String sql="";
           
           if (!tabname.equals("")) {
           if (jj.equals("1")) { if (lb.equals("5")) { sql="select * from " +tabname+" where (jjrq  is null) or (jjrq='') order by tcrq desc";  }
                                 else { sql="select * from " +tabname+" where ((jjrq is null) or (jjrq='')) and ( wtlb='"+lb+"') order by tcrq desc"; }
                               }
                               else if (jj.equals("2")) 
                               { if (lb.equals("5")) { sql="select * from " +tabname+" where (jjrq is not null) and (jjrq!='') order by tcrq desc";  }
                                 else { sql="select * from " +tabname+" where ((jjrq is not null) and (jjrq!='')) and ( wtlb='"+lb+"') order by tcrq desc"; }
                               }
                              else 
                               { if (lb.equals("5")) { sql="select * from " +tabname+"  order by tcrq desc";  }
                                 else { sql="select * from " +tabname+" where ( wtlb='"+lb+"' order by tcrq desc"; }
                               }
            }      
           
           Class.forName("org.gjt.mm.mysql.Driver").newInstance();
           Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/wtk","root","123"); 

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
                        int i = 0;
                        int j = 0;
            			CountR = Rs.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%>  
            			    
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="3%" align="center" class="word_white">���</td>
                            <td  width="10%"  align="center" class="word_white">������</td>
                            <td  width="5%" align="center" class="word_white">�������</td>
                            <td  width="28%" align="center" class="word_white">��������</td> 
                            <td width="12%" align="center" class="word_white">��ʩ</td>
                            <td width="6%" align="center" class="word_white">������</td>
                            <td width="10%" align="center" class="word_white">���ʱ��</td>
                            <td width="10%" align="center" class="word_white">���ʱ��</td>
                            <td width="10%" align="center" class="word_white">��ע</td>
                            <% if((islog) && ((((String)session.getAttribute("deptment")).equals("admin"))
                                         ||(((String)session.getAttribute("zw")).equals("1"))
                                         ||(((String)session.getAttribute("zw")).equals("3"))
                                         ||(((String)session.getAttribute("zw")).equals("cjadmin")))) {%>
                            <td colspan="2"   align="center" class="word_white">����</td>
                            <% } %>
                            </tr>  
                            <%
            				Rs.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rs.isAfterLast())
            			    {     
            			    j++;
  	                        %>
            			    <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9">
            			    <td width="3%" align="center"><%=(CurrPg-1)*PgSize+j%></td>
                            <td width="10%" height="26"  align="center"><%=Rs.getString("num")%></td>
                            <td width="5%" height="26"  align="center">
                               <% if (Rs.getString("wtlb").equals("1")) { %> �豸 <%} %>
                               <% if (Rs.getString("wtlb").equals("2")) { %> ����ִ�� <%} %>
                               <% if (Rs.getString("wtlb").equals("3")) { %> ��ȫ <%} %>
                               <% if (Rs.getString("wtlb").equals("4")) { %> ���� <%} %>
                            </td>
                            <td width="28%"  align="left"><%=Rs.getString("wt")%></td> 
                            <td width="12%" align="center"><%=Rs.getString("cs")%></td>
                            <td width="6%" align="center"><%=Rs.getString("fzr")%></td>
                            <td width="10%"  align="center"><%=Rs.getString("tcrq")%></td>
                            <td width="10%"  align="center">
                            <%if ((Rs.getString("jjrq")!=null) && (!Rs.getString("jjrq").equals(""))) {%>
                            <%=Rs.getString("jjrq")%>
                            <% } else {%> &nbsp; <% } %>
                            </td>
                            <td width="10%"  align="center">
                            <%if ((Rs.getString("bz")!=null) && (!Rs.getString("bz").equals(""))) {%>
                            <%=Rs.getString("bz")%>
                            <% } else {%> &nbsp; <% } %></td> 
                           <% if((islog) && ((((String)session.getAttribute("deptment")).equals("admin"))
                                         ||(((String)session.getAttribute("zw")).equals("1"))
                                         ||(((String)session.getAttribute("zw")).equals("3"))
                                         ||(((String)session.getAttribute("zw")).equals("cjadmin")))) {%>
                            <td width="15" align="center" >
                               <img src="Images/edit.gif" width="12" height="12" border="0" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('editwtk.jsp?tabname=<%=tabname%>&id=<%=Rs.getString("num")%>','','width=562,height=620')">
                            </td>
                            <td width="20" align="center" >
                               <a href="wtk/wtk.jsp?jj=<%=jj%>&page=<%=1%>&lb=<%=lb%>" onClick="Javascript:window.open('delwtk.jsp?ID1=<%=Rs.getString("num")%>&ID2=<%=tabname%>','','width=519,height=155')" title="ɾ����������">
                               <img src="Images/del_file.gif" width="20" height="20" border="0"></a>
                               
                            </td>
                            <%}%>
                            </tr>  
                            <%
					            Rs.next();
					            i++;
					    }
					 %>   </table> 
				 </td>
		    </tr>
		    <tr>
		          <td>
		          <!-- ��ʾҳ��� -->
		          
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
           <td nowrap class="word_blue" align="left">
           <form name="form2" method="post" action="wtk/wtk.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ25�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
            <input name="wtk" type="hidden" value="<%=wtk%>">
            <input name="lb" type="hidden" value="<%=lb%>">
            <input name="jj" type="hidden" value="<%=jj%>">
           </form>
           </td>
          <td>
          
           <%if (CurrPg>1){%>
            <a href="wtk/wtk.jsp?page=1&pgcode=1&wtk=<%=wtk%>&lb=<%=lb%>&jj=<%=jj%>">��ҳ</a> 
            <a href="wtk/wtk.jsp?page=1&pgcode=<%=CurrPg-1%>&wtk=<%=wtk%>&lb=<%=lb%>&jj=<%=jj%>">��һҳ</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="wtk/wtk.jsp?page=1&pgcode=<%=CurrPg+1%>&wtk=<%=wtk%>&lb=<%=lb%>&jj=<%=jj%>">��һҳ</a> 
            <%
          	}
          %>
            <a href="wtk/wtk.jsp?page=1&pgcode=<%=CountPg%>&wtk=<%=wtk%>&lb=<%=lb%>&jj=<%=jj%>">���һҳ</a>
            </td>
        </tr>
        </table>
        <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("�޷���������¼!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }   
         %>
         </td>
      </tr>
     </table>
     </td>
     </tr>
</table>
</body>
</html>
