<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPgbz = 0;
	int CurrPgbz = 0;
	int CountPgzg = 0;
	int CurrPgzg = 0;
	int PgSizebz = 20;
	int PgSizezg = 30;
	int CountR = 0;
	int CountRzg = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cjrsgl.jsp' starting page</title>
    
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
       
      String chej="";
      String str="";
      String bzxxsql="";
      String bbxxsql="select b.bz,c.name,a.zw,a.bb from bbzz a,bz b,zhigong c where a.bz=b.code and a.bbr=c.id";
      String zgxxsql="";
      String zgtitle="����ְ��������Ϣ��";
      
      String submenu="";
      if (request.getParameter("submenu")!=null) submenu=new String(request.getParameter("submenu"));
     
      String searchstr="";
      request.setCharacterEncoding("GB2312");
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
      
      if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
      
      if (chej.equals("zz")) { 
                  str="֣�ݼ���"; 
                  bzxxsql="select * from banzu where cj='41'";
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbzz a,banzu b,zhigongzz c where a.bz=b.code and a.bbr=c.id";
                  
                  if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzz a,banzu b where a.bz=b.code order by bz,name";                              }
                  else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzz a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name";}
                  }
      if (chej.equals("ly")) { 
                  str="��������"; 
                  bzxxsql="select * from banzu where cj='43'"; 
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbly a,banzu b,zhigongly c where a.bz=b.code and a.bbr=c.id";
                  
                  if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongly a,banzu b where a.bz=b.code order by bz,name"; }
                  else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongly a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
                  }
      if (chej.equals("ys")) { 
                  str="��ɽ����"; 
                  bzxxsql="select * from banzu where cj='42'"; 
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbys a,banzu b,zhigongys c where a.bz=b.code and a.bbr=c.id";
                  if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongys a,banzu b where a.bz=b.code order by bz,name"; } 
                  else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongys a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
                  }
      if (chej.equals("zl")) { 
                 str="֣������"; 
                 bzxxsql="select * from banzu where cj='44'";
                 bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbzl a,banzu b,zhigongzl c where a.bz=b.code and a.bbr=c.id";
                  if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzl a,banzu b where a.bz=b.code order by bz,name"; }
                  else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzl a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
                  }
      
      zgtitle=str+zgtitle;
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
        bzxxsql="select * from banzu where cj='41'";
        bbxxsql="select * from bbzz ";
        if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzz a,banzu b where a.bz=b.code order by bz,name"; }
           else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzz a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
      } else {
        if ((islog)&& (((String) session.getAttribute("deptment")).equals("43"))) 
        { chej = "ly";
          str="��������";
          bzxxsql="select * from banzu where cj='43'";
          bbxxsql="select * from bbly ";
          if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongly a,banzu b where a.bz=b.code order by bz,name";   }
          else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongly a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
    	} else { 
    	  if ((islog)&& (((String) session.getAttribute("deptment")).equals("42"))) 
    	  { chej = "ys";
    	    str="��ɽ����";
    	    bzxxsql="select * from banzu where cj='42'";
    	    bbxxsql="select * from bbys ";
    	    if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongys a,banzu b where a.bz=b.code order by bz,name"; }
            else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongys a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
    	  } else { 
    	    if ((islog)&& (((String) session.getAttribute("deptment")).equals("44"))) 
    	    { chej = "zl";
    	      str="֣������";
    	      bzxxsql="select * from banzu where cj='44'";
    	      bbxxsql="select * from bbzl ";
    	      if (searchstr.equals("")) { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzl a,banzu b where a.bz=b.code order by bz,name"; }
              else { zgxxsql="select name,sex,birthday,id,workcard,yibao,zc,b.bz as bz,zw,gz,mm,xl,jg,xx,zz from zhigongzl a,banzu b where a.bz=b.code and name like '"+searchstr+"%' order by bz,name"; }
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
              <td  rowspan="3" align="right"><img  width="43" height="43" src="Images/rsgl.gif"></td>
              <td  height="20"></td>
          </tr>
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>�������¹���&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>
     
      <!-- 
       if (
              (!((String)session.getAttribute("zw")).equals("8"))
             &&(!((String)session.getAttribute("zw")).equals("9"))
             &&(!((String)session.getAttribute("zw")).equals("10"))
             &&( ((String)session.getAttribute("deptment")).equals("1") 
                ||((String)session.getAttribute("zw")).equals("cjadmin")
                ||((String)session.getAttribute("deptment")).equals("admin")))   
      {  -->
      <%
      if (((String)session.getAttribute("deptment")).equals("1")||((String)session.getAttribute("deptment")).equals("admin"))   
      { %>
      <tr><td  width="100%" align="left">
      <div>
      <table width="80%"><tr>
      <td width="25%" ><img id="imgdt1" width="18" height="18" <% if (chej.equals("zz")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=1&cj=zz&submenu=<%=submenu%>&searchstr=<%=searchstr%>">֣�ݼ��޳���</a>
      </td>
      <td width="25%" ><img id="imgdt2" width="18" height="18" <% if (chej.equals("ly")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=1&cj=ly&submenu=<%=submenu%>&searchstr=<%=searchstr%>">�������޳���</a></td>
      <td width="25%" ><img id="imgdt3" width="18" height="18" <% if (chej.equals("ys")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=1&cj=ys&submenu=<%=submenu%>&searchstr=<%=searchstr%>">��ɽ���޳���</a></td>
      <td width="25%" ><img id="imgdt4" width="18" height="18" <% if (chej.equals("zl")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=1&cj=zl&submenu=<%=submenu%>&searchstr=<%=searchstr%>">֣�����ᳵ��</a></td>
      </tr>
      </table>
      </div>
      </td></tr>
      <% } %>
      
      <tr><td width="100%" bgcolor="#6699CC" height="28">
          <!-- ���ܲ˵� -->
          <div>
          <table align="left"  valign="top"  cellpadding=-1 cellspacing=-1>
           <tr >
            <td><img  width="20" height="20" src="Images/GArrow.gif"></td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=1&cj=<%=chej%>">���������Ϣ</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=6&cj=<%=chej%>">������ܰ�����Ϣ</a>&nbsp;
            </td>
            <%if (
              ((!((String)session.getAttribute("zw")).equals("8"))
             &&(!((String)session.getAttribute("zw")).equals("9"))
             &&(!((String)session.getAttribute("zw")).equals("10"))
             &&(!((String)session.getAttribute("zw")).equals(""))
             )|| ((String)session.getAttribute("deptment")).equals("1") )
         { 
       %>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>">���ְ����Ϣ</a>&nbsp;
            </td>
            <%}  %>
            <% if (((String)session.getAttribute("deptment")).equals("admin")
                   ||((String)session.getAttribute("zw")).equals("2")||((String)session.getAttribute("zw")).equals("cjadmin"))   
            { %>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>">������Ϣά��</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>">ְ����Ϣά��</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=5&cj=<%=chej%>">�ɲ�רְ������Ϣά��</a>&nbsp;
            </td>
            <% } %>
           
            </tr>
          </table>
          </div>
          </td>
     </tr>
      
      <%    } %>
      </table>
      <% if (submenu.equals("1")) { %>
      <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99"><img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>���������Ϣ&nbsp;</font></td></tr>
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ���а�����Ϣ�Ĳ�ѯ -->
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
            			Rs = Smts.executeQuery(bzxxsql);
            			
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
                            <td  width="10%"><div align="center" class="word_white">��������</div></td>
                            <td  width="20%"><div align="center" class="word_white">��������</div></td> 
                            <td width="10%"><div align="center" class="word_white">���鹤��</div></td>
                            <td width="10%"><div align="center" class="word_white">�����쵼</div></td>
                            <td width="20%"><div align="center" class="word_white">������</div></td>
                            <td width="10%"><div align="center" class="word_white">�ڸ�����</div></td>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td ><div align="center"> 
                            <%if (Rs.getString("cj").equals("41")) {%>֣�ݼ��޳���<% } %>
                            <%if (Rs.getString("cj").equals("42")) {%>��ɽ���޳���<% } %>
                            <%if (Rs.getString("cj").equals("43")) {%>�������޳���<% } %>
                            <%if (Rs.getString("cj").equals("44")) {%>֣�����ᳵ��<% } %>
                            </div></td> 
                            <td  ><div align="center"> </div></td>
                            <td height="30"  ><div align="center"> </div></td>
                            <td  ><div align="center"> </div></td>
                            <td height="30"  ><div align="center"> </div></td>
                            
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
            <input name="subpg" type="hidden" value="1">
            <input name="submenu" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
           </td>
          <td>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=1&cj=<%=chej%>&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){ %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=1&cj=<%=chej%>&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=1&cj=<%=chej%>&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=1&cj=<%=chej%>&pgcodebz=<%=CountPgbz%>">���һҳ</a>
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
      <tr>
         <td width="100%"   align="left" >
         <table width="100%" cellpadding=-2 cellspacing=-2>
         <tr>
             <td colspan="2" width="100%" height="30" bgcolor="#FFEF99">
             <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>����ְ����Ϣ&nbsp;</font>
             </td>
         </tr>
         <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch1">
             <td width="80%" align="center"><font color="#4E759C">ְ����ѯ:</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="1">
               <input name="submenu" type="hidden" value="2">
               <input name="cj"  type="hidden" value="<%=chej%>">
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
               </td>
             <td valign="top" align="left" width="20%"><img   width="16" height="16" src="Images/excel.jpg" >
             <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>&searchstr=<%=searchstr%>" onClick="outExcel();">����Excel�༭</a>
             </td>
             </form>
         </tr>
         </table>
         </td>
      </tr>
      <tr>
          <td>
          <div>
    <script language="javascript">
    function outExcel(){
	var table=document.all.zgtab;
	row=table.rows.length;
	column=table.rows(1).cells.length;
	var excelapp=new ActiveXObject("Excel.Application");
	excelapp.visible=true;
	objBook=excelapp.Workbooks.Add(); //����µĹ�����
	var objSheet = objBook.ActiveSheet;

	title=objSheet.Range("H1").MergeArea;  //�ϲ���Ԫ��
	title.Cells(1,1).Value ="<%=zgtitle%>";
	title.Cells(1,1).Font.Size =16;
	
	for(i=1;i<row+1;i++){
		for(j=0;j<column;j++){
		  objSheet.Cells(i+1,j+1).value=table.rows(i-1).cells(j).innerHTML.replace("&nbsp;","");
		}
	}

	excelapp.UserControl = true;
    }
   </script>
          <!-- ���￪ʼ����ְ����Ϣ�Ĳ�ѯ -->
          <% 
          String StrPgzg = request.getParameter("pgcodezg");
          
            	if ((StrPgzg == null)||(StrPgzg.equals("")))
            	{
            		CurrPgzg = 1;
            	}
            	else
            	{
            		CurrPgzg = Integer.parseInt(StrPgzg);
            	}
                Statement Smtszg; 
                ResultSet Rszg;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smtszg = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rszg = Smtszg.executeQuery(zgxxsql);
            			
                        Rszg.last();
                        int j = 0;
            			CountRzg = Rszg.getRow();
            			CountPgzg = (CountRzg/PgSizezg);
            			if (CountRzg%PgSizezg>0)
            				CountPgzg++;
            			Rszg.first();
            			if (CountRzg>0)
            			{
            			%><table id="zgtab" width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">���</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="5%" align="center" class="word_white">�Ա�</td>
                            <td width="10%" align="center" class="word_white">��������</td>
                            <td width="10%" align="center" class="word_white">���֤��</td> 
                            <td width="10%" align="center" class="word_white">����֤��</td>
                            <td style="display:none;">ҽ����</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="10%" align="center" class="word_white">ְ��</td>
                            <td style="display:none;">ְ��</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="10%" align="center" class="word_white">������ò</td>
                            <td width="10%" align="center" class="word_white">ѧ��</td>
                            <td style="display:none;">��ҵԺУ</td>
                            <td style="display:none;">����</td>
                            <td style="display:none;">סַ</td>
                            
                            </tr>  
                            <%
            				Rszg.absolute(CurrPgzg*PgSizezg-PgSizezg+1);
	            			while (j<PgSizezg && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9"  onMouseOver="this.style.cursor='hand';this.style.background='#FDFCD9'" onClick="Javascript:window.open('showzg.jsp?cj=<%=chej%>&id=<%=Rszg.getString("id")%>','','width=580,height=490')" onMouseOut="this.style.background='#E1EDF9'"  title="���������">
            			    <td  align="center"><%=(CurrPgzg-1)*PgSizezg+j+1%></td>
                            <td align="center"><%=Rszg.getString("name")%></td>
                            <td  align="center" ><%=Rszg.getString("sex")%></td>
                            <td  align="center" ><%=Rszg.getString("birthday")%></td>
                            <td  align="center" >[<%=Rszg.getString("id")%>]</td> 
                            <td  align="center" >[<%=Rszg.getString("workcard")%>]</td>
                            <td style="display:none;"><%=Rszg.getString("yibao")%></td>
                            <td  align="center" ><%=Rszg.getString("bz")%></td>
                            <td  align="center" ><%=Rszg.getString("zw")%></td>
                            <td style="display:none;"><%=Rszg.getString("zc")%></td>
                            <td  align="center" ><%=Rszg.getString("gz")%></td>
                            <td  align="center" ><%=Rszg.getString("mm")%></td>
                            <td align="center" ><%=Rszg.getString("xl")%></td>
                            <td style="display:none;"><%=Rszg.getString("xx")%></td>
                            <td style="display:none;"><%=Rszg.getString("jg")%></td>
                            <td style="display:none;"><%=Rszg.getString("zz")%></td>
                            </tr>
                            
                            <%
					            Rszg.next();
					            j++;
					    }
					 %>  
		          
		      </table>    
		  </div>
		  </td>
	</tr>
	<!-- ��ʾҳ��� -->
	<tr>
	     <td>
		 <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
          <form name="formzg1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgzg%>/<%=CountPgzg %>] ÿҳ30�� ��<%=CountRzg%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodezg" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="1">
            <input name="submenu" type="hidden" value="2">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>&pgcodezg=1">��ҳ</a>
           <%if (CurrPgzg>1){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>&pgcodezg=<%=CurrPgzg-1%>">��һҳ</a> 
            <% }  %>
            <%if (CurrPgzg<CountPgzg){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>&pgcodezg=<%=CurrPgzg+1%>">��һҳ</a> 
            <% } %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=2&cj=<%=chej%>&pgcodezg=<%=CountPgzg%>">���һҳ</a>
          </td>
          </tr>
        </table>
        </div>
          </td>
      </tr><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ���������ְ����Ϣ!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }    
     %>
      </table>
   <% } %>
   <% if (submenu.equals("3")) { %>
     <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99"><img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>���������Ϣά��&nbsp;</font></td></tr>
      <tr><td width="90%" height="28"  align="left" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('insbz.jsp?cj=<%=chej%>','','width=600,height=265')"><img   width="20" height="18" src="Images/add.gif" 
               >&nbsp;&nbsp;��Ӱ�����Ϣ&nbsp;&nbsp;&nbsp;
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ���а�����Ϣ�Ĳ�ѯ -->
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
            			Rs = Smts.executeQuery(bzxxsql);
            			
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
                            <td  width="20%"><div align="center" class="word_white">��������</div></td>
                            <td  width="20%"><div align="center" class="word_white">��������</div></td> 
                            <td width="20%"><div align="center" class="word_white">���鹤��</div></td>
                            <td width="20%"><div align="center" class="word_white">��������</div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")||((String)session.getAttribute("zw")).equals("2"))) {%>
                            <td colspan="2" width="10%" align="center" class="word_white">����</td>
                            <% } %>
                            </tr>  
                            <%
            				Rs.absolute(CurrPgbz*PgSizebz-PgSizebz+1);
	            			while (i<PgSizebz && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=(CurrPgbz-1)*PgSizebz+i+1%></td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td ><div align="center"> 
                            <%if (Rs.getString("cj").equals("41")) {%>֣�ݼ��޳���<% } %>
                            <%if (Rs.getString("cj").equals("42")) {%>��ɽ���޳���<% } %>
                            <%if (Rs.getString("cj").equals("43")) {%>�������޳���<% } %>
                            <%if (Rs.getString("cj").equals("44")) {%>֣�����ᳵ��<% } %>
                            </div></td> 
                            <td  ><div align="center"> </div></td>
                            <td height="30"  ><div align="center"> </div></td>
                            <% if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")
                             ||((String)session.getAttribute("zw")).equals("2"))) { %>
                            <td width="5%">
                               <div align="center"> 
                               <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>" onClick="Javascript:window.open('upbz.jsp?code=<%=Rs.getString("code")%>','','width=600,height=265')">
                               <img src="Images/edit.gif" width="12" height="12" border="0"></a>
                               </div>
                            </td>
                            <td width="5%">
                               <div align="center">
                               <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>" onClick="Javascript:window.open('delbz.jsp?code=<%=Rs.getString("code")%>','','width=519,height=155')">
                               <img src="Images/del_file.gif" width="20" height="20" border="0" ></a>
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
          <form name="formbz2" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgbz%>/<%=CountPgbz %>] ÿҳ20�� ��<%=CountR%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodebz" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej%>">
             <input name="submenu" type="hidden" value="3">
            </form>
           </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>&pgcodebz=1">��ҳ</a>
           <%if (CurrPgbz>1){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>&pgcodebz=<%=CurrPgbz-1%>">��һҳ</a> 
            <% } %>
            <%if (CurrPgbz<CountPgbz){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>&pgcodebz=<%=CurrPgbz+1%>">��һҳ</a> 
            <% }  %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=3&cj=<%=chej%>&pgcodebz=<%=CountPgbz%>">���һҳ</a>
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
            		{  Con.close();}	
      }    
      %>
      </table>
   <% } %>
   <% if (submenu.equals("4")) { %>
     <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr>
         <td width="100%"   align="left" >
         <table width="100%" cellpadding=-2 cellspacing=-2>
         <tr>
             <td  width="100%" height="30" bgcolor="#FFEF99">
             <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>����ְ����Ϣά��&nbsp;</font>
             </td>
         </tr>
         <tr>
         <form action="cjgl/cjgl.jsp" method="post" name="formzgsearch2">
             <td width="80%" align="center"><font color="#4E759C">ְ����ѯ:</font>
               <input name="searchstr" type="text" size="20" <%if (!searchstr.equals("")) { %>value="<%=searchstr%>" <% } %>>
               <input name="page" type="hidden" value="2">
               <input name="subpg" type="hidden" value="1">
               <input name="submenu" type="hidden" value="4">
               <input name="cj"  type="hidden" value="<%=chej%>">
               <input type="submit" name="Submit" value=" �� ѯ " class="Style_btn">
             </td>
             
             </form>
         </tr>
         <tr><td width="90%" height="28"  align="left" ><img   width="20" height="18" src="Images/add.gif" >
             <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr%>" onClick="Javascript:window.open('inszg.jsp?cj=<%=chej%>','','width=605,height=665')" >���ְ����Ϣ&nbsp;&nbsp;&nbsp;</a>
        <tr>
         </table>
         </td>
      </tr>
      <tr>
          <td>
          <div>

          <!-- ���￪ʼ����ְ����Ϣ�Ĳ�ѯ -->
          <% 
          String StrPgzg = request.getParameter("pgcodezg");
          
            	if ((StrPgzg == null)||(StrPgzg.equals("")))
            	{
            		CurrPgzg = 1;
            	}
            	else
            	{
            		CurrPgzg = Integer.parseInt(StrPgzg);
            	}
                Statement Smtszg; 
                ResultSet Rszg;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smtszg = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rszg = Smtszg.executeQuery(zgxxsql);
            			
                        Rszg.last();
                        int j = 0;
            			CountRzg = Rszg.getRow();
            			CountPgzg = (CountRzg/PgSizezg);
            			if (CountRzg%PgSizezg>0)
            				CountPgzg++;
            			Rszg.first();
            			if (CountRzg>0)
            			{
            			%>
            			   <table id="zgtab" width="99%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="2%" align="center" class="word_white">���</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="3%" align="center" class="word_white">�Ա�</td>
                            <td width="10%" align="center" class="word_white">��������</td>
                            <td width="10%" align="center" class="word_white">���֤��</td> 
                            <td width="10%" align="center" class="word_white">����֤��</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="10%" align="center" class="word_white">ְ��</td>
                            <td width="10%" align="center" class="word_white">����</td>
                            <td width="10%" align="center" class="word_white">������ò</td>
                            <td width="5%" align="center" class="word_white">ѧ��</td>
                            
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")||((String)session.getAttribute("zw")).equals("2"))) {%>
                            <td colspan="3" width="5%" align="center" class="word_white">����</td>
                            <% } %>
                            </tr>  
                            <%
            				Rszg.absolute(CurrPgzg*PgSizezg-PgSizezg+1);
	            			while (j<PgSizezg && !Rszg.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td align="center"><%=(CurrPgzg-1)*PgSizezg+j+1%></td>
                            <td align="center"><%=Rszg.getString("name")%></td>
                            <td  align="center" ><%=Rszg.getString("sex")%></td>
                            <td  align="center" ><%=Rszg.getString("birthday")%></td>
                            <td  align="center" ><%=Rszg.getString("id")%></td> 
                            <td  align="center" ><%=Rszg.getString("workcard")%></td>
                            <td  align="center" ><%=Rszg.getString("bz")%></td>
                            <td  align="center" ><%=Rszg.getString("zw")%></td>
                            <td  align="center" ><%=Rszg.getString("gz")%></td>
                            <td  align="center" ><%=Rszg.getString("mm")%></td>
                            <td align="center" ><%=Rszg.getString("xl")%></td>
                            <td  width="20" align="center">
                            <div>
                            <img width="15" height="15" src="Images/eye.gif" border="0" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('showzg.jsp?cj=<%=chej%>&id=<%=Rszg.getString("id")%>','','width=580,height=490')" title="���������">
  	                        </div>
  	                         </td>
                            <% if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")
                             ||((String)session.getAttribute("zw")).equals("2"))) { %>
                            <td  width="20">
                               <div align="center"> 
                               <img src="Images/edit.gif" width="12" height="12" border="0" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('upzg.jsp?code=<%=Rszg.getString("id")%>&cj=<%=chej%>','','width=600,height=265')" title="�޸�">
                               </div>
                            </td>
                            <td  width="20">
                               <div align="center">
                               <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr %>" onClick="Javascript:window.open('delzg.jsp?code=<%=Rszg.getString("id")%>&cj=<%=chej%>','','width=519,height=155')" title="ɾ��">
                               <img src="Images/del_file.gif" width="20" height="20" border="0"></a>
                            </div>
                            </td>
                            
                            <% } %>
                            </tr>
                            
                           <%
					            Rszg.next();
					            j++;
					    }
					 %>  
		          </table>
		          
		  </div>
		  </td>
	</tr>
	<!-- ��ʾҳ��� -->
	<tr>
	     <td>
		 <div>
		  <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr>
          <td nowrap class="word_blue" align="left">
            <form name="formzg2" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgzg%>/<%=CountPgzg %>] ÿҳ30�� ��<%=CountRzg%>����¼&nbsp;&nbsp;&nbsp;&nbsp; ת����
            <input name="pgcodezg" type="text" size="3" >&nbsp;ҳ&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej %>">
            <input name="searchstr" type="hidden" value="<%=searchstr%>">
            <input name="submenu" type="hidden" value="4">
            </form>
          </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr%>&pgcodezg=1">��ҳ</a>
           <%if (CurrPgzg>1){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr%>&pgcodezg=<%=CurrPgzg-1%>">��һҳ</a> 
            <% }  %>
            <%if (CurrPgzg<CountPgzg){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr%>&pgcodezg=<%=CurrPgzg+1%>">��һҳ</a> 
            <% } %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=4&cj=<%=chej%>&searchstr=<%=searchstr%>&pgcodezg=<%=CountPgzg%>">���һҳ</a>
          </td>
          </tr>
        </table>
        </div>
          </td>
      </tr><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ���������ְ����Ϣ!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }    
     %>
      </table>
   <% } %>
   <% if (submenu.equals("5")) { %>
     <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99"><img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>�������ܰ�����Ϣά��&nbsp;</font></td></tr>
      <tr><td width="90%" height="28"  align="left" ><img   width="20" height="18" src="Images/add.gif" >
             <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=5" onClick="Javascript:window.open('insgz.jsp','','width=600,height=265')">��ӳ������ܰ�����Ϣ&nbsp;&nbsp;&nbsp;</a>
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ���й�����Ϣ�Ĳ�ѯ -->
          <% 
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(bbxxsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td>
                            <td  width="20%"><div align="center" class="word_white">����������</div></td>
                            <td  width="20%"><div align="center" class="word_white">ְ��</div></td>  
                            <td  width="20%"><div align="center" class="word_white">����</div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")||((String)session.getAttribute("zw")).equals("2"))) {%>
                            <td colspan="2" width="10%" align="center" class="word_white">����</td>
                            <% } %>
                            </tr>  
                            <%
            				while (!Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=i+1%></td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td ><div align="center"><%=Rs.getString("bbr")%></div></td>
                            <td ><div align="center"><%=Rs.getString("zw")%></div></td>
                            <td ><div align="center"><%if (Rs.getString("bb").equals("0")) out.print("����"); else out.print("����"); %></div></td>
                            <% if ((islog) && (((String)session.getAttribute("deptment")).equals("admin")
                             ||((String)session.getAttribute("zw")).equals("cjadmin")
                             ||((String)session.getAttribute("zw")).equals("2"))) { %>
                            <td width="5%">
                               <div align="center"> 
                               <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=5" onClick="Javascript:window.open('upgz.jsp?code=<%=Rs.getString("code")%>','','width=600,height=265')">
                               <img src="Images/edit.gif" width="12" height="12" border="0"></a>
                               </div>
                            </td>
                            <td width="5%">
                               <div align="center">
                               <a href="cjgl/cjgl.jsp?page=2&subpg=1&submenu=5" onClick="Javascript:window.open('delgz.jsp?code=<%=Rs.getString("code")%>','','width=519,height=155')">
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
		  </div></td></tr>
	  <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  Con.close(); }	
      }    
      %>
      </table>
   <% } %>
      <% if (submenu.equals("6")) { %>
     <table align="center"  width="100%"   cellpadding=-2 cellspacing=-2 bgcolor="#FFFFFF">
      <tr><td width="100%" height="28"  align="left" bgcolor="#FFEF99"><img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>�������ܰ�����Ϣ&nbsp;</font></td></tr>
      <tr>
          <td>
          <div>
          <!-- ���￪ʼ���й�����Ϣ�Ĳ�ѯ -->
          <% 
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(bbxxsql);
            			
                        Rs.last();
                        int i = 0;
            			CountR = Rs.getRow();
            			Rs.first();
            			if (CountR>0)
            			{
            			%> <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="10%"><div align="center" class="word_white">���</div></td>
                            <td  width="20%"><div align="center" class="word_white">����</div></td>
                            <td  width="20%"><div align="center" class="word_white">����������</div></td>
                            <td  width="20%"><div align="center" class="word_white">ְ��</div></td>  
                            <td  width="20%"><div align="center" class="word_white">����</div></td>
                            
                            </tr>  
                            <%
            				while (!Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9" >
            			    <td width="10%"  align="center"><%=i+1%></td>
                            <td align="center"><%=Rs.getString("bz")%></td>
                            <td ><div align="center"><%=Rs.getString("bbr")%></div></td>
                            <td ><div align="center"><%=Rs.getString("zw")%></div></td>
                            <td ><div align="center"><%if (Rs.getString("bb").equals("0")) out.print("����"); else out.print("����"); %></div></td>
                            </tr>  
                           <%
					            Rs.next();
					            i++;
					        } %>  
		                   </table>
		  </div></td></tr>
	  <% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("δ�ҵ�����������¼!");
            		}
            		finally
            		{  Con.close(); }	
      }    
      %>
      </table>
   <% } %>
  </body>
</html>
