<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%  
    int CountPg = 0;
	int CurrPg = 1;
	int PgSize = 15;
	int CountR = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>段级会议</title>
    
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
   function loadCalendar(field){
   var rtn = window.showModalDialog("calendar.jsp","","dialogWidth:290px;dialogHeight:250px;status:no;help:no;scrolling=no;scrollbars=no");
	if(rtn!=null)
		field.value=rtn;
   return;
   }
   </script> 
   <%
    	boolean islog = false;
    	try {
    		islog = ((String) session.getAttribute("islog")).equals("1");
    	} catch (Exception e) {
    	}
    	
    	String currpg = "";
    	if (request.getParameter("page") != null)  	currpg = new String(request.getParameter("page"));
    	String str = "段级";
    	String tabname = "d";
    	if (currpg.equals("5")) {  tabname = tabname + "sch";  str = str + "生产分析会"; 	}
    	if (currpg.equals("6")) {  tabname = tabname + "qth";  str = str + "其他会议";	}
    	String rq = "";
    	if (request.getParameter("value") != null)   rq = new String(request.getParameter("value"));
    %> 
  <table align="center" width="871" class="tableBorder_LR" valign="top">
  <tr><td width="871" bgcolor="#ffffff" > 
  <table border="0" bgcolor="#ffffff"  cellpadding="-2" cellspacing="-2" >
  <tr><td width="380" class="tdBorder_R"   align="center" valign="top"><div>
  <table width="380" >
        <tr><td width="380" height="30"  align="center" class="stylered">
      <form name="form" method="post" action="hygl/hygl.jsp"><%=str%>会议日期：
      <input type="text" name="value" class="inputbd"   ondblclick="loadCalendar(this)" value="<%=rq%>">
      <input type="submit" name="Submit" class=Style_btn value="  确  定  " >
      <input type="hidden" name="page" value="<%=currpg%>">
      </form>
      </td>
      </tr>
  </table></div>
  <div>
      <table width="100%" height="27"  border="1" align="center" cellpadding="-2" cellspacing="-2" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
      <tr><td align="center" height="25" colspan="5" class="wordred"><%=str%>列表
      <tr border="1">
          <td width="50%"><div align="center" class="wordred">会议主题</div></td>
          <td width="15%"><div align="center" class="wordred">主持人</div></td>
          <td width="15%"><div align="center" class="wordred">会议时间</div></td>
          <td width="10%"><div align="center" class="wordred">地点</div></td>
          <td width="15%"><div align="center" class="wordred">操作</div></td></tr>
      <% 
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
   
   String StrPg = request.getParameter("recpg");
            	if (StrPg == null)
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rsdjhy;
   String  sql="";
   if (Con!= null)
            	{
            		try
            		{
            		  if ((rq!= null) && !rq.equals(""))
						{   
						   sql = "select * from "+tabname+" where rq='"+rq+"' order by rq DESC";
						}
						else {
							sql = "Select * From "+tabname+" order by rq desc";
						}
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdjhy = Smts.executeQuery(sql);
            			
                        Rsdjhy.last();
                        int i = 0;
            			CountR = Rsdjhy.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsdjhy.first();
            			
            			if (CountR>0)
            			{
            				Rsdjhy.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rsdjhy.isAfterLast())
            			    {     
  	                       %>
            			    <tr border="1" height="25">
                            <td width="50%"><div align="center">
                            <a href="hygl/hygl.jsp?page=<%=currpg%>&rq=<%=rq%>&hyno=<%=Rsdjhy.getString("id")%> ">
                            <%=Rsdjhy.getString("rt")%></a></div></td>
                            <td width="15%"><div align="center" ><%=Rsdjhy.getString("zcr")%></div></td> 
                            <td width="15%" ><div align="center"><%=Rsdjhy.getString("rq")%></div></td> 
                            <td width="10%" ><div align="center"><%=Rsdjhy.getString("dd")%></div></td>
                            <td width="15%" ><div align="center">
                            <%if (((String) session.getAttribute("deptment")).equals("41")
  			                  || ((String) session.getAttribute("deptment")).equals("42")
  			                  || ((String) session.getAttribute("deptment")).equals("43")
  			                  || ((String) session.getAttribute("deptment")).equals("44")
  			                  || ((String) session.getAttribute("deptment")).equals("admin")) 
  			                 {
  		                         if (((String) session.getAttribute("zw")).equals("3")
  		                         || ((String) session.getAttribute("zw")).equals("1")
  		                         || ((String) session.getAttribute("zw")).equals("6")
  		                         || ((String) session.getAttribute("deptment")).equals("admin")) 
  		                         {
                                 %><a href="hygl/hygl.jsp?page=<%=currpg%>&rq=<%=rq%>" onClick="Javascript:window.open('delhy.jsp?ID1=<%=Rsdjhy.getString("id")%>&ID2=<%=tabname%>','','width=519,height=155')">
                                  <img src="Images/del.gif" width="16" height="16" border="0" ></a><%
                                 } else{%> <img src="Images/nodel.gif" width="16" height="16" border="0" > <%}
                             } else {%> <img src="Images/nodel.gif" width="16" height="16" border="0" > <% }%>
                             </div></td> </tr>
                           <%
					            Rsdjhy.next();
					            i++;
					         }
					     }
					 
	                 %>
	                 				 
	  </table></div>
	  <div>
          <table  bgcolor="#ffffff" align="center"  width="386"> 
          <tr><td  style="color:#08236F;font-size:12;">[<%=CurrPg%>/<%=CountPg %>] 每页15条 共<%=CountR%>条记录</td></tr>
          <tr>
          <td  rowspan="2" class="wordred" align="left" height="22"><div>
          <form name="formpg" method="post" action="hygl/hygl.jsp">转到第
            <input name="recpg" type="text" size="3" class="inputbdpg">&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_btngo">
            <input name="page" type="hidden" value="<%=currpg%>">
          </form></div>
          </td>
          </tr>
          <tr><td height="2"></td>
          <td height="25" valign="top">
          <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=1">首页</a>
           <%if (CurrPg>1){%>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CurrPg-1%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CurrPg+1%>">下一页</a> 
            <%
          	}
          %>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CountPg%>">最后一页</a>
            </td>
        </tr>
         </table>           
         
     </div>
      <% }
                   catch (SQLException e)
            		{    
            		     out.println("");
            		}
            		finally
            		{
            			 
            		}
          } %>
       <div>
       <table>
          <tr><td align="right" valign="center">
       <%
  			if (!((String) session.getAttribute("deptment")).equals("41")
  			|| !((String) session.getAttribute("deptment")).equals("42")
  			|| !((String) session.getAttribute("deptment")).equals("43")
  			|| !((String) session.getAttribute("deptment")).equals("44")
  			|| ((String) session.getAttribute("deptment")).equals("admin")) {
  		%> 
             <img   width="20" height="18" src="Images/add.gif" >
             <a href="hygl/hygl.jsp?page=<%=currpg%>&rq=<%=rq%>" onClick="Javascript:window.open('inshy.jsp?ID1=<%=tabname%>','','width=690,height=660')" >添加会议记录&nbsp;&nbsp;&nbsp;</a>
       <% } %>
   </td></tr>
   </table></div></td>
   
  <td width="470" valign="top" >
  <div>
 <%  String recno="";
     if (request.getParameter("hyno") != null)   recno= new String(request.getParameter("hyno"));
 %>
  <table width="467" height="54"  border="0" cellpadding="-2" cellspacing="-2" background="Images/meeting_01.gif" >
  <tr>
  <td align="left"   valign="middle" height="33" width="10%" class="style2"><%=str%></td>
  <td align="left"   valign="middle" height="33" width="20%">
  <%     if (!recno.equals("")) {
  			if (!((String) session.getAttribute("deptment")).equals("41")
  			|| !((String) session.getAttribute("deptment")).equals("42")
  			|| !((String) session.getAttribute("deptment")).equals("43")
  			|| !((String) session.getAttribute("deptment")).equals("44")
  			|| ((String) session.getAttribute("deptment")).equals("admin")) {
  %> 
             <img   width="15" height="15" src="Images/modify.gif" >
             <a href="hygl/edithy.jsp?ID1=<%=recno%>&ID2=<%=currpg%>" target="newwindow"  >修改会议记录</a>
   <% } }%>
   </td>
  </tr>
  <tr>
        <td height="21"  colspan="2">&nbsp;</td>
        </tr>
  </table>
  </div><div>
  <table  width="467" border="0" cellpadding="-2" cellspacing="-2" align="left" >
  <%

   Statement Smts2; 
   ResultSet Rsdjhynr;
   String sqlnr="";
  if (Con!= null)
            	{
            		try
            		{
            		   sqlnr = "Select * From "+tabname+" where id='"+recno+"'";
						
						Smts2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdjhynr = Smts2.executeQuery(sqlnr);
            			
                        Rsdjhynr.last();
                        CountR = Rsdjhynr.getRow();
            			Rsdjhynr.first();
            			
            			if (CountR>0)
            			{
            				
	            			while (!Rsdjhynr.isAfterLast())
            			    {     
  	                       %>
            			    <tr border="0" height="26" align="left">
                            <td height="26" background="Images/line.gif"><font color="#C60001">会议主题:&nbsp;</font></td>
                            <td background="Images/line.gif"><% if ((currpg.equals("3")) || (currpg.equals("4"))) 
                            { %> <%=Rsdjhynr.getString("rt")%> <%}else { %>对前日生产情况进行分析总结<%} %></td>
                            </tr>
                            <tr height="26"  ><td background="Images/line.gif"><font color="#C60001">会议日期:&nbsp;</font> </td>
                                <td background="Images/line.gif"><%=Rsdjhynr.getString("rq")%></td>
                            </tr>
                            <tr height="26" ><td  background="Images/line.gif" ><font color="#C60001">会议地点:&nbsp;</font> </td>
                                <td  background="Images/line.gif"><%=Rsdjhynr.getString("dd")%></td>
                            </tr>
                            <tr height="26"  ><td background="Images/line.gif"><font color="#C60001">会议主持人:</font></td>
                                <td background="Images/line.gif"><%=Rsdjhynr.getString("zcr")%></td> 
                            </tr>
                            <tr height="26"  ><td background="Images/line.gif"><font color="#C60001">会议参加人:</font></td>
                                <td background="Images/line.gif"><%=Rsdjhynr.getString("cjr")%></td> 
                            </tr>
                            <tr><td   width="450" valign="top"><font color="#C60001">会议内容:</font>&nbsp;</td>
                                <td><textarea rows="35" cols="75" ><%=Rsdjhynr.getString("nr")%></textarea></td>
                            </tr>
                           <%
					            Rsdjhynr.next();
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
          } %>	
  <tr><td height="20"></td></tr>
  </table>
  </div>
  </td></tr>
  </table>
  </td></tr>
  </table>
 
  </body>
</html>
