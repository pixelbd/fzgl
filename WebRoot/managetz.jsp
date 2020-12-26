<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通知通告管理...</title>
    
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
  <LINK href="Css/css1.css" type=text/css rel=stylesheet> 
  <body background="Images/bg2.gif">
  <%
  java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
  java.util.Date today=new java.util.Date();
  String now = formatter.format(today); 
  
  boolean islog=false;
  boolean canadd=false;
  
  String user="";
  
  try
  { islog=((String)session.getAttribute("islog")).equals("1");
  }
  catch(Exception e)
  {
  //out.println(e);
  }
  if (islog)
  {
   user=(String)session.getAttribute("usertrue");
   
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
  String sql1="";
  String sql2=""; 
        
%>
  
 
  <!-- 接收到的通知 -->
  <table  width="871" background="Images/Top_02.gif"  height="92" align="center" border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_Btm">
   <tr>
  <td  width="100%" valign="bottom" align="center"  height="76" style="FONT:20px 黑体;COLOR:#ffffff;HEIGHT:18px;">通&nbsp;知&nbsp;通&nbsp;告&nbsp;管&nbsp;理</td>
  </tr>
  <tr>
  <td height="16" valign="bottom" style="COLOR:#ffffff;">&nbsp;当前用户:<%=user %></td>
  </tr>
  </table>
 <%   if (islog) {
  bumendh="j"+(String)session.getAttribute("deptment");
  
  %>
  <table bgcolor="#FFFFFF" width="871"   align="center" border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_LRB">
  <tr> 
      <td width="100%" >
      <div>
     
        <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1"  >
        <tr height="40"><td  colspan="5" align="center">我&nbsp;接&nbsp;收&nbsp;到&nbsp;的&nbsp;通&nbsp;知&nbsp;通&nbsp;告</td></tr>
        <tr height="20"><td  colspan="5" align="left">当前[<%=now%>]有效的通知通告...</td></tr>
        <tr  align="center" class="wordstyle" height="30" bgcolor="FFCC99">
        <td  width="10%">发布人</td>
        <td  width="10%">发布部门</td>
        <td  width="10%">发布时间</td>
        <td  width="10%">批准人</td>
        <td  width="50%">通知标题</td></tr>
        <%
       
        if (bumendh.equals("jadmin")) { sql1="select * from tongzhi where   ( yxrq>='"+now+"' ) order by rq desc"; 
            sql2="select * from tongzhi  order by rq desc"; }
        else { sql1="select * from tongzhi where ((jsbm like '"+bumendh+"%'"+") or ( jsbm like '%"+bumendh+"%')) and ( yxrq>='"+now+"' ) order by rq desc"; 
               sql2="select * from tongzhi where fbr='"+user+"' order by rq desc"; }
        
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
        Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123");
        
        Statement Smts; 
        ResultSet Rs;
        if (Con!= null)
        {
           try
           {
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
              Rs = Smts.executeQuery(sql1);
            	
              Rs.last();
              CountR = Rs.getRow();
              Rs.first();
              if (CountR>0)
              {
              %>
              
              <%
              while (!Rs.isAfterLast())
              {
              %>
              <tr bgcolor="fffff0" align="center" height="30"><td width="10%"><%=Rs.getString("fbr")%></td>
                  <td width="10%"><% 
              if (Rs.getString("fbbm").equals("1"))  { bumen="段领导";}
              if (Rs.getString("fbbm").equals("21")) { bumen="验收室";}
              if (Rs.getString("fbbm").equals("22")) { bumen="技术科";}
              if (Rs.getString("fbbm").equals("23")) { bumen="调度科";}
              if (Rs.getString("fbbm").equals("24")) { bumen="材料科";}
              if (Rs.getString("fbbm").equals("25")) { bumen="质检科";}
              if (Rs.getString("fbbm").equals("41")) { bumen="郑州检修车间";}
              if (Rs.getString("fbbm").equals("42")) { bumen="月山检修车间";}
              if (Rs.getString("fbbm").equals("43")) { bumen="洛阳检修车间";}
              if (Rs.getString("fbbm").equals("44")) { bumen="郑州轮轴车间";}
              %>
              <%=bumen%></td>
              <td width="10%"><%=Rs.getString("rq")%></td>
              <td width="10%"><%=Rs.getString("pzr")%></td>
              <td width="50%">
               <font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#cc0033'"  color='#cc0033' onClick="window.open('tznr.jsp?id=<%=Rs.getString("id")%>','','width=587,height=420')"'><%=Rs.getString("bt")%>&nbsp;&nbsp;
               </font>
              </td>
             
              <%
              Rs.next();
              }
              %> 
             </tr>
              <%
              }
           %>
        </table>
        </div>
        </td>
     </tr>
     <tr>
        <td clospan="5" width="30%" align="center"  >[&nbsp;当前共有通知、通告&nbsp;<%=CountR%>&nbsp;条&nbsp;]</td>
     </tr>
   </table>
   
   <!-- 发布的通知通告 -->
 
 
  <table  bgcolor="#FFFFFF" width="871"   align="center" border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_LRB">
  <tr> 
      <td width="100%" >
      <div>
     
        <table  width="98%" align="center" border="0" cellpadding="1" cellspacing="1"  >
        <tr height="40"><td <% if (bumendh.equals("jadmin")) { %> colspan="9" <% } else { %>colspan="7" <% } %>align="center">我&nbsp;发&nbsp;布&nbsp;的&nbsp;通&nbsp;知&nbsp;通&nbsp;告</td></tr>
        <tr  align="center" class="wordstyle" height="30" bgcolor="FFCC99">
        <% if (bumendh.equals("jadmin")) { %>
        <td  width="6%">发布人</td>
        <td  width="8%">发布部门</td> <% } %>
        <td  width="8%">发布时间</td>
        <td  width="8%">有效日期</td>
        <td  width="6%">批准人</td>
        <td  width="24%">接收部门</td>
        <td  width="30%">通知标题</td>
        <td  colspan="2" width="10%">操作</td>
         
        <%     
              
              Rs = Smts.executeQuery(sql2);
            	
              Rs.last();
              CountR = Rs.getRow();
              Rs.first();
              if (CountR>0)
              {
              
              while (!Rs.isAfterLast())
              {
              %><tr  bgcolor="fffff0"  align="center" height="30" >
              <% if (bumendh.equals("jadmin")) { %>
               <td width="6%"><%=Rs.getString("fbr")%></td>
                  <td width="8%"><% 
              if (Rs.getString("fbbm").equals("1"))  { bumen="段领导";}
              if (Rs.getString("fbbm").equals("21")) { bumen="验收室";}
              if (Rs.getString("fbbm").equals("22")) { bumen="技术科";}
              if (Rs.getString("fbbm").equals("23")) { bumen="调度科";}
              if (Rs.getString("fbbm").equals("24")) { bumen="材料科";}
              if (Rs.getString("fbbm").equals("25")) { bumen="质检科";}
              if (Rs.getString("fbbm").equals("41")) { bumen="郑州检修车间";}
              if (Rs.getString("fbbm").equals("42")) { bumen="月山检修车间";}
              if (Rs.getString("fbbm").equals("43")) { bumen="洛阳检修车间";}
              if (Rs.getString("fbbm").equals("44")) { bumen="郑州轮轴车间";}
              %>
              <%=bumen%></td> <%  bumen=""; } %>
              <td width="10%"><%=Rs.getString("rq")%></td>
              <td width="10%"><%=Rs.getString("yxrq")%></td>
              <td width="6%"><%=Rs.getString("pzr")%></td>
              <td width="20%">
              <% if (Rs.getString("jsbm").indexOf("j1")>=0)  { bumen=bumen+"段领导 ";}
                  if (Rs.getString("jsbm").indexOf("j21")>=0)  { bumen=bumen+"验收室 ";}
                 if (Rs.getString("jsbm").indexOf("j22")>=0)  { bumen=bumen+"技术科 ";}
                 if (Rs.getString("jsbm").indexOf("j23")>=0)  { bumen=bumen+"调度科 ";}
                 if (Rs.getString("jsbm").indexOf("j24")>=0)  { bumen=bumen+"材料科 ";}
                 if (Rs.getString("jsbm").indexOf("j25")>=0)  { bumen=bumen+"质检科 ";}
                 if (Rs.getString("jsbm").indexOf("j41")>=0)  { bumen=bumen+"郑州检修 ";}
                 if (Rs.getString("jsbm").indexOf("j42")>=0)  { bumen=bumen+"月山检修 ";}
                 if (Rs.getString("jsbm").indexOf("j43")>=0)  { bumen=bumen+"洛阳检修 ";}
                 if (Rs.getString("jsbm").indexOf("j44")>=0)  { bumen=bumen+"郑州轮轴 ";}
              %>
              <%=bumen %></td>
              <td width="40%">
              <font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#cc0033'" color='#cc0033' onClick="window.open('tznr.jsp?id=<%=Rs.getString("id")%>','','width=587,height=420')"'><%=Rs.getString("bt")%>&nbsp;&nbsp;
              &nbsp;&nbsp;</font></td>
              <td width="10%">
              
              <img src="Images/del_file.gif" width="20" height="20" border="0" onMouseOver="this.style.cursor='hand'" onMouseOut="color='#000000'" title="删除" onClick="Javascript:window.open('deltz.jsp?code=<%=Rs.getString("id")%>','','width=519,height=155')">
                           
              
              </td>
              <%
              Rs.next();
              }
              %> 
             </tr>
              <%
              }
           }
		   catch (SQLException e)
           {
            	out.println("--!--");
           }
           finally
           {
            	Con.close();
           }
        
        }%>
        
        </table>
        </div>
        </td>
     </tr>
     <tr>
        <td clospan="5" width="30%" align="center"  >[&nbsp;共发布通知、通告&nbsp;<%=CountR%>&nbsp;条&nbsp;]</td>
     </tr>
   <tr><td   >&nbsp; <img width="14" height="14"  src="Images/speaker2.gif" border="0">&nbsp;
   <font onMouseOver="this.style.cursor='hand',color='#f77d08'" onMouseOut="color='#cc0033'"  color='#cc0033'  onClick="window.open('addtz.jsp','','width=570,height=485')"' style="padding:0 2px 0 1px;"  >发布通知通告</font></td>
       </tr>
   </table>
   
     <% } else {%>
      <table  bgcolor="#FFFFFF" width="871"   align="center" border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_LRB">
  <tr> <td width="400" height="100" align="right"><img width="32" height="32" src="Images/hint.gif" ></td>
  <td align="left" valign="center">&nbsp;&nbsp;您还未登录,登录后方可进行管理...</td>
      </tr>
      </table>
      <% } %>
    <table  class="tableBorder_B" align="center" width="871"  border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFFFFF">
   <tr>
      <td bgcolor="#ffffff">
      <div>
      <jsp:include flush="true" page="CopyRight.htm"></jsp:include>
      </div>      
      </td>
   </tr>
</table>

  </body>
</html>
