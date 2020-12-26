<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专职考评</title>
    
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
      String bzxxsql="";
      String bbxxsql="select b.bz,c.name,a.zw,a.bb from bbzz a,bz b,zhigong c where a.bz=b.code and a.bbr=c.id";
      String zgxxsql="";
      String zgtitle="车间职工人事信息表";
      
      String submenu="";
      if (request.getParameter("submenu")!=null) submenu=new String(request.getParameter("submenu"));
     
      String searchstr="";
      if (request.getParameter("searchstr")!=null) searchstr=new String(request.getParameter("searchstr"));
      
      if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
      
      if (chej.equals("zz")) { 
                  str="郑州检修"; 
                  bzxxsql="select * from banzu where cj='41'";
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbzz a,banzu b,zhigongzz c where a.bz=b.code and a.bbr=c.id";
                  
                  if (searchstr.equals("")) { zgxxsql="select * from zhigongzz ";                              }
                  else { zgxxsql="select * from zhigongzz where name like '"+searchstr+"%'"; }
                  }
      if (chej.equals("ly")) { 
                  str="洛阳检修"; 
                  bzxxsql="select * from banzu where cj='43'"; 
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbly a,banzu b,zhigongly c where a.bz=b.code and a.bbr=c.id";
                  
                  if (searchstr.equals("")) { zgxxsql="select * from zhigongly "; }
                  else { zgxxsql="select * from zhigongly where name like '"+searchstr+"%'"; }
                  }
      if (chej.equals("ys")) { 
                  str="月山检修"; 
                  bzxxsql="select * from banzu where cj='42'"; 
                  bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbys a,banzu b,zhigongys c where a.bz=b.code and a.bbr=c.id";
                  if (searchstr.equals("")) { zgxxsql="select * from zhigongys "; } 
                  else { zgxxsql="select * from zhigongys where name like '"+searchstr+"%'"; }
                  }
      if (chej.equals("zl")) { 
                 str="郑州轮轴"; 
                 bzxxsql="select * from banzu where cj='44'";
                 bbxxsql="select b.bz as bz,c.name as bbr,c.zw as zw,a.bb as bb ,a.code from bbzl a,banzu b,zhigongzl c where a.bz=b.code and a.bbr=c.id";
                  if (searchstr.equals("")) { zgxxsql="select * from zhigongzl "; }
                  else { zgxxsql="select * from zhigongzl where name like '"+searchstr+"%'"; }
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
        str="郑州检修";
        bzxxsql="select * from banzu where cj='41'";
        bbxxsql="select * from bbzz ";
        if (searchstr.equals("")) { zgxxsql="select * from zhigongzz "; }
           else { zgxxsql="select * from zhigongzz where name like '"+searchstr+"%'"; }
      } else {
        if ((islog)&& (((String) session.getAttribute("deptment")).equals("43"))) 
        { chej = "ly";
          str="洛阳检修";
          bzxxsql="select * from banzu where cj='43'";
          bbxxsql="select * from bbly ";
          if (searchstr.equals("")) { zgxxsql="select * from zhigongly "; 
                                      }
          else { zgxxsql="select * from zhigongly where name like '"+searchstr+"%'"; }
    	} else { 
    	  if ((islog)&& (((String) session.getAttribute("deptment")).equals("42"))) 
    	  { chej = "ys";
    	    str="月山检修";
    	    bzxxsql="select * from banzu where cj='42'";
    	    bbxxsql="select * from bbys ";
    	    if (searchstr.equals("")) { zgxxsql="select * from zhigongys "; }
            else { zgxxsql="select * from zhigongys where name like '"+searchstr+"%'"; }
    	  } else { 
    	    if ((islog)&& (((String) session.getAttribute("deptment")).equals("44"))) 
    	    { chej = "zl";
    	      str="郑州轮轴";
    	      bzxxsql="select * from banzu where cj='44'";
    	      bbxxsql="select * from bbzl ";
    	      if (searchstr.equals("")) { zgxxsql="select * from zhigongzl "; }
              else { zgxxsql="select * from zhigongzl where name like '"+searchstr+"%'"; }
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
          <tr><td  align="left"><font color="#800040">&nbsp;<%=str%>车间专职考评&nbsp;</font></td></tr>
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
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=zz&submenu=<%=submenu%>&searchstr=<%=searchstr%>">郑州检修车间</a>
      </td>
      <td width="25%" ><img id="imgdt2" width="18" height="18" <% if (chej.equals("ly")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%>>
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=ly&submenu=<%=submenu%>&searchstr=<%=searchstr%>">洛阳检修车间</a></td>
      <td width="25%" ><img id="imgdt3" width="18" height="18" <% if (chej.equals("ys")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=ys&submenu=<%=submenu%>&searchstr=<%=searchstr%>">月山检修车间</a></td>
      <td width="25%" ><img id="imgdt4" width="18" height="18" <% if (chej.equals("zl")) {%> src="Images/dot4.gif"<%} else { %> src="Images/dot3.gif" <%}%> >
         <a href="cjgl/cjgl.jsp?page=2&subpg=2&cj=zl&submenu=<%=submenu%>&searchstr=<%=searchstr%>">郑州轮轴车间</a></td>
      </tr></table></div></td></tr>
      <% } %>
      <tr><td width="100%" bgcolor="#6699CC" height="28">
          <!-- 功能菜单 -->
          <div>
          <table align="left"  valign="top"  cellpadding=-1 cellspacing=-1>
           <tr >
            <td><img  width="20" height="20" src="Images/GArrow.gif"></td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=1&cj=<%=chej%>">干部考评结果查询</a>&nbsp;
            </td>
            <td style="color:#ffffff;">|</td>
            <td  align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=1&cj=<%=chej%>">干部考评标准查询</a>&nbsp;
            </td>
            <% if (((String)session.getAttribute("deptment")).equals("admin")
                   ||((String)session.getAttribute("zw")).equals("1")||((String)session.getAttribute("zw")).equals("cjadmin"))   
            { %>
            <td style="color:#ffffff;">|</td>
            <td align="center" height="26" bgcolor="#6699CC" onMouseOver="this.style.background='#FDFCD9'" onMouseOut="this.style.background='#6699CC'">
            &nbsp;<a href="cjgl/cjgl.jsp?page=2&subpg=2&submenu=3&cj=<%=chej%>">干部考评操作</a>&nbsp;
            </td>
            <% } %>
           
            </tr>
          </table>
          </div>
          </td>
     </tr>
      </table>
      <% } %>
  </body>
</html>
