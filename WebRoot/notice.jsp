<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通知...</title>
    
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
     .wordstyle{font-family: 楷体;font-size : 12pt;color: #3F476A}
     .wordstyle2{color: #AFB4B7}
     .wordstyle3{color: #D52005}
 
     -->  
    </style>
  </head>
 <script language="JavaScript">

function scrollUp()
{
document.getElementById("mar1").direction="up";
}
function scrollDown()
{
document.getElementById("mar1").direction="down";
}
function stopScroll()
{
document.getElementById("mar1").stop();
}
function startScroll()
{
document.getElementById("mar1").start();
}
//-->
</script> 
  <body >
  <%
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
      
  boolean islog=false;
  boolean canadd=false;
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
    if (!((((String)session.getAttribute("deptment")).equals("41"))
    ||(((String)session.getAttribute("deptment")).equals("42")) 
    ||(((String)session.getAttribute("deptment")).equals("41")))) { canadd=true;}
  else { if (!((((String)session.getAttribute("zw")).equals("7"))||
              (((String)session.getAttribute("zw")).equals("8"))||
              (((String)session.getAttribute("zw")).equals("9"))||
              (((String)session.getAttribute("zw")).equals("10"))||
              (((String)session.getAttribute("zw")).equals(""))||
              ((String)session.getAttribute("zw")==null))) { canadd=true;} }
  }
   
  int CountR = 0;
  String bumendh="";
  String bumen="";
  
  if (islog) {
  bumendh="j"+(String)session.getAttribute("deptment");
  
  %>
  <!-- 如果登录则显示通知栏 -->
  <table align="center" width="100%" border="0" cellpadding="-2" cellspacing="-2" >
     <tr>
        <td    width="73"   align="right" ></td>
        <td height="38"   class=wordstyle align="center" >
           <div>
               <table>
               <tr><td width="45%" rowspan="2" align="right" >
                   <img width="20" height="20"  src="Images/speaker.gif" border="0">
                   </td>
                   <td  align="center" height="1"></td>
               </tr>
               <tr>
                   <td  align="left" class=wordstyle>&nbsp;<font face="楷体_GB2312" color="#3473b8">&nbsp;通&nbsp;&nbsp;知&nbsp;&nbsp;通&nbsp;&nbsp;告</font>&nbsp;&nbsp;</td>
               </tr>
               </table>
           </div>
        </td>
        <td   width="135"   align="left" ></td>
      </tr>
  </table>
  <!-- 接收到的通知 -->
  <table width="100%" border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_Btm">
  <tr><td width="150" colspan="2" align="center" valign="center">
      <div><img width="60" height="60"  src="Images/remote.ico" border="0"></div>
      <div align="center" class="wordstyle2">|接收到的通知|</div>
      <div align="center" class="wordstyle2">|&nbsp;点击看详情&nbsp;|</div>
     <% if ( canadd ) { %>
        <div align="center" class="wordstyle2">
        <br>
         <table class="tableBorder_LRB2" width="90%" border="0" cellpadding="-2" cellspacing="-2" background="Images/boxEdit.gif">
           <tr><td class="wordtitle" align="center" width="100%" height="30" background="Images/boxTop2.gif">
           <img width="14" height="14"  src="Images/speaker2.gif" border="0"><a  href="managetz.jsp"  target="_blank" style="color:#336699;padding:0 4px 0 8px;">通知通告管理</a></td>
           </tr>
           </table>
        </div>    
      <% } %>
      </td>
      <td width="590">
      <div>
      <table  width="100%" border="0" cellpadding="-2" cellspacing="-2"  >
      <tr>
        <td colspan="3"  height="175" class="wordstyle3">
        <%
        String sql="";
        if (bumendh.equals("jadmin")) { sql="select * from tongzhi where ( yxrq>='"+now+"' ) order by rq desc"; }
        else { sql="select * from tongzhi where ((jsbm like '"+bumendh+"%'"+") or ( jsbm like '%"+bumendh+"%')) and ( yxrq>='"+now+"' ) order by rq desc"; }
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
        Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123");
       
        Statement Smts; 
        ResultSet Rs;
        if (Con!= null)
        {
           try
           {
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
              Rs = Smts.executeQuery(sql);
            	
              Rs.last();
              CountR = Rs.getRow();
              Rs.first();
              if (CountR>0)
              {
              %>
              <marquee id="mar1" direction="up" width="100%" height="173px" scrollamount="2" scrolldelay="100" onMouseOver="stopScroll()" onMouseOut="startScroll()">
              <ul>
              <%
              while (!Rs.isAfterLast())
              {
              %>
           
              <li><font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#cc0033'" color='#cc0033'  onClick="window.open('tznr.jsp?id=<%=Rs.getString("id")%>','','width=587,height=420')"'><%=Rs.getString("bt")%>&nbsp;&nbsp;
              <% 
              if (Rs.getString("fbbm").equals("1"))  { bumen="发布单位:段领导";}
              if (Rs.getString("fbbm").equals("21")) { bumen="发布单位:验收室.";}
              if (Rs.getString("fbbm").equals("22")) { bumen="发布单位:技术科.";}
              if (Rs.getString("fbbm").equals("23")) { bumen="发布单位:调度科.";}
              if (Rs.getString("fbbm").equals("24")) { bumen="发布单位:材料科.";}
              if (Rs.getString("fbbm").equals("25")) { bumen="发布单位:质检科.";}
              if (Rs.getString("fbbm").equals("41")) { bumen="发布单位:郑州检修车间.";}
              if (Rs.getString("fbbm").equals("42")) { bumen="发布单位:月山检修车间.";}
              if (Rs.getString("fbbm").equals("43")) { bumen="发布单位:洛阳检修车间.";}
              if (Rs.getString("fbbm").equals("44")) { bumen="发布单位:郑州轮轴车间.";}
              %>
              <%=bumen%><%=Rs.getString("fbr")%>&nbsp;&nbsp;<%=Rs.getString("rq")%></font>
              <p>
              <%
              Rs.next();
              }
              %> 
              </ul>
              </marquee>
              <%
              }
           }
		   catch (SQLException e)
           {
            	out.println("!");
           }
           finally
           {
            	Con.close();
           }
        
        }%>
        </td>
     </tr>
     <tr>
        
        <td width="35%" align="right"  valign="bottom" >
        <img id="imgUp" src="Images/up.gif" onMouseOver="scrollUp()">&nbsp;</td>
        <td width="30%" align="center"  >[&nbsp;当前共有通知、通告&nbsp;<%=CountR%>&nbsp;条&nbsp;]</td>
        <td width="35%" align="left"  valign="bottom" >
        <img id="imgDown" src="Images/down.gif" onMouseOver="scrollDown()">&nbsp;</td>
        
     </tr>
     </table>
     </div>
     <td width="125" colspan="2" align="left" valign="center">
     </td>

  </table>
  <% } %>
  <!-- 通知栏结束 -->
  </body>
</html>
