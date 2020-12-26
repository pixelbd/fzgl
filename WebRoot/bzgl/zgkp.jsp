<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPgrc = 0;
	int CurrPgrc = 0;
    int CountRrc = 0;
    int CountPgzl = 0;
	int CurrPgzl = 0;
    int CountRzl = 0;
    int PgSizezg = 30;
    String StrPgzl="1";
    String StrPgrc="1";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职工考评(班组管理)</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body >
   <script language="javascript">
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   function changebz()
   { formbz.submit();}
   function changebkhr()
   { formzg.submit();}
   </script>
  <%
      Class.forName("org.gjt.mm.mysql.Driver").newInstance();
      Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
      Statement Smts; 
      ResultSet Rs;
      Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);     
  
      request.setCharacterEncoding("gb2312"); 
      
      String bzcode="";
      if (request.getParameter("bzcode")!=null)  bzcode=new String(request.getParameter("bzcode"));
      String bkhr="";
      if (request.getParameter("bkhr")!=null)  bkhr=new String(request.getParameter("bkhr"));
      String dtfrom="";
      if (request.getParameter("dtfrom")!=null)  dtfrom=new String(request.getParameter("dtfrom"));
      String dtto="";
      if (request.getParameter("dtto")!=null)  dtto=new String(request.getParameter("dtto"));
      if (request.getParameter("pgcodezl")!=null) StrPgzl = request.getParameter("pgcodezl");
      if (request.getParameter("pgcoderc")!=null) StrPgrc = request.getParameter("pgcoderc");       
      boolean islog=false;
      boolean modify=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      String zgkpb="";
      String zjfgb="";
      String ysfgb="";
      String zgtab="";
      String str="";
      String chej="";
      String chejcode="";
      String userid="";
      int i=0;
      int CountR = 0;
      if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
      
      if (chej.equals("zz")) { str="郑州检修"; chejcode="41"; }
      if (chej.equals("ys")) { str="月山检修"; chejcode="42"; }
      if (chej.equals("ly")) { str="洛阳检修"; chejcode="43"; }
      if (chej.equals("zl")) { str="郑州轮轴"; chejcode="44"; }
   
      
      //查询职工考评情况,应查询3个表:职工考评表,质检工序返工表,验收返工表
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
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>班组职工考评&nbsp;</font></td></tr>
          <tr><td  height="10"></td></tr>
          </table>
          </div>
          </td>
      </tr>
      <tr><td  width="100%" align="left">
      <div>
      <%
      //如果登录人是41 42 43 44 这四个车间的职工
      boolean jxcj=false;
      if (((String) session.getAttribute("deptment")).equals("41")) { jxcj=true; chej = "zz"; chejcode="41"; str="郑州检修";  } 
      if (((String) session.getAttribute("deptment")).equals("43")) { jxcj=true; chej = "ly"; chejcode="43"; str="洛阳检修"; } 
      if (((String) session.getAttribute("deptment")).equals("42")) { jxcj=true; chej = "ys"; chejcode="42"; str="月山检修"; }
      if (((String) session.getAttribute("deptment")).equals("44")) {  chej = "zl"; chejcode="44"; str="郑州轮轴"; }
  
     if (!jxcj) {%>
      <table width="80%">
      <tr>
      <td width="25%" ><img id="imgdt1" width="18" height="18" <% if (chej.equals("zz")) {%> src="Images/dot4.gif"<% } else { %> src="Images/dot3.gif" <%}%> >
         <a href="bzgl/bzgl.jsp?page=2&cj=zz">郑州检修车间</a>
      </td>
      <td width="25%" >
      <img id="imgdt2" width="18" height="18" <% if (chej.equals("ly")) { %> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="bzgl/bzgl.jsp?page=2&cj=ly">洛阳检修车间</a></td>
      <td width="25%" ><img id="imgdt3" width="18" height="18" <% if (chej.equals("ys")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="bzgl/bzgl.jsp?page=2&cj=ys">月山检修车间</a></td>
      <td width="25%" ><img id="imgdt4" width="18" height="18" <% if (chej.equals("zl")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="bzgl/bzgl.jsp?page=2&cj=zl">郑州轮轴车间</a></td>
      </tr>
      </table>  
      <% } else { 
       if (((String)session.getAttribute("zw")).equals("8")
             ||((String)session.getAttribute("zw")).equals("9")
             ||((String)session.getAttribute("zw")).equals("10")
             ||((String)session.getAttribute("zw")).equals(""))
          {  userid=(String)session.getAttribute("userid");  
             if (((String)session.getAttribute("zw")).equals("8"))  modify=true;
          } 
       }%>
     </div>
      </td></tr>
     </table>
     
     <%   if (!chej.equals("")) { zgtab="zhigong"+chej; zgkpb="kpjl"+chej; zjfgb="zjgz"+chej; ysfgb="ysgz"+chej;  }%>
    <!--  
     测试1：bzcode:"<%=bzcode %>";zgtab:"<%=zgtab %>";zgkpb:"<%=zgkpb %>";zjfgb:"<%=zjfgb %>";chej:"<%=chej %>";zw:"<%=(String)session.getAttribute("zw")%>"
    --> 
    <table width="100%" bgcolor="#FFFFFF" height="50"  border="0" align="center" cellpadding="-2" cellspacing="-2">
    <tr >
    <td width="100%"   height="28"  align="left" bgcolor="#FFEF99">
    <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>车间职工考评情况&nbsp;</font>
    </td>
    </tr>
    <%if (((!((String)session.getAttribute("zw")).equals("9"))
             &&(!((String)session.getAttribute("zw")).equals("10"))
            &&(!((String)session.getAttribute("zw")).equals(""))
            )|| ((String)session.getAttribute("deptment")).equals("admin") )
         { 
    %>      <tr>
            <td align="left" height="26" bgcolor="#6699CC" ><img   width="20" height="18" src="Images/add.gif" >
<%if (((String)session.getAttribute("zw")).equals("8")) { %>  <font  onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#000000'" onClick="Javascript:window.open('inszgkp.jsp?cj=<%=chej%>','','width=562,height=403')" >添加职工考评记录</font>&nbsp;
            <font color="#ffffff">【工长可进行此项操作】</font><%} %>            
 <%  }  %></td></tr>
    
    
    <tr>
    <td width="100%" >
    <div>
    <table  width="100%" border="0" align="center" cellpadding="-2" cellspacing="-2">
    <tr>
    <%if (Con!= null)
       {if (((!((String)session.getAttribute("zw")).equals("8"))
             &&(!((String)session.getAttribute("zw")).equals("9"))
             &&(!((String)session.getAttribute("zw")).equals("10"))
            &&(!((String)session.getAttribute("zw")).equals("")))
            ||(!jxcj)
            )
         { 
    %>  
    <td align="right" width="50%" >
    <form ACTION="bzgl/bzgl.jsp" name=formbz METHOD="POST"> 
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="cj" value="<%=chej%>"><font color="#000066">班组选择&nbsp;</font>
    <select name="bzcode"   class="Sytle_select" onchange="changebz()">
    <option value=""  color="#666666">选择要查询的班组&nbsp; </option>
    <%    
      String sqlbz=" select bz,code from banzu where cj='"+chejcode+"' order by bz"; 
       
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
      <option  <%if (bzcode.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}}
			catch (SQLException e)
        {
            out.println("error!");
        }
        finally {   }
        }
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    </td><%} %>
    <td width="50%" align="center">
    <form ACTION="bzgl/bzgl.jsp" name=formzg METHOD="POST">
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="cj" value="<%=chej%>">
    <font color="#000066">职工选择&nbsp;</font>
    <select name="bkhr" class="Sytle_select" onchange="changebkhr()">
    <option value=""><font color="#ff0000">全部职工考评&nbsp;</font></option>
    <%      
    String sqlzg="";
    if (!bzcode.equals("")) { sqlzg="select name,id from "+zgtab+" where bz='"+bzcode+"'  and zw='' order by name";}
    else { sqlzg="select a.name,a.id from "+zgtab+" as a,(select * from "+ zgtab+" where id='"+userid+"') as b where a.bz=b.bz order by a.name"; }
      
            try
           {
            Rs = Smts.executeQuery(sqlzg);
            Rs.last();
            i = 0;
            CountR = Rs.getRow();
            Rs.first();
            if (CountR>0)
            {
            	while (!Rs.isAfterLast())
            	{      
     %><option <%if (bkhr.equals(Rs.getString("id"))) out.print("selected"); %> value="<%=Rs.getString("id") %>" ><%=Rs.getString("name")%></option>
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
    %>  
   </select>&nbsp;&nbsp;&nbsp;&nbsp;
   </form></td>
   </tr>
   <tr>
   <!-- 
    <td width="30%" align="center">
    <form ACTION="cjgl/cjgl.jsp" name=formyue METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="subpg" value="5">
    <input type="hidden" name="cj" value="<%=chej%>">
    <input type="hidden" name="bkhr" value="<%=bkhr%>">
    月份选择<input type="text" name="yue" value="">
   </form></td>
  --> 
   <td width="100%" colspan="2" align="center">
    <form ACTION="bzgl/bzgl.jsp" name=formsj METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="subpg" value="5">
    <input type="hidden" name="cj" value="<%=chej%>">
    <input type="hidden" name="bkhr" value="<%=bkhr%>">
    <font color="#000066">时间段选择:&nbsp;从&nbsp;&nbsp;&nbsp;</font><input type="text"  name="dtfrom" onDBLClick="loadCalendar(this)" >
    &nbsp;&nbsp;&nbsp;<font color="#000066">到</font>&nbsp;&nbsp;&nbsp;<input type="text"  name="dtto" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="Submit" value="查询" class="Style_btn">
   </form>
   </td>
   </tr>
   </table>
   </div>
   </td>
  </tr>
  </table>
  <%  String sql="";
  String zjsql="";
  if (bkhr.equals(""))
  {  if (bzcode.equals("")) 
      { if ( dtfrom!=null  &&  dtto!=null && !dtto.equals("") && !dtfrom.equals("")) 
         { zjsql="select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where a.zrbz in (select bz from zhigong"+chej+"  where id='"+userid+"') and rq>='"+dtfrom+"'" +" && rq<='"+dtto+"'"+" and b.zw='' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz  order by rq";
           sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz in (select bz from zhigong"+chej+" where id='"+userid+"') and  a.bz=c.bz and a.khr=c.id and a.bkhr=d.id and e.code=a.bz and a.kpbz=b.code and rq<='"+dtto+"' and rq>='"+dtfrom+"'  order by rq desc "; //班组职工姓名为空时,只选择时间段内所有的考核情况
         }else { 
         zjsql="select  a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where a.zrbz in (select bz from zhigong"+chej+"  where id='"+userid+"') and b.zw='' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz in (select bz from zhigong"+chej+"  where id='"+userid+"') and  a.bz=c.bz and a.khr=c.id and a.bkhr=d.id and e.code=a.bz and a.kpbz=b.code order by rq desc"; 
         }
      } else
        { if (dtfrom!=null  &&  dtto!=null && !dtto.equals("") && !dtfrom.equals(""))  
         {
         zjsql="select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,(select * from  "+zgtab+" where id='"+userid+"') as c,cpzlbz as d,banzu as e where c.zw='' and and rq>='"+dtfrom+"'" +" && rq<='"+dtto+"'"+" and a.zrbz='"+bzcode+"' a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq";
         sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where c.zw=''and a.bz='"+bzcode+"' and a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code and c.zw='' and rq<='"+dtto+"' and rq>='"+dtfrom;}
         else {
         zjsql="select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,(select * from  "+zgtab+" where id='"+userid+"')  as c,cpzlbz as d,banzu as e where b.zw=''  and  a.zrbz='"+bzcode+"' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq";
         sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  where bz in (select bz from zhigong"+chej+"  where id='"+userid+"') as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where d.zw='' and a.bz='"+bzcode+"'and  a.khr=c.id and a.bkhr=d.id and e.code=a.bz and a.kpbz=b.code"; } 
        } 
  }
  else { if (dtfrom!=null  &&  dtto!=null && !dtto.equals("") && !dtfrom.equals(""))  
         { zjsql="select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where a.zrbz in (select bz from zhigong"+chej+"  where id='"+userid+"') and rq>='"+dtfrom+"'" +" && rq<='"+dtto+"'"+" and b.zw='' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz  order by rq";
           sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz in (select bz from zhigong"+chej+"  where id='"+userid+"') and  a.bz=c.bz and a.khr=c.id and a.bkhr=d.id and e.code=a.bz and a.kpbz=b.code and rq<='"+dtto+"' and rq>='"+dtfrom+"'  order by rq desc "; //班组职工姓名为空时,只选择时间段内所有的考核情况
         }else { 
         zjsql="select a.id,a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,a.money,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where a.zrbz in (select bz from zhigong"+chej+"  where id='"+userid+"') and a.zrr='"+bkhr+"' and b.zw='' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.id,a.rq,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms,a.money,a.khr from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz in (select bz from zhigong"+chej+"  where id='"+userid+"') and a.bkhr='"+bkhr+"'and  a.bz=c.bz and a.khr=c.id and a.bkhr=d.id and e.code=a.bz and a.kpbz=b.code order by rq desc"; 
         }
       }
     
          
                      	if ((StrPgrc == null)||(StrPgrc.equals("")))
            	{
            		CurrPgrc = 1;
            	}
            	else
            	{
            		CurrPgrc = Integer.parseInt(StrPgrc);
            	}
                Statement Smtszg; 
                ResultSet Rszg;
                 Smtszg = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			
                if (Con!= null)
            	{
            		try
            		{
            		   Rszg = Smtszg.executeQuery(sql);
            			
                        Rszg.last();
                        int j = 0;
            			CountRrc = Rszg.getRow();
            			CountPgrc = (CountRrc/PgSizezg);
            			if (CountRrc%PgSizezg>0)
            				CountPgrc++;
            			Rszg.first();
            			if (CountRrc>0)
            			{
            			%><table id="zgtab" width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#ffffff">
            			  <tr><td colspan="12">
            			  <table width="100%" bgcolor="#FDFCD9"><tr>
            			  <td width="120" height="26" background="Images/menubg4.gif"><font color="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;常&nbsp;&nbsp;管&nbsp;&nbsp;理</font></td>
            			  <td></td></tr></table>
            			  </td></tr>
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">序号</td>
            			    <td width="7%" align="center" class="word_white">被考评人</td>
            			    <td width="8%" align="center" class="word_white">日期</td>
                            <td width="7%" align="center" class="word_white">考评人</td>
                            <td width="6%" align="center" class="word_white">班组</td>
                            <td width="20%" align="center" class="word_white">考评项目</td>
                            <td width="5%" align="center" class="word_white">扣分</td>
                            <td width="5%" align="center" class="word_white">是否违反高压线</td>
                            <td width="5%" align="center" class="word_white">加分</td>
                            <td width="28%" align="center" class="word_white">详细描述</td>
                            <td width="5%" align="center" class="word_white">考核金额</td>
                            <%if (modify) { %>  <td colspan="2" align="center" class="word_white">操作</td>   <% } %>
                            </tr>
                            <%
            				Rszg.absolute(CurrPgrc*PgSizezg-PgSizezg+1);
	            			while (j<PgSizezg && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9"  >
            			    <td  align="center"><%=(CurrPgrc-1)*PgSizezg+j+1%></td>
                            <td align="center"><%=Rszg.getString("bkh")%></td>
                            <td  align="center" ><%=Rszg.getString("rq").replace("-", ".")%></td>
                            <td  align="center" ><%=Rszg.getString("kh")%></td>
                            <td  align="center" ><%=Rszg.getString("banz")%></td>
                            <td align="center"><%=Rszg.getString("bz")%></td>
                            <td  align="center" ><%=Rszg.getString("kf1")%></td>
                            <td  align="center" ><%if (Rszg.getString("gyx").equals("1")) {%><font color="#ff0033">是</font><%} else out.print("否") ;%></td>
                            <td align="center"><%=Rszg.getString("jf1")%></td>
                            <td  align="center" ><%=Rszg.getString("ms")%></td>
                            <td  align="center" ><% if (Rszg.getString("money").equals("0.00")) { %> 批评 <% }else { %> <%=Rszg.getString("money") %> <%} %></td>
                            
                             <td  align="center"><%if ((modify) && (userid.equals(Rszg.getString("khr")))) { %><a href="">
                <img src="Images/edit.gif" width="12" height="12" border="0" ></a><%} %></td>
                <td><div align="center">
                <%if ((modify) && (userid.equals(Rszg.getString("khr")))) { %>
                <a href="bzgl/bzgl.jsp?page=2" onClick="Javascript:window.open('delzgkp.jsp?ID1=<%=Rszg.getString("id")%>&ID2=<%=chej%>','','width=519,height=155')">
                <img src="Images/del.gif" width="16" height="16" border="0" ></a><% } %></div></td> 
                            </tr>
                            <%
					            Rszg.next();
					            j++;
					        } %>
					  </table>   
					  
		  <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
          <tr  height="20">
          <td nowrap class="word_blue" align="left">
          <form name="formzg1" method="post" action="bzgl/bzgl.jsp">[<%=CurrPgrc%>/<%=CountPgrc %>] 每页30条 共<%=CountRrc%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcoderc" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="bzcode" type="hidden" value="<%=bzcode%>">
            <input name="bkhr" type="hidden" value="<%=bkhr%>">
            <input name="dtfrom" type="hidden" value="<%=dtfrom%>">
            <input name="dtto" type="hidden" value="<%=dtto%>">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcoderc=1&pgcodezl=<%=StrPgzl%>">首页</a>
           <%if (CurrPgrc>1){%>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcoderc=<%=CurrPgrc-1%>&pgcodezl=<%=StrPgzl%>">上一页</a> 
            <% }  %>
            <%if (CurrPgrc<CountPgrc){%>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcoderc=<%=CurrPgrc+1%>&pgcodezl=<%=StrPgzl%>">下一页</a> 
            <% } %>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcoderc=<%=CountPgrc%>&pgcodezl=<%=StrPgzl%>">最后一页</a>
          </td>
          </tr>
        </table>
  <%    }
     
                
            	if ((StrPgzl == null)||(StrPgzl.equals("")))
            	{
            		CurrPgzl = 1;
            	}
            	else
            	{
            		CurrPgzl = Integer.parseInt(StrPgzl);
            	}
                 
            		   Rszg = Smtszg.executeQuery(zjsql);
            			
                        Rszg.last();
                        j = 0;
            			CountRzl = Rszg.getRow();
            			CountPgzl = (CountRzl/PgSizezg);
            			if (CountRzl%PgSizezg>0)
            				CountPgzl++;
            			Rszg.first();
            			if (CountRzl>0)
            			{
            			%><table id="zgtab" width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#ffffff">
            			  <tr><td colspan="10">
            			  <table width="100%" bgcolor="#FDFCD9"><tr>
            			  <td width="120" height="26" background="Images/menubg4.gif"><font color="#">&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;序&nbsp;质&nbsp;量&nbsp;返&nbsp;工</font></td>
            			  <td></td></tr></table>
            			  </td></tr>
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">序号</td>
            			    <td width="6%" align="center" class="word_white">被考评人</td>
            			    <td width="8%" align="center" class="word_white">日期</td>
                            <td width="6%" align="center" class="word_white">质检员</td>
                            <td width="7%" align="center" class="word_white">故障产品编号</td>
                            <td width="6%" align="center" class="word_white">班组</td>
                            <td width="4%" align="center" class="word_white">故障类别</td>
                            <td width="5%" align="center" class="word_white">扣分</td>
                            <td width="5%" align="center" class="word_white">是否违反高压线</td>
                            <td width="31%" align="center" class="word_white">详细描述</td>
                            <td width="5%" align="center" class="word_white">考核金额</td>
                            
                            </tr>
                            <%
            				Rszg.absolute(CurrPgzl*PgSizezg-PgSizezg+1);
	            			while (j<PgSizezg && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr height="25" bgcolor="#E1EDF9">
            			    <td width="3%" align="center"><%=(CurrPgzl-1)*PgSizezg+j+1 %></td>
            			    <td width="6%" align="center"><%=Rszg.getString("zrr")%></td>
                            <td width="8%"><div align="center" ><%=Rszg.getString("rq").replace("-", ".")%></div></td>
                            <td width="6%" align="center"><%=Rszg.getString("zjy")%></td> 
                            <% if ((Rszg.getString("cx"))==null ) {%>
                            <td width="5%"><div align="center" >&nbsp;</div> 
                            <%} else { %>
                            <td width="10%" align="center"><%=Rszg.getString("cx")%>&nbsp; <%} %>
                            <%=Rszg.getString("ch")%></td> 
                            <td align="center"><%=Rszg.getString("zrbz")%></td>
                            <td align="center"><%if (Rszg.getString("xz").equals("B")) {%><font color="#000066"><%=Rszg.getString("xz")%></font><%} else { if (Rszg.getString("xz").equals("A")) { %><font color="#ff0033"><%=Rszg.getString("xz")%></font><%} 
                                     else {%><%=Rszg.getString("xz")%><% } }%></td> 
                            <td align="center"><%if (Rszg.getString("xz").equals("B")) {%><font color="#000066">10</font><%} else { if (Rszg.getString("xz").equals("A")) { %><font color="#ff0033">20</font><%} 
                                     else {%>5<% } }%></td>
                            <td align="center"><%if (Rszg.getString("gyx").equals("1")) {%><font color="#ff0033">是</font><%} else out.print("否") ;%></td>
                            <td  align="left">
                            <% if (Rszg.getString("gzms").equals("")) {%><%=Rszg.getString("bz")%><%  } else { %><%=Rszg.getString("gzms") %><%} %>
                            </td>
                            <td  align="center" > <%=Rszg.getString("money") %></td>
                            
                           <%
					            Rszg.next();
					            j++;
					        } %>
					  </table>   
					  
		  <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr bgcolor="#Ffffff" height="20">
          <td nowrap class="word_blue" align="left">
          <form name="formzg1" method="post" action="bzgl/bzgl.jsp">[<%=CurrPgzl%>/<%=CountPgzl %>] 每页30条 共<%=CountRzl%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcodezl" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="5">
            
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcodezl=1&pgcoderc=<%=StrPgrc%>">首页</a>
           <%if (CurrPgzl>1){%>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcodezl=<%=CurrPgzl-1%>&pgcoderc=<%=StrPgrc%>">上一页</a> 
            <% }  %>
            <%if (CurrPgzl<CountPgzl){%>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcodezl=<%=CurrPgzl+1%>&pgcoderc=<%=StrPgrc%>">下一页</a> 
            <% } %>
            <a href="bzgl/bzgl.jsp?page=2&bzcode=<%=bzcode%>&bkhr=<%=bkhr%>&dtfrom=<%=dtfrom%>&cj=<%=chej%>&pgcodezl=<%=CountPgzl%>&pgcoderc=<%=StrPgrc%>">最后一页</a>
          </td>
          </tr>
        </table>
   
        <%}  }  
                   catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            			Con.close();
            		} 
           } } //end of islog  
   %>     
  </body>
</html>
