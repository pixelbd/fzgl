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
    
    <title>My JSP 'dtxxmain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <style type="text/css">
/* Reset style */
* { margin:0; padding:0; word-break:break-all; }
     .wordtitle{color: #DB4185}
     .wordtitle2{color: #E54743}

h1, h2, h3, h4, h5, h6 {
     font-size:1em; 
     }
a    { 
     color:#0287CA; text-decoration:none; 
     }
a:hover { 
      
     }
ul, li { 
     list-style:none; 
     }
fieldset, img { 
     border:none; 
     }
legend { 
     display:none; 
     }
em, strong, cite, th { 
     font-style:normal; font-weight:normal; 
     }
input, textarea, select, button { 
     font:12px Helvetica, Arial, sans-serif; 
     }
table { 
     border-collapse:collapse; 
     }
html { 
     overflow:-moz-scrollbars-vertical; 
     } /*Always show Firefox scrollbar*/
     
/* iFocus style */
#ifocus { 
     width:525px; height:245px; margin:20px; border:1px solid #DEDEDE; background:#FFEBF2; 
     }
#ifocus_pic { 
     display:inline; position:relative; float:left; width:410px; height:225px; overflow:hidden; margin:10px 0 0 10px; 
     }
#ifocus_piclist { 
     position:absolute; 
     }
#ifocus_piclist li { 
     width:410px; height:225px; overflow:hidden; 
     }
#ifocus_piclist img { 
     width:410px; height:225px; 
     }
#ifocus_btn { 
     display:inline; float:right; width:91px; margin:9px 9px 0 0; 
     }
#ifocus_btn li { 
     width:91px; height:57px; cursor:pointer; opacity:0.5; -moz-opacity:0.5; filter:alpha(opacity=50); 
     }
#ifocus_btn img { 
     width:75px; height:45px; margin:7px 0 0 11px; 
     }
#ifocus_btn .current { 
     background: url("http://localhost:8080/fzgl/Images/ifocus_btn_bg.gif") no-repeat; opacity:1; -moz-opacity:1; filter:alpha(opacity=100); 
     }
#ifocus_opdiv { 
     position:absolute; left:0; bottom:0; width:410px; height:35px; background:#000; opacity:0.5; -moz-opacity:0.5; filter:alpha(opacity=50); 
     }
#ifocus_tx { 
     position:absolute; left:8px; bottom:8px; color:#FFF; 
     }
#ifocus_tx .normal { 
     display:none; 
     }
 INPUT.Style_btn {
	  BORDER-RIGHT: #FF6666 1px solid; BORDER-TOP: #FF6666 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #FFFAEE; BORDER-LEFT: #D84E3F 1px solid; COLOR: #FF3333; BORDER-BOTTOM: #FF6666 1px solid;HEIGHT: 20px;width: 30px
       }
INPUT.Sytle_textred {
	BACKGROUND: #FFFFFF;BORDER-RIGHT:#D84E3F 1px solid; BORDER-TOP:#D84E3F 1px solid; FONT-SIZE: 10pt; COLOR: #D84E3F;BORDER-LEFT:#D84E3F 1px solid;BORDER-BOTTOM:#D84E3F 1px solid;HEIGHT: 20px;width: 30px
}
</style>
<script type="text/javascript">
function $(id) { return document.getElementById(id); }
function addLoadEvent(func){
 var oldonload = window.onload;
 if (typeof window.onload != 'function') 
 {
  window.onload = func;
 } else 
 {
      window.onload = function()
      {
      oldonload();
      func();
      }
 }
}
function moveElement(elementID,final_x,final_y,interval) {
  if (!document.getElementById)            return false;
  if (!document.getElementById(elementID)) return false;
  var elem = document.getElementById(elementID);
  if (elem.movement) {
      clearTimeout(elem.movement);
  } 
  if (!elem.style.left) {
      elem.style.left = "0px";
  }
  if (!elem.style.top) {
      elem.style.top = "0px";
  }
  var xpos = parseInt(elem.style.left);
  var ypos = parseInt(elem.style.top);
  if (xpos == final_x  &&  ypos == final_y) 
  {  return true; }
  if (xpos < final_x) {
    var dist = Math.ceil((final_x - xpos)/10);
    xpos = xpos + dist;
  }
  if (xpos > final_x) {
    var dist = Math.ceil((xpos - final_x)/10);
    xpos = xpos - dist;
  }
  if (ypos < final_y) {
    var dist = Math.ceil((final_y - ypos)/10);
    ypos = ypos + dist;
  }
  if (ypos > final_y) {
    var dist = Math.ceil((ypos - final_y)/10);
    ypos = ypos - dist;
  }
  elem.style.left = xpos + "px";
  elem.style.top = ypos + "px";
  var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
  elem.movement = setTimeout(repeat,interval);
}
function classNormal(iFocusBtnID,iFocusTxID){
 var iFocusBtns= $(iFocusBtnID).getElementsByTagName('li');
 var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
 for(var i=0; i<iFocusBtns.length; i++) {
  iFocusBtns[i].className='normal';
  iFocusTxs[i].className='normal';
 }
}
function classCurrent(iFocusBtnID,iFocusTxID,n){
 var iFocusBtns= $(iFocusBtnID).getElementsByTagName('li');
 var iFocusTxs = $(iFocusTxID).getElementsByTagName('li');
 iFocusBtns[n].className='current';
 iFocusTxs[n].className='current';
}
function iFocusChange() {
 if(!$('ifocus')) return false;
 $('ifocus').onmouseover = function(){atuokey = true};
 $('ifocus').onmouseout = function(){atuokey = false};
 var iFocusBtns = $('ifocus_btn').getElementsByTagName('li');
 var listLength = iFocusBtns.length;
 iFocusBtns[0].onmouseover = function() {
  moveElement('ifocus_piclist',0,0,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',0);
 }
 if (listLength>=2) {
  iFocusBtns[1].onmouseover = function() {
   moveElement('ifocus_piclist',0,-225,5);
   classNormal('ifocus_btn','ifocus_tx');
   classCurrent('ifocus_btn','ifocus_tx',1);
  }
 }
 if (listLength>=3) {
  iFocusBtns[2].onmouseover = function() {
   moveElement('ifocus_piclist',0,-450,5);
   classNormal('ifocus_btn','ifocus_tx');
   classCurrent('ifocus_btn','ifocus_tx',2);
  }
 }
 if (listLength>=4) {
  iFocusBtns[3].onmouseover = function() {
   moveElement('ifocus_piclist',0,-675,5);
   classNormal('ifocus_btn','ifocus_tx');
   classCurrent('ifocus_btn','ifocus_tx',3);
  }
 }
}
setInterval('autoiFocus()',5000);
var atuokey = false;
function autoiFocus() {
 if(!$('ifocus')) return false;
 if(atuokey) return false;
 var focusBtnList = $('ifocus_btn').getElementsByTagName('li');
 var listLength = focusBtnList.length;
 for(var i=0; i<listLength; i++) {
  if (focusBtnList[i].className == 'current') var currentNum = i;
 }
 if (currentNum==0 && listLength!=1 ){
  moveElement('ifocus_piclist',0,-225,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',1);
 }
 if (currentNum==1 && listLength!=2 ){
  moveElement('ifocus_piclist',0,-450,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',2);
 }
 if (currentNum==2 && listLength!=3 ){
  moveElement('ifocus_piclist',0,-675,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',3);
 }
 if (currentNum==3 ){
  moveElement('ifocus_piclist',0,0,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',0);
 }
 if (currentNum==1 && listLength==2 ){
  moveElement('ifocus_piclist',0,0,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',0);
 }
 if (currentNum==2 && listLength==3 ){
  moveElement('ifocus_piclist',0,0,5);
  classNormal('ifocus_btn','ifocus_tx');
  classCurrent('ifocus_btn','ifocus_tx',0);
 }
}
addLoadEvent(iFocusChange);
</script>
  </head>
  
  <body background="Images/back.jpg">
  <% 
  String str[]={"==郑州北车辆段货车检修系统动态信息=="};
  int i=0; 
  int j=0;
  String tabname="dtxx";
  String sql="select * from "+tabname+" order by id desc";
  String pic[]={"","","",""};
  String tpjs[]={"","","",""};
  String nr[]={"","","",""};
  String link[]={"","","",""};
  
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
    ||(((String)session.getAttribute("deptment")).equals("43"))
    ||(((String)session.getAttribute("deptment")).equals("44")))) { canadd=true;}
  else {if (!((((String)session.getAttribute("zw")).equals("7"))||
              (((String)session.getAttribute("zw")).equals("8"))||
              (((String)session.getAttribute("zw")).equals("9"))||
              (((String)session.getAttribute("zw")).equals("10"))||
              (((String)session.getAttribute("zw")).equals(""))||
              ((String)session.getAttribute("zw")==null))) { canadd=true;}  }
  }
   %>

<table  width="100%" align="center" border="0" cellpadding="-2" cellspacing="-2" >
<tr>
  <td width="100%" align="center" valign="top">
  <div>
      <table   width="100%" border="0" cellpadding="-2" cellspacing="-2" bgcolor="#FFEEF4">
      <tr><td colspan="5">
          <div>
          <table width="100%">
          <tr>
          <td class="wordtitle" align="left" width="70%" height="30" background="Images/boxTop1.gif">&nbsp;&nbsp;
             <img width="4" height="12"  src="Images/boxH.gif" border="0">&nbsp;<%=str[i]%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </td>
          <td class="wordtitle" align="center" width="30%" height="30" background="Images/boxTop1.gif">
          <% if ( canadd ) { %>
          [ <img width="14" height="14"  src="Images/speaker2.gif" border="0"><a  href="dtxx/addxx.jsp"  style="color:#ff3399;padding:0 4px 0 8px;">动态信息管理</a>
           ]<% } %>
          </td>
          </tr>
          </table>
          </div>
          </td>
      </tr> 
		       <% 
                 Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                 Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/dtxx","root","123"); 

                String StrPg = request.getParameter("pgcode");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
                Statement Smts; 
                ResultSet Rs;
                if (Con!= null)
            	{
            		try
            		{
            		
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rs = Smts.executeQuery(sql);
            			
                        Rs.last();
                        j = 0;
            			CountR = Rs.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rs.first();
            			%>
            			<tr><td colspan="5" width="100%" align="center">
            			<div id="ifocus">
                        <div id="ifocus_pic">
                        <div id="ifocus_piclist" style="left:0; top:0;">
                        <ul>
                        <%
            			while (j<4 && !Rs.isAfterLast())
            			{
            			if (!Rs.getString("pic1").equals(""))
            			{
            			pic[j]="http://10.99.125.238:8080/fzgl/dtxxpic/"+Rs.getString("pic1");
            			tpjs[j]=Rs.getString("bt");
            			nr[j]=Rs.getString("nr");
            			link[j]="dtxx/showxx.jsp?id="+Rs.getString("id");
            			j++;
            			Rs.next();
            			}
            			else Rs.next();
            			}
            			
            			for (j=0;j<4;j++) {
            			%>
            			<li><a href=<%=link[j]%> target="_blank"><img src=<%=pic[j]%> alt="" /></a></li>
            			<% } %>
            			</ul>
                        </div>
                        <div id="ifocus_opdiv"></div>
                        <div id="ifocus_tx">
                        <ul>
            			<%
            			for (j=0;j<4;j++) {
            			%>
            			 <li <%if (j==0) {%>class="current" <%} else {%> class="normal" <% } %>><%=tpjs[j]%></li>
            			<% } %>
            			 </ul>
                        </div>
                        </div>
                        <div id="ifocus_btn">
                        <ul>
                        <%
            			for (j=0;j<4;j++) {
            			%>
            			<li <%if (j==0) {%>class="current" <%} else {%> class="normal" <% } %>><a  href=<%=link[j]%> target="_blank"><img src=<%=pic[j]%> alt="" /></a></li>
            			<% } %>
            			</ul>
            			</div>
                        </div>
                       </td></tr>
            			<%
            			i=0;
            			j=0;
            			Rs.first();
            			if (CountR>0)
            			{
            			    Rs.absolute(CurrPg*PgSize-PgSize+1);
            			    
            			    
	            			while (i<PgSize && !Rs.isAfterLast())
            			    {   j++;  
  	                        %>
            			    <tr border="0"  height="30"  cellpadding="0" cellspacing="0" >
            			    <td width="8%"  align="right" ><img  src="Images/arrow.gif" width="13" height="9" >&nbsp;&nbsp;&nbsp;</td>
                            <td width="65%"  align="left"  background="Images/line4.gif" >
                                <div >&nbsp;
                                <a href="dtxx/showxx.jsp?id=<%=Rs.getString("id")%>" target="_blank"><%=Rs.getString("bt")%></a>
                               &nbsp;<%if (!Rs.getString("pic1").equals("")||!Rs.getString("pic2").equals("")
                               ||!Rs.getString("pic3").equals("")||!Rs.getString("pic4").equals("")
                               ||!Rs.getString("pic5").equals("")) {%><img  src="Images/image.gif" width="16" height="16" >...<%} %>&nbsp;
                               <%if (j<=5) {%><img  src="Images/new.gif" width="33" height="16" > <% } %>
                                </div>
                            </td>
                            <td width="10%"  background="Images/line4.gif" >
                               <div align="center">
                               <% if (Rs.getString("fbbm").equals("21")) { %> 验收室 <%} %>
                               <% if (Rs.getString("fbbm").equals("22")) { %> 技术科 <%} %>
                               <% if (Rs.getString("fbbm").equals("23")) { %> 调度科 <%} %>
                               <% if (Rs.getString("fbbm").equals("24")) { %> 材料科 <%} %>
                               <% if (Rs.getString("fbbm").equals("25")) { %> 质检科 <%} %>
                               <% if (Rs.getString("fbbm").equals("41")) { %> 郑州检修车间 <%} %>
                               <% if (Rs.getString("fbbm").equals("42")) { %> 月山检修车间 <%} %>
                               <% if (Rs.getString("fbbm").equals("43")) { %> 洛阳检修车间 <%} %>
                               <% if (Rs.getString("fbbm").equals("44")) { %> 郑州轮轴车间 <%} %>
                               <% if (Rs.getString("fbbm").equals("admin")) { %> 系统管理员 <%} %>
                               </div>
                            </td>
                            <td width="10%" background="Images/line4.gif">
                                <div align="center"> 
                                <%=Rs.getString("rq").replace("-", ".")%>
                                </div>
                            </td>
                            <td width="10%" align="center" ></td>
                            </tr>
                           <%
					            Rs.next();
					            i++;
					    }
					 %>   </table> 
				 </td>
		    </tr>
		    <tr>
		          <td>
		          <!-- 显示页码表 -->
		          
		  <table align="center"  width="100%" bgcolor="#FFEEF4"> 
          <tr>
          <td  align="center" width="60%">
          <form name="form2" method="post" action="gzzd/gzzd.jsp"><font color="#ff0000">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第</font>
            <input name="pgcode" type="text" size="3" class=Sytle_textred><font color="#ff0000">&nbsp;页&nbsp;&nbsp;</font>
            <input type="submit" name="Submit" value="GO" class="Style_btn">
            </form>
           </td>
           
          <td width="30%" align="center">
           <%if (CurrPg>1){%>
            <a href="dtxx/dtxx.jsp?page=1&pgcode=<%=CurrPg-1%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="dtxx/dtxx.jsp?page=1&pgcode=<%=CurrPg+1%>">下一页</a> 
            <%
          	}
          %>
            <a href="dtxx/dtxx.jsp?page=1&pgcode=<%=CountPg%>">最后一页</a>
            </td>
        </tr>
        </table><% } } catch (SQLException e)
            		{
            			out.println("暂无信息!");
            		}
            		finally
            		{
            			Con.close();
            		}}%>
       <tr>
          <td colspan="5" class="wordtitle" align="left" width="100%" height="30" background="Images/boxbtm.gif">
          </td>
    </tr>
       </table>



</body>
</html>