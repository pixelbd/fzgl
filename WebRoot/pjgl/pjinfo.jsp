<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����Ϣ�޸�</title>
    
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
  .word1{
	font-size: 9pt;	color: #6A4A2F;
   }
   -->
  </style>
  </head>
  
  <body>
  <!-- ��������޸�Ȩ�޼��,ϵͳ����Ա����Ͽ���Ա --> 
 <% 
 if (((String)session.getAttribute("deptment")).equals("admin")
      ||((String)session.getAttribute("deptment")).equals("24")) 
  {
  
    String oper="";
    if (request.getParameter("oper")!=null) oper=new String(request.getParameter("oper"));
    String pjbh="";
    if (request.getParameter("pjbh")!=null) pjbh=new String(request.getParameter("pjbh"));
    
    String name="";
    String gg="";
    String dw="";
    String dj="";
    String low="";
    String high="";
 %>
 <table align="center" width="694"  border="0" cellpadding="-2" cellspacing="-2">
  <tr>
      <td><img width="694" height="68" src="Images/pjxxxg.gif" >
      </td>
  </tr>
  <tr> <td align="center">
  	 <form name="form1" method="post" action="pjgl/pjgl.jsp">��ѡ�����:
     <input type="radio" name="oper" value="1" <%if (oper.equals("1")) out.print("checked"); %>> �޸������Ϣ
     <input type="radio" name="oper" value="2" <%if (oper.equals("2")) out.print("checked"); %>> ��������Ϣ
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="kc" value="3">
     <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " >
     </form>
     </td>
  </tr>
  <tr>
     <td align="center" class="word1">
     <%if (oper.equals("1")) { %> ��������:�޸������Ϣ <%} 
          else { if (oper.equals("2")) {%> ��������:��������Ϣ <% }
          } %>
     </td>
  </tr>
 </table>
 <!-- ������޸Ĳ���,Ҫ���������Ž����޸� -->
 <%if (oper.equals("1")) { %>
 <table align="center" width="694"   border="0" cellpadding="-2" cellspacing="-2">
  <tr>
      <td align="center">
      <form name="form2" method="post" action="pjgl/pjgl.jsp">������:
      <input type="text" name="pjbh"  value=<%=pjbh%>> 
      <input type="hidden" name="oper" value="<%=oper%>">
      <input type="hidden" name="page" value="1">
      <input type="hidden" name="kc" value="3">
      <input type="submit" name="Submit" class=Style_button value="  ȷ  ��  " >
      </form>
      </td>
  </tr>
 </table>

<%
 if (request.getParameter("pjbh")!=null) 
     {
       Class.forName("org.gjt.mm.mysql.Driver").newInstance();
       Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/pjgl","root","123");       
       Statement Smts; 
       ResultSet Rs;
       if (Con != null)
        {
             try
             {
              String  sql ="select * from pjinfo where id='"+(request.getParameter("pjbh"))+"'";
              Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
     
              Rs = Smts.executeQuery(sql);
              
              Rs.first();
              if (!Rs.isAfterLast())
              {
              name=Rs.getString("pjname");
              gg=Rs.getString("gg");
              dw=Rs.getString("dw");
              dj=Rs.getString("dj");
              low=Rs.getString("low");
              high=Rs.getString("high");
              }
             }
             catch (SQLException e)
            		{
            		out.print("�޴˱�����");            		}
            		finally
            		{
            			Con.close();
            		}	
       }    
     }
  %>
  <table align="center" width="694" class="tableBorder_Btm" border="0" cellpadding="-2" cellspacing="-2">
       <form name="form3" method="post" action="pjgl/editpjinfo.jsp">
       <tr height="30">
          <td>������:<input type="text" name="pjbh" value=<%=pjbh%>> </td>
          <td colspan="2">�������:<input type="text" name="pjname" value=<%=name%>> </td>
       <tr height="30">
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="gg" size="14" value=<%=gg%> > </td>
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;λ:<input type="text" name="dw" size="5" value=<%=dw%>> </td>
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="dj" size="10" value=<%=dj%> > </td>
       </tr >
       <tr height="30">
           <td height="30">��ʹ���:<input type="text" name="low" size="5" value=<%=low%>> </td>
           <td height="30">��ߴ���:<input type="text" name="high" size="5" value=<%=high%>> </td>
       </tr>
       <tr height="30"><td colspan="3" align="center">
      <input type="hidden" name="page" value="1">
      <input type="hidden" name="kc" value="3">
      <input type="hidden" name="oper" value="<%=oper%>">
      <input type="submit" name="Submit" class=Style_button2 value="  ��  ��  " >
      </td></tr>
      </form>
 </table>
 <!-- ������Ӳ��� -->
 <%} else { if (oper.equals("2")) { %>
  <form name="form4" method="post" action="pjgl/editpjinfo.jsp">
   <table align="center" width="694" class="tableBorder_Btm" border="0" cellpadding="-2" cellspacing="-2">
      
       <tr height="30">
          <td>������:<input type="text" name="pjbh"  > </td>
          <td colspan="2">�������:<input type="text" name="pjname"  > </td>
       <tr height="30">
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="gg" size="14" > </td>
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;λ:<input type="text" name="dw"  size="5"> </td>
          <td>��&nbsp;&nbsp;&nbsp;&nbsp;��:<input type="text" name="dj"  size="10"> </td>
       </tr>
       <tr height="30">
           <td>��ʹ���:<input type="text" name="low" value="0" size="5"> </td>
           <td>��ߴ���:<input type="text" name="high" value="10000" size="5" > </td>
       </tr>
       <tr><td align="center" colspan="3" height="30">
       <input type="hidden" name="oper" value="<%=oper%>">
      <input type="hidden" name="page" value="1">
      <input type="hidden" name="kc" value="3">
      <input type="submit" name="Submit" class=Style_button value="  ��  ��  " >&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" name="Submit" class=Style_button value="  ��  ��  " >
      </td>
      </tr>
     
 </table>
  </form>
 <%}} %>
 <%} %>

  </body>
</html>
