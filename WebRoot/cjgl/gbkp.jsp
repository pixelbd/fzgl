<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPgbz = 0;
	int CurrPgbz = 0;
	int CountPgzg = 0;
	int CurrPg = 0;
	int PgSizebz = 20;
	int PgSizezg = 30;
	int CountR = 0;
	int CountRzg = 0;
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ɲ�����</title>
    
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
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      
      String chej="";
      String str="";
      String kpjgsql="select b.name,c.rq,b.name,a.ba,a.kf3,a.ldkh from kpbz.cjkpbz a,zhigongzz b,kpbz.kp c where a.zrr=b.id and c.kp=a.code";
      
      
      String submenu="";
      if (request.getParameter("submenu")!=null) submenu=new String(request.getParameter("submenu"));
      String searchstr="";
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
      
      if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
      
      if (chej.equals("zz")) { 
                  str="֣�ݼ���";
                 
                  }
                  
      if (chej.equals("ly")) { 
                  str="��������"; 
                  }
                  
      if (chej.equals("ys")) { 
                  str="��ɽ����"; 
                  }
      if (chej.equals("zl")) { 
                 str="֣������"; 
                 }
      
      
      boolean islog=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      
      if ((islog)&& (((String) session.getAttribute("deptment")).equals("41"))) 
      { chej = "zz";
        str="֣�ݼ���";
        
      } else {
        if ((islog)&& (((String) session.getAttribute("deptment")).equals("43"))) 
        { chej = "ly";
          str="��������";
         
    	} else { 
    	  if ((islog)&& (((String) session.getAttribute("deptment")).equals("42"))) 
    	  { chej = "ys";
    	    str="��ɽ����";
    	    
    	  } else { 
    	    if ((islog)&& (((String) session.getAttribute("deptment")).equals("44"))) 
    	    { chej = "zl";
    	      str="֣������";
    	    }
    			}
    		}
    	}
      
      
      if (islog) 
      { 
      %>
      <table align="center"  valign="top" width="100%" cellpadding=-1 cellspacing=-1 bgcolor="#FFFFFF">
      <tr><td  width="100%">
          <div>
          <table align="center">
          <tr>
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/kp.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>����ɲ�����&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>
      <%
      if (((String)session.getAttribute("deptment")).equals("1")||((String)session.getAttribute("deptment")).equals("admin"))   
      { %>
      <tr><td  width="100%" align="left"><div><table width="80%"><tr>
      <td width="25%" ><img id="imgdt1" width="18" height="18" <% if (chej.equals("zz")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=zz&submenu=<%=submenu%>&searchstr=<%=searchstr%>">֣�ݼ��޳���</a>
      </td>
      <td width="25%" ><img id="imgdt2" width="18" height="18" <% if (chej.equals("ly")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=ly&submenu=<%=submenu%>&searchstr=<%=searchstr%>">�������޳���</a></td>
      <td width="25%" ><img id="imgdt3" width="18" height="18" <% if (chej.equals("ys")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=ys&submenu=<%=submenu%>&searchstr=<%=searchstr%>">��ɽ���޳���</a></td>
      <td width="25%" ><img id="imgdt4" width="18" height="18" <% if (chej.equals("zl")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=zl&submenu=<%=submenu%>&searchstr=<%=searchstr%>">֣�����ᳵ��</a></td>
      </tr></table></div></td></tr>
      <% } %>
      <tr><td width="100%" bgcolor="#6699CC" height="28">
          <!-- ���ܲ˵� -->
          <div>
          <table align="left"  valign="top"  cellpadding=-1 cellspacing=-1>
           <tr >
            <td><img  width="20" height="20" src="Images/GArrow.gif"></td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=1&cj=<%=chej%>">������Ա���������ѯ</a>&nbsp;
            </td>
            <% if (((String)session.getAttribute("deptment")).equals("admin")
                   ||((String)session.getAttribute("zw")).equals("1")||((String)session.getAttribute("zw")).equals("cjadmin"))   
            { %>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=2&cj=<%=chej%>">������Ա��������</a>&nbsp;
            </td>
            <% } %>
           
            </tr>
          </table>
          </div>
          </td>
     </tr>
      </table>
      <% } %>
     
 <% if (submenu.equals("1")) { 
				    
      %>
      </table>
      <tr><td width="100%" height="28"  align="left">
      <img  width="21" height="17" src="Images/arrow.png"><font color="#374295">&nbsp;���������������&nbsp;</font></td></tr>
      
         <tr>
         <td><div>
         <!-- �����ǿ�������Ĳ�ѯ -->
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
                ResultSet Rskhld;
                if (Con!= null)
            	{
            		try
            		{
            		
						Rskhld = Smts.executeQuery(bzsql);
            			
                        Rskhld.last();
                        int i = 0;
            			CountR = Rskhld.getRow();
            			CountPgbz = (CountR/PgSizebz);
            			if (CountR%PgSizebz>0)
            				CountPgbz++;
            			Rskhld.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
            			    <td  width="10%"><div align="center" class="word_white">����</div></td>
                            <td  width="20%"><div align="center" class="word_white">������</div></td>
                            <td  width="10%"><div align="center" class="word_white">��������</div></td>
                            <td  width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">��׼</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td> 
                            <td width="10%"><div align="center" class="word_white">�۷�</div></td>
                            </tr>  
                            <%
            				Rskhld.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rskhld.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
            			    <td align="center"><%=Rskhld.getString("rq")%></td>
            			    <td align="center"><%=Rskhld.getString("khr")%></td>
            			    <td align="center"><%=Rskhld.getString("bkhr")%></td>
                            <td align="center"><%=Rskhld.getString("fl")%></td>
                            <td ><div align="center"><%=Rskhld.getString("bz")%></div></td> 
                            <td align="center"><%=Rskhld.getString("ms")%></td>
                            <td  ><div align="center"><%=Rskhld.getString("kf")%></div></td>
                            </tr>  
                           <%
					            Rskhld.next();
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
            <input name="subpg" type="hidden" value="2">
            <input name="submenu" type="hidden" value="2">
            <input name="cj"  type="hidden" value="<%=chej%>">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=2&cj=<%=chej%>&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=2&cj=<%=chej%>&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=2&cj=<%=chej%>&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=2&cj=<%=chej%>&pgcodebz=<%=CountPgbz%>">���һҳ</a>
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
