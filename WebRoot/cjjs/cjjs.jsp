<%@ page language="java"  import="java.util.*,java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="java.io.FileReader"/>
<jsp:directive.page import="java.io.File"/>
<%!File file;
FileReader reader;
char[] cbuf;
%>
<%
   int CurrPage=1;
   String filepath="zzjx/cjgk.txt";
 %>
 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>车间介绍...</title>
    
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
    body {
	margin-left: 0px; 
	margin-top: 1px;
      }
    -->  
     </style>
<link href="Css/style.css" rel="stylesheet">

<SCRIPT language="javascript">
//指定要显示的图片路径
var sImgArr=new Array("zzjx/cjfm/1.JPG","zzjx/cjfm/2.JPG","zzjx/cjfm/3.JPG","zzjx/cjfm/4.JPG","zzjx/cjfm/5.JPG");
var plImg = new Image();
var gIndex = 0;
function SlideImg(index){
	gIndex = index;
	if ('Microsoft Internet Explorer' == navigator.appName)	{
		document.images["slideImg"].filters.item(0).Apply();
	}
	document.images["slideImg"].src = sImgArr[index];
	if ('Microsoft Internet Explorer' == navigator.appName){
		document.images["slideImg"].filters.item(0).play();
	}
}
function NextImg(){  //显示下一张图片
	gIndex = ((gIndex+1)>=sImgArr.length?0:(gIndex+1));
	SlideImg(gIndex);
}
function PrevImg(){  //显示前一张图片
	gIndex = ((gIndex-1)<0?(sImgArr.length-1):(gIndex-1));
	SlideImg(gIndex);	
}
var sid;
function inislide(){  //设置自动运行
	if(sid==null){
		sid = setInterval('NextImg()', 3000);
	}
}
</SCRIPT>

  </head>
  
  <body align="center" onload="inislide()" >

  <%
            	String StrPage = request.getParameter("Page");
            	if (StrPage == null)
            	{
            		CurrPage = 1;
            	}
            	else
            	{
            		CurrPage = Integer.parseInt(StrPage);
            	}
   %>
   <%
   if (CurrPage==1) { filepath="zzjx/cjgk.txt"; }
    else if (CurrPage==2) { filepath="ysjx/cjgk.txt" ;}
     else if (CurrPage==3) { filepath="lyjx/cjgk.txt" ;}
       else if (CurrPage==4) { filepath="zzlz/cjgk.txt" ;}
    file=new File(getServletContext().getRealPath(filepath));
    cbuf=new char[(int)file.length()];
    reader=new FileReader(file);
    reader.read(cbuf);
   %>
  <br>
<table width="871" align="center" cellspacing="-2" cellpadding="-2">
<tr>
<TD>
<jsp:include flush="true" page="cjjstitle.jsp"></jsp:include>
</TD>
</tr>
</table>
  <table width="871" align="center" cellspacing="-2" cellpadding="-2">
  <tr>
  <td>
   <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
        <tr>
          <td height="238" valign="top">
          <table width="100%" height="507"  border="0" cellpadding="-2" cellspacing="-2">
            <tr>
              <td width="17" valign="top">
              <table width="100%" height="439"  border="0" cellpadding="-2" cellspacing="-2">
                <tr>
                  <td height="225" background="Images/welcome.gif">&nbsp;</td>
                </tr>
                <tr>
                  <td height="190" background="Images/left_bottom.gif"></td>
                </tr>
                <tr>
                  <td height="9" background="Images/left_line.gif"></td>
                </tr>
           </table>
              </td>
              <td width="854" valign="top" background="Images/Top_05.gif">
              <table width="100%" height="135"  border="0" cellpadding="-2" cellspacing="-2" background="Images/Top_04.gif">
               <tr valign="top">
                  <td width="24%" valign="bottom" rowspan="2" >
                  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="162" height="79">
                  <param name="movie" value="Flash/qiu.swf">
                  <param name="quality" value="high">
                  <param name="wmode" value="transparent">
                  <embed src="Flash/qiu.swf" width="100" height="100" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                  </object>
                  </td>
                  <td width="76%">&nbsp;</td>
                </tr>
                <tr>
                <td width="76%" style="color:#5D5D5D">
                    <% if (CurrPage==1) { %>郑州北车辆段郑州检修车间 <br>
            ZBCLD Zheng Zhou Jian Xiu Che Jian<%} %>
                    <% if (CurrPage==2) { %>郑州北车辆段月山检修车间 <br>
            ZBCLD Yue Shan Jian Xiu Che Jian<%} %>
                    <% if (CurrPage==3) { %>郑州北车辆段洛阳检修车间 <br>
            ZBCLD Luo Yang Jian Xiu Che Jian<%} %>
                    <% if (CurrPage==4) { %>郑州北车辆段郑州轮轴车间 <br>
            ZBCLD Zheng Zhou  Che Jian<%} %>
                  </td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
              </table>
                
              <table width="98%" height="308"  border="0" cellpadding="-2" cellspacing="-2" style="margin:5pt">
                  <tr>
                    <td valign="top">
                    <table width="340" height="261" border="0" align="right" cellpadding="-2" cellspacing="-2">
                    <tr>
                     <td><img src="zzjx/cjfm/1.JPG" name="slideImg" width="339" height="255" id="slideImg" style="BORDER-TOP: #000 1px solid;BORDER-RIGHT: #000 1px solid;  BORDER-LEFT: #000 1px solid; FILTER: revealtrans(duration=2.0,transition=10); BORDER-BOTTOM: #000 1px solid"></td>
                    </tr>
                    <tr>
                     <td height="24"><div align="center">
                    <% if (CurrPage==1) { %>郑州北车辆段郑州检修车间 <%} %>
                    <% if (CurrPage==2) { %>郑州北车辆段月山检修车间 <%} %>
                    <% if (CurrPage==3) { %>郑州北车辆段洛阳检修车间 <%} %>
                    <% if (CurrPage==4) { %>郑州北车辆段郑州轮轴车间 <%} %></div>
                      </td>
                     </tr>
                    </table> 
                                 <%=String.valueOf(cbuf) %>       
                    </td>            　　
                 </tr>
                 <tr>
                 <td>
         <% Class.forName("org.gjt.mm.mysql.Driver").newInstance();
			Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgk","root","123"); 
		 %>
          <table width="100%" cellpadding=3 cellspacing=1    align="center">
          <tr align="center">
          <td colspan="4" bgcolor="#525c87" style="color:#ffffff;font-size:14;font-family:楷体">
                    <div align="center" >
                    <% if (CurrPage==1) { %>郑州检修车间领导分工及联系方法 <%} %>
                    <% if (CurrPage==2) { %>月山检修车间领导分工及联系方法 <%} %>
                    <% if (CurrPage==3) { %>洛阳检修车间领导分工及联系方法 <%} %>
                    <% if (CurrPage==4) { %>郑州轮轴车间领导分工及联系方法 <%} %>
                    </div>
          </td>
          </tr>
          <tr align="center">
           <td  width="10%" bgcolor="b1b7d0"><div align="center" >姓    名</div></td>
           <td  width="15%" bgcolor="b1b7d0"><div align="center" >职    务</div></td>
           <td  width="60%" bgcolor="b1b7d0"><div align="center" >分    工</div></td>
           <td  width="15%" bgcolor="b1b7d0"><div align="center" >联系电话</div></td>
          </tr>
          <%        	
            	Statement Smt; 
            	ResultSet Rs;
            	if (Con != null)
            	{
            		try
            		{
            		String SQL="";
            		if (CurrPage==1) { SQL = "Select * From zzjx order by num asc"; }
    					else if (CurrPage==2) { SQL = "Select * From ysjx order by num asc" ;}
     						else if (CurrPage==3) { SQL = "Select * From lyjx order by num asc" ;}
      							 else if (CurrPage==4) { SQL = "Select * From zzlz order by num asc" ;}
				
            			Smt = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			  
            			Rs = Smt.executeQuery(SQL);
            			int i = 0;
            			
            			Rs.first();
            			while ( !Rs.isAfterLast())
                             {
                              %>
                              <tr>
                              <td><div align="left" ><%=Rs.getString("name")%></div></td>
                              <td><div align="left" ><%=Rs.getString("zw")%></div></td>  
                              <td><div align="left" ><%=Rs.getString("gz")%></div></td>
                              <td><div align="center" ><%=Rs.getString("tel")%></div></td>
						      </tr>
						      <% 
								Rs.next();
								i++;
						 }
				}
          catch (SQLException e)
            		{
            			out.println(e.getMessage());
            		}
            		finally
            		{
            			
            		}
            	}
            %>                 
          </table>  
          <table width="100%" cellpadding=3 cellspacing=1    align="center">
          <tr align="center">
          <td colspan="4" bgcolor="#525c87" style="color:#ffffff;font-size:14;font-family:楷体">
                    <div align="center" >
                    <% if (CurrPage==1) { %>郑州检修车间班组设置情况 <%} %>
                    <% if (CurrPage==2) { %>月山检修车间班组设置情况 <%} %>
                    <% if (CurrPage==3) { %>洛阳检修车间班组设置情况 <%} %>
                    <% if (CurrPage==4) { %>郑州轮轴车间班组设置情况 <%} %>
                    </div>
          </td>
          </tr>
          <tr align="center">
           <td  width="10%" bgcolor="b1b7d0"><div align="center" >班组名称</div></td>
           <td  width="15%" bgcolor="b1b7d0"><div align="center" >工&nbsp;&nbsp;长</div></td>
           <td  width="60%" bgcolor="b1b7d0"><div align="center" >工作范围</div></td>
           <td  width="15%" bgcolor="b1b7d0"><div align="center" >职工人数</div></td>
          </tr>
          <%        	
            	Statement Smt2; 
            	ResultSet Rs2;
            	if (Con != null)
            	{
            		try
            		{
            		String SQL2="";
            		if (CurrPage==1) { SQL2 = "Select * From zzjxbz order by num asc"; }
    					else if (CurrPage==2) { SQL2 = "Select * From ysjxbz order by num asc" ;}
     						else if (CurrPage==3) { SQL2 = "Select * From lyjxbz order by num asc" ;}
      							 else if (CurrPage==4) { SQL2 = "Select * From zzlzbz order by num asc" ;}
				
					
									
            			Smt2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			  
            			Rs2 = Smt2.executeQuery(SQL2);
            			int j = 0;
            			
            			Rs2.first();
            			while ( !Rs2.isAfterLast())
                             {
                              %>
                              <tr >
                              <td><div align="left" ><%=Rs2.getString("bz")%></div></td>
                              <td><div align="left" ><%=Rs2.getString("gz")%></div></td>  
                              <td><div align="left" ><%=Rs2.getString("zz")%></div></td>
                              <td><div align="center" ><%=Rs2.getString("rs")%></div></td>
						      </tr>
						      <% 
								Rs2.next();
								j++;
						 }
				}
          catch (SQLException e)
            		{
            			out.println(e.getMessage());
            		}
            		finally
            		{
            			Con.close();
            		}
            	}
            %>                 
          </table>                    
                </td>
                </tr>
              </table>
              </td>
           </tr>
      </table>
      </td>
      </tr>

      <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
      <tr>
         <td height="8" background="Images/bottom.gif"></td>
      </tr>
      <tr>
         <td   bgcolor="#FFFFFF">
            <div align="center" style="color:#666666 ">
            <jsp:include page="CopyRight.htm"/>
            </div>
         </td>
      </tr>
      <tr>
         <td height="8" background="Images/bottom.gif"></td>
      </tr>
     </table>


 
  </body>
</html>
