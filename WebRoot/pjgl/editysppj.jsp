<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
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
    
    <title>已索赔配件记录编辑</title>
    
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
      .word_yellow {
	 	font-size: 9pt;
	  	color: #EFD20F;  }
	  .title{
	  	font-size: 14px;
		color: #000000;
		font-family:楷体;}
     INPUT.Style_button {
	  BORDER-RIGHT: #4E759C 1px solid; BORDER-TOP: #4E759C 1px solid; FONT-SIZE: 9pt; 
	  BACKGROUND: #EFEFEF; BORDER-LEFT: #4E759C 1px solid; COLOR: #4E759C; BORDER-BOTTOM: #4E759C 1px solid;HEIGHT: 20px;width: 60px
       }
    -->  
     </style>
	
	
    <script src="js/onclock.JS"></script>
  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
  <body onLoad="clockon(bgclock)" background="Images/bg2.gif">
    <script language="javascript">
	function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
</script>
  
  <% 
    String chej = "zz";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String vdate1 ="";
    if (request.getParameter("v1")!=null) vdate1 = new String(request.getParameter("v1"));
    String vdate2 ="";
    if (request.getParameter("v2")!= null) vdate2 =new String(request.getParameter("v2"));
    String dtname=" ";
    if (!chej.equals("")) { dtname="ysppj"+chej; } else { };
    String user="";
    if (request.getParameter("user")!=null) user= new String(request.getParameter("user"));;
    if (user.equals("41")) chej="zz";
    if (user.equals("42")) chej="ys";
    if (user.equals("43")) chej="ly";
    
  %>
  
  <table background="Images/Top_02.gif" width="871" height="92" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
  <td  height="80%" valign="center" align="center" width="803" height="166" style="FONT:20px 黑体;COLOR:#ffffff;HEIGHT:18px;BACKGROUND-COLOR:#DFFF1F9">配&nbsp;件&nbsp;管&nbsp;理&nbsp;-&nbsp;>&nbsp;配&nbsp;件&nbsp;已&nbsp;索&nbsp;赔&nbsp;情&nbsp;况&nbsp;编&nbsp;辑</td>
  </tr>
  <tr>
  <td align="right" height="20%">
     <div><script src="JS/onclock.JS"></script><div id="bgclock" class="word_yellow"></div>
  </td>
  </tr>
  </table>
 <table  class="tableBorder_LR" width="871" height="92" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ffffff">
  <tr>
  <td align="center"> 
  <table width="100%" height="60" border="0" align="center" cellpadding="-2" cellspacing="1"  bgcolor="#ffffff">
  <tr>
  
  <td align="center" colspan="">
  <%if (user.equals("admin")) { %>
  <form name="form" method="post" action="pjgl/editysppj.jsp">选择检修车间:
  <input type="hidden" name="user" value=<%=user%>>
  <input type="radio" name="cj" value="zz" <%if (chej.equals("zz")) out.print("checked"); %>> 郑州检修车间
  <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) out.print("checked"); %>> 月山检修车间
  <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) out.print("checked"); %>> 洛阳检修车间
  <input type="submit" name="Submit" class="Style_button" value="  确   定  " >
  </form> 
  <%} %>
  </td>
  
  </tr>
  <tr>
   <td align="center" >
    <form name="form2" method="post" action="pjgl/editysppj.jsp">
           <input width="10" name="cj" type="hidden" size="16"  value="<%=chej%>">请输入要查询的日期：从
           <input width="20" name="v1" type="text" size="16" ondblClick="loadCalendar(this)" value="<%=vdate1%>">到
           <input width="20" name="v2" type="text" size="16" ondblClick="loadCalendar(this)" value="<%=vdate2%>">
           <input type="hidden" name="user" value=<%=user%>>
           <input type="submit" name="Submit" class="Style_button" value="  查  询  " >
    </form>
   </td>
  </tr>
  </table>

<table   width="99%"  cellpadding="-1" cellspacing="1"  bgcolor="#ffffff">
<tr align="center"  height="25">
<td colspan="13" bgcolor="#6595D6" style="color:#ffffff;font-size:12;font-family:宋体"><div align="center" >
<% if (chej.equals("zz")) { %>[郑州检修车间] 配件已索赔情况明细<%} else{} %>
<% if (chej.equals("ys")) { %>[月山检修车间] 配件已索赔情况明细<%} else{}%>
<% if (chej.equals("ly")) { %>[洛阳检修车间] 配件已索赔情况明细<%} else{}%>
</div></td>
</tr>
<tr align="center" >
    <td width="10%" height="25"  class=tablebody2>日期</td>
    <td width="10%" class=tablebody2 >配件名称</td>
    <td width="10%" class=tablebody2 >配件型号</td>
    <td width="10%" class=tablebody2 >制造厂代号</td>
    <td width="10%" class=tablebody2 >制造时间</td>
    <td width="10%" class=tablebody2 >数&nbsp;量</td>
    <td width="30%" class=tablebody2 >备&nbsp;注</td>
    <td width="5%"  class=tablebody2><font color="#0000ff">修改</td>
    <td width="5%"  class=tablebody2><font color="#ff0000">删除</font></td>
</tr>
<% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Condsp = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 

   String StrPg = request.getParameter("Pageysp");
            	if (StrPg == null)
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rsysp;
   if (Condsp!= null)
            	{
            		try
            		{
            		String  sql2="";
            		    
                        if (vdate1!= null && !vdate1.equals("") && vdate2!= null && !vdate2.equals(""))
						{   
						   sql2 = "select * from "+dtname+" where rq>='"+vdate1+"'" +" && rq<='"+vdate2+"'"+" order by rq desc";
						}
						else {
							sql2 = "Select * From "+dtname+" order by rq desc";
						}
						Smts = Condsp.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsysp = Smts.executeQuery(sql2);
            			
                        Rsysp.last();
                        int j = 0;
            			CountR = Rsysp.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsysp.first();
            			if (CountR>0)
            			{
            				Rsysp.absolute(CurrPg*PgSize-PgSize+1);
	            			while (j<PgSize && !Rsysp.isAfterLast())
            			    {     
            			%>
           			    <tr height="25">
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("rq")%></div></td>
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("pjmc")%></div></td> 
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("xinghao")%></div></td>
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("zzcdh")%></div></td>
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("zzsj")%></div></td>
                            <td bgcolor="#ccccff"><div align="center"><%=Rsysp.getString("shuliang")%></div></td>
                            <% if (Rsysp.getString("beizhu")!=null) { %>   <td bgcolor="#ccccff"><div align="center" ><%=Rsysp.getString("beizhu")%></div></td> <% } else 
                            { %>   <td bgcolor="#ccccff"><div align="center" ></div></td> <% } %>
                            <td bgcolor="#ccccff"><div align="center">
                            <a href="pjgl/updateysppj.jsp?ID1=<%=Rsysp.getString("num")%>ID2=<%=chej%>">
                            <img src="Images/edit.gif" width="12" height="12" border="0" ></div></td>
                            <td bgcolor="#ccccff"><div align="center">
                            <a href="pjgl/editysppj.jsp?cj=<%=chej%>&user=<%=user %>" onClick="Javascript:window.open('delysppj.jsp?ID1=<%=Rsysp.getString("num")%>&ID2=<%=chej%>','','width=519,height=155')">
                            <img src="Images/del.gif"  width="16" height="16" border="0" ></a></div></td>
                        </tr>  
              <%
					            Rsysp.next();
					            j++;
					    }
					    }
		    }
           catch (SQLException e)
            		{
            			out.println("");
            		}
            		finally
            		{
            			Condsp.close();
            		}	
            }    
%>
</table>
<table bgcolor="#ffffff" align="center"  width="98%"> <tr >
<td   style="color:#08236F;font-size:12;">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录</td>
          <td width="260">
            <div align="right"><
              <% for (int j = 1;j<=CountPg;j++){%>
                <a href="pjgl/editysppj.jsp?Pageysp=<%=j%>&v1=<%=vdate1%>&v2=<%=vdate2%>&cj=<%=chej%>&user=<%=user %>"><%=j%></a> 
              <%}%>
            ></div></td></tr>        
  <tr align="right">
  <td colspan="2"></td>
  <td  width="80" align="right" colspan="" height="20" ><div>[<a href="pjgl/editysppj.jsp?cj=<%=chej%>&user=<%=user%>" onClick="Javascript:window.open('insertysppj.jsp?cj=<%=chej%>','','width=680,height=500')">添加记录</a>]</div></td>
</tr>            
</table>
</td>
</tr>
</table>
<table>
<tr>
  <table width="871" height="30" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#BEE09C" bgcolor="#ffffff">
 <tr >
  <td colspan="2" height="56" bgcolor="#FFFFFF"><div align="center" style="color:#666666 ">
  <jsp:include page="CopyRight.html"/>
            </div></td></tr>
</table>
 </body>
</html>
