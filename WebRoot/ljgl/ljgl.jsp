<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
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
    
    <title>量具管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style>
#popupcontent
{
  position: absolute;  
  visibility: hidden;   
  overflow: hidden;   
  border:1px solid #CCC;   
  background-color:#F9F9F9;   
  border:1px solid #333;   
  padding:5px;
}
</style>

  <LINK href="Css/style.css" type=text/css rel=stylesheet> 
  <body background="Images/bgmain.gif" onLoad="clockon(bgclock)" >

  <script language="javascript">
  var baseText = null; 
  function showPopup(w,h){   var popUp = document.getElementById("popupcontent");    popUp.style.top = "200px";   popUp.style.left = "200px";   popUp.style.width = w + "px";   popUp.style.height = h + "px";    if (baseText == null) baseText = popUp.innerHTML;   popUp.innerHTML = baseText +       "<div id=\"statusbar\"><input type=\"button\" value=\"Close window\" onClick=\"hidePopup();\"></div>";    var sbar = document.getElementById("statusbar");   sbar.style.marginTop = (parseInt(h)-60) + "px";   popUp.style.visibility = "visible";}
  function hidePopup(){   var popUp = document.getElementById("popupcontent");   popUp.style.visibility = "hidden";}
  
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
  }
  </script> 
  
  <% 
  //获取当前日期的月份
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
   java.util.Date today=new java.util.Date();
   int nowyear = today.getYear()+1900;
   int nowmonth = today.getMonth()+1; 
  
   String chej="";
   String cj="";
   String sqlsj="";
   String sqldq="";
   String strsj="sj";
   String strdq="";
    
   boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	   //-  识别所属车间,如不是车间要选择车间 --
	if((islog) && (((String)session.getAttribute("deptment")).equals("41"))) { chej="zz"; cj="41"; } 
	  else {  if((islog) && (((String)session.getAttribute("deptment")).equals("43"))) { cj="43"; chej="ly"; }
	          else{ if ((islog) && (((String)session.getAttribute("deptment")).equals("42"))) {  chej="ys"; cj="42";}
	                else if ((islog) && (((String)session.getAttribute("deptment")).equals("44"))) {  chej="zl"; cj="44";}
	          }
	       }

  Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
   Statement Smts; 
  ResultSet Rssj,Rsdq; 
 %>
  <table align="center" width="871" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
  <tr>
  	  <td width="100%"  colspan="2" align="left" valign="bottom" height="150">
  	  <!-- 表头 -->
  	  <table  width="100%" height="259" border="0" cellpadding="-2" cellspacing="-2" background="Images/ljbg.JPG">
  	  <tr>
  	  <td valign="top" align="left"><script src="JS/onclock.JS"></script><div id="bgclock" class="word"></div></td>
  	  
      </tr>  
  	  </table>
  	  </td>
  </tr>
  <%
  if   (cj!= null && !cj.equals("") )
  {
   sqlsj="select b.name,a.yxq,c.bz from songjian as a,lianju as b,banzu as c where lianju.cj='"+cj+"' and  a.code=b.code and b.bz=c.code and a.yxq>CURDATE() and year(a.yxq)='"+nowyear+"' and month(a.yxq)='"+nowmonth+"' group by a.code order by a.yxq desc";
   sqldq="select b.name,a.yxq,c.bz from ( select code,max(yxq) as yxq from songjian group by code) as a ,lianju as b,banzu as c where lianju.cj='"+cj+"' and  a.code=b.code and b.bz=c.code and a.yxq<=CURDATE() group by a.code order by a.yxq desc";
  }
  else 
  {
  sqlsj="select b.cj,b.name,a.yxq,c.bz from songjian as a,lianju as b,banzu as c where   a.code=b.code and b.bz=c.code  and a.yxq>CURDATE() and year(a.yxq)='"+nowyear+"' and month(a.yxq)='"+nowmonth+"' group by a.code order by a.yxq desc";
  sqldq="select distinct(a.code),b.cj,b.name,a.yxq,c.bz from  ( select code,max(yxq) as yxq from songjian group by code) as a ,lianju as b,banzu as c where   a.code=b.code and b.bz=c.code  and a.yxq<=CURDATE()  order by a.yxq desc";
  
  }
  if (Con!= null)
        {
           try
           {
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
              Rssj = Smts.executeQuery(sqlsj);
            	
              Rssj.last();
              CountR = Rssj.getRow();
              Rssj.first();
              if (CountR>0)
              {
              while (!Rssj.isAfterLast())
              {
               if (cj!= null && !cj.equals("") ) strsj=strsj+Rssj.getString("bz")+" "+Rssj.getString("name")+" "+Rssj.getString("yxq")+";";
               else 
               {
               if (Rssj.getString("cj").equals("41"))
               strsj=strsj+"郑州检修 "+Rssj.getString("bz")+" "+Rssj.getString("name")+" "+Rssj.getString("yxq")+"&nbsp";
               if (Rssj.getString("cj").equals("42"))
               strsj=strsj+"洛阳检修 "+Rssj.getString("bz")+" "+Rssj.getString("name")+" "+Rssj.getString("yxq")+"&nbsp";
               if (Rssj.getString("cj").equals("43"))
               strsj=strsj+"月山检修 "+Rssj.getString("bz")+" "+Rssj.getString("name")+" "+Rssj.getString("yxq")+"&nbsp";
               if (Rssj.getString("cj").equals("44"))
               strsj=strsj+"郑州轮轴 "+Rssj.getString("bz")+" "+Rssj.getString("name")+" "+Rssj.getString("yxq")+"&nbsp";
               }
               Rssj.next();
               }
             }
             
              Rsdq = Smts.executeQuery(sqldq);
            	
              Rsdq.last();
              CountR = Rsdq.getRow();
              Rsdq.first();
              if (CountR>0)
              {
              while (!Rsdq.isAfterLast())
              {
               if (cj!= null && !cj.equals("") ) strdq=strdq+Rsdq.getString("bz")+" "+Rsdq.getString("name")+" "+Rsdq.getString("yxq")+";";
               else 
               {
               if (Rsdq.getString("cj").equals("41"))
               strdq=strdq+"郑州检修 "+Rsdq.getString("bz")+" "+Rsdq.getString("name")+" "+Rsdq.getString("yxq")+"&nbsp";
               if (Rsdq.getString("cj").equals("42"))
               strdq=strdq+"洛阳检修 "+Rsdq.getString("bz")+" "+Rsdq.getString("name")+" "+Rsdq.getString("yxq")+"&nbsp";
               if (Rsdq.getString("cj").equals("43"))
               strdq=strdq+"月山检修 "+Rsdq.getString("bz")+" "+Rsdq.getString("name")+" "+Rsdq.getString("yxq")+"&nbsp";
               if (Rsdq.getString("cj").equals("44"))
               strdq=strdq+"郑州轮轴 "+Rsdq.getString("bz")+" "+Rsdq.getString("name")+" "+Rsdq.getString("yxq")+"&nbsp";
                
               }
               Rsdq.next();
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
  <tr>
  	  <td align="center"  colspan="2" >
  	  <table  width="869"  border="0" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff" background="Images/linem.gif">
  	  <tr>
  	  <!-- sqlsj<%=sqlsj %> -->
  	  <td width="15%" align="left"><font color="#696969">【</font><font color="#8B4513">本月即将到期量具</font><font color="#696969">】</font></td>
  	  <td width="100%"  >
  	  <marquee scrollamount="1" scrolldelay="7" direction="left" onMouseOver="this.stop();" onMouseOut="this.start();">
  	  <font color="#6B4513"><%=strsj%></font>
  	  </marquee>
      </td>
      </tr>
      <tr>
  	  <td width="15%" align="left"><font color="#696969">【</font><font color="#ff0000">已到期未送检量具</font><font color="#696969">】</font></td>
  	  <td width="85%"  >
  	  <marquee scrollamount="1" scrolldelay="7" direction="left" onMouseOver="this.stop();" onMouseOut="this.start();">
      <font color="#ff0000"><%=strdq %></font>
      </marquee>
      </td>
      </tr>
  	  </table>
  	  </td>
  </tr>
  <%
   %>
  <tr>
     <td width="25%" align="center" > 
     <table border="0" cellpadding="-2" cellspacing="-2" >
     <tr>
        <td>
        <table border="0" align="center" cellpadding="0" cellspacing="0" background="Images/header_bg2.gif">
        <tr>
        <td width="14" height="23" background="Images/header_left.gif"></td>
        <td width="80" valign="bottom"><span class=GlowLeft>量具管理功能</span></td>
        <td width="99"></td>
        <td width="14" height="23" background="Images/header_right.gif"></td>
        </tr>
        </table>
        </td>
     </tr>
     <tr>
        <td align="center">
        <table width="207" border="0" cellpadding="0" cellspacing="1" bgcolor="BFC0C0">
        <tr height="25">
        	<td align="center" bgcolor="#FFFFFF">量具样板信息维护
        	</td>
        </tr>
        <tr height="25">
        	<td align="center" bgcolor="#FFFFFF">量具样板送检登记
        	</td>
        </tr>
        </table>
        </td>
        
     </tr>
     <tr>
        <td></td>
        
     </tr>
     </table>
     
    
     </td> 
     <td width="75%" align="center" >
     <table border="0" cellpadding="-2" cellspacing="-2" >
     <tr>
        <td>
        <table border="0" align="center" cellpadding="0" cellspacing="0" background="Images/header_bg2.gif">
        <tr>
        <td width="14" height="23" background="Images/header_left.gif"></td>
        <td width="471" valign="bottom"><span class=Glow>量具样板送检信息</span></td>
        <td width="153"></td>
        <td width="14" height="23" background="Images/header_right.gif"></td>
        </tr>
        </table>
        </td>
     </tr>
     <tr>
        <td align="center">
        <table width="652" border="0" cellpadding="0" cellspacing="1" bgcolor="BFC0C0">
        <tr height="25">
        	<td align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;按班组显示1
        	</td>
        </tr>
        <tr height="25">
        	<td align="left" bgcolor="#FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;按班组显示2
        	</td>
        </tr>
        </table>
        </td>
     </tr>
     <tr>
        <td></td>
        
     </tr>
     </table>
     
     
     </td>
  </tr>
  </table>
   <table  align="center" class="tableBorder_B" valign="center" width="871"  border="0" cellpadding="-2" cellspacing="-2">
   <tr>
      <td height="8" background="Images/bottom.gif"></td>
   </tr>
   <tr>
      <td bgcolor="#ffffff" align="center">
      <div>
      <jsp:include flush="true" page="CopyRight.htm"></jsp:include>
      </div>      
      </td>
   </tr>
   <tr>
         <td height="8" background="Images/bottom.gif"></td>
      </tr>
</table>
  </body>
</html>
