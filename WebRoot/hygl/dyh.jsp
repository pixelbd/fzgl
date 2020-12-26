<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    
    <title>段验会议</title>
    
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
<%  boolean islog = false;
    	try {
    		islog = ((String) session.getAttribute("islog")).equals("1");
    	} catch (Exception e) {
    	}
%> 
   <table align="center" width="871" class="tableBorder_LR" valign="top" bgcolor="#ffffff">
  <tr>
  <td><div>
     <table width="556"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
     <tr>
         <td  <% if ((islog)&& (((String) session.getAttribute("deptment")).equals("admin"))) {%>
             colspan="6"<% } else { %> colspan="5" <% } %> align="center" align="right"  ><img width="556" height="44" src="Images/lxh.gif"  ></td>
         <td></td>
     </tr>
     <tr height="27">
          <td width="50%" ><div align="center">标题</div></td>
          <td width="10%" ><div align="center">上传人</div></td>
          <td width="15%" ><div align="center">上传部门</div></td>
          <td width="15%" ><div align="center">上传时间</div></td>
          <td width="5%" ><div align="center">下载</div></td>
          <td width="5%"><% if ((islog)&& (((String) session.getAttribute("deptment")).equals("admin"))) {%>
             删除<% } %></td>
     </tr>
     <%
     Class.forName("org.gjt.mm.mysql.Driver").newInstance();
     Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/hygl","root","123"); 
     String tabname="dyh";
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
    ResultSet Rsdyh;
    String  sql="Select * From "+tabname+" order by rq desc";
    
    if (Con!= null)
            	{
            		try
            		{
            		  
						Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdyh = Smts.executeQuery(sql);
            			
                        Rsdyh.last();
                        int i = 0;
            			CountR = Rsdyh.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsdyh.first();
            			
            			if (CountR>0)
            			{
            				Rsdyh.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rsdyh.isAfterLast())
            			    {     
  	                       %>
            			    <tr border="1" height="25">
                            <td width="50%"><div align="center" ><%=Rsdyh.getString("title")%></div>
                            <td width="10%"><div align="center" ><%=Rsdyh.getString("scr")%></div></td> 
                            <td width="15%"><div align="center" ><%=Rsdyh.getString("bm")%></div></td>
                            <td width="15%" ><div align="center"><%=Rsdyh.getString("rq")%></div></td> 
                            <td width="5%" ><div align="center">
                            <%String fpath="E:\\dyh\\"+Rsdyh.getString("filename");%> 
                               <a href="hygl/download.jsp?path=<%=fpath%>">
                               <img src="Images/download.GIF" width="22" height="22" border="0" ></a></div>
                            </td>
                            <td width="5%" ><div align="center"><% if ((islog)&& (((String) session.getAttribute("deptment")).equals("admin"))) {%>
                            <a href="hygl/hygl.jsp?page=7" onClick="Javascript:window.open('delhy.jsp?ID1=<%=Rsdyh.getString("id")%>&ID2=dyh','','width=519,height=155')">
                            <img src="Images/del.gif" width="16" height="16" border="0" ></a>
                            <% } %></div>
                            </td>
                            </tr>
                           <%
					            Rsdyh.next();
					            i++;
					         }
					     }
					}
                   catch (SQLException e)
            		{    
            		     out.println("");
            		}
            		finally
            		{
            		     Con.close();
            		}
     } %>				 
	  </table></div>
	  <div>
          <table width="556" bgcolor="#ffffff" cellspacing="1" align="center"  width="386"> 
         <tr><td  style="color:#08236F;font-size:12;">[<%=CurrPg%>/<%=CountPg %>] 每页15条 共<%=CountR%>条记录</td></tr>
         <tr><td  rowspan="2" class="wordred" align="left" height="22"><div>
          <form name="formpg" method="post" action="hygl/hygl.jsp">转到第
            <input name="recpg" type="text" size="3" class="inputbdpg">&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_btngo">
            <input name="page" type="hidden" value="7">
          </form></div>
          </td>
          </tr>
          <tr><td height="2"></td>
          <td height="25" valign="top">
          <a href="hygl/hygl.jsp?page=7&recpg=1">首页</a>
           <%if (CurrPg>1){%>
            <a href="hygl/hygl.jsp?page=7&recpg=<%=CurrPg-1%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="hygl/hygl.jsp?page=7&recpg=<%=CurrPg+1%>">下一页</a> 
            <%
          	}
          %>
            <a href="hygl/hygl.jsp?page=7&recpg=<%=CountPg%>">最后一页</a>
            </td>
        </tr>
         </table>            
     </div>
     <% 
        
         if ((islog)&& ((((String) session.getAttribute("deptment")).equals("21"))
          || (((String) session.getAttribute("deptment")).equals("22")) || (((String) session.getAttribute("deptment")).equals("admin")))) {%>       
         <div><table width="556"  height="40" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
         <tr>
         <td border="0" colspan="1" valign="center" align="center"  class="tdBorderno">【 技术科、验收室专有功能 】</td>
         <td border="0" colspan="1" valign="center" align="left"  class="tdBorderno"><img width="26" height="26" src="Images/upload.gif"></td>
         <td colspan="2"  align="left"><a  href="hygl/hygl.jsp?page=7" onClick="Javascript:window.open('uploaddyh.jsp','','width=600,height=400')">&nbsp;&nbsp;上传段验会议记录</a></td>
         </tr>
         </table> </div> <%} %>
  </td>
  </tr>
  </table>

  </body>
</html>
