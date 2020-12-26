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
    
    <title>车辆典型故障</title>
    
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
   <script language="javascript">
   function showphoto(cimg,obj)
   {
　　var mytop=obj.offsetTop; 
　　var myleft=obj.offsetLeft;
　　  while(obj=obj.offsetParent)
     {
    　　myleft+=obj.offsetLeft; 
    　　mytop+=obj.offsetTop; 
　　  }
    photodiv.style.top=mytop-30;
    photodiv.style.left=myleft+60;
    photodiv.innerHTML=" <table border=0 cellspacing=1 cellpadding=0 bgcolor=#808080><tr><td bgcolor=#ffffff><img src='"+  cimg +"' width=75 height=75 border=0></td></tr></table>";
    photodiv.style.display='block';
   }
   function closephoto()
   {
   photodiv.style.display='none';
   } 
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
    //获取当前日期的月份
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  int nowyear = today.getYear()+1900;
  int nowmonth = today.getMonth()+1; 
  
  request.setCharacterEncoding("GB2312");
  
  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
  Statement Smts; 
  ResultSet Rs,Rsgz;
  Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
  
  String datef="";
  if (request.getParameter("v1")!=null) datef = new String(request.getParameter("v1"));
  String dateto ="";
  if (request.getParameter("v2")!= null) dateto =new String(request.getParameter("v2"));
  String chej="";
  if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
  String sqlbz=" select bz,code from banzu where cj='"+chej+"' order by bz"; 
  String bz="";
  if (request.getParameter("bz")!=null) bz=new String(request.getParameter("bz"));
  String bw1="";
  if (request.getParameter("bw1")!=null) bw1=new String(request.getParameter("bw1").getBytes("ISO-8859-1"));
  String sqlbw1=" select distinct bw1 from dxgzfl ";
  String bw2="";
  if (request.getParameter("bw2")!=null) bw2=new String(request.getParameter("bw2").getBytes("ISO-8859-1"));
  String sqlbw2="";
  if (!bw1.equals("")||(bw1!=null)) sqlbw2=" select bw2 from dxgzfl where bw1='"+bw1+"'";
  
  boolean canmodify=false;
  boolean isgz=false;
  String userid="";
  String gzcj="";//看是哪个车间工长
  String gzbz="";//看是哪个班组工长，工长的班组编号
  String zgtab="";
  int i=0;
  if  (((String)session.getAttribute("deptment")).equals("41") 
      || ((String)session.getAttribute("deptment")).equals("42")
      || ((String)session.getAttribute("deptment")).equals("43")
      || ((String)session.getAttribute("deptment")).equals("44")
      || ((String)session.getAttribute("deptment")).equals("admin"))
  {   
           if  (((String)session.getAttribute("deptment")).equals("41"))  { zgtab="zhigongzz"; gzcj="41"; }
           if  (((String)session.getAttribute("deptment")).equals("43"))  { zgtab="zhigongly"; gzcj="43"; }
           if  (((String)session.getAttribute("deptment")).equals("42"))  { zgtab="zhigongys"; gzcj="42"; } 
           if  (((String)session.getAttribute("deptment")).equals("44"))  { zgtab="zhigongzl"; gzcj="44"; }
           userid=(String)session.getAttribute("userid");
           //工长,技术专职,安全员,车间管理员,车间领导可以输入相关信息
           if (((String)session.getAttribute("zw")).equals("8")
           ||((String)session.getAttribute("zw")).equals("1")
           ||((String)session.getAttribute("zw")).equals("6")
           ||((String)session.getAttribute("zw")).equals("4")
           ||((String)session.getAttribute("zw")).equals("3")
           ||((String)session.getAttribute("zw")).equals("cjadmin")
           ||((String)session.getAttribute("deptment")).equals("admin")) 
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
               {  gzbz=Rs.getString("bz");
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
      <div><font color="#bbbbbb">条件查询</font></div>
      </td>
      <td width="80%"  align="left">
      <table  border="0" width="100%" cellpadding="-2" cellspacing="-2">
      <tr>
          <td width="50%" height="25" align="right">
          <form name="formcj" ACTION="gzgl/gzgl.jsp"  METHOD="POST"> 
          <input type="hidden" name="bw1" value="<%=bw1%>">
          <input type="hidden" name="bw2" value="<%=bw2%>">
          <input type="hidden" name="page" value="3"><font color="#003366">故障发现部门选择:&nbsp;</font>
          <select name="cj"   class="Sytle_select" onchange="changecj()">
          <option value=""  >选择要查询的车间&nbsp;</option>
          <option  value="41" <%if (chej.equals("41")) out.print("selected"); %>>郑州检修车间</option>
          <option  value="42" <%if (chej.equals("42")) out.print("selected"); %>>月山检修车间</option>
          <option  value="43" <%if (chej.equals("43")) out.print("selected"); %>>洛阳检修车间</option>
          <option  value="44" <%if (chej.equals("44")) out.print("selected"); %>>郑州轮轴车间</option>
          </select>
          </form>
          </td>
          <td width="5%" height="25" align="right"></td>
         <td width="45%" align="left">
         <form ACTION="gzgl/gzgl.jsp" name=formbz METHOD="POST"> 
         <input type="hidden" name="page" value="3">
         <input type="hidden" name="bw1" value="<%=bw1%>">
         <input type="hidden" name="bw2" value="<%=bw2%>">
         <input type="hidden" name="cj" value="<%=chej%>">
         <select name="bz"   class="Sytle_select" onchange="changebz()">
         <option value="" >选择要查询的班组&nbsp;</option>
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
          <form name="formbw1" ACTION="gzgl/gzgl.jsp"  METHOD="POST"> 
          <input type="hidden" name="cj" value="<%=chej%>">
          <input type="hidden" name="bz" value="<%=bz%>">
          <input type="hidden" name="page" value="3"><font color="#003366">故障分类选择:&nbsp;</font>
          <select name="bw1"   class="Sytle_select" onchange="changebw1()">
          <option value=""  >选择故障部位分类&nbsp;</option>
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
         <td width="45%" align="left">
         <form ACTION="gzgl/gzgl.jsp" name=formbw2 METHOD="POST"> 
         <input type="hidden" name="page" value="3">
         <input type="hidden" name="cj" value="<%=chej%>">
          <input type="hidden" name="bz" value="<%=bz%>">
          <input type="hidden" name="bw1" value="<%=bw1%>">
          <select name="bw2"   class="Sytle_select" onchange="changebw2()">
         <option value="" >选择详细部位&nbsp;</option>
         <%
         if (Con!= null)
         {
           try
           {
           Rs = Smts.executeQuery(sqlbw2);
           Rs.last();
           i = 0;
           CountR = Rs.getRow();
           Rs.first();
           if (CountR>0)
           {
               while (!Rs.isAfterLast())
               {      
               %>
           <option  <%if (bw2.equals(Rs.getString("bw2"))) out.print("selected"); %> value="<%=Rs.getString("bw2")%>"><%=Rs.getString("bw2")%>&nbsp;</option>
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
          <td align="center" colspan="3">
          <form name="form2" method="post" action="gzgl/gzgl.jsp"><font color="003366">查询时间段:从</font> 
          <input name="v1" type="text" onDBLClick="loadCalendar(this)" value=<%=datef%>><font color="#003366">&nbsp;到</font>
          <input name="v2" type="text" onDBLClick="loadCalendar(this)" value=<%=dateto%>>
          <input name="cj" type=hidden value=<%=chej %>>
          <input name="bz" type=hidden value=<%=bz%>>
          <input name="bw1" type=hidden value=<%=bw1 %>>
          <input name="bw2" type=hidden value=<%=bw2%>>
          <input name="page" type=hidden value="3">
          <input type="submit" name="Submit"  class=Style_button value="  查  询  " >
          </form>
          </td>
      </tr>
      </table>
      </td>
   </tr>
   <tr>
      <td colspan="2" width="100%"   align="left" bgcolor="#FFFFFF">
      <%if  (canmodify) { %> 
   &nbsp;&nbsp;&nbsp;&nbsp;<img   width="20" height="18" src="Images/add.gif" >【<font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#000000'" onClick="Javascript:window.open('insdxgz.jsp?cj=<%=gzcj%>&bz=<%=gzbz %>','','width=562,height=454')" target="newwindow" >添加职工发现典型故障记录 </font>】&nbsp;&nbsp;  
   <% } %>
      </td>
      </tr>
   </table>
  <!-- 从这里开始显示故障列表 -->
     <table class="tableBorder_LR"   align="center" width="871" border="0" cellpadding="-2" cellspacing="1" bgcolor="#ffffff">

  <%
  String sqlgz="";
  if ((!chej.equals(""))&&(chej!=null)) 
  {
    if ((!bz.equals(""))&&(bz!=null)) 
    {
      if ((!bw1.equals(""))&&(bw1!=null)) 
     {
      if ((!bw2.equals(""))&&(bw2!=null))  { sqlgz="select a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2 from dxgz as a,banzu as c where a.cj='"+chej+"'and  a.bw2='"+bw2+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";}
      else { sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and  a.bw1='"+bw1+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";}
     }
     else 
     {
      if (!bw2.equals("")&&(bw2!=null))  { sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz ,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and a.bw2='"+bw2+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";}
      else { sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";}
     }
    } else
    {
     if (!bw1.equals("")&&(bw1!=null)) 
     {
      if (!bw2.equals("")&&(bw2!=null)) {  sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bw2='"+bw2+"' and a.cj='"+chej+"' and a.bz=c.code  order by a.rq desc";}
      else { sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bw1='"+bw1+"' and a.cj='"+chej+"' and a.bz=c.code  order by a.rq desc";}
     }
     else 
     {
      if (!bw2.equals("")&&(bw2!=null))  { sqlgz="select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bw2='"+bw2+"' and cj='"+chej+"' and a.bz=c.code  order by a.rq desc";}
      else { sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.cj='"+chej+"' and a.bz=c.code  order by a.rq desc"; }
     }
    }
   }  
  else 
  {
    if (!bz.equals("")&&(bz!=null)) 
    {
     // 部位查询
     if (!bw1.equals("")&(bw1!=null)) 
     {
      if (!bw2.equals("")&&(bw2!=null))   sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw2='"+bw2+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";
      else sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw1='"+bw1+"' and a.bz=c.code and a.bz='"+bz+"' order by a.rq desc";
     }
     else 
     {
      if (!bw2.equals("")&&(bw2!=null))   sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz ,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw2='"+bw2+"' and a.bz=c.code  order by a.rq desc";
      else sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where a.bz=c.code  order by a.rq desc";
     }
    } else
    {
     if (!bw1.equals("")&&(bw1!=null)) 
     {
      if (!bw2.equals("")&&(bw2!=null))   sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw2='"+bw2+"' and cj='"+chej+"' and a.bz=c.code  order by a.rq desc";
      else sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw1='"+bw1+"'  and a.bz=c.code  order by a.rq desc";
     }
     else 
     {
      if (!bw2.equals("")&&(bw2!=null))   sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where bw2='"+bw2+"' and cj='"+chej+"' and a.bz=c.code  order by a.rq desc";
      else sqlgz=" select  a.id,a.rq,a.cx,a.ch,a.cj,a.bz as bzcode,c.bz as bz,a.fxr,a.gzms,a.bw1,a.bw2,a.pic1,a.pic2,a.tpjs1,a.tpjs2  from dxgz as a,banzu as c where  a.bz=c.code  order by a.rq desc";
     }
    }
  }
 
   if (Con!= null)
            	{
            		try
            		{
            		    Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsgz = Smts.executeQuery(sqlgz);
            			
                        Rsgz.last();
                        i = 0;
            			CountR = Rsgz.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsgz.first();
            			%>
            			   <tr align="center" height="25" bgcolor="#6699cc"> 
                             <td width="3%" align="center"><font color="#ffffff">序号</font></td>
                             <td  width="8%" align="center"><font color="#ffffff">日期</font></td>
                             <td width="10%" align="center"><font color="#ffffff">车型车号/配件编号</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">车间</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">班组</font></td>
                             <td width="6%" align="center" ><font color="#ffffff">发现人</font></td>
                             <td width="10%" align="center" ><font color="#ffffff">故障部位</font></td>
                             <td width="45%" align="center" ><font color="#ffffff">故障描述</font></td>
                             <td width="3%" align="center"><font color="#ffffff">故障图片</font></td>
                             <td width="5%" align="center"><font color="#ffffff">操作</font></td>
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
                            <% if (Rsgz.getString("cj").equals("41")) out.print("郑州检修");
                               if (Rsgz.getString("cj").equals("42")) out.print("洛阳检修");
                               if (Rsgz.getString("cj").equals("43")) out.print("月山检修");
                               if (Rsgz.getString("cj").equals("44")) out.print("郑州轮轴");
                            %>
                            </td>
                            <td width="6%" align="center"><%=Rsgz.getString("bz")%></td>
                            <td width="6%" align="center"><%=Rsgz.getString("fxr")%></td>
                            <td width="10%" align="center"><%=Rsgz.getString("bw1")%>:<%=Rsgz.getString("bw2")%></td>
                            <td width="45%" align="left"><%=Rsgz.getString("gzms")%></td> 
                            <td width="3%"  align="center"> 
                            <% if (!(Rsgz.getString("pic1").equals(""))&&(Rsgz.getString("pic2").equals(""))) {
                            %>
                            <img width="15" height="15" src="Images/eye.gif" border="0" onMouseOver="this.style.cursor='hand'" onClick="Javascript:window.open('showgz.jsp?id=<%=Rsgz.getString("id")%>','','')" title="点击看故障图片">
  	                        </td>
  	                        <%} %>
                            <td width="5%"  align="center">
                            <%
                            if (canmodify&&(!isgz))
                            { //非工长，但可修改如安全员、车间管理员、系统管理员                            
                              //如是车间管理员但须是本车间的管理员检修车间情况
                              if (Rsgz.getString("cj").equals(gzcj)) {out.print("非工长可修改");}
                              else {out.print("无权修改");}
                            
                            }
                            else
                            {  //是车间工长可修改
                               if (canmodify&&(isgz)) {
                               if (Rsgz.getString("bzcode").equals(gzbz)) {out.print("");}}
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
