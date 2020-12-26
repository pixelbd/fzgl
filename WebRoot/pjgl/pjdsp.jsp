<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>索赔配件 </title>
    
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
    	.word_darkblue{
	    font-size:9pt;
	    color:#122072;}
	    .word_white{
	    font-size:9pt;
	    color:#ffffff;}

    -->  
     </style>
  </head>
<%  
    int CountPgdsp = 0;
	int CurrPgdsp = 1;
	int PgSize = 20;
	int CountRdsp = 0;
    int CountRdata = 0;
    int CountRdata2 = 0;
    int CountRdata3 = 0;
 %>  
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
    //获取当前日期的月份
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
   java.util.Date today=new java.util.Date();
   int nowyear = today.getYear()+1900;
   int nowmonth = today.getMonth()+1; 
  
    String chej = "";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String dspf ="";
    if (request.getParameter("v1")!=null) dspf = new String(request.getParameter("v1"));
    String dspto ="";
    if (request.getParameter("v2")!= null) dspto =new String(request.getParameter("v2"));
  
    String user=(String)session.getAttribute("deptment");
    
    Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123"); 
  %>  
  <!-- 身份识别 -->
 <%
  boolean islog=false;
	  try
	  {
	   islog=((String)session.getAttribute("islog")).equals("1");
	  }
	  catch(Exception e)
	  {	    
	  }
	   //-  识别所属车间,如不是车间要选择车间 --
 %>
     <table align="center"  cellpadding="-2" cellspacing="-2" >
     <tr >
         <td height="28" valign="center" align="left" bgcolor="#ffffff">
 <% if (islog) {
 	if (((String)session.getAttribute("deptment")).equals("41")) { chej="zz";  
     %><div><img width="13" height="13" src="Images/listflag.gif">郑州检修车间配件索赔情况</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("42")) {
     chej="ys"; 
     %><div><img width="13" height="13" src="Images/listflag.gif">月山检修车间配件索赔情况</div>
    <%} else { if(((String)session.getAttribute("deptment")).equals("43")) {
     chej="ly";  
  %><div><img width="13" height="13" src="Images/listflag.gif">洛阳检修车间配件索赔情况</div>
     <% } else { if(((String)session.getAttribute("deptment")).equals("44")) {
     chej="zl";  
  %><div><img width="13" height="13" src="Images/listflag.gif">郑州轮轴车间配件索赔情况</div>
    <% } else {  
     if (request.getParameter("cj")!=null) { 
         if (request.getParameter("cj").equals("zz")) { chej="zz"; %>  <div><img width="13" height="13" src="Images/listflag.gif">郑州检修车间配件索赔情况</div> <%}
            else { if (request.getParameter("cj").equals("ys")) { chej="ys"; %><div><img width="13" height="13" src="Images/listflag.gif">月山检修车间配件索赔情况</div><%}
                      else { if (request.getParameter("cj").equals("ly")) { chej="ly";%><div><img width="13" height="13" src="Images/listflag.gif">洛阳检修车间配件索赔情况</div> <%} 
                             else if (request.getParameter("cj").equals("zl")) { chej="zl";%><div><img width="13" height="13" src="Images/listflag.gif">郑州轮轴车间配件索赔情况</div> <%} 
                           }
                 }
              } %>
     <form name="formcj" method="post" action="pjgl/pjgl.jsp">请选择检修车间:
     <input type="radio" name="cj" value="zz" checked> 郑州检修车间
     <input type="radio" name="cj" value="ys" > 月山检修车间
     <input type="radio" name="cj" value="ly" > 洛阳检修车间
     <input type="radio" name="cj" value="zl" > 郑州轮轴车间
     <input type="hidden" name="page" value="2">
     <input type="hidden" name="sp" value="1">
     <input type="submit" name="Submit" class=Style_button2 value="  选  择  " >
     </form> <% } }}}%>
     <!-- end of 识别所属车间 -->
     </td>
     </tr>
     </table>
     <table   width="100%" align="center" cellpadding="-2" cellspacing="-2" bgcolor="#ffffff">
     <tr><td>
    <table width="100%" height="60"  align="center" cellpadding="-1" cellspacing="-1" bgcolor="#E6F0F9">
    <tr height="29">
    <td  class=word_yellow colspan="11" align="left"   background="Images/bg.jpg">&nbsp;&nbsp;&nbsp;待索赔配件
    </td>
    </tr>
    <tr height="29">
    <td colspan="3" align="center">
            <div >
              <% 
        if  (((String)session.getAttribute("deptment")).equals("41") 
           || ((String)session.getAttribute("deptment")).equals("42")
           || ((String)session.getAttribute("deptment")).equals("43")
           || ((String)session.getAttribute("deptment")).equals("44")
           || ((String)session.getAttribute("deptment")).equals("admin"))
           {
           //5车间材料管理员8工长6技术专职1车间领导可以进行编辑
           if (((String)session.getAttribute("zw")).equals("6")
              ||((String)session.getAttribute("zw")).equals("5")
              ||((String)session.getAttribute("zw")).equals("8")
              ||((String)session.getAttribute("zw")).equals("1")
              ||((String)session.getAttribute("zw")).equals("cjadmin")
              ||((String)session.getAttribute("deptment")).equals("admin")) { %>
           [<a href="pjgl/editsppj.jsp?user=<%=user%>" target=" ">&nbsp;编辑索赔配件记录&nbsp;</a>]
           <%} } else if (((String)session.getAttribute("deptment")).equals("admin")) {%> 
           [<a href="pjgl/editsppj.jsp?user=<%=user%>" target=" ">&nbsp;编辑索赔配件记录&nbsp;</a>]
           <%}%>
            </div>
    </td>
    <td colspan="8" align="center" >
         <form name="dspcx" action="pjgl/pjgl.jsp">查询时间段:从
        <input name="v1" type="text" ondblClick="loadCalendar(this)" value=<%=dspf%>>&nbsp到
        <input name="v2" type="text" ondblClick="loadCalendar(this)" value=<%=dspto%>>
        <input type="hidden" name="cj" value=<%=chej %>>
        <input type="hidden" name="page" value="2">
        <input type="hidden" name="sp" value="1">
        <input type="submit" name="Submit"  class=Style_button value="  查  询  ">
        </form>
    </td>
    </tr>
    <tr>
       <td colspan="11" align="center"><font color="#13566F">
        <% if (dspf!= null && dspf!=null && !dspto.equals("") && !dspto.equals(""))
	   { %>当前显示数据为：从<%=dspf%>到<%=dspto%>待索赔配件情况
	   <%} else { %>当前显示数据为：<%=nowyear%>年<%=nowmonth%>月待索赔配件情况<%} %>
       </font></td>
    </tr>
	<tr>
    <td  align="right"><div><img src="Images/list.gif"></div></td>
    <td  colspan="11" align="left">
        <div><font color="#ff8040">待&nbsp;索&nbsp;赔&nbsp;配&nbsp;件&nbsp;明&nbsp;细</font></div>
    </td>
    </tr>
    <tr>
    <td colspan="11">
    <div>
    
  <%   String StrPgdsp = request.getParameter("gopage");
            	if ((StrPgdsp == null)||(StrPgdsp.equals("")))
            	{
            		CurrPgdsp = 1;
            	}
            	else
            	{
            		CurrPgdsp = Integer.parseInt(StrPgdsp);
            	}
      Statement Smtsdsp; 
      ResultSet Rsdsp;
      if (Con != null)
            	{
            		try
            		{
            		String  sqldsp="";
            		 if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldsp ="Select * From sppj"+chej+"  where  rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'   order by rq desc";
						}
						else {
						   sqldsp ="Select * From sppj"+chej+"  where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'  order by rq desc";
						}
            		  
                        Smtsdsp = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdsp = Smtsdsp.executeQuery(sqldsp);
                        Rsdsp.last();
                        int i = 0;
            			CountRdsp = Rsdsp.getRow();
            			CountPgdsp = (CountRdsp/PgSize);
            			if (CountRdsp%PgSize>0)   CountPgdsp++;
            			Rsdsp.first();
            			if (CountRdsp>0)
            			{
            				Rsdsp.absolute(CurrPgdsp*PgSize-PgSize+1);
            				%>
            				<!-- 索赔配件明细 -->
                            <table class="tableBorder_B1"   cellpadding="-1" cellspacing="1"   >
            				<tr align="center" height="29" >
                            <td width="180"  class=word_white bgcolor="#13566F">日期</td>
                            <td width="100" class=word_white bgcolor="#13566F">配件名称</td>
                            <td width="100" class=word_white bgcolor="#13566F">配件编号</td>
                            <td width="200" class=word_white bgcolor="#13566F">配件型号</td>
                            <td width="200" class=word_white colspan="2" bgcolor="#13566F">原装车型车号</td>
                            <td width="160" class=word_white bgcolor="#13566F">制造厂代号</td>
                            <td width="120" class=word_white bgcolor="#13566F">制造时间</td>
                            <td width="50" class=word_white bgcolor="#13566F">数&nbsp;量</td>
                            <td width="15%" class=word_white bgcolor="#13566F">故障描述</td>
                            <td width="100" class=word_white bgcolor="#13566F">处理情况</td>
                            </tr>
                            <% 
           					while (i<PgSize && !Rsdsp.isAfterLast())	{     
            			    %>
            			    <tr height="25" >
                            <td width="180" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("rq")%></td>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("pjmc")%></td> 
                            <% if (Rsdsp.getString("pjbh")!=null && Rsdsp.getString("pjbh")!="") { %>
                            <td  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("pjbh")%></td> 
                            <%} else { %> <td align="center" class="word_darkblue">无</td> <%} %>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("xinghao")%></td>
                            <td width="30" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chexing")%></td> 
                            <td width="100"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chehao")%></td>
                            <td width="160"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("zzcdh")%></td>
                            <td width="120" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("zzsj")%></td>
                            <td width="50" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("shuliang")%></td>
                            <td width="15%"  align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("guzhang")%></td>
                            <td width="200" align="center" bgcolor="#fffffF" ><%=Rsdsp.getString("chuli")%></td> 
                            </tr> 
                        <%
					            Rsdsp.next();
					            i++;
                            }
                        %>
                         </table>
                         <!-- 显示页码表 -->
           <table  bgcolor="#E6F0F9" align="center"  width="95%"> 
          <tr><form name="formpg" method="post" action="pjgl/pjgl.jsp">
          <td nowrap class="word_blue" align="left">[<%=CurrPgdsp%>/<%=CountPgdsp %>] 每页20条 共<%=CountRdsp%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="gopage" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
           <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="page" type="hidden" value="2">
            <input name="sp" type="hidden" value="1">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="v1" type="hidden" value="<%=dspf%>">
            <input name="v2" type="hidden" value="<%=dspto%>">
           </td></form>
          <td>
          <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=1&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">上一页</a> 
           <%if (CurrPgdsp>1){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CurrPgdsp-1%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPgdsp<CountPgdsp){%>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CurrPgdsp+1%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">下一页</a> 
            <%
          	}
          %>
            <a href="pjgl/pjgl.jsp?page=2&sp=1&gopage=<%=CountPgdsp%>&v1=<%=dspf%>&v2=<%=dspto%>&cj=<%=chej%>">最后一页</a>
            </td>
        </tr>
        </table>
                        <%
					    }
					  }
		     
           catch (SQLException e)
            		{
            			out.println(" ");
            		}
            		finally
            		{
            			
            		}	
            }    
             %>
    
     </div>
     </td>
     </tr>
    
    <tr align="center" height="29">
        <td  align="right"><div><img src="Images/count.gif"></div></td>
        <td  colspan="10" align="left"><div>
        <font color="#ff8040">待&nbsp;索&nbsp;赔&nbsp;配&nbsp;件&nbsp;数&nbsp;据&nbsp;统&nbsp;计</font></div>
        </td>
    </tr>
    <tr>
        <td colspan="11">
        <!-- 配件统计分析 按配件名称统计-->
        <table width="90%" border="0" cellpadding="-2" cellspacing="-2"  align="center">
                <tr>
          <td colspan="11" >
          
          <div><table width="100%">
          <%   
             Statement Smtsdata2; 
             ResultSet Rsdata2;
              if (Con != null)
            	{
            		try
            		{
            		String  sqldata2="";
            		
            		if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldata2 ="Select bw,sum(shuliang)as total2  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'"+"  group by bw order by pjmc";
						}
						else {
						   sqldata2 ="Select bw,sum(shuliang)as total2  From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by bw order by pjmc";
						}
						
						Smtsdata2 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata2 = Smtsdata2.executeQuery(sqldata2);
                        Rsdata2.last();
                        Rsdata2.first();
                        CountRdata2=Rsdata2.getRow();
            			if (CountRdata2>0)
            			{
           %>               <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div> 按配件所属部位统计</div></td>
                            </tr>  
            				<tr align="center" height="29">
                            <td  colspan="2" class=word_white bgcolor="#307F9C">配件所属部位</td>
                            <td  colspan="2" class=word_white bgcolor="#307F9C">数&nbsp;量</td>
                            </tr>
                        <% 
           				while ( !Rsdata2.isAfterLast())
           				{     
            			%>
            			    <tr height="25" align="center">
                            <td width="50%" colspan="2" align="center" bgcolor="#fffffF" ><%=Rsdata2.getString("bw")%></td> 
                            <td width="50%" colspan="2"  align="center" bgcolor="#fffffF" ><%=Rsdata2.getString("total2")%></td>
                            </tr> 
                        <%
					            Rsdata2.next();
                         }
					    }
					}
           catch (SQLException e)
            		{
            			out.println("无符合条件记录！");
            		}
            		finally
            		{
             		}	
               }
             %></table>
             </div>
             </td>
         </tr>
                <tr>
                <td colspan="11" >
               
               <div><table width="100%">
               <%   
                Statement Smtsdata; 
                ResultSet Rsdata;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata="";
            		if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{   
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'"+"  group by pjmc,xinghao,zzcdh order by pjmc";
						}
						else {
						   sqldata ="Select pjmc,xinghao,zzcdh,sum(shuliang)as total  From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"'   group by pjmc,xinghao,zzcdh order by pjmc";
						}
						
                        Smtsdata = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata = Smtsdata.executeQuery(sqldata);
                        Rsdata.last();
                        Rsdata.first();
                        CountRdata=Rsdata.getRow();
            			if (CountRdata>0)
            			{
            			%>  <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"><div> 按配件名称统计</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">配件名称</td>
                            <td   class=word_white bgcolor="#307F9C">配件型号</td>
                            <td   class=word_white bgcolor="#307F9C">制造厂代号</td>
                            <td   class=word_white bgcolor="#307F9C">数&nbsp;量</td>
                            </tr>
                        <% 
           				while ( !Rsdata.isAfterLast())	{     
            			%>
            			    <tr height="25" align="center">
                            <td width="30%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("pjmc")%></td> 
                            <td width="20%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("xinghao")%></td>
                            <td width="30%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("zzcdh")%></td>
                            <td width="20%" align="center" bgcolor="#fffffF" ><%=Rsdata.getString("total")%></td>
                            </tr> 
                        <%
					            Rsdata.next();
                          }
					    }
		           }
                   catch (SQLException e)
            		{
            			out.println("无符合条件记录！");
            		}
            		finally
            		{
            		}	
                   }  
                %>
            </table></div>
            </td>  
     </tr>      
     
         <tr>
             <td colspan="11" width="100%">
            
             <div><table width="100%" border="0" cellpadding="-2" cellspacing="1">
             <%   
                Statement Smtsdata3; 
                ResultSet Rsdata3;
                if (Con != null)
            	{
            		try
            		{
            		String  sqldata3="";
                         
                        
                      if (dspf!= null && !dspf.equals("") && dspto!= null && !dspto.equals(""))    
						{  
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3  From sppj"+chej+" where rq>='"+dspf+"'"+ "&& rq<='"+dspto+"'   group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao"; 
						   }
						else {
						   sqldata3 ="Select zzcdh,pjmc,xinghao,sum(shuliang)as total3 From sppj"+chej+" where year(rq)='"+nowyear+"' and month(rq)='"+nowmonth+"' group by zzcdh,pjmc,xinghao order by zzcdh,pjmc,xinghao";
						
						}
						
                        Smtsdata3 = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsdata3 = Smtsdata3.executeQuery(sqldata3);
                        Rsdata3.last();
                        Rsdata3.first();
                        CountRdata3=Rsdata3.getRow();
            			if (CountRdata3>0)
            			{
                       %>   <tr align="center" height="29">
                            <td  colspan="4" class=word_white bgcolor="#307F9C"> <div > 按生产厂家统计</div></td>
                            </tr>
            				<tr align="center" height="29">
                            <td   class=word_white bgcolor="#307F9C">制造厂代号</td>
                            <td    class=word_white bgcolor="#307F9C">配件名称</td>
                            <td    class=word_white bgcolor="#307F9C">配件型号</td>
                            <td    class=word_white bgcolor="#307F9C">数&nbsp;量</td>
                            </tr>
                        <% 
           				while ( !Rsdata3.isAfterLast())	
           				{     
            			%>
            			    <tr border="0" height="25" align="center" >
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("zzcdh")%></td> 
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("pjmc")%></td> 
                            <td width="25%" bgcolor="#fffffF" ><%=Rsdata3.getString("xinghao")%></td> 
                            <td width="25%" bgcolor="#fffffF"><%=Rsdata3.getString("total3")%></td>
                            </tr> 
                        <%
					            Rsdata3.next();
                          }
					    }
				   }
		        catch (SQLException e)
            		{  out.println("无符合条件记录！"); }
            	finally
            		{      }	
               } 
                         %>  
               <tr height="25"><td colspan="4"></td></tr>
              </table></div>
              </td>  
        </tr>  
        </table>
        	
    </td>
    </tr>
   </table>
    </td>
    </tr>
    </table>

    
  </body>
</html>
