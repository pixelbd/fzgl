<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
    int CountPgzg = 0;
	int CurrPgzg = 0;
	int CountRzg = 0;
	int CountPgzj = 0;
	int CurrPgzj = 0;
	int CountRzj = 0;
	int PgSize = 30;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职工考评</title>
    
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
   function changezg()
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
         String StrPgzg = request.getParameter("pgcodezg");
         String StrPgzj = request.getParameter("pgcodezj");
             
      boolean islog=false;
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
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>车间职工考评&nbsp;</font></td></tr>
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
      <table width="80%"><tr>
      <td width="25%" ><img id="imgdt1" width="18" height="18" <% if (chej.equals("zz")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=zz">郑州检修车间</a>
      </td>
      <td width="25%" ><img id="imgdt2" width="18" height="18" <% if (chej.equals("ly")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=ly">洛阳检修车间</a></td>
      <td width="25%" ><img id="imgdt3" width="18" height="18" <% if (chej.equals("ys")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=ys">月山检修车间</a></td>
      <td width="25%" ><img id="imgdt4" width="18" height="18" <% if (chej.equals("zl")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=zl">郑州轮轴车间</a></td>
      </tr>
      </table>  
     <% } %> 
     </div>
      </td></tr>
     </table>
     
     <%   if (!chej.equals("")) { zgtab="zhigong"+chej; zgkpb="kpjl"+chej; zjfgb="zjgz"+chej; ysfgb="ysgz"+chej;  }%>
     
    <table width="100%" height="50"  border="0" align="center" cellpadding="-2" cellspacing="-2">
     <%if (((!((String)session.getAttribute("zw")).equals("8"))
             &&(!((String)session.getAttribute("zw")).equals("9"))
             &&(!((String)session.getAttribute("zw")).equals("10"))
            &&(!((String)session.getAttribute("zw")).equals(""))
            )|| ((String)session.getAttribute("deptment")).equals("admin") )
         { 
    %>
            <tr>
            <td align="left" height="26" bgcolor="#6699CC" ><img   width="20" height="18" src="Images/add.gif" >
             <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>" onClick="Javascript:window.open('inscjkp.jsp?cj=<%=chej%>','','width=580,height=410')" >添加职工、班组考评记录</a>&nbsp;
            <font color="#ffffff">【车间领导、专职可进行此项操作】</font></td>
     <%  }  %>
    <tr >
    <td width="100%"   height="28"  align="left" bgcolor="#FFEF99">
    <img  width="16" height="16" src="Images/enter.gif"><font color="#374295">&nbsp;<%=str%>车间职工考评情况&nbsp;</font>
    </td>
    </tr>
    
    <tr>
    <td width="100%" >
    <div>
    <table  width="100%" border="0" align="center" cellpadding="-2" cellspacing="-2">
    <tr><td align="right" width="50%" >
    <form ACTION="cjgl/cjgl.jsp" name="formbz" METHOD="POST"> 
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="subpg" value="5">
    <input type="hidden" name="cj" value="<%=chej%>"><font color="#000066">班组选择&nbsp;</font>
    <select name="bzcode"   class="Sytle_select" onchange="changebz()">
    <option value=""  color="#666666">选择要查询的班组&nbsp; </option>
    <%    
      String sqlbz=" select bz,code from banzu where cj='"+chejcode+"' order by bz"; 
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
      <option  <%if (bzcode.equals(Rs.getString("code"))) out.print("selected"); %> value="<%=Rs.getString("code")%>"><%=Rs.getString("bz")%>&nbsp;</option>
               <% 
				Rs.next();
				i++;
			    } 
			}
	%>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    </td>
    <td width="50%" align="left">
    <form ACTION="cjgl/cjgl.jsp" name=formzg METHOD="POST">
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="subpg" value="5">
    <input type="hidden" name="cj" value="<%=chej%>">
    <font color="#000066">职工选择&nbsp;</font>
    <select name="bkhr" class="Sytle_select" onchange="changezg()">
    <option value=""><font color="#ff0000">请选择职工姓名&nbsp;</font></option>
    <%      
    
            String sqlzg="select name,id from "+zgtab+" where bz='"+bzcode+"'  and zw='' order by name";
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
    }%>  
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
    <form ACTION="cjgl/cjgl.jsp" name=formsj METHOD="POST">
    <input type="hidden" name="bzcode" value="<%=bzcode%>">
    <input type="hidden" name="page" value="2">
    <input type="hidden" name="subpg" value="5">
    <input type="hidden" name="cj" value="<%=chej%>">
    <input type="hidden" name="bkhr" value="<%=bkhr%>">
    <font color="#000066">时间段选择:&nbsp;从&nbsp;&nbsp;&nbsp;</font><input type="text"  name="dtfrom" onDBLClick="loadCalendar(this)" >
    &nbsp;&nbsp;&nbsp;<font color="#000066">到</font>&nbsp;&nbsp;&nbsp;<input type="text"  name="dtto" onDBLClick="loadCalendar(this)">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="Submit" value="查询" class="Style_btn">
   </form></td>
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
         { zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where rq>='"+dtfrom+"'  and rq<='"+dtto+"'"+" and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
           sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code and rq<='"+dtto+"' and rq>='"+dtfrom+"' order by rq desc"; //班组职工姓名为空时,只选择时间段内所有的考核情况
         }else { 
         zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where  a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code order by rq desc"; }
      } else
        { if (dtfrom!=null  &&  dtto!=null && !dtto.equals("") && !dtfrom.equals(""))  
         {
         zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where rq>='"+dtfrom+"'  and rq<='"+dtto+"'"+" and a.zrbz='"+bzcode+"' a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz='"+bzcode+"' and a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code and c.zw='' and rq<='"+dtto+"' and rq>='"+dtfrom+"' order by rq desc";}
         else {
         zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where  a.zrbz='"+bzcode+"' and a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bz='"+bzcode+"'and  a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code order by rq desc"; } 
        } 
  }
  else { if (dtfrom!=null  &&  dtto!=null && !dtto.equals("") && !dtfrom.equals(""))  
         { 
         zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where a.zrr='"+bkhr+"' and rq>='"+dtfrom+"'" +" && rq<='"+dtto+"'"+" and a.bz='"+bzcode+"' a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bkhr='"+bkhr+"' and a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code order by rq desc";}
         else { 
         zjsql="select a.rq as rq,a.cx as cx,a.ch as ch,a.gzms as gzms,b.name as zjy,c.name as zrr,d.fl as fl,d.xz as xz,d.bz as bz,e.bz as zrbz,d.gyx as gyx from zjgz"+chej+" as a,zhigong"+chej+" as b,zhigong"+chej+" as c,cpzlbz as d,banzu as e where  a.zrr='"+bkhr+"' and  a.zjy=b.id and a.zrr=c.id and a.gzcode=d.code and e.code=a.zrbz order by rq desc";
         sql="select a.rq,a.money,c.name as kh,d.name as bkh,e.bz as banz,b.bz,b.kf1,b.gyx,b.jf1,a.ms from kpjl"+chej+"  as a ,cjkpbz as b,zhigong"+chej+" as c,zhigong"+chej+" as d ,banzu as e where a.bkhr='"+bkhr+"' and a.khr=c.id and a.bkhr=d.id and a.bz=e.code and a.kpbz=b.code order by rq desc";} 
       }

          
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
                Smtszg = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			
                if (Con!= null)
            	{
            		try
            		{
            		   Rszg = Smtszg.executeQuery(sql);
            			
                        Rszg.last();
                        int j = 0;
            			CountRzg = Rszg.getRow();
            			CountPgzg = (CountRzg/PgSize);
            			if (CountRzg%PgSize>0)
            				CountPgzg++;
            			Rszg.first();
            			if (CountRzg>0)
            			{
            			%><table id="zgtab" width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			  <tr><td colspan="10">
            			  <table width="100%" bgcolor="#FDFCD9"><tr>
            			  <td width="120" height="26" background="Images/menubg4.gif"><font color="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;常&nbsp;&nbsp;管&nbsp;&nbsp;理</font></td>
            			  <td></td></tr></table>
            			  </td></tr>
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">序号</td>
            			    <td width="7%" align="center" class="word_white">被考评人</td>
            			    <td width="10%" align="center" class="word_white">日期</td>
                            <td width="7%" align="center" class="word_white">考评人</td>
                            <td width="8%" align="center" class="word_white">班组</td>
                            <td width="20%" align="center" class="word_white">考评项目</td>
                            <td width="5%" align="center" class="word_white">扣分</td>
                            <td width="5%" align="center" class="word_white">是否违反高压线</td>
                            <td width="5%" align="center" class="word_white">加分</td>
                            <td width="23%" align="center" class="word_white">详细描述</td>
                            <td width="5%" align="center" class="word_white">考核金额</td>
                            </tr>
                            <%
            				Rszg.absolute(CurrPgzg*PgSize-PgSize+1);
	            			while (j<PgSize && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr border="0" height="30"   cellpadding="0" cellspacing="0" bgcolor="#E1EDF9"  >
            			    <td  align="center"><%=(CurrPgzg-1)*PgSize+j+1%></td>
                            <td align="center"><%=Rszg.getString("bkh")%></td>
                            <td  align="center" ><%=Rszg.getString("rq").replace("-", ".")%></td>
                            <td  align="center" ><%=Rszg.getString("kh")%></td>
                            <td  align="center" ><%=Rszg.getString("banz")%></td>
                            <td align="center"><%=Rszg.getString("bz")%></td>
                            <td  align="center" ><%=Rszg.getString("kf1")%></td>
                            <td  align="center" ><%if (Rszg.getString("gyx").equals("1")) {%><font color="#ff0033">是</font><%} else out.print("否") ;%></td>
                            <td align="center"><%=Rszg.getString("jf1")%></td>
                            <td  align="center" ><%=Rszg.getString("ms")%></td>
                            <td  align="center" ><%=Rszg.getString("money")%></td>
                            
                            </tr>
                            <%
					            Rszg.next();
					            j++;
					        } %>
					  </table>   
					  
		  <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr height="20">
          <td nowrap class="word_blue" align="left">
          <form name="formzg1" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgzg%>/<%=CountPgzg %>] 每页30条 共<%=CountRzg%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcodezg" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="5">
            <input name="pgcodezj" type="hidden" value="<%=StrPgzj%>">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezj=<%=StrPgzj%>&pgcodezg=1">首页</a>
           <%if (CurrPgzg>1){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezj=<%=StrPgzj%>&pgcodezg=<%=CurrPgzg-1%>">上一页</a> 
            <% }  %>
            <%if (CurrPgzg<CountPgzg){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezj=<%=StrPgzj%>&pgcodezg=<%=CurrPgzg+1%>">下一页</a> 
            <% } %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezj=<%=StrPgzj%>&pgcodezg=<%=CountPgzg%>">最后一页</a>
          </td>
          </tr>
        </table>
  <%    }
     
               if ((StrPgzj == null)||(StrPgzj.equals("")))
            	{
            		CurrPgzj = 1;
            	}
            	else
            	{
            		CurrPgzj = Integer.parseInt(StrPgzj);
            	}
                        Rszg = Smtszg.executeQuery(zjsql);
            			Rszg.last();
                        j = 0;
            			CountRzj = Rszg.getRow();
            			CountPgzj = (CountRzj/PgSize);
            			if (CountRzj%PgSize>0)
            				CountPgzj++;
            			Rszg.first();
            			if (CountRzj>0)
            			{
            			%><table id="zgtab" width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
            			  <tr><td colspan="10">
            			  <table width="100%" bgcolor="#FDFCD9"><tr>
            			  <td width="120" height="26" background="Images/menubg4.gif">&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;序&nbsp;质&nbsp;量&nbsp;返&nbsp;工</td>
            			  <td></td></tr></table>
            			  </td></tr>
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td width="5%" align="center" class="word_white">序号</td>
            			    <td width="7%" align="center" class="word_white">被考评人</td>
            			    <td width="10%" align="center" class="word_white">日期</td>
                            <td width="7%" align="center" class="word_white">质检员</td>
                            <td width="7%" align="center" class="word_white">故障产品编号</td>
                            <td width="8%" align="center" class="word_white">班组</td>
                            <td width="4%" align="center" class="word_white">故障类别</td>
                            <td width="4%" align="center" class="word_white">扣分</td>
                            <td width="5%" align="center" class="word_white">是否违反高压线</td>
                            <td width="30%" align="center" class="word_white">详细描述</td>
                            </tr>
                            <%
            				Rszg.absolute(CurrPgzj*PgSize-PgSize+1);
	            			while (j<PgSize && !Rszg.isAfterLast())
            			    {     
  	                        %>
  	                        <tr height="25" bgcolor="#E1EDF9">
            			    <td width="3%" align="center"><%=(CurrPgzj-1)*PgSize+j+1 %></td>
            			    <td width="4%" align="center"><%=Rszg.getString("zrr")%></td>
                            <td width="8%"><div align="center" >
                            <%=Rszg.getString("rq").replace("-", ".")%></div></td>
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
                           <%
					            Rszg.next();
					            j++;
					        } %>
					  </table>   
					  
		  <table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" >
          <tr  height="20">
          <td nowrap class="word_blue" align="left">
          <form name="formzj" method="post" action="cjgl/cjgl.jsp">[<%=CurrPgzj%>/<%=CountPgzj %>] 每页30条 共<%=CountRzj%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcodezj" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="subpg" type="hidden" value="5">
            <input name="pgcodezg" type="hidden" value="<%=CurrPgzg%>">
            <input name="cj" type="hidden" value="<%=chej%>">
            </form>
          </td>
          <td>
          <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezg=<%=StrPgzg%>&pgcodezj=1">首页</a>
           <%if (CurrPgzj>1){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezg=<%=StrPgzg%>&pgcodezj=<%=CurrPgzj-1%>">上一页</a> 
            <% }  %>
            <%if (CurrPgzj<CountPgzj){%>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezg=<%=StrPgzg%>&pgcodezj=<%=CurrPgzj+1%>">下一页</a> 
            <% } %>
            <a href="cjgl/cjgl.jsp?page=2&subpg=5&cj=<%=chej%>&pgcodezg=<%=StrPgzg%>&pgcodezj=<%=CountPgzj%>">最后一页</a>
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
