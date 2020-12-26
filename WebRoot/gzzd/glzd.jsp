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
    
    <title>My JSP 'glzd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<SCRIPT language=javascript src="JS/title1.js"></SCRIPT>
  </head>
 <LINK href="Css/gzzdstyle.css" type=text/css rel=stylesheet> 
  <body>
  <%  
    
    boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	  
    String str="";
    String tabname="";
	String zdlb="";
	String currpage="";
	
	if (request.getParameter("page")!=null) 
	{  currpage=request.getParameter("page");
       if (currpage.equals("2")) { zdlb="2"; str="段级管理制度"; tabname="dglzd"; }
       if (currpage.equals("3")) { zdlb="3"; str="车间管理制度"; tabname="cjglzd"; }
    }
    
    String searchstr=""; 
    if (request.getParameter("searchstr")!=null)  searchstr=request.getParameter("searchstr");
    
    String sql="Select * from "+tabname;
    if (searchstr.equals(""))  { sql=sql+" order by num"; }
       else { sql=sql+" where  ( mc like '"+searchstr+"%'"+") or ( mc like '%"+searchstr+"%') " +" order by num"; }
     
  %>
  <table width="100%" align="center"   border="0"   cellpadding="0" cellspacing="0" >
  <tr>
      <td align="right" ><div>
      <table width="95%"  align="center"  border="0"   cellpadding="0" cellspacing="0">
          <tr>
          <td width="100%" align="center" border="0">
              <table  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                 <td  rowspan="2" width="100" valign="middle" align="center" height="62" ><img width="32" height="31" src="Images/wjdb/searchlist.jpg">
                 </td>
                 <td  height="22" class="word_orange">&nbsp;关&nbsp;键&nbsp;字&nbsp;检&nbsp;索&nbsp;</td>
              </tr>
              <tr>
                 <td height="40"><form action="gzzd/gzzd.jsp" method="post" name="form1" >
                     <input type="hidden" name="page"  value="<%=zdlb%>">
                     <input type="text" name="searchstr" size="80" value="<%=searchstr%>"> &nbsp;&nbsp;
                     <input name="Button1" type="submit" class="Style_button" value="查&nbsp;&nbsp;&nbsp;&nbsp;询" >
                     </form>
                 </td>
              </tr>
              </table>
          </td>
          </tr>
      </table>
      </div>
      </td>
  </tr>
  </table>
  	<table width="100%"    border="0"  cellpadding="0" cellspacing="0">
		<tr>
		    <td width="35" valign="top">
		    <table width="100%"  height="133" border="0"  cellpadding="0" cellspacing="0">
		    <tr>
		        <td width="35" valign="top" height="133" align="right"><img src="Images/wjdb/tableleft.jpg"></td>
		    </tr>
		    </table>
		    </td>
		    <td  valign="top">
		    <table width="100%"  border="0"  cellpadding="0" cellspacing="0">
		    <tr>
		        <td valign="middle" height="28"  background="Images/wjdb/tabletop.jpg"><img src="Images/wjdb/arrow1.jpg"><font color="#ffffff">&nbsp;<%=str%>&nbsp;</font></td>
		    </tr>
		    <tr>
		        <td >
		       
		          <!-- 这里开始进行文件电报的查询 -->
		       <% 
                 Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                 Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/glzd","root","123"); 

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
                        int i = 0;
            			CountR = Rs.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rs.first();
            			if (CountR>0)
            			{
            			%>
            			    <table width="100%" border="0" align="left" cellpadding="-1" cellspacing="-1" >
            			   <!--   
            			    <tr border="0"  height="25"  cellpadding="0" cellspacing="0" bgcolor="#6699CC">
            			    <td bgcolor="#fffff"></td>
                            <td width="82%"><div align="center" class="word_white">&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;&nbsp;</div></td>
                            <td width="8%"><div align="center" class="word_white">性&nbsp;&nbsp;质</div></td>
                            <td width="8%"><div align="center" class="word_white">发布时间</div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin"))) {%>
                            <td colspan="2" align="center" class="word_white">操作</td>
                            <% } %>
                            </tr>  
                           -->
                            <%
            				Rs.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rs.isAfterLast())
            			    {     
  	                        %>
            			    <tr border="0" height="30"   cellpadding="0" cellspacing="0"  >
            			    <td width="5" bgcolor="#fffff"><img  id="img1" src="Images/angle.gif" width="3" height="5" ></td>
                            <td  align="left" bgcolor="#fffff" background="Images/line4.gif">
                            <%String fpath="e:/glzd/"+Rs.getString("filename");%>
                            &nbsp;&nbsp;<a href="gzzd/download.jsp?path=<%=fpath%>" title="<%=Rs.getString("sm")%>"><%=Rs.getString("mc")%></a> 
                            </td>
                            <td align="center" bgcolor="#fffff" background="Images/line4.gif"> <%=Rs.getString("xz")%></td> 
                            <td height="30" bgcolor="#fffff" background="Images/line4.gif"><div align="center">
                            <%if ((Rs.getString("rq")!=null) && (!Rs.getString("rq").equals(""))) 
                            {%>   <%=Rs.getString("rq").replace("-", ".")%>
                            <% } else {%> &nbsp; <% } %>
                            </div></td>
                            <% if((islog) && (((String)session.getAttribute("deptment")).equals("admin"))) {%>
                            <td width="12" align="center" background="Images/line4.gif"><div >
                               <a href="gzzd/editwd.jsp?id=<%=Rs.getString("num")%>">
                               <img src="Images/edit.gif" width="12" height="12" border="0" ></a>
                               </div>
                            </td>
                            <td width="20" align="center" background="Images/line4.gif"><div>
                             <a href="gzzd/gzzd.jsp?page=1&pgcode=<%=CurrPg%>&zdlb=<%=zdlb%>" onClick="Javascript:window.open('del.jsp?ID1=<%=Rs.getString("num")%>&ID2=<%=tabname%>','','width=519,height=155')">
                             <img src="Images/del_file.gif" width="20" height="20" border="0" ></a>
                               </div>
                            </td>
                            <%}%>
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
		          
		  <table   bgcolor="#ffffff" align="center"  width="100%"> 
          <tr>
          <td nowrap class="word_blue" align="left"><form name="form2" method="post" action="gzzd/gzzd.jsp">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="pgcode" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="1">
            <input name="searchstr" type="hidden" value=<%=searchstr%>>
            <input name="zdlb" type="hidden" value="<%=zdlb%>">
            
             </form>
           </td>
           
          <td>
          <a href="gzzd/gzzd.jsp?page=<%=currpage%>&pgcode=1&zdlb=<%=zdlb%>">首页</a>
            
           <%if (CurrPg>1){%>
            <a href="gzzd/gzzd.jsp?page=<%=currpage%>&pgcode=<%=CurrPg-1%>&zdlb=<%=zdlb%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="gzzd/gzzd.jsp?page=<%=currpage%>&pgcode=<%=CurrPg+1%>&zdlb=<%=zdlb%>">下一页</a> 
            <%
          	}
          %>
            <a href="gzzd/gzzd.jsp?page=<%=currpage%>&pgcode=<%=CountPg%>&zdlb=<%=zdlb%>">最后一页</a>
            </td>
        </tr>
        </table><% 
				    }
		            }
                   catch (SQLException e)
            		{
            			out.println("未找到符合条件文电!");
            		}
            		finally
            		{
            			Con.close();
            		}	
      }    %> 
		          </td>
		    </tr>
           </table>
		      
		    <td width="31"  valign="top" align="left"  bordercolor="#ffcccc">
		    <table width="100%"  height="133" border="0"   cellpadding="0" cellspacing="0">
		    <tr>
		        <td valign="top" width="11" height="133" ><img src="Images/wjdb/tableright.jpg"></td>
		    </tr>
		    </table>
		    </td>
		</tr>
		</table>
  </body>
</html>
