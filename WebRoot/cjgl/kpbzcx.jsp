<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPgbz = 0;
	int CurrPgbz = 0;
	
	int PgSizebz = 20;
	int CountR = 0;
	int CountRzg = 0;
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'kpbzcx.jsp' starting page</title>
    
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
 <%   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      String gbkpbzsql="select fl,bz,kf3,ldkh from cjkpbz where kf3>0 order by fl "; 
      String zjykpbzsql="select fl,bz,kf1,jf1,gyx from cjkpbz where kf1>0 and bz like '�ʼ�Ա%'  order by fl ";
      String zgkpbzsql="select fl,bz,kf1,jf1,gyx from cjkpbz where kf1>0 or jf1>0 order by fl ";
      String bzkpbzsql="select fl,bz,kf2,ldkh,jf2,gyx from cjkpbz where kf2>0 or jf2>0 order by fl ";
      String submenu="";
      if (request.getParameter("submenu")!=null) submenu=new String(request.getParameter("submenu"));
      String searchstr="";
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
      
 %>   
 <table align="center"  valign="top" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%">
          <div>
          <table align="center">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/rule.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;������׼��ѯ&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>  

<tr  height="28">
<td width="100%" bgcolor="#6699CC" height="28">
<table>
           <tr >
            <td><img  width="20" height="20" src="Images/GArrow.gif"></td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=1">������Ա������׼��ѯ</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=2">���鹤��������׼��ѯ</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=3">�ʼ�Ա������׼��ѯ</a>&nbsp;
            </td><td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=4">ְ��������׼��ѯ</a>&nbsp;
            </td>
            <td></td>
            </tr>
</table>
</td>
</tr>
</table>
 <% if (submenu.equals("1")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99">
      <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;������Ա������׼&nbsp;</font></td></tr>
      <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">ģ����ѯ��</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="7">
               <input name="submenu" type="hidden" value="1">
               
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
             </td>
          </form>
         </tr>
         <tr>
         <td>
         <div>
         <!-- �����ǿ�����׼�Ĳ�ѯ -->
         <% 
          String StrPg = request.getParameter("pgcodebz");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPgbz = 1;
            	}
            	else
            	{
            		CurrPgbz = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(gbkpbzsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			CountPgbz = (CountR/PgSizebz);
            			if (CountR%PgSizebz>0)
            				CountPgbz++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
            			    <td  width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td> 
                            <td width="10%"><div align="center" class="word_white">�۷�</div></td>
                            <td width="10%"><div align="center" class="word_white">�Ƿ���������</div></td>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td ><div align="center"><%=Rs.getString("bz")%></div></td> 
                            <td  ><div align="center"><%=Rs.getString("kf3")%></div></td>
                            <td  ><div align="center"><% if (Rs.getString("ldkh").equals("1")) out.print("��"); else out.print("��"); %></div></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } %>  
		                   </table>
		               <!-- ��ʾҳ��� -->
		  </div></td></tr>
		  <tr>
		  <td>
		  <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formbz1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgbz%>/<%=CountPgbz %>] ÿҳ20�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodebz" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="7">
            <input name="submenu" type="hidden" value="1">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=1&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=1&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=1&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=1&pgcodebz=<%=CountPgbz%>">���һҳ</a>
            </td>
            </tr>
            </table>
        </div>
        </td>
      </tr>
        <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }    
      %>
      </table>
      <% } %>   
 <% if (submenu.equals("2")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99">
      <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;���鹤��������׼&nbsp;</font></td></tr>
      <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">ģ����ѯ��</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="7">
               <input name="submenu" type="hidden" value="2">
               
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
             </td>
          </form>
         </tr>
         <tr>
         <td>
         <div>
         <!-- �����ǿ�����׼�Ĳ�ѯ -->
         <% 
          String StrPg = request.getParameter("pgcodebz");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPgbz = 1;
            	}
            	else
            	{
            		CurrPgbz = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(bzkpbzsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			CountPgbz = (CountR/PgSizebz);
            			if (CountR%PgSizebz>0)
            				CountPgbz++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
            			    <td  width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td> 
                            <td width="10%"><div align="center" class="word_white">�۷�</div></td>
                            <td width="10%"><div align="center" class="word_white">�ӷ�</div></td>
                            <td width="10%"><div align="center" class="word_white">�Ƿ���������</div></td>
                            <td width="10%"><div align="center" class="word_white">�Ƿ�����ѹ��</div></td>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td ><div align="center"><%=Rs.getString("bz")%></div></td> 
                            <td  ><div align="center"><%=Rs.getString("kf2")%></div></td>
                            <td  ><div align="center"><%=Rs.getString("jf2")%></div></td>
                            <td  ><div align="center"><% if (Rs.getString("ldkh").equals("1")) out.print("��"); else out.print("��"); %></div></td>
                            <td  ><div align="center"><% if (Rs.getString("gyx").equals("1")) out.print("��"); else out.print("��"); %></div></td>
                            
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } %>  
		                   </table>
		               <!-- ��ʾҳ��� -->
		  </div></td></tr>
		  <tr>
		  <td>
		  <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formbz1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgbz%>/<%=CountPgbz %>] ÿҳ20�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodebz" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="7">
            <input name="submenu" type="hidden" value="2">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=2&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=2&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=2&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=2&pgcodebz=<%=CountPgbz%>">���һҳ</a>
            </td>
            </tr>
            </table>
        </div>
        </td>
      </tr>
        <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }    
      %>
      </table>
      <% } %>  
       <% if (submenu.equals("3")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99">
      <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;�ʼ�Ա������׼&nbsp;</font></td></tr>
      <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">ģ����ѯ��</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="7">
               <input name="submenu" type="hidden" value="3">
               
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
             </td>
          </form>
         </tr>
         <tr>
         <td>
         <div>
         <!-- �����ǿ�����׼�Ĳ�ѯ -->
         <% 
          String StrPg = request.getParameter("pgcodebz");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPgbz = 1;
            	}
            	else
            	{
            		CurrPgbz = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(zjykpbzsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			CountPgbz = (CountR/PgSizebz);
            			if (CountR%PgSizebz>0)
            				CountPgbz++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
            			    <td  width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td> 
                            <td width="10%"><div align="center" class="word_white">�۷�</div></td>
                            <td width="10%"><div align="center" class="word_white">�ӷ�</div></td>
                            <td width="10%"><div align="center" class="word_white">�Ƿ�����ѹ��</div></td>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td ><div align="center"><%=Rs.getString("bz")%></div></td> 
                            <td  ><div align="center"><%=Rs.getString("kf1")%></div></td>
                            <td  ><div align="center"><%=Rs.getString("jf1")%></div></td>
                            <td  ><div align="center"><% if (Rs.getString("gyx").equals("1")) out.print("��"); else out.print("��"); %></div></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } %>  
		                   </table>
		               <!-- ��ʾҳ��� -->
		  </div></td></tr>
		  <tr>
		  <td>
		  <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formbz1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgbz%>/<%=CountPgbz %>] ÿҳ20�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodebz" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="7">
            <input name="submenu" type="hidden" value="3">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=3&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=3&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=3&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=3&pgcodebz=<%=CountPgbz%>">���һҳ</a>
            </td>
            </tr>
            </table>
        </div>
        </td>
      </tr>
        <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }    
      %>
      </table>
      <% } %>    
       <% if (submenu.equals("4")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99">
      <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;ְ��������׼&nbsp;</font></td></tr>
      <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">ģ����ѯ��</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="7">
               <input name="submenu" type="hidden" value="4">
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
             </td>
          </form>
         </tr>
         <tr>
         <td>
         <div>
         <!-- �����ǿ�����׼�Ĳ�ѯ -->
         <% 
          String StrPg = request.getParameter("pgcodebz");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPgbz = 1;
            	}
            	else
            	{
            		CurrPgbz = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(zgkpbzsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			CountPgbz = (CountR/PgSizebz);
            			if (CountR%PgSizebz>0)
            				CountPgbz++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
            			    <td  width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td> 
                            <td width="10%"><div align="center" class="word_white">�۷�</div></td>
                            <td width="10%"><div align="center" class="word_white">�ӷ�</div></td>
                            <td width="10%"><div align="center" class="word_white">�Ƿ�����ѹ��</div></td>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td ><div align="center"><%=Rs.getString("bz")%></div></td> 
                            <td  ><div align="center"><%=Rs.getString("kf1")%></div></td>
                            <td  ><div align="center"><%=Rs.getString("jf1")%></div></td>
                            <td  ><div align="center"><% if (Rs.getString("gyx").equals("1")) out.print("��"); else out.print("��"); %></div></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } %>  
		                   </table>
		               <!-- ��ʾҳ��� -->
		  </div></td></tr>
		  <tr>
		  <td>
		  <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formbz1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgbz%>/<%=CountPgbz %>] ÿҳ20�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodebz" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="7">
            <input name="submenu" type="hidden" value="4">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=4&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=4&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=4&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=7&submenu=4&pgcodebz=<%=CountPgbz%>">���һҳ</a>
            </td>
            </tr>
            </table>
        </div>
        </td>
      </tr>
        <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }    
      %>
      </table>
      <% } %>                               
  </body>
</html>
