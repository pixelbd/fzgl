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
    
    <title>�豸ά����Ϣ...</title>
    
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
  String subpg="1";
  String cj="";
  
  boolean islog=false;
  
  boolean canmodify=false;
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  { 
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      String tabname="sbxx"; 
      String sql="";
      
    String searchstr="";
    if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
    
     if (((String)session.getAttribute("deptment")).equals("41")) 
    {
            if  (searchstr.equals("")) sql="select a.code,a.mc,a.xh,a.made,a.cj,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='41' order by cj,bz,fl,code";
            else sql="select a.code,a.mc,a.xh,a.made,a.cj,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='41' and  mc like '"+searchstr+"%' order by cj,bz,fl,code";
    } else {
           if (((String)session.getAttribute("deptment")).equals("42")) 
              { 
               if  (searchstr.equals("")) sql="select a.code,a.mc,a.xh,a.made,a.cj,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='42' order by cj,bz,fl,code";
               else sql="select a.code,a.mc,a.made,a.cj,a.xh,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='42' and  mc like '"+searchstr+"%' order by cj,bz,fl,code";
           }  else {
            if (((String)session.getAttribute("deptment")).equals("43")) {
               if  (searchstr.equals("")) sql="select a.code,a.mc,a.xh,a.made,a.cj,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='43' order by cj,bz,fl,code";
               else sql="select a.code,a.mc,a.xh,a.made,a.cj,a.work,a.fl,b.bz as bz from "+tabname+" as a,banzu as b where a.bz=b.code and a.cj='43' and  mc like '"+searchstr+"%' order by cj,bz,fl,code";
           
           } else 
           {  
           }
           }}
   %>
  <table border="0" align="center"  valign="middle" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%" colspan="2">
          <div>
          <table align="center" valign="top">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/wx.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;�豸������Ϣ��ѯ&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>
      <tr><form action="sbgl/sbgl.jsp" method="post" name="form1">
         <td  width="40%"   align="right" valign="top">
            <table>
            <tr>
            <td rowspan="2">
            <img  width="24" height="24" src="Images/search.gif">
            </td>
            </tr>
            <tr>
            <td height="5"></td>
            <td height="25"><font color="#4E759C">�豸�ؼ��ֲ�ѯ:</font>
            </td>
            </tr>
            </table>
         </td>
         <td valign="middle"> 
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% }%>>
               <input name="page" type="hidden" value="5">
              <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
         </td></form>
      </tr>
      </table>
     <table align="center" valign="top" width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr>
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ�����豸��Ϣ�Ĳ�ѯ -->
          <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%"><div align="center" class="word_white">���</div></td>
                            <td  width="12%"><div align="center" class="word_white">�豸����</div></td>
                            <td  width="25%"><div align="center" class="word_white">�豸����</div></td>
                            <td  width="5%"><div align="center" class="word_white">�豸�ͺ�</div></td>
                            <td  width="10%"><div align="center" class="word_white">����ʱ��</div></td>
                            <td  width="5%"><div align="center" class="word_white">�豸����</div></td> 
                            <td width="10%"><div align="center" class="word_white">��������</div></td>
                            <td width="10%"><div align="center" class="word_white">��������</div></td>
                           
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
            			    <td width="5%"  align="center"><%=(CurrPg-1)*PgSize+i+1%></td>
                            <td width="12%" align="center"><%=Rs.getString("code")%></td>
                            <td width="25%" align="center"><%=Rs.getString("mc")%></td>
                            <td width="10%" align="center"><%=Rs.getString("xh")%></td>
                            <td width="10%" align="center"><%=Rs.getString("made")%></td>
                            <td width="5%" align="center"><%=Rs.getString("fl")%></td>
                            <td width="14%" align="center"><% if (Rs.getString("cj").equals("41")) out.print("֣�ݼ��޳���");%>
                            <%if (Rs.getString("cj").equals("43")) out.print("�������޳���");%>
                            <%if (Rs.getString("cj").equals("42")) out.print("��ɽ���޳���");%>
                            <%if (Rs.getString("cj").equals("44")) out.print("֣�����ᳵ��");%></td>
                            <td width="12%" align="center"><%=Rs.getString("bz")%></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } }%>  
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
            <input name="page" type="hidden" value="5">
            <input name="subpg" type="hidden" value="3">
          </form>
          </td>
          <td>
          <a href="sbgl/sbgl.jsp?page=5&pgcode=1">��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="sbgl/sbgl.jsp?page=5&pgcode=<%=CurrPg-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPg<CountPg){%>
            <a href="sbgl/sbgl.jsp?page=5&pgcode=<%=CurrPg+1%>">��һҳ</a> 
            <% }  %>
            <a href="sbgl/sbgl.jsp?page=5&pgcode=<%=CountPg%>">���һҳ</a>
            </td>
            </tr>
            </table>
        </div>
        </td>
      </tr>
</table>
    <% }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  }	
      }
      }%>
      
  </body>
</html>
