<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
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
    
    <title>车间级会议</title>
    
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
   <%      String meettime="";
   String zcr="";
   String cjr="";
   String nr="";
   String rt="";
   
    	boolean islog = false;
    	try {
    		islog = ((String) session.getAttribute("islog")).equals("1");
    	} catch (Exception e) {
    	}
    	String chej = "";
    	//-  识别所属车间 --
    	if ((islog)&& (((String) session.getAttribute("deptment")).equals("41"))) { chej = "zz";
    	} else {if ((islog)&& (((String) session.getAttribute("deptment")).equals("43"))) { chej = "ly";
    		} else { if ((islog)&& (((String) session.getAttribute("deptment")).equals("42"))) { chej = "ys";
    			} else { if ((islog)&& (((String) session.getAttribute("deptment")).equals("44"))) { chej = "zl";
    		           }
    			}
    		}
    	}
    	String currpg = "";
    	if (request.getParameter("page") != null)  	currpg = new String(request.getParameter("page"));
    	String str = "";
    	if (request.getParameter("cj") != null)  	chej = new String(request.getParameter("cj"));
    	if (chej.equals("zz"))    		str = "郑州检修车间";
    	if (chej.equals("ly"))    		str = "洛阳检修车间";
    	if (chej.equals("ys"))    		str = "月山检修车间";
    	if (chej.equals("zl"))    		str = "郑州轮轴车间";
    	String hylb = "";
    	if (request.getParameter("cjhy") != null)  	hylb = new String(request.getParameter("cjhy"));
    	String tabname = "cj";
    	if (hylb.equals("1")) {  tabname = tabname + "sch";  str = str + "生产分析会"; 	}
    	if (hylb.equals("2")) {  tabname = tabname + "lxh";  str = str + "党政联席会";	}
    	if (hylb.equals("3")) {  tabname = tabname + "zlh";  str = str + "质量分析会";    }
    	if (hylb.equals("4")) {  tabname = tabname + "zth";  str = str + "专题分析会";    }
    	if (!chej.equals(""))  tabname = tabname + chej;

    	String rq = "";
    	if (request.getParameter("value") != null)   rq = new String(request.getParameter("value"));
    %> 
  <table align="center" valign="top" width="871" class="tableBorder_LR">
  <tr><td width="871" bgcolor="#ffffff" > 
  <table border="0" height="500" bgcolor="#ffffff" valign="top" align="center" cellpadding="-2" cellspacing="-2">
  <tr>
  <td width="380"  class="tdBorder_R"   valign="top"><div>
  <form name="form" method="post" action="hygl/hygl.jsp">
  <table width="380" valign="top" >
     <tr><td  width="380"     align="center" class="wordred">
      <% 
      //-  识别所属车间,如不是车间要选择车间 --
      	if ((islog)&& (!((String) session.getAttribute("deptment")).equals("41"))
      		&& (!((String) session.getAttribute("deptment")).equals("43"))
      		&& (!((String) session.getAttribute("deptment")).equals("42"))
      		&& (!((String) session.getAttribute("deptment")).equals("44"))) {
      %><div align="left">请选择车间：</div> 
        <div>
            <input name="cj" type="radio" value="zz" <%if (chej.equals("zz")) out.print("checked"); %>> 郑州检修车间
            <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) out.print("checked"); %>> 月山检修车间
        </div>
        <div>
            <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) out.print("checked"); %>> 洛阳检修车间
            <input type="radio" name="cj" value="zl" <%if (chej.equals("zl")) out.print("checked"); %>> 郑州轮轴车间
        </div>
      <%
      }
      %>
      </td></tr>
      <tr><td width="380" height="30"  align="center" class="stylered">
          <%=str%>会议日期：<input type="text" name="value" class="inputbd"   ondblclick="loadCalendar(this)" value="<%=rq%>">
      </td></tr>
      <tr><td height="30" align="center" >
      <input type="submit" name="Submit" class="Style_btn" value="  确  定  " >
      <input type="hidden" name="page" value="<%=currpg%>">
      <input type="hidden" name="cjhy" value="hylb"></td>
      </tr>
   </table></form></div>
    
      <div>
      <table  valign="top"  width="99%"   border="1" align="center" cellpadding="-2" cellspacing="-2" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
      <tr><td align="center" height="28" colspan="4" class="wordred"><%=str%>列表
      <tr border="1" height="25">
          <td width="55%"><div align="center" class="wordred">会议主题</div></td>
          <td width="15%"><div align="center" class="wordred">主持人</div></td>
          <td width="20%"><div align="center" class="wordred">会议时间</div></td>
          <td width="10%"><div align="center" class="wordred">删除</div></td>
      </tr>
  
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
   ResultSet Rscjhy;
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
            			Rscjhy = Smts.executeQuery(sql);
            			
                        Rscjhy.last();
                        int i = 0;
            			CountR = Rscjhy.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rscjhy.first();
            			
            			if (CountR>0)
            			{
            				Rscjhy.absolute(CurrPg*PgSize-PgSize+1);
	            			while (i<PgSize && !Rscjhy.isAfterLast())
            			    {     
  	                       %>
            			    <tr border="1" >
                            <td width="55%"><div align="center">
                            <a href="hygl/hygl.jsp?cj=<%=chej%>&page=<%=currpg%>&cjhy=<%=hylb%>&rq=<%=rq%>&hyno=<%=Rscjhy.getString("id")%>&recpg=<%=CurrPg%> " title="点击看详情">
                            <%=Rscjhy.getString("rt")%></a></div></td>
                            <td width="15%"><div align="center" ><%=Rscjhy.getString("zcr")%></div></td> 
                            <td width="20%" ><div align="center"><%=Rscjhy.getString("rq")%></div></td> 
                            <td width="10%" ><div align="center">
                            <%if (((String) session.getAttribute("deptment")).equals("41")
  			                  || ((String) session.getAttribute("deptment")).equals("42")
  			                  || ((String) session.getAttribute("deptment")).equals("43")
  			                  || ((String) session.getAttribute("deptment")).equals("44")
  			                  || ((String) session.getAttribute("deptment")).equals("admin")) 
  			                 {
  		                         if (((String) session.getAttribute("zw")).equals("3")
  		                         || ((String) session.getAttribute("zw")).equals("1")
  		                         || ((String) session.getAttribute("zw")).equals("6")
  		                         || ((String) session.getAttribute("zw")).equals("cjadmin")
  		                         || ((String)session.getAttribute("deptment")).equals("admin")) 
  		                         {
                                 %><a href="hygl/hygl.jsp?cj=<%=chej%>&page=<%=currpg%>&cjhy=<%=hylb%>&rq=<%=rq%>" onClick="Javascript:window.open('delhy.jsp?ID1=<%=Rscjhy.getString("id")%>&ID2=<%=tabname%>','','width=519,height=155')">
                                  <img src="Images/del.gif" width="16" height="16" border="0" ></a><%
                                 } else{%> <img src="Images/nodel.gif" width="16" height="16" border="0" > <%}
                             } else {%> <img src="Images/nodel.gif" width="16" height="16" border="0" > <% }%>
                             </div></td> </tr>
                           <%
					            Rscjhy.next();
					            i++;
					         }
					     }
					 
	                 %>
	                 				 
	  </table></div>
	  <div>
          <table  bgcolor="#ffffff" align="center"  width="386"  > 
          <tr><td  style="color:#08236F;font-size:12;">[<%=CurrPg%>/<%=CountPg %>] 每页15条 共<%=CountR%>条记录</td></tr>
          <tr>
          <td  rowspan="2" class="wordred" align="left" height="22"><div>
          <form name="formpg" method="post" action="hygl/hygl.jsp">转到第
            <input name="recpg" type="text" size="3" class="inputbdpg">&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_btngo">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="page" type="hidden" value="<%=currpg%>">
          </form></div>
          </td>
          </tr>
          <tr><td height="2"></td>
          <td height="25" valign="top">
          <a href="hygl/hygl.jsp?page=<%=currpg%>&cj=<%=chej%>&recpg=1">首页</a>
           <%if (CurrPg>1){%>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CurrPg-1%>&cj=<%=chej%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CurrPg+1%>&cj=<%=chej%>">下一页</a> 
            <%
          	}
          %>
            <a href="hygl/hygl.jsp?page=<%=currpg%>&recpg=<%=CountPg%>&cj=<%=chej%>">最后一页</a>
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
  			if (((String) session.getAttribute("deptment")).equals("41") 
  			|| ((String) session.getAttribute("deptment")).equals("42")
  			|| ((String) session.getAttribute("deptment")).equals("43") 
  			|| ((String) session.getAttribute("deptment")).equals("44")
  			|| ((String) session.getAttribute("deptment")).equals("admin")) {
  		        if (((String) session.getAttribute("zw")).equals("3") 
  		         || ((String) session.getAttribute("zw")).equals("1")
  		            || ((String) session.getAttribute("zw")).equals("6") 
  		            || ((String) session.getAttribute("zw")).equals("cjadmin")
  		            ||((String)session.getAttribute("deptment")).equals("admin")) {
  		         if (!chej.equals("")) {
       %> 
             <img   width="20" height="18" src="Images/add.gif" >
             <a href="hygl/hygl.jsp?cj=<%=chej%>&page=<%=currpg%>&cjhy=<%=hylb%>&rq=<%=rq%>" onClick="Javascript:window.open('inshy.jsp?ID1=<%=tabname%>','','width=690,height=660')" >添加会议记录&nbsp;&nbsp;&nbsp;</a>
             <% }
             	}
             	}
             %>
        
   </td></tr>
   </table></div>    
      </td>
   
  <td width="470" valign="top" >
  <div>
 <%  String recno="";
     if (request.getParameter("hyno") != null)   recno= new String(request.getParameter("hyno"));
 %>
  <table width="467"  border="0" cellpadding="-2" cellspacing="-2" >
  <tr  >
  <td>
  <table  width="467" height="26"  border="0" cellpadding="-2" cellspacing="-2" background="Images/meeting_01.gif">
  <tr>
  <td align="left"   valign="middle" height="33" width="10%" class="style2"><%=str%></td>
  <td align="left"   valign="middle" height="33" width="20%"></td>
  </tr>
  </table>
  </td>
  </tr>
  <tr>
        <td height="26"  colspan="2">
        <div>
        <table background="Images/line.gif" width="100%">
        <% if (!recno.equals("")) { %>
        <tr align="left">
        <td height="26" align="align" ><font color="#C60001">
        <%
  			if (((String) session.getAttribute("deptment")).equals("41")
  			|| ((String) session.getAttribute("deptment")).equals("42")
  			|| ((String) session.getAttribute("deptment")).equals("43")
  			|| ((String) session.getAttribute("deptment")).equals("44")
  			|| ((String) session.getAttribute("deptment")).equals("admin")) {
  		if (((String) session.getAttribute("zw")).equals("3")
  		|| ((String) session.getAttribute("zw")).equals("1")
  		|| ((String) session.getAttribute("zw")).equals("6")
  		|| ((String) session.getAttribute("zw")).equals("cjadmin")
  		|| ((String)session.getAttribute("deptment")).equals("admin")) {
        
         %> <img   width="15" height="15" src="Images/modify.gif" >
         <a href="hygl/hygl.jsp?cj=<%=chej%>&page=<%=currpg%>&cjhy=<%=hylb%>&rq=<%=rq%>&hyno=<%=recno%>&recpg=<%=CurrPg%>" onClick="Javascript:window.open('updatehy.jsp?ID1=<%=recno%>&ID2=<%=tabname%>','','width=690,height=660')" >修改会议记录</a>
             <% }
             	}
             %>
        </td>
        <td >
        <img   width="16" height="16" src="Images/winword.JPG" >
         <a href="hygl/hygl.jsp?cj=<%=chej%>&page=<%=currpg%>&cjhy=<%=hylb%>&rq=<%=rq%>&hyno=<%=recno%>&recpg=<%=CurrPg%>" onClick="javascript:outDoc()">会议记录导出Word</a>
        </td>
        
        <td width="40%"></td>
        </tr>  
        <%  } %>  
        </table>
        </div>
        </td>
        </tr>
  </table>
  </div><div>
  
  <table id="tab"  width="467" border="0" cellpadding="-2" cellspacing="-2" align="left" >
  <%
   Statement Smts2; 
   ResultSet Rscjhynr;


   String sqlnr="";
  if (Con!= null)
            	{
            		try
            		{
            		   sqlnr = "Select * From "+tabname+" where id='"+recno+"'";
						
						Smts2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rscjhynr = Smts2.executeQuery(sqlnr);
            			
                        Rscjhynr.last();
                        CountR = Rscjhynr.getRow();
            			Rscjhynr.first();
            			
            			if (CountR>0)
            			{
            				
	            			while (!Rscjhynr.isAfterLast())
            			    { 
            			    rt=Rscjhynr.getString("rt");
            			    meettime=Rscjhynr.getString("rq");
            			    zcr=Rscjhynr.getString("zcr");
            			    cjr=Rscjhynr.getString("cjr");
            			    nr=Rscjhynr.getString("nr");
            			     
  	                       %>
            			    <tr border="0" height="26" align="left">
                                <td height="26" background="Images/line.gif"><font color="#C60001">会议主题:&nbsp;</font> </td>
                                <td height="26" background="Images/line.gif"><%=rt%></td>
                            </tr>
                            <tr><td height="26" background="Images/line.gif"><font color="#C60001">会议日期:&nbsp;</font> </td>
                                <td height="26" background="Images/line.gif"><%=meettime%></td>
                            </tr>
                            <tr><td height="26" background="Images/line.gif"><font color="#C60001">会议主持人:</font></td>
                                <td height="26" background="Images/line.gif"><%=zcr%></td> 
                            </tr>
                            <tr><td height="26" background="Images/line.gif"><font color="#C60001">会议参加人:</font></td>
                                <td height="26" background="Images/line.gif"><%=cjr%></td> 
                            </tr>
                            <tr><td width="15%" valign="top"><font color="#C60001">会议内容:</font>&nbsp;</td>
                                <td  ><textarea rows="35" cols="75" ><%=nr%></textarea></td>
                            </tr>  
                           <%
					            Rscjhynr.next();
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
  </table>
  </div>
  </td></tr>
  </table>
  </td></tr>
  </table>
  <script language="javascript">
 function outDoc()
 {
  var oWD = new ActiveXObject("Word.Application");
  var oDC = oWD.Documents.Add("",0,1);
  var oRange =oDC.Range(0,1);
  var sel = document.body.createTextRange();
  sel.moveToElementText(tab);
  sel.select();
  sel.execCommand("Copy");
  oRange.Paste();
  oWD.Application.Visible = true;
  //window.close();
 }

</script>
</body>
</html>
