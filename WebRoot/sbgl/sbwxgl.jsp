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
	<style type="text/css">
  <!--
.tableBorder_TB{
	    border:1px solid #FF9900;
	    border-left-style:none;
	    border-right-style:none;
        }
     -->  
   </style>

  </head>
  
  <body>
 <% 
  String subpg="1";
  String cj="";
  String chej="";
  String zgtab="";
  String bzsql="";
  String bzcode="";
  String bzstr="";
  
  boolean islog=false;
  boolean canmodify=false;
  boolean canjudge=false;
  
  String str="";
  String sql="";
  String sqlzx="";
  String sqlzr="";
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
      if (islog) { 
      if  (((String)session.getAttribute("deptment")).equals("41")
             ||((String)session.getAttribute("deptment")).equals("42")
             ||((String)session.getAttribute("deptment")).equals("43")
             ||((String)session.getAttribute("deptment")).equals("44"))
      {   
          
          String userid=(String)session.getAttribute("userid");
          chej=(String)session.getAttribute("deptment"); 
          if (chej.equals("41")) { zgtab="zhigongzz"; str="[֣�ݼ��޳���]";}
          if (chej.equals("42")) { zgtab="zhigongys"; str="[��ɽ���޳���]";}
          if (chej.equals("43")) { zgtab="zhigongly"; str="[�������޳���]";}
          if (chej.equals("44")) { zgtab="zhigongzl"; str="[֣�����ᳵ��]";}
          if (((String)session.getAttribute("zw")).equals("8"))
          { bzsql="select b.bz,b.code as bzcode from banzu as b,"+zgtab+" as a where a.bz=b.code and a.id='"+userid+"'";
          }
          
           sql="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b, banzu as c where a.cj='"+chej+"'and a.code=b.code and b.bz=c.code order by a.tingj desc";
           sqlzx="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b,banzu as c where a.cj='"+chej+"'and a.code=b.code and b.bz=c.code and a.xiuf  is null order by a.tingj desc";
           sqlzr="select zr,count(zr) as sl  from sbwx where cj='"+chej+"'and zr is not null group by zr   ";
      }
      else 
      {
          sql="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b, banzu as c where a.code=b.code and b.bz=c.code order by a.tingj desc";
          sqlzx="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b,banzu as c where a.code=b.code and b.bz=c.code and a.xiuf  is null order by a.tingj desc";
          sqlzr="select zr,count(zr) as sl  from sbwx where zr is not null group by zr   ";
      }
      
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      String tabname="sbxx"; 
       
    String searchstr="";
    if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
    //ϵͳ����Ա ����  ���������豸ͣ����Ϣ 
    if ((((String)session.getAttribute("deptment")).equals("admin"))||(((String)session.getAttribute("zw")).equals("8")))
       { canmodify=true;}
    //ϵͳ����Ա �����쵼 ��ȫԱ ���� �����ж��豸ͣ������
    if ((((String)session.getAttribute("deptment")).equals("admin"))||(((String)session.getAttribute("zw")).equals("3"))||(((String)session.getAttribute("zw")).equals("7"))||(((String)session.getAttribute("zw")).equals("1")))
       { canjudge=true;}   
   %>
   
  <table border="0" align="center"  valign="middle" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%" colspan="2">
          <div>
          <table align="center" valign="top">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/wx.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;�豸ά����Ϣ&nbsp;</font></td></tr>
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
               <input name="page" type="hidden" value="4">
              <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
         </td></form>
      </tr>
      <%if (Con!= null)
            	{
            		try
            		{
            		Statement Smts;
					Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
					if (((String)session.getAttribute("zw")).equals("8"))
          			{       ResultSet Rsbz;
							Rsbz=Smts.executeQuery(bzsql);
							Rsbz.last();
							CountR = Rsbz.getRow();
            			    Rsbz.first();
            			    if (CountR>0)  
            			    {
            			    bzcode=Rsbz.getString("bzcode");
            			    bzstr=Rsbz.getString("bz");
            			    }
            			    if (!bzcode.equals(""))
            			    {
            			   sql="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b, banzu as c where b.bz='"+bzcode+"' and a.code=b.code and b.bz=c.code order by a.tingj desc";
                           sqlzx="select a.id,a.code,a.tingj,a.xiuf,a.gz,a.fx,a.zr,b.mc,b.cj,c.bz,b.fl  from sbwx as a,sbxx as b,banzu as c where b.bz='"+bzcode+"' and  a.code=b.code and b.bz=c.code and a.xiuf  is null order by a.tingj desc";
                           sqlzr="select a.zr,count(a.zr) as sl  from sbwx as a ,sbxx as b where a.code=b.code and b.bz='"+bzcode+"' and   zr is not null group by zr   ";
      
            			    }
          			}
		%>
       <!-- 
       <tr>bzcode<%=bzcode %></tr>
       <tr><%=bzsql %></tr>  
       <tr><%=sql %></tr>
       <tr><%=sqlzx %></tr>
       <tr><%=sqlzr %></tr>
        -->
       <tr><td  width="100%" colspan="2" class=tableBorder_TB>
          <div>
          <table align="center" valign="top">
          <tr><td colspan="2" align="center" height="25" class=tableBorder_Btm ><font color="#800040">&nbsp;<%=str %><%=bzstr %>�豸���ϡ�ά������ͳ�Ʒ���&nbsp;</font></td></tr>
          <tr><td width="50%" valign="top">
          <table align="center" valign="top" >
          <tr><td  align="center"><font color="#800040">&nbsp;��ǰ�����豸�б�&nbsp;</font></td></tr>
          <tr><td  >
                    <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="4%"><div align="center" class="word_white">���</div></td>
                            <td width="10%"><div align="center" class="word_white">�豸���</div></td>
                            <td width="10%"><div align="center" class="word_white">�豸����</div></td>
                            <td width="8%"><div align="center" class="word_white">��������</div></td>
                            <td width="7%"><div align="center" class="word_white">��������</div></td>
                            <td width="4%"><div align="center" class="word_white">�豸����</div></td>
                            <td width="10%"><div align="center" class="word_white">ͣ��ʱ��</div></td>
                            </tr>
          <% 
                ResultSet Rs;
                Rs = Smts.executeQuery(sqlzx);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			
            			Rs.first();
            			if (CountR>0)
            			{
            			    
	            			while (!Rs.isAfterLast())
            			    {     
  	                        %>
  	                        <!-- ������:10
  	                               �豸���code (������Ϣ���ж���: ����mc ��������cj ����bz ����fl) 
  	                               ͣ��ʱ��tingj ��������gz �޸�ʱ��xiuf ����ԭ��yy �����϶�zrrd 
  	                        -->
            			    <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td align="center"><%=(CurrPg-1)*PgSize+i+1%></td>
                            <td align="center"><%=Rs.getString("code")%></td>
                            <td align="center"><%=Rs.getString("mc")%></td>
                            <td align="center">
                               <% if (Rs.getString("cj").equals("41")) { %> ֣�ݼ��޳��� <%} %>
                               <% if (Rs.getString("cj").equals("42")) { %> ��ɽ���޳��� <%} %>
                               <% if (Rs.getString("cj").equals("43")) { %> �������޳��� <%} %>
                               <% if (Rs.getString("cj").equals("44")) { %> ֣�����ᳵ�� <%} %>
                            </td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td align="center"><%=Rs.getString("tingj")%></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } } else {
                      %>
                        <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
                        <td colspan="7" align="center" ><font color="#3366CC">��ǰ�޴��޸�ͣ���豸</font></td>
                        </tr>
                    <% } %> 
		                   </table>
          </td></tr>
          </table>
          </td>
          <td width="50%">
          <table width="100%" align="center" valign="top" class=tableBorder_L>
          <tr><td  align="center"><font color="#800040">&nbsp;�豸�������η���&nbsp;</font></td></tr>
          <tr><td  >
           <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">�����϶�</div></td>
                            <td  width="10%"><div align="center" class="word_white">����</div></td>
                            <td  width="70%" style="display:none;"></td>
                            </tr>
          <% 
                        Rs = Smts.executeQuery(sqlzr);
            			Rs.last();
                        i = 0;
            			CountR = Rs.getRow();
            			
            			Rs.first();
            			if (CountR>0)
            			{
            			    
	            			while (!Rs.isAfterLast())
            			    {     
  	                        %>
  	                        <!-- ������:10
  	                               �豸���code (������Ϣ���ж���: ����mc ��������cj ����bz ����fl) 
  	                               ͣ��ʱ��tingj ��������gz �޸�ʱ��xiuf ����ԭ��yy �����϶�zrrd 
  	                        -->
            			    <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td align="center"><%=(CurrPg-1)*PgSize+i+1%></td>
                            <td align="center"><%=Rs.getString("zr")%></td>
                            <td align="center"><%=Rs.getString("sl")%></td>
                            <td  width="70%" style="display:none;"></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } }else {
                      %>
                        <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
                        <td colspan="7" align="center" ><font color="#3366CC">��ǰ�޷���</font></td>
                        </tr>
                    <% } %>    
		                   </table>
          </td></tr>
          </table>
          
          
          </td>
          </tr>
          </table>
          </div>
          </td>
      </tr>
      </table>
     <table align="center"  valign="top" width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><% if (canmodify) { %>
             <td width="95%" height="28"  align="left" ><img   width="20" height="18" src="Images/add.gif" >
             <font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#000000'" onClick="Javascript:window.open('inssbgz.jsp','','width=562,height=489')" target="newwindow">����豸������Ϣ&nbsp;&nbsp;&nbsp;</font></td>
           <% } %>
      <tr>    
          <td>
          <div>
          <!-- ���￪ʼ���в�Ʒ������Ϣ�Ĳ�ѯ -->
          <table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="4%"><div align="center" class="word_white">���</div></td>
                            <td  width="10%"><div align="center" class="word_white">�豸���</div></td>
                            <td  width="10%"><div align="center" class="word_white">�豸����</div></td>
                            <td width="8%"><div align="center" class="word_white">��������</div></td>
                            <td width="7%"><div align="center" class="word_white">��������</div></td>
                            <td  width="4%"><div align="center" class="word_white">�豸����</div></td>
                            <td  width="10%"><div align="center" class="word_white">ͣ��ʱ��</div></td>
                            <td  width="15%"><div align="center" class="word_white">��������</div></td>
                            <td  width="10%"><div align="center" class="word_white">�޸�ʱ��</div></td> 
                            <td  width="15%"><div align="center" class="word_white">����ԭ��</div></td> 
                            <td  width="12%"><div align="center" class="word_white">�����϶�</div></td>
                            <% if (canmodify||canjudge) {%>
                            <td colspan="4" width="10%" align="center" class="word_white">����</td>
                            <% } %>
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
                 
                
                Rs = Smts.executeQuery(sql);
            			
                        Rs.last();
                        i = 0;
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
  	                        <!-- ������:10
  	                               �豸���code (������Ϣ���ж���: ����mc ��������cj ����bz ����fl) 
  	                               ͣ��ʱ��tingj ��������gz �޸�ʱ��xiuf ����ԭ��yy �����϶�zrrd 
  	                        -->
            			    <tr border="0" height="25"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td align="center"><%=(CurrPg-1)*PgSize+i+1%></td>
                            <td align="center"><%=Rs.getString("code")%></td>
                            <td align="center"><%=Rs.getString("mc")%></td>
                            <td align="center"> <% if (Rs.getString("cj").equals("41")) { %> ֣�ݼ��޳��� <%} %>
                               <% if (Rs.getString("cj").equals("42")) { %> ��ɽ���޳��� <%} %>
                               <% if (Rs.getString("cj").equals("43")) { %> �������޳��� <%} %>
                               <% if (Rs.getString("cj").equals("44")) { %> ֣�����ᳵ�� <%} %></td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td align="center"><%=Rs.getString("fl")%></td>
                            <td align="center"><%=Rs.getString("tingj")%></td>
                            <td align="center"><%if (Rs.getString("gz")!=null) {%> <%=Rs.getString("gz")%> <% } %></td>
                            <td align="center"><%if (Rs.getString("xiuf")!=null) {%> <%=Rs.getString("xiuf")%> <% } else { %><font color="#ff3300">.��δ�޸�.</font> <% } %></td>
                            <td align="center"><%if (Rs.getString("fx")!=null) {%> <%=Rs.getString("fx")%> <% }  %></td>
                            <td align="center"><%if (Rs.getString("zr")!=null) {%> <%=Rs.getString("zr")%> <% }  %></td>
                            <% if (canmodify) { %>
                            <%if ((Rs.getString("xiuf")==null)||Rs.getString("xiuf").equals("")) {%>
                            <td width="4%">
                               <div align="center">
                               <img src="Images/timer.gif" width="20" height="20" border="0" onMouseOver="this.style.cursor='hand'" onMouseOut="color='#000000'"  title="�޸���ʱ" onClick="Javascript:window.open('inssbxf.jsp?id=<%=Rs.getString("id")%>','','width=562,height=202')">
                               </div>
                            </td><% } else { %><td><img src="Images/notimer.gif" width="20" height="20" border="0"></td><%}%>
                            <td width="4%">
                               <div align="center"> 
                               <img src="Images/edit.gif" width="12" height="12" border="0" onMouseOver="this.style.cursor='hand'" onMouseOut="color='#000000'" title="�޸�" onClick="Javascript:window.open('upsbxx.jsp?code=<%=Rs.getString("code")%>','','width=565,height=345')">
                               </div>
                            </td>
                            <td width="4%">
                               <div align="center">
                               <img src="Images/del_file.gif" width="20" height="20" border="0" onMouseOver="this.style.cursor='hand'" onMouseOut="color='#000000'" title="ɾ��" onClick="Javascript:window.open('delsbxx.jsp?code=<%=Rs.getString("code")%>','','width=519,height=155')">
                            </div>
                            </td>
                            <% } %>
                            <% if (canjudge) { %>
                            <td width="4%">
                               <div align="center">
                               <img src="Images/judge.gif" width="20" height="20" border="0" onMouseOver="this.style.cursor='hand'" onMouseOut="color='#000000'" title="�����ж�" onClick="Javascript:window.open('judge.jsp?id=<%=Rs.getString("id")%>','','width=561,height=311')">
                            </div>
                            </td>
                            <% } %>
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
          <form name="formbz" method="post" action="sbgl/sbgl.jsp">[<%=CurrPg%>/<%=CountPg %>] ÿҳ30�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcode" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
            <input name="subpg" type="hidden" value="3">
          </form>
          </td>
          <td>
          <a href="sbgl/sbgl.jsp?page=1&pgcode=1">��ҳ</a>
           <%if (CurrPg>1){%>
            <a href="sbgl/sbgl.jsp?page=1&pgcode=<%=CurrPg-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPg<CountPg){%>
            <a href="sbgl/sbgl.jsp?page=1&pgcode=<%=CurrPg+1%>">��һҳ</a> 
            <% }  %>
            <a href="sbgl/sbgl.jsp?page=1&pgcode=<%=CountPg%>">���һҳ</a>
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
            		{  
            		Con.close();}	
                     }
      }%>
      
  </body>
</html>
