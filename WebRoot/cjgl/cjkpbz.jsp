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
    
    <title>��������ۺϿ�����׼</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body valign="top">
     <%
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      String tabname="cjkpbz"; 
      String sql="";
      
      String title="��������ۺϿ�����׼";
      
      String searchstr="";
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
      if (searchstr.equals("")) { sql="select * from "+tabname; }
      else { sql="select * from "+tabname+" where   (bz like '"+searchstr+"%') or ( bz like '%"+searchstr+"%') or ( fl like '%"+searchstr+"%')  or ( fl like '%"+searchstr+"%')" ; }
      
      
      boolean islog=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      
      if (islog) 
      { 
      %>
      <table border="0" align="center"  valign="middle" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%" colspan="2">
          <div>
          <table align="center" valign="top">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/system.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;��������ۺϿ�����׼ά��&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>
      <tr><form action="cjgl/cjgl.jsp" method="post" name="form1">
         <td  width="40%"   align="right" valign="top">
            <table>
            <tr>
            <td rowspan="2">
            <img  width="24" height="24" src="Images/search.gif">
            </td>
            </tr>
            <tr>
            <td height="5"></td>
            <td height="25"><font color="#4E759C">�ؼ��ֲ�ѯ:</font>
            </td>
            </tr>
            </table>
         </td>
         <td valign="middle"> 
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% }%>>
               <input name="page" type="hidden" value="3">
               <input name="subpg" type="hidden" value="4">
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
         </td>
         </form>
      </tr>
      </table>
      <% } %>
     <table align="center" valign="top" width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="95%" height="28"  align="left" ><img   width="20" height="18" src="Images/add.gif" >
             <a href="cjgl/cjgl.jsp?page=3&subpg=4" onClick="Javascript:window.open('inscjkpbz.jsp?','','width=565,height=485')">��ӳ�������ۺϿ�����׼&nbsp;&nbsp;&nbsp;</a>
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ���в�Ʒ������Ϣ�Ĳ�ѯ -->
          <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="4%" rowspan="2"><div align="center" class="word_white">���</div></td>
                            <td width="8%" rowspan="2"><div align="center" class="word_white">����</div></td>
                            <td width="8%" rowspan="2"><div align="center" class="word_white">����</div></td>
                            <td width="41%" rowspan="2"><div align="center" class="word_white">������׼����</div></td> 
                            <td width="20%" colspan="4"><div align="center" class="word_white">�۷ֱ�׼</div></td>
                            <td width="10%" colspan="2"><div align="center" class="word_white">�ӷֱ�׼</div></td>
                            <td width="4%" rowspan="2"><div align="center" class="word_white">�Ƿ��ѹ��</div></td>
                            <td width="4%" rowspan="2"><div align="center" class="word_white">�Ƿ���������</div></td>
                           <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")||((String)session.getAttribute("zw")).equals("2"))) {%>
                            <td colspan="2" rowspan="2" width="6%" align="center" class="word_white">����</td>
                            <% } %>
                            </tr>
                            <tr border="0" height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%"><div align="center" class="word_white">ְ��</div></td>
                            <td width="5%"><div align="center" class="word_white">���鹤��</div></td>
                            <td width="5%" ><div align="center" class="word_white">�����쵼</div></td>
                            <td  width="5%"><div align="center" class="word_white">����רְ</div></td> 
                            <td width="5%"><div align="center" class="word_white">ְ��</div></td>
                            <td width="5%"><div align="center" class="word_white">���鹤��</div></td>
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
  	                        %>
            			    <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="4%"  align="center"><%=(CurrPg-1)*PgSize+i+1%></td>
                            <td width="8%" align="center"><%=Rs.getString("code")%></td>
                            <td width="8%" align="center"><%=Rs.getString("fl")%></td>
                            <td width="41%" ><div align="left"><%=Rs.getString("bz")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("kf1")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("kf2")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("kf3")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("kf4")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("jf1")%></div></td>
                            <td width="5%" ><div align="center"><%=Rs.getString("jf2")%></div></td>
                            <td width="4%" ><div align="center"><% if (Rs.getString("gyx").equals("1")) {%>��<%} else{ %>��<% } %></div></td>
                            <td width="4%" ><div align="center"><% if (Rs.getString("ldkh").equals("1")) {%>��<%} else{ %>��<% } %></div></td>
                            <% if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")
                             ||((String)session.getAttribute("zw")).equals("2"))) { %>
                            <td width="3%">
                               <div align="center"> 
                               <a href="cjgl/cjgl.jsp?page=3&subpg=4" title="�޸�" onClick="Javascript:window.open('upcjkpbz.jsp?code=<%=Rs.getString("code")%>','','width=565,height=485')">
                               <img src="Images/edit.gif" width="12" height="12" border="0"></a>
                               </div>
                            </td>
                            <td width="3%">
                               <div align="center">
                               <a href="cjgl/cjgl.jsp?page=3&subpg=4" title="ɾ��" onClick="Javascript:window.open('delcjkpbz.jsp?code=<%=Rs.getString("code")%>&tabname=<%=tabname%>','','width=519,height=155')">
                               <img src="Images/del_file.gif" width="20" height="20" border="0"></a>
                            </div>
                            </td>
                            <% } %>
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
          <form name="formbz" method="post" action="cjgl/cjgl.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="3">
            <input name="subpg" type="hidden" value="4">
            </form>
           </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=3&subpg=4&pgcode=1">��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="cjgl/cjgl.jsp?page=3&subpg=4&pgcode=<%=CurrPg-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPg<CountPg){%>
            <a href="cjgl/cjgl.jsp?page=3&subpg=4&pgcode=<%=CurrPg+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=3&subpg=4&pgcode=<%=CountPg%>">���һҳ</a>
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
  

  </body>
</html>
