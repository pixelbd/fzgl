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
    
    <title>�������߹���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <LINK href="Css/style.css" type=text/css rel=stylesheet>
  <body>
  <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
}
 function changebz()
   { formbz.submit();}
   function changecj()
   { formcj.submit();}
   function changebw1()
   { formbw1.submit();}
   function changebw2()
   { formbw2.submit();} 
</script> 
  <% 
    //��ȡ��ǰ���ڵ��·�
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
   java.util.Date today=new java.util.Date();
   int nowyear = today.getYear()+1900;
   int nowmonth = today.getMonth()+1; 
  

  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
  Statement Smts; 
  ResultSet Rs,Rsgz;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
 
  String chej="";
  if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
  String sqlbz=" select bz,code from banzu where cj='"+chej+"' order by bz"; 
  String bz="";
  if (request.getParameter("bz")!=null) bz=new String(request.getParameter("bz"));
  String bw1="";
  if (request.getParameter("bw1")!=null) bw1=new String(request.getParameter("bw1").getBytes("ISO-8859-1"));
  String sqlbw1=" select distinct bw1 from dxgzfl ";

  boolean canmodify=false;
  boolean isgz=false;
  String userid="";
  String lianjucj="";//�����ĸ����乤��
  String liangjubz="";//�����ĸ����鹤���������İ�����
  String zgtab="";
  int i=0;
  if  (((String)session.getAttribute("deptment")).equals("41") 
      || ((String)session.getAttribute("deptment")).equals("42")
      || ((String)session.getAttribute("deptment")).equals("43")
      || ((String)session.getAttribute("deptment")).equals("44")
      || ((String)session.getAttribute("deptment")).equals("admin"))
  {   
           if  (((String)session.getAttribute("deptment")).equals("41"))  { zgtab="zhigongzz"; lianjucj="41"; }
           if  (((String)session.getAttribute("deptment")).equals("42"))  { zgtab="zhigongly"; lianjucj="42"; }
           if  (((String)session.getAttribute("deptment")).equals("43"))  { zgtab="zhigongys"; lianjucj="43"; } 
           if  (((String)session.getAttribute("deptment")).equals("44"))  { zgtab="zhigongzl"; lianjucj="44"; }
           userid=(String)session.getAttribute("userid");
           //����,����רְ,�������Ա,�����쵼�������������Ϣ
           if (((String)session.getAttribute("zw")).equals("8")
           ||((String)session.getAttribute("zw")).equals("1")
           ||((String)session.getAttribute("zw")).equals("6")
           ||((String)session.getAttribute("zw")).equals("cjadmin")) 
           { 
           canmodify=true;
           if  (((String)session.getAttribute("zw")).equals("8")) 
           { isgz=true; 
             String sqluser="select bz from "+zgtab+" where id='"+userid+"'";
             
             if (Con!= null)
             {
             try
             { Rs = Smts.executeQuery(sqluser);
               Rs.last();
               CountR = Rs.getRow();
               Rs.first();
               if (CountR>0)
               {  liangjubz=Rs.getString("bz");
               }
             }
             catch (SQLException e)
             {
              out.println("error!");
             }
             finally {   }
             }
           }
           else isgz=false;
           
           }
   }
  %>

   <table class="tableBorder_LR"   align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
   <tr align="center">
      <td width="20%" height="25"  align="right">
      <div><img   width="44" height="44" src="Images/search.ico" ></div>
      <div><font color="#bbbbbb">������ѯ</font></div>
      </td>
      <td width="80%"  align="left">
      <table  border="0" width="100%" cellpadding="-2" cellspacing="-2">
      <tr>
          <td width="50%" height="25" align="right">
          <form name="formcj" ACTION="liangju.jsp"  METHOD="POST"> 
          <input type="hidden" name="bw1" value="<%=bw1%>">
          <input type="hidden" name="page" value="3"><font color="#003366">���Ϸ��ֲ���ѡ��:&nbsp;</font>
          <select name="cj"   class="Sytle_select" onchange="changecj()">
          <option value=""  >ѡ��Ҫ��ѯ�ĳ���&nbsp;</option>
          <option  value="41" <%if (chej.equals("41")) out.print("selected"); %>>֣�ݼ��޳���</option>
          <option  value="42" <%if (chej.equals("42")) out.print("selected"); %>>�������޳���</option>
          <option  value="43" <%if (chej.equals("43")) out.print("selected"); %>>��ɽ���޳���</option>
          <option  value="44" <%if (chej.equals("44")) out.print("selected"); %>>֣�����ᳵ��</option>
          </select>
          </form>
          </td>
          <td width="5%" height="25" align="right"></td>
         <td width="45%" align="left">
         <form ACTION="liangju.jsp" name=formbz METHOD="POST"> 
         <input type="hidden" name="page" value="3">
         <input type="hidden" name="bw1" value="<%=bw1%>">
         <input type="hidden" name="cj" value="<%=chej%>">
         <select name="bz"   class="Sytle_select" onchange="changebz()">
         <option value="" >ѡ��Ҫ��ѯ�İ���&nbsp;</option>
         <%
         
         if (Con!= null)
         {
           try
           {
           Rs = Smts.executeQuery(sqlbz);
           Rs.last();
           i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
           <option  <%if (bz.equals(Rs.getString("code"))) out.print("selected");%> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {   }
    }
	     %>
         </select>&nbsp;&nbsp;&nbsp;&nbsp;
         </form>
         </td>
      </tr>
      <tr>
          <td width="50%" height="25" align="right">
          <form name="formbw1" ACTION="liangju.jsp"  METHOD="POST"> 
          <input type="hidden" name="cj" value="<%=chej%>">
          <input type="hidden" name="bz" value="<%=bz%>">
          <input type="hidden" name="page" value="3"><font color="#003366">���Ϸ���ѡ��:&nbsp;</font>
          <select name="bw1"   class="Sytle_select" onchange="changebw1()">
          <option value=""  >ѡ����ϲ�λ����&nbsp;</option>
         <% if (Con!= null)
         {
           try
           {
           Rs = Smts.executeQuery(sqlbw1);
           Rs.last();
           i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
           <option  <%if (bw1.equals(Rs.getString("bw1"))) out.print("selected"); %> value="<%=Rs.getString("bw1")%>"><%=Rs.getString("bw1")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
			}
        catch (SQLException e)
        {
            out.println("error!");
        }
        finally {   }
        }%>
        </select>
          </form>
          </td>
          <td width="5%" height="25" align="right"></td>
         
      </tr>
      
      </table>
      </td>
   </tr>
   <tr>
      <td colspan="2" width="100%"   align="left" bgcolor="#FFFFFF">
      <%if  (canmodify) { %> 
   &nbsp;&nbsp;&nbsp;&nbsp;<img   width="20" height="18" src="Images/add.gif" >��<font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#000000'" onClick="Javascript:window.open('inssongjian.jsp?cj=<%=lianjucj%>&bz=<%=liangjubz %>','','width=562,height=454')" target="newwindow" >��������ͼ��¼ </font>��&nbsp;&nbsp;  
   <% } %>
      </td>
      </tr>
   </table>
  <!-- �����￪ʼ��ʾ�����б� -->
     <table class="tableBorder_LR"   align="center" width="871" border="0" cellpadding="-2" cellspacing="1" bgcolor="#ffffff">

  <%
  String sqllingju="";
  if ((!chej.equals(""))&&(chej!=null)) 
  {
    if ((!bz.equals(""))&&(bz!=null)) 
    {
      if ((!bw1.equals(""))&&(bw1!=null)) 
     {
      sqllingju="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and  a.bw1='"+bw1+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";
     }
     else 
     {
      sqllingju="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";
     }
    } else
    {
     if (!bw1.equals("")&&(bw1!=null)) 
     {
      sqllingju="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bw1='"+bw1+"' and a.cj='"+chej+"' and a.bz=c.code  order by a.rq desc";
     }
     else 
     {
      sqllingju=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and a.bz=c.code  order by a.rq desc"; 
     }
    }
   }  
  else 
  {
    if (!bz.equals("")&&(bz!=null)) 
    {
     // ��λ��ѯ
     if (!bw1.equals("")&(bw1!=null)) 
     {
      sqllingju=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw1='"+bw1+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";
     }
     else 
     {
      sqllingju=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bz=c.code  order by a.rq desc";
     }
    } else
    {
     if (!bw1.equals("")&&(bw1!=null)) 
     {
      sqllingju=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw1='"+bw1+"'  and a.bz=c.code  order by a.rq desc";
     }
     else 
     {
       sqllingju=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where  a.bz=c.code  order by a.rq desc";
     }
    }
  }
 
   if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsgz = Smts.executeQuery(sqllingju);
            			
                        Rsgz.last();
                        i = 0;
            			CountR = Rsgz.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsgz.first();
            			%><%=sqllingju %>
            			   <tr align="center" height="25" bgcolor="#6699cc"> 
                             <td width="3%" align="center"><font color="#ffffff">���</font></td>
                             <td  width="8%" align="center"><font color="#ffffff">����</font></td>
                             <td width="10%" align="center"><font color="#ffffff">���߱��</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">��������</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">��������</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">�ͼ���</font></td>
                             <td width="10%" align="center" ><font color="#ffffff">�ͼ�����</font></td>
                             <td width="45%" align="center" ><font color="#ffffff">ȡ������</font></td>
                             <td width="3%" align="center"><font color="#ffffff">��Ч�ڵ�</font></td>
                             <td width="5%" align="center"><font color="#ffffff">����</font></td>
                            </tr>
            			<%
            			if (CountR>0)
            			{
            				Rsgz.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rsgz.isAfterLast())
            			   {     
  	                      %>
            			    <tr   height="25" bgcolor="#E1EDF9">
            			    <td width="3%" align="center"><%=(CurrPg-1)*PgSize+i+1 %></td>
                            <td width="8%"><div align="center" ><%=Rsgz.getString("rq")%></div></td> 
                            <% if ((Rsgz.getString("cx"))==null ) {%>
                            <td width="5%"><div align="center" >&nbsp;</div> 
                            <%} else { %>
                            <td width="10%" align="center"><%=Rsgz.getString("cx")%>&nbsp; <%} %>
                            <%=Rsgz.getString("ch")%></td>
                            <td width="6%" align="center">
                            <% if (Rsgz.getString("cj").equals("41")) out.print("֣�ݼ���");
                               if (Rsgz.getString("cj").equals("42")) out.print("��������");
                               if (Rsgz.getString("cj").equals("43")) out.print("��ɽ����");
                               if (Rsgz.getString("cj").equals("44")) out.print("֣������");
                            %>
                            </td>
                            <td width="6%" align="center"><%=Rsgz.getString("bz")%></td>
                            <td width="6%" align="center"><%=Rsgz.getString("fxr")%></td>
                            <td width="10%" align="center"><%=Rsgz.getString("bw1")%>:<%=Rsgz.getString("bw2")%></td>
                            <td width="45%" align="left"><%=Rsgz.getString("gzms")%></td> 
                            <td width="3%"  align="center"> 
                            <% if (!(Rsgz.getString("pic1").equals(""))&&(Rsgz.getString("pic2").equals(""))) {
                            %>
                            <img width="15" height="15" src="Images/eye.gif" border="0" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('showgz.jsp?id=<%=Rsgz.getString("id")%>','','')" title="���������ͼƬ">
  	                        </td>
  	                        <%} %>
                            <td width="5%"  align="center">
                            <%
                            if (canmodify&&(!isgz))
                            { //�ǹ����������޸��簲ȫԱ���������Ա��ϵͳ����Ա                            
                              //���ǳ������Ա�����Ǳ�����Ĺ���Ա���޳������
                              if (Rsgz.getString("cj").equals(lianjucj)) {out.print("�ǹ������޸�");}
                              else {out.print("��Ȩ�޸�");}
                            
                            }
                            else
                            {  //�ǳ��乤�����޸�
                               if (canmodify&&(isgz)) {
                               if (Rsgz.getString("bzcode").equals(liangjubz)) {out.print("");}}
                            }
                             %>
                            </td>
                            </tr>
                           <%
					            Rsgz.next();
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
            		}	
            }   
         %>
         </table>
 
   
  </body>
</html>
