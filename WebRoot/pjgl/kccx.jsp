<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>配件库存查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script language="javascript">
function Mycheck()
{
if !(formincx.bhmc.value=="1") {
if (formincx.pj.value=="")
{ alert("内容不能为空,请输入日期、编号或名称！");
  formincx.pj.focus();
  return;
}}
  formincx.submit();
} 
</script> 
  <body>
    <!-- 日期选择器函数 -->

<%      boolean islog=false;
        int CountR=0;
        int CountPgkc = 0;
	    int CurrPgkc = 1;
	    int PgSize = 20;
        try
         { islog=((String)session.getAttribute("islog")).equals("1");
         }
        catch(Exception e)
        {
         //out.println(e);
        }
        String pjk="";
        if (request.getParameter("pjk")!=null) pjk=new String(request.getParameter("pjk"));
        
        String tabname="";
        String str="";
        
        if (pjk.equals("1")) { tabname="pjkczz"; str="郑州检修车间备品库";}
        if (pjk.equals("2")) { tabname="pjkcys"; str="月山检修车间备品库";}
        if (pjk.equals("3")) { tabname="pjkcly"; str="洛阳检修车间备品库";}
        if (pjk.equals("4")) { tabname="pjkczl"; str="郑州轮轴车间备品库";}
        if (pjk.equals("5")) { tabname="pjkcd"; str="段材料库";}
        
       
       String bhmc="";
        if (request.getParameter("bhmc")!=null) bhmc=new String(request.getParameter("bhmc"));
        
        String pj="";
        if (request.getParameter("pj")!=null) pj=new String(request.getParameter("pj"));
%>
   <table align="center" width="694" border="0" cellpadding="-2" cellspacing="-2">
  <tr> <td><img width="694" height="68" src="Images/kccx.gif" >  </td>
  </tr>
  <tr>
      <td height="25"><div>
      <%if (!(((String)session.getAttribute("deptment")).equals("41")
          || ((String)session.getAttribute("deptment")).equals("42")
          || ((String)session.getAttribute("deptment")).equals("43") 
          || ((String)session.getAttribute("deptment")).equals("44"))) 
      { %>
     <form name="formpjk" method="post" action="pjgl/pjgl.jsp">请选择备品库名称:
     <input type="radio" name="pjk" value="1" <%if (pjk.equals("1")) out.print("checked"); %>> 郑州检修车间
     <input type="radio" name="pjk" value="2" <%if (pjk.equals("2")) out.print("checked"); %>> 月山检修车间
     <input type="radio" name="pjk" value="3" <%if (pjk.equals("3")) out.print("checked"); %>> 洛阳检修车间
     <input type="radio" name="pjk" value="4" <%if (pjk.equals("4")) out.print("checked"); %>> 郑州轮轴车间
     <input type="radio" name="pjk" value="5" <%if (pjk.equals("5")) out.print("checked"); %>> 段材料库
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="6">
      <input type="submit" name="Submit" class=Style_button2 value="  确  定  " >
     </form>
     <% } %></div>
      </td>
  </tr>
  <tr>
     <td align="center" height="25">查询的是:<%=str %>配件当前库存信息</td>
  </tr>
  <tr>
      <td height="25">
     <form name="formincx" method="post" action="pjgl/pjgl.jsp">请选择查询条件:
     <input type="radio" name="bhmc" value="1" <%if (bhmc.equals("1")) out.print("checked");%>> 查看全部配件库存
     <input type="radio" name="bhmc" value="2" <%if (bhmc.equals("2")) out.print("checked");%>> 配件名称
     <input type="radio" name="bhmc" value="3" <%if (bhmc.equals("3")) out.print("checked");%>>配件编号
     <input type="text" name="pj"  > 
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="6">
     <input type="hidden" name="pjk" value=<%=pjk%>>
     <input type="submit" name="Submit" class=Style_button2   value="  确  定  " onClick="Mycheck()">
     </form>
     </td>
  </tr>
</table>

 <table align="center" width="694"  border="0" cellpadding="-2" cellspacing="-2">
   <tr border="1" bordercolor="#6894D5" height="25">
       <td ><div align="center" class="word_blue">配件编号</div></td>
       <td ><div align="center" class="word_blue">配件名称</div></td>
       <td ><div align="center" class="word_blue">规格</div></td> 
       <td ><div align="center" class="word_blue">单位</div></td>
       <td ><div align="center" class="word_blue">配件单价</div></td>
  <!--
  <td ><div align="center">前期数</div></td>  
  -->     
       <td ><div align="center">入库数</div></td> 
       <td ><div align="center">出库数</div></td>
       <td ><div align="center">结存数</div></td>
       <td ><div align="center">库存提示</div></td>
   </tr> 
      <% 
       String StrPgkc = request.getParameter("gopage");
            	if (StrPgkc == null)
            	{
            		CurrPgkc = 1;
            	}
            	else
            	{
            		CurrPgkc = Integer.parseInt(StrPgkc);
            	}        
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123");       
       Statement Smts; 
       ResultSet Rs;
       if (Con != null)
        {
             try
             {
              String sql="";
              if (bhmc.equals("1")) {
                      sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,pjinfo.low,pjinfo.high,"+tabname+".qcs,"+tabname+".rks,"+tabname+".cks,"+tabname+".jcs  from " +tabname+",pjinfo where "+tabname+".id=pjinfo.id";
             } else {
              if (bhmc.equals("2")) { 
                 sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,pjinfo.low,pjinfo.high,"+tabname+".qcs,"+tabname+".rks,"+tabname+".cks,"+tabname+".jcs  from " +tabname+",pjinfo where "+tabname+".name like '"+pj+"%' and "+tabname+".id=pjinfo.id"; }
                      else { if (bhmc.equals("3")) 
                      {  sql ="select "+tabname+".id,"+tabname+".name,pjinfo.gg,pjinfo.dw,pjinfo.dj,pjinfo.low,pjinfo.high,"+tabname+".qcs,"+tabname+".rks,"+tabname+".cks,"+tabname+".jcs from " +tabname+",pjinfo where "+tabname+".id='"+pj+"' and "+tabname+".id=pjinfo.id"; }
                        }
               } 
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

              Rs = Smts.executeQuery(sql);
              Rs.last();
              CountR = Rs.getRow();
               
              int l = 0;
              int i=0;
              int j=0;
              int k=0;
              CountPgkc = (CountR/PgSize);
              if (CountR%PgSize>0)   CountPgkc++;
              Rs.first();		
            			if (CountR>0)
            			{
            			  Rs.absolute(CurrPgkc*PgSize-PgSize+1);
            			 
            			  while ( l<PgSize &&  !Rs.isAfterLast())	{  
            		     if  (((Rs.getString("low")!=null) || (!Rs.getString("low").equals(""))) &&
            		         ((Rs.getString("high")!=null) || (!Rs.getString("high").equals(""))))
            		      { 
            		         i=Integer.valueOf(Rs.getString("jcs")).intValue() ;
            		         j=Integer.valueOf(Rs.getString("low")).intValue() ;
            		         k=Integer.valueOf(Rs.getString("high")).intValue() ;   
            		       }
            			    %>
            			    <tr border="1" bordercolor="#6894D5" height="25">
                            <td  ><div align="center" class="word_blue"><%=Rs.getString("id")%></div></td>
                            <td ><div align="center" class="word_blue"><%=Rs.getString("name")%></div></td>
                            <td ><div align="center" class="word_blue"><%=Rs.getString("gg")%></div></td> 
                            <td ><div align="center" class="word_blue"><%=Rs.getString("dw")%></div></td> 
                            <td ><div align="center" class="word_blue"><%=Rs.getString("dj")%></div></td>  
                   <!-- 
                   <td ><div align="center"><%=Rs.getString("qcs")%></div></td> 
                   -->         
                            <td ><div align="center"><%=Rs.getString("rks")%></div></td> 
                            <td ><div align="center"><%=Rs.getString("cks")%></div></td>
                            <td ><div align="center"><%=Rs.getString("jcs")%></div></td>
                            <td >
                                 <div align="center">
                                 <% if ((j!=0) && (k!=0)) {
                                  if (i>k) { %>
                                  <img width="13" height="13" src="Images/baojing.gif">库存数高于上限<%=k%>
                                  <%}else if (i<j) {%>
                                  <img width="13" height="13" src="Images/baojing.gif">库存数低于下限<%=j%>
                                  <%  }}%>
                                 </div>
                            </td>
                            </tr>  
              <%            Rs.next();
                            l++;
				          } 
					    }
		    }
           catch (SQLException e)
            		{
            			out.println("无符合条件记录");
            		}
            		finally
            		{
            			Con.close();
            		}	
            }
  %>          
  </table>
  <!-- 显示页码表 -->
    <table align="center"  width="100%"> 
    <tr >
    <td >[<%=CurrPgkc%>/<%=CountPgkc %>] 每页20条 共<%=CountR%>条记录    </td>
    <td  align="right">
            <div >第[ 
              <% for (int l = 1;l<=CountPgkc;l++){%>
                <a href="pjgl/pjgl.jsp?page=1&kc=6&gopage=<%=l%>&pjk=<%=pjk%>&bhmc=<%=bhmc%>&pj=<%=pj%>"><%=l%></a> 
              <%}%>]页
            </div>
    </td>
    <td align="right">
          
    </td>
    </tr>
    </table>    
 

  </body>
</html>
