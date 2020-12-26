<%@ page language="java" import="java.util.*,java.sql.*,java.sql.Date" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    int CountPg = 0;
	int CurrPg = 1;
	int PgSize = 30;
	int CountR = 0;
    String title="";
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>日计划查询（表格形式）</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <LINK href="Css/css1.css" type=text/css rel=stylesheet>    
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
    String chej = "zz";
    if (request.getParameter("cj")!=null) chej=new String(request.getParameter("cj"));
    String vdate = "";
    if (request.getParameter("v1")!=null) vdate = new String(request.getParameter("v1"));
    String vapm ="";
    if (request.getParameter("v2")!= null) vapm =new String(request.getParameter("v2"));
    
    if (((String)session.getAttribute("deptment")).equals("41")) { chej="zz"; title="郑州检修车间车辆检修日计划";} else {
        if (((String)session.getAttribute("deptment")).equals("42")) { chej="ys"; title="月山检修车间车辆检修日计划";}  else {
          if (((String)session.getAttribute("deptment")).equals("43")) { chej="ly";title="洛阳检修车间车辆检修日计划";} else {}}}
  %>
  

  <form name="form" method="post" action="jhgl/scrw.jsp">
  <table width="99%" height="40" border="0" align="center" >
 <%  if (((String)session.getAttribute("deptment")).equals("41")||((String)session.getAttribute("deptment")).equals("42") ||
            ((String)session.getAttribute("deptment")).equals("43")) { } else { %>
  <tr>
  <td align="center" height="25">
  <input name="cj" type="radio"  value="zz" <%if (chej.equals("zz")) { title="郑州检修车间车辆检修日计划"; out.print("checked"); }%>> 郑州检修车间
  <input type="radio" name="cj" value="ys" <%if (chej.equals("ys")) { title="月山检修车间车辆检修日计划"; out.print("checked"); }%>> 月山检修车间
  <input type="radio" name="cj" value="ly" <%if (chej.equals("ly")) { title="洛阳检修车间车辆检修日计划"; out.print("checked"); }%>> 洛阳检修车间
  </td>
  </tr>
 <%}%>
  <tr>
  <td align="center" >请输入要查询的日期：
           <input width="20" name="v1" type="text" size="16" ondblclick="loadCalendar(this)"  value="<%=vdate%>">&nbsp上下午:&nbsp
           <select name="v2"  value="<%=vapm%>">
           <option value="1" <%if (vapm.equals("1")) out.print("selected");%> >上午</option>
		   <option value="2" <%if (vapm.equals("2")) out.print("selected");%> >下午</option>
		   <option value="3" <%if (vapm.equals("3")) out.print("selected");%> >全天</option>
		   <input type="hidden" name="page" value="3">
	  	   </select>&nbsp; 
           <input type="submit" name="Submit" class="Style_button" value="  查  询  " >
    </td>
  </tr>
  </table>
</form>
<table    align="center" width="100%" border="0"  cellpadding="-2" cellspacing="1" >
<tr align="center" bordercolor="#6894D5" height="25">
<td colspan="21" bgcolor="#6595D6" style="color:#ffffff;font-size:12;font-family:宋体"><%=title%>
</td></tr>
<tr align="center">
<td colspan="2" bgcolor="#6595D6" align="center" class="word_white">时间</td>
<td colspan="2" bgcolor="#6595D6" align="center" class="word_white">进车台位</td>
<td colspan="3" bgcolor="#6595D6" align="center" class="word_white">车辆基本信息</td>
<td colspan="2" bgcolor="#6595D6" align="center" class="word_white">前次厂修</td>
<td colspan="2" bgcolor="#6595D6" align="center" class="word_white">前次段修</td>
<td colspan="5" bgcolor="#6595D6" align="center" class="word_white">配件信息</td>
<td colspan="4" bgcolor="#6595D6" align="center" class="word_white">其他信息</td>
<td bgcolor="#6595D6"></td>
</tr>
<tr align="center" height="25">
<td class=tablebody2>日期</td><td class=tablebody2 >上/下午</td>
<td class=tablebody2>道-位</td><td  class=tablebody2>号</td>
<td class=tablebody2>车型 车号</td><td class=tablebody2>性质</td><td class=tablebody2>修程</td>
<td class=tablebody2>单位</td><td class=tablebody2>日期</td>
<td class=tablebody2>单位</td><td class=tablebody2>日期</td>
<td class=tablebody2>轮轴</td><td class=tablebody2>转向架</td><td class=tablebody2>制动梁</td><td class=tablebody2>制动机</td><td class=tablebody2>车钩</td>
<td class=tablebody2>改造</td><td class=tablebody2>保证月</td><td class=tablebody2>HMIS上传日期</td><td class=tablebody2>部令</td>
<td class=tablebody2>备注</td>
</tr>
<script language="javascript">
    function outExcel(){
	var table=document.all.rjhtab;
	row=table.rows.length;
	column=table.rows(1).cells.length;
	var excelapp=new ActiveXObject("Excel.Application");
	excelapp.visible=true;
	objBook=excelapp.Workbooks.Add(); //添加新的工作簿
	var objSheet = objBook.ActiveSheet;

	title=objSheet.Range("k1").MergeArea;  //合并单元格
	title.Cells(1,1).Value ="<%=title%>";
	title.Cells(1,1).Font.Size =16;
	
	for(i=1;i<row+1;i++){
		for(j=0;j<column;j++){
		  objSheet.Cells(i+1,j+1).value=table.rows(i-1).cells(j).innerHTML.replace("&nbsp;","");
		}
	}

	excelapp.UserControl = true;
    }
   </script>
<% 
  
  
   Class.forName("org.gjt.mm.mysql.Driver").newInstance();
   Connection Conrjh = DriverManager.getConnection("jdbc:mysql://localhost/jhgl","root","123"); 

   String StrPg = request.getParameter("Pagerjh");
            	if ((StrPg == null)||(StrPg.equals("")))
            	{
            		CurrPg = 1;
            	}
            	else
            	{
            		CurrPg = Integer.parseInt(StrPg);
            	}
   Statement Smts; 
   ResultSet Rsrjh;
   if (Conrjh != null)
            	{
            		try
            		{
            		String  sql2=" ";
            		String  s1="";
            		String  s2="";
            		String  s3="";
            		String  s4="";
            		String  s5="";
            		String  s6="";
            		String  s7="";
            		String  s8="";
            		String  s9="";
            		String  s10="";
            		String  s11="";
            		String  s12="";
            		String  s13="";
            		String  s14="";
            		String  s15="";
            		String  s16="";
            		String  s17="";
            		String  s18="";
            		String  s19="";
            		String  s20="";
                    String  s21="";
            		    
                        if  (chej.equals("zz")) {
                        if (vdate!= null && !vdate.equals(""))
						{   
						    if (vapm.equals("1")||vapm.equals("2"))  {sql2 = "select * from jxjhzz where rq='"+vdate+"'" +" && apm='"+vapm+"'"+" order by id";}
						    else { sql2 = "Select * From jxjhzz Where rq='"+vdate+"'";}
						}
						else {
							sql2 = "Select * From jxjhzz  where rq in (select max(rq) From jxjhzz) order by id,rq,apm";
						}
						}
                                               
                        if  (chej.equals("ys")) {
                        if (vdate!= null && !vdate.equals(""))
						{   
						    if (vapm.equals("1")||vapm.equals("2"))  {sql2 = "select * from jxjhys where rq='"+vdate+"'" +" && apm='"+vapm+"'"+" order by id";}
						    else { sql2 = "Select * From jxjhys Where rq='"+vdate+"'";}
						}
						else {
							sql2 = "Select * From jxjhys  where rq in (select max(rq) From jxjhys) order by id,rq,apm";
						}
						}
                                               
                        if  (chej.equals("ly"))
                        {
                        if (vdate!= null && !vdate.equals(""))
						{   
						    if (vapm.equals("1")||vapm.equals("2"))  {sql2 = "select * from jxjhly where rq='"+vdate+"'" +" && apm='"+vapm+"'"+" order by id";}
						    else { sql2 = "Select * From jxjhly Where rq='"+vdate+"'";}
						}
						else {
							sql2 = "Select * From jxjhly  where rq in (select max(rq) From jxjhly) order by id,rq,apm";
						}
                        } 
            			
            			Smts = Conrjh.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            			Rsrjh = Smts.executeQuery(sql2);
                        Rsrjh.last();
                        int j = 0;
            			CountR = Rsrjh.getRow();
            			CountPg = (CountR/PgSize);
            			if (CountR%PgSize>0)
            				CountPg++;
            			Rsrjh.first();
            			if (CountR>0)
            			{
            				Rsrjh.absolute(CurrPg*PgSize-PgSize+1);
	            			while (!Rsrjh.isAfterLast())
            			       			{     
            			      s1=Rsrjh.getString("rq"); 			
            			     if (Rsrjh.getString("apm").equals("1")) { s2="上午"; }
            			     else { s2="下午"; } 			
            			     s3=Rsrjh.getString("dao")+"道"+Rsrjh.getString("wei");
            			     s4=Rsrjh.getString("hao");  			
            			     if (Rsrjh.getString("cx")!=null ) { s5=Rsrjh.getString("cx");}
 			                 if (Rsrjh.getString("ch")!=null ) { s5=s5+" "+Rsrjh.getString("ch");}
 			                 if (Rsrjh.getString("xz")!=null ) { s6=Rsrjh.getString("xz");}
 			                 if (Rsrjh.getString("xc")!=null ) { s7=Rsrjh.getString("xc");}
 			                 if (Rsrjh.getString("qccxdw")!=null ) { s8=Rsrjh.getString("qccxdw");}
 			                 if (Rsrjh.getString("qccxrq")!=null ) { s9=" "+Rsrjh.getString("qccxrq")+" ";}
 			                 if (Rsrjh.getString("qcdxdw")!=null ) { s10=Rsrjh.getString("qcdxdw");}
 			                 if (Rsrjh.getString("qcdxrq")!=null ) { s11=Rsrjh.getString("qcdxrq");}
 			                 if (Rsrjh.getString("lz")!=null ) { s12=Rsrjh.getString("lz");}
 			                 if (Rsrjh.getString("zxj")!=null ) { s13=Rsrjh.getString("zxj");}
 			                 if (Rsrjh.getString("zdl")!=null ) { s14=Rsrjh.getString("zdl");}
 			                 if (Rsrjh.getString("zdf")!=null ) { s15=Rsrjh.getString("zdf");}
 			                 if (Rsrjh.getString("cg")!=null ) { s16=Rsrjh.getString("cg");}
 			                 if (Rsrjh.getString("qz")!=null ) { s17=Rsrjh.getString("qz");}
 			                 if (Rsrjh.getString("bzq")!=null ) { s18=Rsrjh.getString("bzq");}
 			                 if (Rsrjh.getString("hmisrq")!=null ) { s19=Rsrjh.getString("hmisrq");}
 			                 if (Rsrjh.getString("bl")!=null ) { s20=Rsrjh.getString("bl");}
 			                 if (Rsrjh.getString("bz")!=null ) { s21=Rsrjh.getString("bz");}
            			%>
                <tr border="1"   height="25" <% if (j%2==0)  out.print("bgcolor='#C8DEF5'"); else out.print("bgcolor='#EFF7F4'"); %>>
            	<td align="center"><%=s1%></td>
                <td align="center"><%=s2 %></td>
                <td align="center"><%=s3%></td>
                <td align="center"><%=s4%></td>
                <td align="center"><%=s5%></td>
                <td align="center"><%=s6%></td> 
                <td align="center"><%=s7%></td>
                <td align="center"><%=s8%></td> 
                <td align="center"><%=s9%></td> 
                <td align="center"><%=s10%></td>
                <td align="center"><%=s11%></td> 
                <td align="center"><%=s12%></td> 
                <td align="center"><%=s13%></td>
                <td align="center"><%=s14%></td> 
                <td align="center"><%=s15%></td>
                <td align="center"><%=s16%></td> 
                <td align="center"><%=s17%></td>
                <td align="center"><%=s18%></td> 
                <td align="center"><%=s19%></td> 
                <td align="center"><%=s20%></td>
                <td align="center"><%=s21%></td>
             </tr> 
            <%
					            Rsrjh.next();
					            j++;
					    }
					    }
		    }
           catch (SQLException e)
            		{
            			out.println(e.getMessage());
            		}
           finally
            		{
            			Conrjh.close();
            		}	
            }    
%>
</table>
<table   bgcolor="#FFFFFF" " align="center"  width="100%" border="0"> 
          <tr>
          <td class="word_blue"  align="left" rowspan="2" width="55%">
            <form name="formpg" method="post" action="jhgl/scrw.jsp">[<%=CurrPg%>/<%=CountPg %>] 每页30条 共<%=CountR%>条记录&nbsp;&nbsp;&nbsp;&nbsp; 转到第
            <input name="Pagerjh" type="text" size="3" >&nbsp;页&nbsp;&nbsp;
            <input type="submit" name="Submit" value="GO" class="Style_button3">
            <input name="cj" type="hidden" value="<%=chej%>">
            <input name="v1" type="hidden" value="<%=vdate%>">
            <input name="v2" type="hidden" value="<%=vapm%>">
            <input name="page" type="hidden" value="3">
            </form>
          </td>
          <td height="1" width="30%"></td>
          <td height="1" width="3%"></td>
          <td height="1"  width="12%"></td>
          
          </tr>
          <tr>
          <td valign="top">
          <a href="jhgl/scrw.jsp?page=3&Pagerjh=1&v1=<%=vdate%>&v2=<%=vapm%>&cj=<%=chej%>">首页</a>
           <%if (CurrPg>1){%>
            <a href="jhgl/scrw.jsp?page=3&Pagerjh=<%=CurrPg-1%>&v1=<%=vdate%>&v2=<%=vapm%>&cj=<%=chej%>">上一页</a> 
            <%
          	}
          %>
            <%if (CurrPg<CountPg){%>
            <a href="jhgl/scrw.jsp?page=3&Pagerjh=<%=CurrPg+1%>&v1=<%=vdate%>&v2=<%=vapm%>&cj=<%=chej%>">下一页</a> 
            <%
          	}
          %>
            <a href="jhgl/scrw.jsp?page=3&Pagerjh=<%=CountPg%>&v1=<%=vdate%>&v2=<%=vapm%>&cj=<%=chej%>">最后一页</a>
            </td>
            <td valign="top" align="right">
            <img   width="16" height="16" src="Images/excel.jpg" >
            </td>
            <td valign="top" align="left"><a href="jhgl/scrw.jsp?page=3&Pagerjh=<%=CurrPg%>&v1=<%=vdate%>&v2=<%=vapm%>&cj=<%=chej%>" onClick="outExcel();">导出Excel</a></td>
            
        </tr>
        </table>
        
    
  </body>
</html>
