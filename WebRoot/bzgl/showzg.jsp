<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ְ��������Ϣ��ѯ...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
    .dottedtab1 {
   BORDER-RIGHT: #FF9933 1px dotted; 
   BORDER-TOP: #FF9933 1px dotted; 
   BORDER-LEFT: #FF9933 1px dotted; 
   BORDER-BOTTOM: #FF9933 1px dotted
    }
    .dottedtab2 {
   BORDER-RIGHT: #6699CC 1px dotted; 
   BORDER-TOP: #6699CC 1px dotted; 
   BORDER-LEFT: #6699CC 1px dotted; 
   BORDER-BOTTOM: #6699CC 1px dotted
    }
   body {
	margin-left: 0px; 
	margin-top: 0px;
      }
   .style1 { color: #334094 }
   .style2 { color: #669999 }
   </style>
  </head>
  <LINK href="Css/css1.css" type=text/css rel=stylesheet>
  <body>
<%        
          
      boolean islog=false;
      try
      { islog=((String)session.getAttribute("islog")).equals("1");
      }
      catch(Exception e)
      { //out.println(e);
      }
      
    if ((islog)&&(((String)session.getAttribute("zw")).equals("8"))) {       
    String   id="";
          String   chej="";
          String   tabname="zhigong";
          String   str="";
          String showpic="";
          if ((request.getParameter("id") != null)) {id = request.getParameter("id"); }
          if ((request.getParameter("cj") != null)) {chej = request.getParameter("cj");
                                                      }
          if (chej.equals("41")) { str="֣�ݼ��޳���"; tabname=tabname+"zz";}
          if (chej.equals("43")) { str="�������޳���"; tabname=tabname+"ly";}
          if (chej.equals("42")) { str="��ɽ���޳���"; tabname=tabname+"ys";}
          if (chej.equals("44")) { str="֣�����ᳵ��"; tabname=tabname+"zl";}
      
          Class.forName("org.gjt.mm.mysql.Driver").newInstance();
          Connection Con = DriverManager.getConnection("jdbc:mysql://localhost/cjgl","root","123"); 
          Statement Smts; 
          ResultSet Rs;
          
    if (Con != null)
    {
    try
    {
          Smts = Con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
           
          String sql = "select * from "+tabname+" where id='" + id + "'";
          Rs = Smts.executeQuery(sql);
          Rs.first(); 
          
%>
<table width="580" align="center" bgcolor="#ffffff" class=dottedtab1 cellpadding="-1" cellspacing="-1">
<tr><td colspan="2" align="center" height="35" ><font color="#6699cc"><%=str%>ְ��������Ϣ</font></td></tr>
<tr>
   <td width="85%">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60"  class="word_white">��&nbsp;&nbsp;&nbsp;&nbsp;��</td><td><%=Rs.getString("name")%></td>
      <td width="60" align="center" class="word_white">�Ա�</td><td width="30" align="center"><%=Rs.getString("sex")%></td>
      <td width="60" align="center" class="word_white">������ò</td><td align="center"><%=Rs.getString("mm")%></td>
   </tr>
   </table>
   </td>
   <td width="15%" rowspan="4" align="center" class=dottedtab2>
   <% if (!Rs.getString("picpath").equals("")) { showpic="http://10.99.125.238:8080/fzgl/rsglpic/"+Rs.getString("picpath"); %>
   <img width="85" height="104"  class=pic src="<%=showpic%>"/><% } 
   else { showpic="http://10.99.125.238:8080/fzgl/rsglpic/no.gif"; %>
   <div><img width="43" height="43" class=pic src="Images/person.gif"/> </div><div><font color="#666666">������Ƭ</font></div><% } %>
   </td>
</tr>
<tr>
   <td height="25" width="85%">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60" class="word_white">��������</td><td><%=Rs.getString("birthday")%></td>
      <td width="80" class="word_white">�μӹ���ʱ��</td><td><%=Rs.getString("workday")%></td>
   </tr>
   </table>
   </td>
  
</tr>
<tr>
   <td height="25"  width="85%">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" width="60" class="word_white">����֤��</td><td><%=Rs.getString("workcard")%></td>
      <td width="80" align="center" class="word_white">ҽ�Ʊ��պ�</td><td><%=Rs.getString("yibao")%></td>
   </tr>
   </table>
   </td>
   
</tr>
<tr>
   <td height="25" width="85%">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">���֤��</td><td><%=Rs.getString("id")%></td>
   </tr>
   </table>
   </td>
   
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%"  cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">��&nbsp;&nbsp;&nbsp;&nbsp;��</td><td><%=Rs.getString("jg")%></td>
      <td width="60" align="center" class="word_white">סַ</td><td><%=Rs.getString("zz")%></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">ѧ&nbsp;&nbsp;&nbsp;&nbsp;��</td><td width="60"><%=Rs.getString("xl")%></td>
      <td class="word_white" width="60" align="center">��ҵԺУ</td><td ><%=Rs.getString("xx")%></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</td><td width="60"><%=Rs.getString("zw")%></td>
      <td class="word_white" width="60" align="center">����</td><td width="60"><%=Rs.getString("bz")%></td>
      <td class="word_white" width="60" align="center">����</td><td  width="100"><%=Rs.getString("gz")%></td>
      <td class="word_white" width="60" align="center">�Ƿ��ڸ�</td><td><%if (Rs.getString("zaig").equals("0")) out.print("��"); else out.print("��"); %></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">�����ʸ�</td><td width="60"><%=Rs.getString("zg")%></td>
      <td class="word_white" width="60" align="center">����ְ��</td><td><%=Rs.getString("zc")%></td>
   </tr>
   </table>
   </td>
</tr>
<tr>
   <td height="25" colspan="2">
   <table width="100%" cellpadding="1" cellspacing="1" >
   <tr height="25" bgcolor="#6699CC">
      <td align="center" class="word_white" width="60">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td align="center"><textarea rows="12" cols="96" ><%=Rs.getString("jl")%></textarea></td>
   </tr>
   </table>
   </td>
</tr>
</table>

<% 
      }
      catch (SQLException e)
           {
            	out.println("!");
           }
           finally
           {
            	Con.close();
           }
        
      }
      } else {%><script language="javascript">
              alert("�����ǹ���������ִ�д˲�����");
              window.close();
            </script>
        <% } %>
  <table align="center"  >
  <tr><td height="60" valign="middle">
  <form><input name="myclose" type="button" class="Style_button"  value="��&nbsp;&nbsp;��"
				 onClick="javascrip:window.close()"></form>      
  </td></tr></table>
  </body>
</html>
